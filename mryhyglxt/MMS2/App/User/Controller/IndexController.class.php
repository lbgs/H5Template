<?php
namespace User\Controller;
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
	  if(!cookie('mid')){
			redirect(U('index/login'));
		}
      $info = M('user')->find(cookie('mid'));
	  $list=M('news')->limit(4)->order('id desc')->select();
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
        $where=" posname='美容顾问' and (username='".$username."' or phone='".$username."') and password='".$password."' and status=1 ";		
		$rs=M('user')->where($where)->select();
		if($rs){
			$uid=M('user')->where($where)->getField('id');
			$shopid=M('user')->where($where)->getField('shopid');
			$data['id']=$uid;
		    $data['logintime']=date('Y-m-d H:i:s',time());
		    $data['update_time']=time();
		    $data['loginip']=get_client_ip();
		    $data['logins']=array('exp','logins+1');
		    M('user')->save($data);
			  cookie('mid',$uid,36000000);
			  cookie('shopid',$shopid,36000000);
			  redirect(U('index'));	
		}else{
		  $this->_goto(U('index/login'),'用户名或手机号码或密码错误，登陆失败');	
		}
	   }else{
		$this->display();  
	   }	   
	}
	
	
	public function logout(){
		cookie('mid',null);
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
	 if(!cookie('mid')){
			redirect(U('index/login'));
	 }
	 $list=M('ticheng')->where("addtime like '%".date("Y-m",time())."%'")->field('sum(jine) as count,juname')->limit(20)->group('juid')->order('count desc')->select();
	 $list2=M('guwen')->where("updatetime like '%".date("Y-m",time())."%'")->order('manyi desc')->select();
	 $this->assign('list', $list);
	 $this->assign('list2', $list2);
	 $this->display();	
	}
	
	
	public function yeji(){
		if(!cookie('mid')){
			redirect(U('index/login'));
		}
		$list=M('ticheng')->where("addtime like '%".date("Y-m",time())."%' and juid=".cookie('mid')." ")->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	    $count=M('ticheng')->where("addtime like '%".date("Y-m",time())."%' and juid=".cookie('mid')." ")->count();
	    $Page = new \Think\Page($count,10);
        $show  = $Page->show();
	    $this->assign('page',$show);
        $this->assign('count',$count);
		$this->assign('list',$list);
		$this->assign('Rs',$Rs);
		$this->display();
	}
	
	public function user(){
		$info = M('user')->find(cookie('mid'));
		$this->assign('Rs', $info);
		$this->display();
	}
	
	
	public function info(){
		if(!cookie('mid')){
			redirect(U('index/login'));
		}
		if(IS_POST){
		  $count=M('user')->where("id<>".cookie('mid')." and phone='".I('phone')."'")->count();
		  if($count>0){
			 $this->_goto(U('index/info'),'您的手机号码已经在数据库中存在，不能录入了，谢谢！'); 
		  }
		  M('user')->save(I('post.'));
		  $this->_goto(U('index/index'),'更新成功');	
		}else{
		$info = M('user')->find(cookie('mid'));
		$this->assign('id', cookie('mid'));
		$this->assign('Rs', $info);
		$this->display();
		}
		
	}
	
	public function changepwd(){
		if(!cookie('mid')){
			redirect(U('index/login'));
		}
		if(IS_POST){
		  $ypwd=M('user')->where(array('id'=>I('id')))->getField('password');
		  if($ypwd!==md5(md5(I('ypwd')))){
			$this->_goto(U('index/changepwd'),'原密码不正确，请重新输入');  
		  }else{
			  if(I('password')!==I('xxpwd')){
			   $this->_goto(U('index/changepwd'),'两次密码输入不一致，请重新输入');  
		       }else{
			    $data['id']=I('id');
			    $data['password']=md5(md5(I('password')));
		        M('user')->save($data);
		        cookie('uid',null);
		        $this->_goto(U('index/login'),'密码修改成功！请重新登陆');	
		      }
		  }
		  
		}else{
		$info = M('user')->find(cookie('mid'));
		$this->assign('id', cookie('mid'));
		$this->assign('Rs', $info);
		$this->display();
		}
		
	}
	
	public function guwen(){
		if(!cookie('mid')){
			redirect(U('index/login'));
	 }
		if(IS_POST){
		  if(!I('techang')||!I('xingming')){
			$this->_goto(U('index/guwen'),'必填项目未填，请尽量完善信息，谢谢！');  
		  }
		  if(I('id')){
			  M('guwen')->save(I('post.')); 
		  }else{
			  $info = M('user')->find(cookie('mid'));
		      $data['uid']=cookie('mid');
			  $data['shopid']=cookie('shopid');
		      $data['uname']=$info['truename'];
		      $data['addtime']=date('Y-m-d H:i:s',time());
		      $data['status']=1;
		      $data=array_merge($data,I('post.'));
		      M('guwen')->add($data);
		  }
		  
		  $this->_goto(U('index/index'),'更新成功！');	
		}
		$Rs = M('guwen')->where(array('uid'=>cookie('mid')))->order('id desc')->find();
		if($Rs['attid']==0){
			$attid=time();
		}else{
			$attid=$Rs['attid'];
		}
	    $this->assign('attid',$attid);
		$this->assign('Rs',$Rs);
		$this->display();
		
	}
	
	
	public function mypingjia(){
		if(!cookie('mid')){
			redirect(U('index/login'));
		}
		$list=M('pingjia')->where(array('juid'=>cookie('mid')))->order('id desc')->select();
		$this->assign('list',$list);
		$this->assign('uid',$uid);
		$this->assign('gonghao',$gonghao);
		$this->assign('Rs',$Rs);
		$this->assign('urs',$urs);
		$this->display();
	}
	
	public function myyuyue(){
		if(!cookie('mid')){
			redirect(U('index/login'));
		}
		$list=M('yuyue')->where(array('juid'=>cookie('mid')))->order('id desc')->select();
		$this->assign('list',$list);
		$this->assign('uid',$uid);
		$this->assign('gonghao',$gonghao);
		$this->assign('Rs',$Rs);
		$this->assign('urs',$urs);
		$this->display();
	}
	
	public function pingjia_add(){
		if(!cookie('mid')){
			redirect(U('index/login'));
		}
		if(IS_POST){
			if(!I('content')){
			$this->_goto(U('index/mypingjia'),'请填写评价内容哦！');  
		  }
		   M('pingjia')->save(I('post.'));
		   $this->_goto(U('index/mypingjia'),'回评成功！');	
		}
		 $Rs = M('pingjia')->find(I('id'));
		 $urs=M('user')->find(cookie('mid'));
		 $this->assign('Rs',$Rs);
		 $this->assign('urs',$urs);
		 $this->display();
		
		
		
		
	}

}