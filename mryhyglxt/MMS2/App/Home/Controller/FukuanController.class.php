<?php

/**
 *      支出记录控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class FukuanController extends CommonController{

   public function _initialize() {
        parent::_initialize();
        $this->dbname = CONTROLLER_NAME;
    }
	
   function _filter(&$map) {
	   if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		 if(session('iszb')!=='是'){
			$map['shopid'] = array('EQ', session('shopid'));  
		  }   
	   }
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['addtime'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}

	   if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }
if(isset($_REQUEST['leixing']) && $_REQUEST['leixing'] != ''){$map['leixing'] =array('EQ', urldecode(I('leixing'))); }
if(isset($_REQUEST['type']) && $_REQUEST['type'] != ''){$map['type'] =array('EQ', urldecode(I('type'))); }
if(isset($_REQUEST['jingban']) && $_REQUEST['jingban'] != ''){$map['jingban'] =array('EQ', urldecode(I('jingban'))); }
if(isset($_REQUEST['shenhe']) && $_REQUEST['shenhe'] != ''){$map['shenhe'] =array('EQ', urldecode(I('shenhe'))); }


	}
	
   public function _befor_index(){ 
     $shopidlist =  M($this->dbname)->where(array('shopid'=>array('neq','')))->distinct('shopid')->field('shopid')->select();
 $this->assign('shopidlist', $shopidlist); $leixinglist =  M($this->dbname)->where(array('leixing'=>array('neq','')))->distinct('leixing')->field('leixing')->select();
 $this->assign('leixinglist', $leixinglist); $typelist =  M($this->dbname)->where(array('type'=>array('neq','')))->distinct('type')->field('type')->select();
 $this->assign('typelist', $typelist); $jingbanlist =  M($this->dbname)->where(array('jingban'=>array('neq','')))->distinct('jingban')->field('jingban')->select();
 $this->assign('jingbanlist', $jingbanlist); $shenhelist =  M($this->dbname)->where(array('shenhe'=>array('neq','')))->distinct('shenhe')->field('shenhe')->select();
 $this->assign('shenhelist', $shenhelist); 
   }
  
  
  public function _befor_add(){
	  $attid=time();
	  $this->assign('attid',$attid);
    
  }
  
  public function _befor_insert($data){
    $data['shopid']=session('shopid');
    $data['shenhe']='等待审核';
	return $data;
  }
	
   public function _after_add($id){
    
   }


  
  public function _befor_edit(){
     $model = D($this->dbname);
	 $info = $model->find(I('get.id'));
	 $attid=$info['attid'];
	 $this->assign('attid',$attid);
  }
   
  public function _befor_update($data){

  }
  
    public function _after_edit($id){
     
   }

   public function _befor_view($id){
	   
   }
   
    public function _befor_del($id){
	 M('shenhe')->where(array('xid'=>$id,'type'=>CONTROLLER_NAME))->delete();
   }
   
    public function _after_del(){
     M($this->dbname)->where('shenhe<>"审核通过"')->delete(); 
   }


   public function outxls() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$list = $model->where($map)->field('id,shopid,title,leixing,type,jine,jingban,beizhu,shenheren,shenhe')->select();
	    $headArr=array('ID','所在店铺','标题','支出类型','付款方式','支出金额','经办人','备注详情','审核人','审核状态');
	    $filename='支出记录';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function dshenhe(){
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$map['shenhe']  =  array('neq','审核通过');
		$list = $model->where($map)->select();
	    $this->assign('list', $list);
		$this->display('index');
	}
	
	public function shenhe(){
	 if(IS_POST){
	   $upda["id"]=I("xid");
	   $upda["shenhe"]=I("title");
	   $upda["shenheren"]=session('truename');
	   D($this->dbname)->save($upda);
	    $data["type"]=$this->dbname;
		$data["title"]=I("title");
		$data["content"]=I("content");
		$data['uid']=session('uid');
        $data['uname'] = session('truename');
        $data['addtime'] = date("Y-m-d H:i:s",time());
		$data["xid"]=I("xid");
	    M("shenhe")->add($data);
		if($_POST['title']=="审核通过"){
		$this->mtReturn(200,"审核结果".$_POST['title'],$_REQUEST['navTabId'],true);		
	   }
	     $this->mtReturn(200,"审核结果".$_POST['title'],$_REQUEST['navTabId'],true);
	 }
	 $xid=I("get.id");
	 $shenhe=M($this->dbname)->where(array("id"=>I("get.id")))->getField('shenhe');
	 $list=M('shenhe')->where(array("xid"=>$xid,'type'=>$this->dbname))->select();
	 $this->assign('xid',$xid);
	 $this->assign('shenhe',$shenhe);
	 $this->assign('list',$list); 
	 $this->display();

   }
	
	

}