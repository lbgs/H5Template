<?php

/**
 *      销售管理控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class SaleController extends CommonController{

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
   
   public function jiesuan(){ 
        $model = D($this->dbname);
		if(isset($_REQUEST['keys']) && $_REQUEST['keys'] != ''){
			$map['kahao|dianhua'] =array('EQ', I('keys'));
		 if (method_exists($this, '_filter')) {
			$this->_filter($map);
		 }
		 $Rs = $model->where($map)->find();
		 $this->assign('Rs',$Rs);
		}
		$edata['edit']=0;
        M("xiaofeis")->where(array("xid"=>I("did")))->save($edata);
	    $this->display();
   }
   
    public function kshy(){ 
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
   
   public function kssk(){ 
	    $this->display();
   }
   
    public function jici(){ 
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
   
  public function shangpin(){
	 if(IS_POST){
		if(I('guadan')==0&&I('guadan')=='0'){ 
		 if(I('yue')>I('kayue')){
			$this->mtReturn(300,"结算失败！余额支付".I('yue').'超过了卡余额'.I('kayue'),$_REQUEST['navTabId'],false);
		 } 
		
         if(I('shishou')<I('jine')){
			$this->mtReturn(300,'结算失败！您才支付'.I('shishou').'还差'.(I('jine')-I('shishou')).'元才能完成本次结算',$_REQUEST['navTabId'],false);
		 } 
		}		
		if(I('guadan')==0&&I('guadan')=='0'){
		 $zhuangtai='已结算';	
		}else{
		 $zhuangtai='挂单';	
		}
		$danhao='SP'.$this->noid(C('BIANHAO_NUM'),1);
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=I('hid');
		$data['danhao']=$danhao;
		$data['xingming']=I('xingming');
		$data['kahao']=I('kahao');
		$data['type']='商品消费';
		$data['jine']=I('jine');
		if(I('guadan')==0&&I('guadan')=='0'){ 
		 $data['jian']=I('jian');
		}
		
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
		$jian=I('jian');
		$jine=I('jine');
        $shishou=I('shishou');
		$title=I('title');
		
		foreach ($_POST['xbianhao'] as $keys=>$v) { 
		$jrs=M('chanpin')->where(array('bianhao'=>$_POST['xbianhao'][$keys]))->find();
		 $xdata[]=array(    
		                    'bianhao'=>$_POST['xbianhao'][$keys],				
							 'rjiage'=>$jrs['rjiage'],
							'title'=>$_POST['xtitle'][$keys],
							'xjiage'=>$_POST['xjiage'][$keys],
							'zjiage'=>$_POST['zjiage'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'xiaoji'=>$_POST['ssxiaoji'][$keys],
							'jifen'=>$_POST['jifen'][$keys],
							'juid'=>$_POST['juid'][$keys],
							'juname'=>$_POST['juname'][$keys],
							'shopid'=>session('shopid'),
							'danhao'=>$danhao,
							'zhuangtai'=>$zhuangtai,
							'xid'=>$xid,
							 'uid'=>session('uid'),
							 'uname'=>session('truename'),
							 'addtime'=>date("Y-m-d H:i:s",time())
                          );
						$jifen+=$xdata[$keys]['jifen']; 
						$xtitle.=" ".$xdata[$keys]['title'];
						D('xiaofeis')->add($xdata[$keys]);
                        if(I('guadan')==0&&I('guadan')=='0'){
						if(isset($_REQUEST['juid'][$keys]) && $_REQUEST['juid'][$keys] != ''){
						 //提成//
						 $title='卡号['.I('kahao').']商品消费['.$xdata[$keys]['title'].']获得提成';
						 $tctype=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('tctype');
						 $ticheng=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('ticheng');
						 if($tctype==0){
						  	$tichengjine=$xdata[$keys]['xiaoji']*$ticheng/100;
						 }else{
							$tichengjine=$ticheng*$xdata[$keys]['shuliang'];
						 }
	                     $this->addticheng($xdata[$keys]['juid'],$xdata[$keys]['juname'],$danhao,'商品消费提成',$tichengjine,$title);
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
						  $cdata['beizhu']='卡号['.I('kahao').']商品消费';
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
						 
						}
						
						  
	 }
	 if(I('guadan')==0&&I('guadan')=='0'){
	  
	  $sdata['id']=$xid;
	  $sdata['jifen']=$jifen;
	  $sdata['title']=$xtitle;
	  M('xiaofei')->save($sdata);
	  
	 
     if($yue>0){
		$title='卡号['.I('kahao').']商品消费,卡扣款'.$yue;
	 }else{
		$title='卡号['.I('kahao').']商品消费'.$shishou;
	 }
	    $this->addzijin($hid,$danhao,'商品消费',$shishou,$title,$yue,$xianjin,$pos,0,$jian);
	    $this->updatezijin($hid,'减少',$yue); 
	 
	 
	 if($jifen>0){
		$title='卡号['.I('kahao').']商品消费获得积分';
		$this->addjifen($hid,$danhao,'商品消费',$jifen,$title);
		$this->updatejifen($hid,'增加',$jifen);
	 }	
	    $this->addxiaofei($hid,$shishou);
		 //sms
	  $phone=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$hid))->getField('jine');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'商品消费'.$shishou.',卡余额:'.$kayue;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //
        $this->mtReturn(200,'['.I('xingming').']商品消费成功 ','zijin',false);
	 }else{
		$this->mtReturn(200,'['.I('xingming').']商品消费挂单成功 ','zijin',false); 
	 }
	 
   }
  }
  
  public function jiesuanok(){
	 if(IS_POST){
		if(I('guadan')==0&&I('guadan')=='0'){ 
		 if(I('yue')>I('kayue')){
			$this->mtReturn(300,"结算失败！余额支付".I('yue').'超过了卡余额'.I('kayue'),$_REQUEST['navTabId'],false);
		 } 
		
         if(I('shishou')<I('jine')){
			$this->mtReturn(300,'结算失败！您才支付'.I('shishou').'还差'.(I('jine')-I('shishou')).'元才能完成本次结算',$_REQUEST['navTabId'],false);
		 } 
		}		
		if(I('guadan')==0&&I('guadan')=='0'){
		 $zhuangtai='已结算';	
		}else{
		 $zhuangtai='挂单';	
		}
		$danhao=I('danhao');
		
		$data['id']=I('did');
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=I('hid');
		$data['xingming']=I('xingming');
		$data['kahao']=I('kahao');
		$data['type']='商品消费';
		$data['jine']=I('jine');
		if(I('guadan')==0&&I('guadan')=='0'){ 
		 $data['jian']=I('jian');
		}
		
		$data['fukuan']=I('shishou');
		$data['jifen']=$jifen;
		$data['shopid']=session('shopid');
		$data['uid']=session('uid');
		$data['uname']=session('truename');
		$data['addtime'] = date("Y-m-d H:i:s",time());
		M('xiaofei')->save($data);
		$xid = i('did');
		
		$hid=I('hid');
		$yue=I('yue');
		$xianjin=I('xianjin');
        $pos=I('pos');
		$jian=I('jian');
		$jine=I('jine');
        $shishou=I('shishou');
		$title=I('title');
		
		foreach ($_POST['xbianhao'] as $keys=>$v) {
		$jrs=M('chanpin')->where(array('bianhao'=>$_POST['xbianhao'][$keys]))->find();
		 $xdata[]=array(    
		                    'id'=>$_POST['mid'][$keys],
		                    'bianhao'=>$_POST['xbianhao'][$keys],
							'rjiage'=>$jrs['rjiage'],
							'title'=>$_POST['xtitle'][$keys],
							'xjiage'=>$_POST['xjiage'][$keys],
							'zjiage'=>$_POST['zjiage'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'xiaoji'=>$_POST['jsxiaoji'][$keys],
							'jifen'=>$_POST['jifen'][$keys],
							'juid'=>$_POST['juid'][$keys],
							'juname'=>$_POST['juname'][$keys],
							'shopid'=>session('shopid'),
							'danhao'=>$danhao,
							'zhuangtai'=>$zhuangtai,
							'xid'=>$xid,
							'edit'=>1,	 
							 'uid'=>session('uid'),
							 'uname'=>session('truename'),
							 'addtime'=>date("Y-m-d H:i:s",time())
                          );
						$jifen+=$xdata[$keys]['jifen'];
                        $xtitle.=" ".$xdata[$keys]['title'];
                        $jcount=M("xiaofeis")->where(array('id'=>$_POST['mid'][$keys]))->count();
					    if ($jcount>0){
					     D('xiaofeis')->save($xdata[$keys]); 
					    }else{
					     D('xiaofeis')->add($xdata[$keys]);   
					    }						
                        if(I('guadan')==0&&I('guadan')=='0'){
						//提成//
						if(isset($_REQUEST['juid'][$keys]) && $_REQUEST['juid'][$keys] != ''){
						  $title='卡号['.I('kahao').']商品消费['.$xdata[$keys]['title'].']获得提成';
						  $tctype=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('tctype');
						  $ticheng=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('ticheng');
						  if($tctype==0){
						  	$tichengjine=$xdata[$keys]['xiaoji']*$ticheng/100;
						   }else{
							$tichengjine=$ticheng*$xdata[$keys]['shuliang'];
						  }
	                     $this->addticheng($xdata[$keys]['juid'],$xdata[$keys]['juname'],$danhao,'商品消费提成',$tichengjine,$title);
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
						  $cdata['beizhu']='卡号['.I('kahao').']商品消费';
						M('chukus')->add($cdata);
						$bmap= array();
						$bmap[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"title"=>array('EQ',$xdata[$keys]['title']),"_logic"=>"and");
						$count=M('chanpin')->where($bmap)->count();
						if ($count > 0) {
						M("chanpin")->where($bmap)->setDec('kucun',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"出库失败，出库产品不存在",$_REQUEST['navTabId'],true);		
						}
						
						$bmap1= array();
						$bmap1[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"shopid"=>array('EQ',session('shopid')),"_logic"=>"and");
						$count1=M('ku')->where($bmap1)->count();
						if ($count1 > 0) {
						M("ku")->where($bmap1)->setDec('kucun',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"出库失败，出库产品不存在",$_REQUEST['navTabId'],true);		
						}
						 
						}
									  
	 }
	 D('xiaofeis')->where(array("edit"=>0,'xid'=>$xid))->delete();
	 if(I('guadan')==0&&I('guadan')=='0'){
	  
	  $sdata['id']=$xid;
	  $sdata['jifen']=$jifen;
	  $sdata['title']=$xtitle;
	  $sdata['addtime']=date("Y-m-d H:i:s",time());
	  M('xiaofei')->save($sdata);
	  
	 
     if($yue>0){
		$title='卡号['.I('kahao').']商品消费,卡扣款'.$yue;
	 }else{
		$title='卡号['.I('kahao').']商品消费'.$shishou;
	 }
	    $this->addzijin($hid,$danhao,'商品消费',$shishou,$title,$yue,$xianjin,$pos,0,$jian);
	    $this->updatezijin($hid,'减少',$yue); 
	 
	 
	 if($jifen>0){
		$title='卡号['.I('kahao').']商品消费获得积分';
		$this->addjifen($hid,$danhao,'商品消费',$jifen,$title);
		$this->updatejifen($hid,'增加',$jifen);
	 }	
	    $this->addxiaofei($hid,$shishou);
		 //sms
	  $phone=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$hid))->getField('jine');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'商品消费'.$shishou.',卡余额:'.$kayue;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //
        $this->mtReturn(200,'['.I('xingming').']商品消费成功 ','zijin',true);
	 }else{
		$this->mtReturn(200,'['.I('xingming').']商品消费挂单成功 ','zijin',true); 
	 }
	 
   }
  }
  

  public function delguadan(){
	 $did=I('get.did');
	 M('xiaofeis')->where(array('xid'=>$did))->delete();
	 M('xiaofei')->where(array('id'=>$did))->delete();
	 $this->mtReturn(200,'挂单删除成功 ',$_REQUEST['navTabId'],false);
  }
  
  
  public function sanke(){
	 $this->display();  
  }
   
   
   public function sankeok(){
	 if(IS_POST){
	
         if(I('shishou')<I('jine')){
			$this->mtReturn(300,'结算失败！您才支付'.I('shishou').'还差'.(I('jine')-I('shishou')).'元才能完成本次结算',$_REQUEST['navTabId'],false);
		 } 

	    $zhuangtai='已结算';
		$danhao='SP'.$this->noid(C('BIANHAO_NUM'),1);
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=0;
		$data['danhao']=$danhao;
		$data['xingming']='散客';
		$data['kahao']='无卡号';
		$data['type']='商品消费';
		$data['jine']=I('jine');
		$data['jian']=I('jian');
		$data['fukuan']=I('shishou');
		$data['jifen']=$jifen;
		$data['shopid']=session('shopid');
		$data['uid']=session('uid');
		$data['uname']=session('truename');
		$data['addtime'] = date("Y-m-d H:i:s",time());
		M('xiaofei')->add($data);
		$xid = M('xiaofei')->getLastInsID();
		
		$hid=0;
		$yue=I('yue');
		$xianjin=I('xianjin');
        $pos=I('pos');
		$jian=I('jian');
		$jine=I('jine');
        $shishou=I('shishou');
		$title=I('title');
		
		foreach ($_POST['xbianhao'] as $keys=>$v) {
		 $jrs=M('chanpin')->where(array('bianhao'=>$_POST['xbianhao'][$keys]))->find();	
		 $xdata[]=array(    
		                    'bianhao'=>$_POST['xbianhao'][$keys],
							'title'=>$_POST['xtitle'][$keys],
							'rjiage'=>$jrs['rjiage'],
							'xjiage'=>$_POST['xjiage'][$keys],
							'zjiage'=>$_POST['zjiage'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'xiaoji'=>$_POST['xiaoji'][$keys],
							//'jifen'=>$_POST['jifen'][$keys],
							'juid'=>$_POST['juid'][$keys],
							'juname'=>$_POST['juname'][$keys],
							'shopid'=>session('shopid'),
							'danhao'=>$danhao,
							'zhuangtai'=>$zhuangtai,
							'xid'=>$xid,
							 'uid'=>session('uid'),
							 'uname'=>session('truename'),
							 'addtime'=>date("Y-m-d H:i:s",time())
                          );
						D('xiaofeis')->add($xdata[$keys]);
						$xtitle.=" ".$xdata[$keys]['title'];
						if(isset($_REQUEST['juid'][$keys]) && $_REQUEST['juid'][$keys] != ''){
						 //提成//
						 $title='散客 商品消费['.$xdata[$keys]['title'].']获得提成';
						 $tctype=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('tctype');
						 $ticheng=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('ticheng');
						 if($tctype==0){
						  	$tichengjine=$xdata[$keys]['xiaoji']*$ticheng/100;
						 }else{
							$tichengjine=$ticheng*$xdata[$keys]['shuliang'];
						 }
	                     $this->addticheng($xdata[$keys]['juid'],$xdata[$keys]['juname'],$danhao,'商品消费提成',$tichengjine,$title);
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
						  $cdata['beizhu']='散客 商品消费';
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
					  
	    }
	  
         $sdata['id']=$xid;
	     $sdata['title']=$xtitle;
	     M('xiaofei')->save($sdata);
	 
		$title='散客 商品消费'.$shishou;
	    $this->addzijin(0,$danhao,'商品消费',$shishou,$title,0,$xianjin,$pos,0,$jian);

        $this->mtReturn(200,'散客商品消费成功 ','zijin',false);
	 }
	 
   }

   
   public function kshyok(){
	 if(IS_POST){

		 if(I('yue')>I('kayue')){
			$this->mtReturn(300,"结算失败！余额支付".I('yue').'超过了卡余额'.I('kayue'),$_REQUEST['navTabId'],false);
		 } 
		
         if(I('shishou')<I('jine')){
			$this->mtReturn(300,'结算失败！您才支付'.I('shishou').'还差'.(I('jine')-I('shishou')).'元才能完成本次结算',$_REQUEST['navTabId'],false);
		 } 
		
        $jifen=I('jifen');
		$zhuangtai='已结算';	
		$danhao='KS'.$this->noid(C('BIANHAO_NUM'),1);
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=I('hid');
		$data['danhao']=$danhao;
		$data['xingming']=I('xingming');
		$data['kahao']=I('kahao');
		$data['type']='快速消费';
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
		
	  
	 
     if($yue>0){
		$title='卡号['.I('kahao').']快速消费,卡扣款'.$yue;
	 }else{
		$title='卡号['.I('kahao').']快速消费'.$shishou;
	 }
	    $this->addzijin($hid,$danhao,'快速消费',$shishou,$title,$yue,$xianjin,$pos,0,$jian);
	    $this->updatezijin($hid,'减少',$yue); 
	 
	 
	 if($jifen>0){
		$title='卡号['.I('kahao').']快速消费获得积分';
		$this->addjifen($hid,$danhao,'快速消费',$jifen,$title);
		$this->updatejifen($hid,'增加',$jifen);
	 }	
	    $this->addxiaofei($hid,$shishou);
		 //sms
	  $phone=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$hid))->getField('jine');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'快速消费'.$shishou.',卡余额:'.$kayue;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //
        $this->mtReturn(200,'['.I('xingming').']快速消费成功 ','zijin',false);
	 
   }
  }
  
  public function ksskok(){
	 if(IS_POST){
	
         if(I('shishou')<I('jine')){
			$this->mtReturn(300,'结算失败！您才支付'.I('shishou').'还差'.(I('jine')-I('shishou')).'元才能完成本次结算',$_REQUEST['navTabId'],false);
		 } 
        $jifen=0;
	    $zhuangtai='已结算';
		$danhao='KS'.$this->noid(C('BIANHAO_NUM'),1);
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=0;
		$data['danhao']=$danhao;
		$data['xingming']='散客';
		$data['kahao']='无卡号';
		$data['type']='快速消费';
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
		
		$hid=0;
		$yue=I('yue');
		$xianjin=I('xianjin');
        $pos=I('pos');
		$jian=I('jine')-I('shishou');
		$jine=I('jine');
        $shishou=I('shishou');
		$title=I('title');
		
		$title='散客 快速消费'.$shishou;
	    $this->addzijin(0,$danhao,'快速消费',$shishou,$title,0,$xianjin,$pos,0,$jian);

        $this->mtReturn(200,'散客快速消费成功 ','zijin',false);
	 }
	 
   }
   
   public function jiciok(){
	 if(IS_POST){	

		$zhuangtai='已结算';	
		$danhao='JC'.$this->noid(C('BIANHAO_NUM'),1);
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=I('hid');
		$data['danhao']=$danhao;
		$data['xingming']=I('xingming');
		$data['kahao']=I('kahao');
		$data['type']='计次消费';
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
		 $jrs=M('chanpin')->where(array('bianhao'=>$_POST['xbianhao'][$keys]))->find();		
		 $xdata[]=array(    
		                    'bianhao'=>$_POST['xbianhao'][$keys],
							'title'=>$_POST['xtitle'][$keys],
							'rjiage'=>$jrs['rjiage'],
							'xjiage'=>$_POST['xjiage'][$keys],
							'zjiage'=>$_POST['zjiage'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'xiaoji'=>$_POST['xiaoji'][$keys],
							'jifen'=>$_POST['jifen'][$keys],
							'juid'=>$_POST['juid'][$keys],
							'juname'=>$_POST['juname'][$keys],
							'shopid'=>session('shopid'),
							'danhao'=>$danhao,
							'zhuangtai'=>$zhuangtai,
							'xid'=>$xid,
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
						 $title='卡号['.I('kahao').']计次消费['.$xdata[$keys]['title'].']获得提成';
						 $tctype=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('tctype');
						 $ticheng=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('ticheng');
						 if($tctype==0){
						  	$tichengjine=$xdata[$keys]['zjiage']*$xdata[$keys]['shuliang']*$ticheng/100;
						 }else{
							$tichengjine=$ticheng*$xdata[$keys]['shuliang'];
						 }
	                     $this->addticheng($xdata[$keys]['juid'],$xdata[$keys]['juname'],$danhao,'计次消费提成',$tichengjine,$title);
						}
						
						$bmap2= array();
						$bmap2[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"hid"=>array('EQ',I('hid')),"_logic"=>"and");
						$count2=M('cika')->where($bmap2)->count();
						if ($count2 > 0) {
						 M("cika")->where($bmap2)->setDec('shuliang',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"消费失败，次卡商品不存在",$_REQUEST['navTabId'],false);		
						}		 

						
						  
	 }

	  
	  $sdata['id']=$xid;
	  $sdata['jifen']=$jifen;
	  $sdata['title']=$xtitle;
	  M('xiaofei')->save($sdata);
	  M("huiyuan")->where(array('id'=>$hid))->setDec('jici',$shuliang);
	   //sms
	  $phone=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$hid))->getField('jine');
	  $kajici=M('huiyuan')->where(array('id'=>$hid))->getField('jici');
	  if(C('SMS_HOST')!=''&& strlen($phone)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'次卡消费成功,次卡余额'.$kajici.',卡余额:'.$kayue;
       $this->sendSMS($phone,$content,$navTabId=""); 
	  }
	 //
     $this->mtReturn(200,'['.I('xingming').']计次消费成功 ','zijin',false);

   }
  }
  
}