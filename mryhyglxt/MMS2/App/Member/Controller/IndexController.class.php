<?php
namespace Member\Controller;
use Think\Controller;
use Vendor\Qrcode\Qrcode;
use Common\Controller\BaseController;
class IndexController extends BaseController {
   
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
	  if(!cookie('uid')){
			redirect(U('index/login'));
		}
      $info = M('huiyuan')->find(cookie('uid'));
	  $list=M('news')->limit(10)->order('id desc')->select();
      $this->assign('Rs', $info);
	  $this->assign('list', $list);
	  $this->display();
	}

	
	
	public function login(){
	   if(IS_POST){
		if(I('username')==''){	
		  $this->_goto(U('index/login'),'卡号或手机号码没有输入,不能登陆');
		}
		$username=I('username');
        $password=I('password');
        $where="  (kahao='".$username."' or dianhua='".$username."') and mima='".$password."' and status=1 ";		
		$rs=M('huiyuan')->where($where)->select();
		if($rs){
			$uid=M('huiyuan')->where($where)->getField('id');
			$shopid=M('huiyuan')->where($where)->getField('shopid');
			$data['id']=$uid;
		    $data['updatetime']=date('Y-m-d H:i:s',time());
		    M('huiyuan')->save($data);
			  cookie('uid',$uid,36000000);
              session('shopid',$shopid);			  
			  redirect(U('index'));	
		}else{
		  $this->_goto(U('index/login'),'卡号或手机号码或密码错误，登陆失败');	
		}
	   }else{
		$this->display();  
	   }	   
	}
	
	
	public function logout(){
		cookie('uid',null);
		redirect(U('index/login'));
	}
	

	
	public function user(){
		$info = M('huiyuan')->find(cookie('uid'));
		$this->assign('Rs', $info);
		$this->display();
	}
	
	
	public function info(){
		if(!cookie('uid')){
			redirect(U('index/login'));
		}
		if(IS_POST){
		 	
		  M('huiyuan')->save(I('post.'));
		  $this->_goto(U('index/index'),'更新成功');	
		}else{
		$info = M('huiyuan')->find(cookie('uid'));
		$this->assign('id', cookie('uid'));
		$this->assign('Rs', $info);
		$this->display();
		}
		
	}
	
	public function changepwd(){
		if(!cookie('uid')){
			redirect(U('index/login'));
		}
		if(IS_POST){
		  $ypwd=M('huiyuan')->where(array('id'=>I('id')))->getField('mima');
		  if($ypwd!==I('ypwd')){
			$this->_goto(U('index/changepwd'),'原密码不正确，请重新输入');  
		  }else{
			  if(I('password')!==I('xxpwd')){
			   $this->_goto(U('index/changepwd'),'两次密码输入不一致，请重新输入');  
		       }else{
			    $data['id']=I('id');
			    $data['mima']=I('password');
		        M('huiyuan')->save($data);
		        cookie('uid',null);
		        $this->_goto(U('index/login'),'密码修改成功！请重新登陆');	
		      }
		  }
		  
		}else{
		$info = M('huiyuan')->find(cookie('uid'));
		$this->assign('id', cookie('uid'));
		$this->assign('Rs', $info);
		$this->display();
		}
		
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
	
	
	
	public function myzijin(){
	 if(!cookie('uid')){
			redirect(U('index/login'));
	 }
	 $Rs = M('huiyuan')->find(cookie('uid'));
	 $where=" hid=".$Rs['id']."";
	 if(IS_POST){
		if(isset($_REQUEST['keys']) && $_REQUEST['keys'] != ''){
         $where.=" and (xingming like '%".I('keys')."%' or dianhua like '%".I('keys')."%'  )";
        } 
		if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){
         $where.=" and (addtime >= '".I('time1')."' or addtime<= '".I('time2')."'  )";
        }
		
	 }
	 $list=M('zijin')->where($where)->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	 $count=M('zijin')->where($where)->count();
	 $Page = new \Think\Page($count,10);
     $show  = $Page->show();
	 $this->assign('page',$show);
     $this->assign('count',$count);
	 $this->assign('list', $list);
	 $this->display();	
	}
	
	public function mycika(){
	 if(!cookie('uid')){
			redirect(U('index/login'));
	 }
	 $Rs = M('huiyuan')->find(cookie('uid'));
	 $where=" hid=".$Rs['id']."";
	 if(IS_POST){
		if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){
         $where.=" and (addtime >= '".I('time1')."' or addtime<= '".I('time2')."'  )";
        }
		
	 }
	 $list=M('cika')->where($where)->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	 $count=M('cika')->where($where)->count();
	 $Page = new \Think\Page($count,10);
     $show  = $Page->show();
	 $this->assign('page',$show);
     $this->assign('count',$count);
	 $this->assign('list', $list);
	 $this->display();	
	}
	
    public function myjifen(){
	 if(!cookie('uid')){
			redirect(U('index/login'));
	 }
	 $Rs = M('huiyuan')->find(cookie('uid'));
	 $where=" hid=".$Rs['id']."";
	 if(IS_POST){
		if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){
         $where.=" and (addtime >= '".I('time1')."' or addtime<= '".I('time2')."'  )";
        }
		
	 }
	 $list=M('jifen')->where($where)->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	 $count=M('jifen')->where($where)->count();
	 $Page = new \Think\Page($count,10);
     $show  = $Page->show();
	 $this->assign('page',$show);
     $this->assign('count',$count);
	 $this->assign('list', $list);
	 $this->display();	
	}
	
	public function myxiaofei(){
	 if(!cookie('uid')){
			redirect(U('index/login'));
	 }
	 $Rs = M('huiyuan')->find(cookie('uid'));
	 $where=" hid=".$Rs['id']."";
	 if(IS_POST){
		if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){
         $where.=" and (addtime >= '".I('time1')."' or addtime<= '".I('time2')."'  )";
        }
		
	 }
	 $list=M('xiaofei')->where($where)->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	 $count=M('xiaofei')->where($where)->count();
	 $Page = new \Think\Page($count,10);
     $show  = $Page->show();
	 $this->assign('page',$show);
     $this->assign('count',$count);
	 $this->assign('list', $list);
	 $this->display();	
	}
	
	public function tousu(){
		if(!cookie('uid')){
			redirect(U('index/login'));
		}
		if(IS_POST){
		   M('tousu')->add(I('POST.'));
		   $this->_goto(U('index/index'),'投诉成功，我们会尽快处理，谢谢!');
		}
		$list=M('tousu')->where(array('hid'=>cookie('uid')))->limit(50)->order('id desc')->select();
		$Rs=M('huiyuan')->find(cookie('uid'));
		$this->assign('list',$list);
		$this->assign('Rs',$Rs);
		$this->display();
	}
	
	public function lipin(){
	 if(I('shopid')){
		 $map=" and shopid=".I('shopid')." ";
	 }
	 $list=M('lipin')->where('kucun>0 and status=1'.$map)->order('id desc')->limit(10)->page($_GET['p'].',10')->select();
	 $count=M('lipin')->where('kucun>0 and status=1'.$map)->count();
	 $Page = new \Think\Page($count,10);
     $show  = $Page->show();
     //if(strlen($show)<15){$show='';}
	 $slist =  M('lipin')->where(array('shopid'=>array('neq','')))->distinct('shopid')->field('shopid')->select();
     $this->assign('slist', $slist);
     $this->assign('page',$show);
     $this->assign('count',$count);
	 $this->assign('list', $list);
	 $this->display();
	}	 
	 
	public function yuyue(){
	 if(I('shopid')){
		 $map=" and shopid=".I('shopid')." ";
	 }	
	 $list=M('guwen')->where(' status=1'.$map)->order('manyi desc')->limit(10)->page($_GET['p'].',10')->select();
	 $count=M('guwen')->where(' status=1'.$map)->count();
	 $Page = new \Think\Page($count,10);
     $show  = $Page->show();
     //if(strlen($show)<15){$show='';}
	 $slist =  M('guwen')->where(array('shopid'=>array('neq','')))->distinct('shopid')->field('shopid')->select();
     $this->assign('slist', $slist);
     $this->assign('page',$show);
     $this->assign('count',$count);
	 $this->assign('list', $list);
	 $this->display();	
	}
	
	
	public function pingjia(){
		if(IS_POST){
		  if(I('pingfen')==''){	
		   $this->_goto(U('index/yuyue'),'请对该员工评分哦！谢谢');
		   }
		   M('pingjia')->add(I('POST.'));
		   $manyi=M('pingjia')->where(array('juid'=>I('juid')))->avg('pingfen');
		   M('guwen')->where(array('uid'=>I('juid')))->setField('manyi',$manyi);
		   $this->_goto(U('index/yuyue'),'评价成功，谢谢!');
		}
		$uid=M('guwen')->where(array('id'=>I('id')))->getField('uid');
		$gonghao=M('guwen')->where(array('id'=>I('id')))->getField('gonghao');
		$urs=M('user')->find($uid);
		$Rs=M('huiyuan')->find(cookie('uid'));
		$list=M('pingjia')->where(array('juid'=>$uid))->order('id desc')->select();
		$this->assign('list',$list);
		$this->assign('uid',$uid);
		$this->assign('gonghao',$gonghao);
		$this->assign('Rs',$Rs);
		$this->assign('urs',$urs);
		$this->display();
	}
	
	
	public function yuyue_add(){
		if(IS_POST){
		  if(I('title')==''){	
		   $this->_goto(U('index/yuyue'),'请填写预约服务内容！谢谢');
		   }
		   $data['yytime']=I('riqi').' '.I('time');
		   $data=array_merge($data,I('post.'));
		   M('yuyue')->add($data);
		   M('guwen')->where(array('uid'=>I('juid')))->setInc('yycs',1);
		   $phone=M('user')->where(array('id'=>I('juid')))->getField('phone');
		    if(C('SMS_HOST')!=''&& strlen($phone)==11){
	         $content='亲:会员'.I('xingming').'预约了您，顾客将在'.I('riqi').' '.I('time').'到店，请做好准备！';
              $this->sendSMS($phone,$content,$navTabId=""); 
	        }
		   
		   $this->_goto(U('index/yuyue'),'预约成功，我们将会做好安排，欢迎准时光临!');
		}
		$uid=M('guwen')->where(array('id'=>I('id')))->getField('uid');
		$gonghao=M('guwen')->where(array('id'=>I('id')))->getField('gonghao');
		$urs=M('user')->find($uid);
		$Rs=M('huiyuan')->find(cookie('uid'));
		$this->assign('uid',$uid);
		$this->assign('gonghao',$gonghao);
		$this->assign('Rs',$Rs);
		$this->assign('urs',$urs);
		$this->display();
	}
	
	
	public function mypingjia(){
		if(!cookie('uid')){
			redirect(U('index/login'));
		}
		$list=M('pingjia')->where(array('hid'=>cookie('uid')))->order('id desc')->select();
		$this->assign('list',$list);
		$this->assign('uid',$uid);
		$this->assign('gonghao',$gonghao);
		$this->assign('Rs',$Rs);
		$this->assign('urs',$urs);
		$this->display();
	}
	
	public function myyuyue(){
		if(!cookie('uid')){
			redirect(U('index/login'));
		}
		$list=M('yuyue')->where(array('hid'=>cookie('uid')))->order('id desc')->select();
		$this->assign('list',$list);
		$this->assign('uid',$uid);
		$this->assign('gonghao',$gonghao);
		$this->assign('Rs',$Rs);
		$this->assign('urs',$urs);
		$this->display();
	}
	
}