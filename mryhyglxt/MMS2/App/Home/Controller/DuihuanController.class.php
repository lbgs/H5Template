<?php

/**
 *      积分兑换控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class DuihuanController extends CommonController{

   public function _initialize() {
        parent::_initialize();
        $this->dbname = 'huiyuan';
    }
	
   function _filter(&$map) {
	   $map['zhuangtai']='正常';

	}
	
   public function index(){ 
        $model = D($this->dbname);
		if(isset($_REQUEST['keys']) && $_REQUEST['keys'] != ''){
			$map['kahao|dianhua'] =array('EQ', I('keys'));
		 if (method_exists($this, '_filter')) {
			$this->_filter($map);
		 }
		 $Rs = $model->where($map)->find();
		 $this->assign('Rs',$Rs);
		}
	    $this->display();
   }
   
   
   public function biandong(){ 
        $model = D($this->dbname);
		if(isset($_REQUEST['keys']) && $_REQUEST['keys'] != ''){
			$map['kahao|dianhua'] =array('EQ', I('keys'));
		 if (method_exists($this, '_filter')) {
			$this->_filter($map);
		 }
		 $Rs = $model->where($map)->find();
		 $this->assign('Rs',$Rs);
		}
	    $this->display();
   }

   
  public function duihuanok(){
	 if(IS_POST){
	
		 if(I('kjifen')>I('kajifen')){
			$this->mtReturn(300,"结算失败！扣除积分".I('kjifen').'超过了卡积分余额'.I('kajifen'),$_REQUEST['navTabId'],false);
		 } 
		
         if(I('kjifen')<I('jine')){
			$this->mtReturn(300,'结算失败！您才支付'.I('kjifen').'积分，还差'.(I('jine')-I('kjifen')).'积分才能完成本次兑换',$_REQUEST['navTabId'],false);
		 } 
		
		
		$hid=I('hid');
		$jifen=I('kjifen');
		$title=I('title');
		$danhao='DH'.$this->noid(C('BIANHAO_NUM'),1);
		
		foreach ($_POST['xtitle'] as $keys=>$v) {
		 $xdata[]=array(    
							'title'=>$_POST['xtitle'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'xiaoji'=>$_POST['xiaoji'][$keys],
							'shopid'=>session('shopid'),
							'xid'=>$xid,
							 'uid'=>session('uid'),
							 'uname'=>session('truename'),
							 'addtime'=>date("Y-m-d H:i:s",time())
                          );
						$bmap= array();
						$bmap[] = array("title"=>array('EQ', $xdata[$keys]['title']),"shopid"=>array('EQ',session("shopid")),"_logic"=>"and");
						$count=M('lipin')->where($bmap)->count();					
						if ($count > 0) {
						M("lipin")->where($bmap)->setDec('kucun',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"出库失败，出库产品不存在",$_REQUEST['navTabId'],true);		
						}
	   }

	 if($jifen>0){
		$title='卡号['.I('kahao').']积分兑换礼品';
		$this->addjifen($hid,$danhao,'兑换礼品',$jifen,$title);
		$this->updatejifen($hid,'减少',$jifen);
	 }	
	 
	  //sms
	  $phone=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kajifen=M('huiyuan')->where(array('id'=>$hid))->getField('jifen');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='尊敬的客户:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'兑换礼品,消耗积分'.$jifen.',积分余额:'.$kajifen;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //

        $this->mtReturn(200,'['.I('xingming').']积分兑换成功 ','jifen',false);
	
	 
   }
  }
  
   public function biandongok(){
	 if(IS_POST){
	
		 if(!isset($_REQUEST['type']) || $_REQUEST['type'] == ''){
			$this->mtReturn(300,'请选择积分变动的类型',$_REQUEST['navTabId'],false);
		 } 
		
         if(!isset($_REQUEST['jifen']) || $_REQUEST['jifen'] == '0'|| $_REQUEST['jifen'] == 0){
			$this->mtReturn(300,'请填写积分变动的数量',$_REQUEST['navTabId'],false);
		 } 
		
		
		$hid=I('hid');
		$type=I('type');
		$jifen=I('jifen');
		$title=I('title');
		$danhao='BD'.$this->noid(C('BIANHAO_NUM'),1);
		


	 if($jifen>0){
		$title='卡号['.I('kahao').']积分'.$type.$jifen;
		$this->addjifen($hid,$danhao,'积分'.$type,$jifen,$title);
		$this->updatejifen($hid,$type,$jifen);
	 }	

	     //sms
	  $phone=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kajifen=M('huiyuan')->where(array('id'=>$hid))->getField('jifen');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='尊敬的客户:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'积分'.$type.$jifen.',积分余额:'.$kajifen;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //
        $this->mtReturn(200,'['.I('xingming').']积分'.$type.$jifen,'jifen',false);
	
	 
   }
  }
  
  

  
}