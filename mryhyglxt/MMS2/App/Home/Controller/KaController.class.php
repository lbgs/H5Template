<?php

/**
 *      会员卡管理控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class KaController extends CommonController{

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
  
  public function chongzhi(){
	 if(IS_POST){
		$id=I('id');
		$kahao=I('kahao');
		$xianjin=I('xianjin');
        $pos=I('pos');
		$song=I('song');
        $jine=I('jine');
     if(I('jine')>0){
	 $danhao='CZ'.$this->noid(C('BIANHAO_NUM'),1);
	 $title='['.I('kahao').']充值['.I('jine').'] '.I('title');
	 $this->addzijin($id,$danhao,'充值',I('jine'),$title,0,$xianjin,$pos,$song,0);
	 $this->updatezijin($id,'增加',I('jine'));
	 $title='['.I('kahao').']充值['.I('jine').']获得提成';
	 $ticheng=I('jine')*C('CHONGZHI_TICHENG')/100;
	 $this->addticheng(I('juid'),I('juname'),$danhao,'会员充值提成',$ticheng,$title);
	 //sms
	  $shouji=M('huiyuan')->where(array('id'=>$id))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$id))->getField('jine');
	  if(C('SMS_HOST')!=''&& strlen($shouji)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'充值'.I('jine').',卡余额:'.$kayue;
       $this->sendSMS($shouji,$content,$navTabId=""); 
	  }
	 //
	 $this->mtReturn(200,'['.I('kahao').']充值['.I('jine').'] ','zijin',false);
	}	
   }
  }
  

   public function gaimi(){ 
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
   
   public function gaimiok(){
	   if(IS_POST){
		 if(I('ymima')!==I('yymima')){
			$this->mtReturn(300,'原密码不正确','zijin',false); 
		 }else{
			M('huiyuan')->save(I('post.'));
 			$this->mtReturn(200,'密码修改成功','zijin',false); 
		 }
		   
	   }
   }
   
      public function xinmi(){ 
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
   
   public function xinmiok(){
	   if(IS_POST){
			M('huiyuan')->save(I('post.'));
 			$this->mtReturn(200,'密码修改成功','zijin',false); 
   
	   }
   }
   
   public function guashi(){ 
        $model = D($this->dbname);
		if(isset($_REQUEST['keys']) && $_REQUEST['keys'] != ''){
			$map['kahao|dianhua'] =array('EQ', I('keys'));
		 $Rs = $model->where($map)->find();
		 $this->assign('Rs',$Rs);
		} 
        $this->display();
   }
   
   public function guashiok(){
	   if(IS_POST){
			M('huiyuan')->save(I('post.'));
 			$this->mtReturn(200,'会员状态更改为'.I('zhuangtai'),'zijin',false); 
   
	   }
   }
   
    public function huanka(){ 
        $model = D($this->dbname);
		if(isset($_REQUEST['keys']) && $_REQUEST['keys'] != ''){
			$map['kahao|dianhua'] =array('EQ', I('keys'));
		 $Rs = $model->where($map)->find();
		 $this->assign('Rs',$Rs);
		} 
        $this->display();
   }
   
   public function huankaok(){
	   if(IS_POST){
		   $id=I('id');
		    $count=M('huiyuan')->where(array('kahao'=>I('kahao')))->count();
			if($count>0){
				$this->mtReturn(300,'卡号'.I('kahao').'已经被使用，请换其他卡片','zijin',false);
			}else{
				D('huiyuan')->save(I('post.'));
			}
			//sms
	       $phone=M('huiyuan')->where(array('id'=>$id))->getField('dianhua');
	       $kahao=M('huiyuan')->where(array('id'=>$id))->getField('kahao');
		   $kayue=M('huiyuan')->where(array('id'=>$id))->getField('jine');
	       if(C('SMS_HOST')!=''&& strlen($phone)==11){
	         $content='亲:您的卡号:'.$kahao.'于'.date("Y-m-d H:i:s",time()).'更换为'.I('kahao').',卡余额:'.$kayue;
            $this->sendSMS($phone,$content,$navTabId=""); 
	       }
	      //
 			$this->mtReturn(200,'您的卡号已经换为'.I('kahao'),'zijin',false); 
   
	   }
   }
    
    public function tuikuan(){ 
        $model = D($this->dbname);
		if(isset($_REQUEST['keys']) && $_REQUEST['keys'] != ''){
			$map['kahao|dianhua'] =array('EQ', I('keys'));
		 $Rs = $model->where($map)->find();
		 $this->assign('Rs',$Rs);
		} 
        $this->display();
   }
   
   public function tuikuanok(){
	   if(IS_POST){   
	    $id=I('id');
		$kahao=I('kahao');
		$xianjin=I('xianjin');
        $jine=I('jine');
     if(I('jine')>0){
	 $danhao='TK'.$this->noid(C('BIANHAO_NUM'),1);
	 $title='['.I('kahao').']扣款['.I('jine').']退现金['.I('xianjin').'] '.I('title'); 
	 $this->addzijin($id,$danhao,'退款',"-".$xianjin,$title,0,"-".$xianjin,0,0,0);
	 $this->updatezijin($id,'减少',I('jine'));
	  //sms
	  $phone=M('huiyuan')->where(array('id'=>$id))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$id))->getField('jine');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'退款'.I('jine').',卡余额:'.$kayue;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //
	 $this->mtReturn(200,'['.I('kahao').']扣款['.I('jine').']退现金['.I('xianjin').']','zijin',false);
	 }
	}
   }
   
    public function chongci(){ 
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
   
   public function chongciok(){
	 if(IS_POST){

		 if(I('yue')>I('kayue')){
			$this->mtReturn(300,"结算失败！余额支付".I('yue').'超过了卡余额'.I('kayue'),$_REQUEST['navTabId'],false);
		 } 
		
         if(I('shishou')<I('jine')){
			$this->mtReturn(300,'结算失败！您才支付'.I('shishou').'还差'.(I('jine')-I('shishou')).'元才能完成本次结算',$_REQUEST['navTabId'],false);
		 } 
		

		$zhuangtai='已结算';	
		$danhao='CC'.$this->noid(C('BIANHAO_NUM'),1);
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=I('hid');
		$data['danhao']=$danhao;
		$data['xingming']=I('xingming');
		$data['kahao']=I('kahao');
		$data['type']='会员充次';
		$data['jine']=I('jine');
		$data['jian']=I('jine')-I('shishou');
		$data['fukuan']=I('shishou');
		$data['jifen']=$jifen;
		$data['shopid']=session('shopid');
		$data['uid']=session('uid');
		$data['uname']=session('truename');
		$data['addtime'] = date("Y-m-d H:i:s",time());
		M('xiaofei')->add($data);
		$xid = M('xiaofei')->getLastInsID();
		
		$hid=I('hid');
		$yue=I('yue');
		$xianjin=I('xianjin');
        $pos=I('pos');
		$jian=I('jine')-I('shishou');
		$jine=I('jine');
        $shishou=I('shishou');
		$title=I('title');
		
		foreach ($_POST['xbianhao'] as $keys=>$v) {
		 $xdata[]=array(    
		                    'bianhao'=>$_POST['xbianhao'][$keys],
							'title'=>$_POST['xtitle'][$keys],
							'xjiage'=>$_POST['xjiage'][$keys],
							'zjiage'=>$_POST['zjiage'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'xiaoji'=>$_POST['czxiaoji'][$keys],
							'jifen'=>$_POST['jifen'][$keys],
							'juid'=>$_POST['juid'][$keys],
							'juname'=>$_POST['juname'][$keys],
							'shopid'=>session('shopid'),
							'danhao'=>$danhao,
							'zhuangtai'=>$zhuangtai,
							'xid'=>$xid,
							'hid'=>$hid,
							 'uid'=>session('uid'),
							 'uname'=>session('truename'),
							 'addtime'=>date("Y-m-d H:i:s",time())
                          );
						$jifen+=$xdata[$keys]['jifen']; 
						$shuliang+=$xdata[$keys]['shuliang'];
						$xtitle.=" ".$xdata[$keys]['title'];
						D('xiaofeis')->add($xdata[$keys]);
						if(isset($_REQUEST['juid'][$keys]) && $_REQUEST['juid'][$keys] != ''){
						 //提成//
						 $title='卡号['.I('kahao').']会员充次['.$xdata[$keys]['title'].']获得提成';
						 $tctype=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('tctype');
						 $ticheng=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('ticheng');
						 if($tctype==0){
						  	$tichengjine=$xdata[$keys]['xiaoji']*$ticheng/100;
						 }else{
							$tichengjine=$ticheng;
						 }
	                     $this->addticheng($xdata[$keys]['juid'],$xdata[$keys]['juname'],$danhao,'会员充次提成',$tichengjine,$title);
						}
						///////////////
						$crs=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->find();
						  $cdata['title']=$crs['title'];
						  $cdata['bianhao']=$crs['bianhao'];
						  $cdata['shopid']=session('shopid');
						  $cdata['dalei']=$crs['dalei'];
						  $cdata['fenlei']=$crs['fenlei'];
						  $cdata['type']=$crs['danwei'];
						  $cdata['danwei']=$crs['danwei'];
						  $cdata['shuliang']=$xdata[$keys]['shuliang'];
						  $cdata['number']=$danhao;
						  $cdata['jingban']=session('truename');
						  $cdata['shijian']=date("Y-m-d H:i:s",time());
						  $cdata['shenhe']='审核通过';
						  $cdata['beizhu']='卡号['.I('kahao').']会员充次';
						M('chukus')->add($cdata);
						$bmap= array();
						$bmap[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"title"=>array('EQ',$xdata[$keys]['title']),"_logic"=>"and");
						$count=M('chanpin')->where($bmap)->count();
						if ($count > 0) {
						M("chanpin")->where($bmap)->setDec('kucun',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"出库失败，出库产品不存在",$_REQUEST['navTabId'],false);		
						}
						
						$bmap1= array();
						$bmap1[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"shopid"=>array('EQ',session('shopid')),"_logic"=>"and");
						$count1=M('ku')->where($bmap1)->count();
						if ($count1 > 0) {
						M("ku")->where($bmap1)->setDec('kucun',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"出库失败，出库产品不存在",$_REQUEST['navTabId'],false);		
						}

                        $bmap2= array();
						$bmap2[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"hid"=>array('EQ',I('hid')),"_logic"=>"and");
						$count2=M('cika')->where($bmap2)->count();
						if ($count2 > 0) {
						 M("cika")->where($bmap2)->setInc('shuliang',$xdata[$keys]['shuliang']);
						}else{
						 M("cika")->add($xdata[$keys]);		
						}		
						  
	 }
	  
	  $sdata['id']=$xid;
	  $sdata['jifen']=$jifen;
	  $sdata['title']=$xtitle;
	  M('xiaofei')->save($sdata);
	  M("huiyuan")->where(array('id'=>$hid))->setInc('jici',$shuliang);
	  
	 
     if($yue>0){
		$title='卡号['.I('kahao').']会员充次,卡扣款'.$yue;
	 }else{
		$title='卡号['.I('kahao').']会员充次'.$shishou;
	 }
	    $this->addzijin($hid,$danhao,'会员充次',$shishou,$title,$yue,$xianjin,$pos,0,$jian);
	    $this->updatezijin($hid,'减少',$yue); 
	 
	 
	 if($jifen>0){
		$title='卡号['.I('kahao').']会员充次获得积分';
		$this->addjifen($hid,$danhao,'会员充次',$jifen,$title);
		$this->updatejifen($hid,'增加',$jifen);
	 }	
	    //sms
	  $phone=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$hid))->getField('jine');
	  $kajici=M('huiyuan')->where(array('id'=>$hid))->getField('jici');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'充次卡,次卡余额'.$kajici.',卡余额:'.$kayue;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //
	    $this->addxiaofei($hid,$shishou);
        $this->mtReturn(200,'['.I('xingming').']充次成功 ','zijin',false);
	 
   }
  }

}