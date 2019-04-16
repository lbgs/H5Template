<?php
namespace Admin\Controller;
use Think\Controller;
use Vendor\Qrcode\Qrcode;
class IndexController extends Controller {
   
   public function _initialize(){
		
       
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); 

			 
	}
	
	public function _goto($url,$msg){
		  $gourl=$url;
		  echo "<script language='javascript' type='text/javascript'>"; 
		  echo "alert('$msg');";
		  echo "window.location.href='$gourl'"; 
		  echo "</script>";
		  exit();
	}
	
	
	public function index(){
	  if(!cookie('aid')){
			redirect(U('index/login'));
		}
      $info = M('user')->find(cookie('aid'));
	  $list=M('news')->limit(3)->order('id desc')->select();
      $this->assign('Rs', $info);
	  $this->assign('list', $list);
	  $this->display();
	}

	
	
	public function login(){
	   if(IS_POST){
		if(I('username')==''){	
		  $this->_goto(U('index/login'),'用户名或手机号码没有输入,不能登陆');
		}
		$username=I('username');
        $password=md5(md5(I('password')));
        $where=" posname='老板' and (username='".$username."' or phone='".$username."') and password='".$password."' and status=1 ";		
		$rs=M('user')->where($where)->select();
		if($rs){
			$uid=M('user')->where($where)->getField('id');
			$data['id']=$uid;
		    $data['logintime']=date('Y-m-d H:i:s',time());
		    $data['update_time']=time();
		    $data['loginip']=get_client_ip();
		    $data['logins']=array('exp','logins+1');
		    M('user')->save($data);
			  cookie('aid',$uid,36000000);		  
			  redirect(U('index'));	
		}else{
		  $this->_goto(U('index/login'),'用户名或手机号码或密码错误，登陆失败');	
		}
	   }else{
		$this->display();  
	   }	   
	}
	
	
	public function logout(){
		cookie('aid',null);
		redirect(U('index/login'));
	}
	


	public function news_detail(){
	 $id=I('id');
	 $data['id']=$id;
	 $data['hits']=array('exp','hits+1');
	 M('news')->save($data);
	 $Rs=M('news')->find($id);
	 $this->assign('Rs', $Rs);
	 $this->display();	
		
	}


	
	public function news(){
	 $list=M('news')->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	 $count=M('news')->count();
	 $list2=M('news')->order('hits desc')->limit(10)->select();
	 $Page = new \Think\Page($count,10);
     $show  = $Page->show();
     //if(strlen($show)<15){$show='';}
     $this->assign('page',$show);
     $this->assign('count',$count);
	 $this->assign('list', $list);
	 $this->assign('list2', $list2);
	 $this->display();	
	}
	
	public function top(){
	 if(!cookie('aid')){
			redirect(U('index/login'));
	 }
	 $list=M('ticheng')->where("addtime like '%".date("Y-m",time())."%'")->field('sum(jine) as count,juname')->limit(20)->group('juid')->order('count desc')->select();
	 $list2=M('zijin')->where("addtime like '%".date("Y-m",time())."%' and type<>'充值' and type<>'退款'")->field('sum(jine) as count,shopid')->limit(20)->group('shopid')->order('count desc')->select();
	 $this->assign('list', $list);
	 $this->assign('list2', $list2);
	 $this->display();	
	}
	
	
	public function tousu(){
		if(!cookie('aid')){
			redirect(U('index/login'));
		}
		$list=M('tousu')->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	    $count=M('tousu')->count();
	    $Page = new \Think\Page($count,10);
        $show  = $Page->show();
	    $this->assign('page',$show);
        $this->assign('count',$count);
		$this->assign('list',$list);
		$this->assign('Rs',$Rs);
		$this->display();
	}
	
	public function shop(){
		if(!cookie('aid')){
			redirect(U('index/login'));
		}
		$list=M('shop')->where("iszb='否'")->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	    $count=M('shop')->where("iszb='否'")->count();
	    $Page = new \Think\Page($count,10);
        $show  = $Page->show();
	    $this->assign('page',$show);
        $this->assign('count',$count);
		$this->assign('list',$list);
		$this->assign('Rs',$Rs);
		$this->display();
	}
	
	public function shop_detail(){
		if(!cookie('aid')){
			redirect(U('index/login'));
		}
		$Rs=M('shop')->find(I('id'));
		$this->assign('list',$list);
		$this->assign('Rs',$Rs);
		$this->display();
	}
	
	
	public function pingjia(){
		if(!cookie('aid')){
			redirect(U('index/login'));
		}
		$list=M('pingjia')->order('id desc')->select();
		$count=M('pingjia')->count();
	    $Page = new \Think\Page($count,10);
        $show  = $Page->show();
	    $this->assign('page',$show);
        $this->assign('count',$count);
		$this->assign('list',$list);
		$this->display();
	}
	
	public function yuyue(){
		if(!cookie('aid')){
			redirect(U('index/login'));
		}
		$list=M('yuyue')->order('id desc')->select();
		$count=M('yuyue')->count();
	    $Page = new \Think\Page($count,10);
        $show  = $Page->show();
	    $this->assign('page',$show);
        $this->assign('count',$count);
		$this->assign('list',$list);
		$this->display();
	}

}