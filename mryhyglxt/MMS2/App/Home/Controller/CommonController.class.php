<?php
namespace Home\Controller;
use Think\Controller;
use Common\Controller\BaseController;
Class CommonController extends BaseController{


	public function _initialize(){
		
        $this->_name = CONTROLLER_NAME;
	    
		if(!session('uid')){
			redirect(U('Public/login'));
		}
       
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); 

		$name=MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
		if(!authcheck($name,session('uid'))){
		   //$this->error(''.session('username').'很抱歉,此项操作您没有权限！');
		   $this->mtReturn(300,''.session('username').'很抱歉,此项操作您没有权限！',$_REQUEST['navTabId']);
		}		 
	}
	
	public function noid($num,$type){
	  switch ($type){
		  case 1:
		  return date("Ymdhis",time()) . rand(10,99);
		  break;
		  case 2:
		  return date("Ymd",time()) . rand(1000,9999);
		  break;
		  default:
		  $count = M($this->dbname)->count();
	      return date("ymds",time()) . str_pad( ($count+1), $num, '0', STR_PAD_LEFT);
	  }
	}
	
	protected function addjifen($hid,$danhao,$type,$jifen,$title) {
	 if($jifen!==0){
        $rdata=M('huiyuan')->find($hid);
		$data['shopid'] = session('shopid');
	    $data['hid'] = $hid;
		$data['kahao'] = $rdata['kahao'];
		$data['xingming'] = $rdata['xingming'];
	    $data['danhao'] = $danhao;
		$data['type'] = $type;
		$data['jifen'] = $jifen;
        $data['title'] = $title;
		$data['uid']=session('uid');
        $data['uname']=session('truename');
        $data['addtime'] = date("Y-m-d H:i:s",time());
        M('jifen')->add($data); 
	 }
	}
	
	protected function updatejifen($id,$type,$jifen) {
	 if($jifen!==0){
		if($type=='增加'){
		  M("huiyuan")->where(array('id'=>$id))->setInc('jifen',$jifen);
		}else{
		  M("huiyuan")->where(array('id'=>$id))->setDec('jifen',$jifen);
		}
	 }
	 $olddj=M('huiyuan')->where(array('id'=>$id))->getField('dengji');
	 $oldjinfen=M('huiyuan')->where(array('id'=>$id))->getField('jifen');
	 $nrs=M('dengji')->where('jizhi=0 and jifen<='.$oldjinfen)->order('jifen desc')->find();
	 $newdj=$nrs['title'];
	 if($olddj!==$newdj){
		$ldata['id']=$id;
        $ldata['dengji']=$newdj;
        M('huiyuan')->save($ldata);
        //sms
	  $phone=M('huiyuan')->where(array('id'=>$id))->getField('dianhua');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'由'.$olddj.'调整为'.$newdj;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //		
	 }
	 
	}
	
	protected function addzijin($hid,$danhao,$type,$jine,$title,$yue,$xianjin,$pos,$song,$jian) {
	 if($jine!==0){
        $rdata=M('huiyuan')->find($hid);
		$data['shopid'] = session('shopid');
        if($hid!==0){
		$data['hid'] = $hid;
		$data['kahao'] = $rdata['kahao'];
		$data['xingming'] = $rdata['xingming'];
		}else{
		$data['hid'] = 0;
		$data['kahao'] = '无卡号';
		$data['xingming'] = '散客';	
		}   
	    $data['danhao'] = $danhao;
		$data['type'] = $type;
		$data['yue'] = $yue;
		$data['xianjin'] = $xianjin;
		$data['pos'] = $pos;
		$data['song'] = $song;
		$data['jian'] = $jian;
		$data['jine'] = $jine;
        $data['title'] = $title;
		$data['uid']=session('uid');
        $data['uname']=session('truename');
        $data['addtime'] = date("Y-m-d H:i:s",time());
        M('zijin')->add($data); 
	 }
	}
	
	protected function updatezijin($id,$type,$jine) {
	  if($jine!==0){
		if($type=='增加'){
		  M("huiyuan")->where(array('id'=>$id))->setInc('jine',$jine);
		}else{
		  M("huiyuan")->where(array('id'=>$id))->setDec('jine',$jine);
		}
	  }
	}
	
	protected function addticheng($juid,$juname,$danhao,$type,$jine,$title) {
	 if($jine!==0&&$juid!==0){
		$hrs=M('xiaofei')->where(array('danhao'=>$danhao))->limit(1)->find();
		$data['shopid'] = session('shopid');
	    $data['juid'] = $juid;
		$data['juname'] = $juname;
	    $data['danhao'] = $danhao;
		$data['hid']=$hrs['hid'];
		$data['xingming']=$hrs['xingming'];
		$data['type'] = $type;
		$data['jine'] = $jine;
        $data['title'] = $title;
		$data['uid']=session('uid');
        $data['uname']=session('truename');
        $data['addtime'] = date("Y-m-d H:i:s",time());
        M('ticheng')->add($data); 
	 }
	}
	
	protected function addxiaofei($id,$jine) {
	  if($jine!==0){
		  M("huiyuan")->where(array('id'=>$id))->setField('updatetime',date("Y-m-d H:i:s",time()));
		  M("huiyuan")->where(array('id'=>$id))->setInc('xiaofei',$jine);
	  }
	}
    
	
}