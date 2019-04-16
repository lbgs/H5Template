<?php

/**
 *      出库记录控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class ChukuController extends CommonController{

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
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['shijian'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}
       if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }


	}
	
   public function _befor_index(){ 
     
   }
  
  
  public function _befor_add(){
	  $attid=time();
	  $this->assign('attid',$attid);
	  $this->assign('number',C('BIANHAO_AUTO'));
    
  }
  
  public function _befor_insert($data){
    
	if(C('BIANHAO_AUTO')=='自动编号'){
	 unset($data['number']);
     $data['number'] = $this->noid(C('BIANHAO_NUM'),C('BIANHAO_GUIZE'));		
	}
      $data['shopid']=session('shopid');
	  $data['shenhe']='等待审核';
	  return $data;
  }
	
   public function _after_add($id){
    foreach ($_POST['xbianhao'] as $keys=>$v) {
		 $xdata[]=array(    
		                    'bianhao'=>$_POST['xbianhao'][$keys],
							'title'=>$_POST['xtitle'][$keys],
							'dalei'=>$_POST['xdalei'][$keys],
							'fenlei'=>$_POST['xfenlei'][$keys],
							'type'=>$_POST['xtype'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'danwei'=>$_POST['xdanwei'][$keys],
							'jingban'=>$_POST['jingban'],
							'shijian'=>$_POST['shijian'],
							'hid'=>$_POST['hid'],
							'number'=>$_POST['bianhao'],
							'beizhu'=>$_POST['xbeizhu'][$keys],
							'shopid'=>session('shopid'),
							'shenhe'=>'等待审核',
							'xid'=>$id
                          );
						$shuliang+=$xdata[$keys]['shuliang'];
						$title=$title.",".$xdata[$keys]['title'];
						D('chukus')->add($xdata[$keys]);	
						  
	 }
	$data['id']=$id;
	$data["shuliang"]=$shuliang;
	$data['title']=substr($title, 1);
	M($this->dbname)->save($data);
   }


  
  public function _befor_edit(){
     $model = D($this->dbname);
	 $info = $model->find(I('get.id'));
	 $attid=$info['attid'];
	 $this->assign('attid',$attid);
	 $edata['edit']=0;
     M("chukus")->where(array("xid"=>I("id")))->save($edata);
  }
   
  public function _befor_update($data){

  }
  
    public function _after_edit($id){
     $id=I('post.id');
     foreach ($_POST['xbianhao'] as $keys=>$v) {
		 $xdata[]=array(    
		                    'id'=>$_POST['mid'][$keys],
		                    'bianhao'=>$_POST['xbianhao'][$keys],
							'title'=>$_POST['xtitle'][$keys],
							'dalei'=>$_POST['xdalei'][$keys],
							'fenlei'=>$_POST['xfenlei'][$keys],
							'type'=>$_POST['xtype'][$keys],
							'shuliang'=>$_POST['xshuliang'][$keys],
							'danwei'=>$_POST['xdanwei'][$keys],
							'jingban'=>$_POST['jingban'],
							'shijian'=>$_POST['shijian'],
							'hid'=>$_POST['hid'],
							'number'=>$_POST['bianhao'],
							'beizhu'=>$_POST['xbeizhu'][$keys],
							'shopid'=>session('shopid'),
							'shenhe'=>'等待审核',
							'xid'=>$id,
							'edit'=>1,	 
                          );
						$shuliang+=$xdata[$keys]['shuliang'];
						$title=$title.",".$xdata[$keys]['title'];
						$count=M("chukus")->where(array('id'=>$_POST['mid'][$keys]))->count();
					    if ($count>0){
					    D('chukus')->save($xdata[$keys]);  
					    }else{
					    D('chukus')->add($xdata[$keys]);   
					    }
						  
	 }
	D('chukus')->where(array("edit"=>0,'xid'=>$id))->delete();
	$data['id']=$id;
	$data["shuliang"]=$shuliang;
	$data['title']=substr($title, 1);
	M($this->dbname)->save($data);
   }

   public function _befor_view($id){
	   
   }
   
   public function _befor_del($id){
    M('chukus')->where(array('cid'=>$id))->delete(); 
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
		$list = $model->where($map)->field('id,hid,number,bianhao,title,shuliang,shijian,jingban,shenheren,shenhe')->select();
	    $headArr=array('ID','合同ID','出库单号','合同编号','出库产品','出库数量','出库时间','经办人','审核人','审核状态');
	    $filename='出库记录';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function fenxi(){
	 $this->display();
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
		   $mingxi=M('chukus')->where(array("xid"=>I("xid")))->select();
		   M('chukus')->where(array("xid"=>I("xid")))->setField('shenhe','审核通过');
		   foreach ($mingxi as $keys=>$v) {
                       $xdata[]=array(
                            'title'=>$mingxi[$keys]['title'],
							'dalei'=>$_POST['xdalei'][$keys],
							'fenlei'=>$mingxi[$keys]['fenlei'],
							'bianhao'=>$mingxi[$keys]['bianhao'],
							'type'=>$mingxi[$keys]['type'],
							'danwei'=>$mingxi[$keys]['danwei'],
							'kucun'=>$mingxi[$keys]['shuliang'],
							'beizhu'=>$mingxi[$keys]['beizhu']
                        );
						$bmap= array();
						$bmap[] = array("bianhao"=>array('EQ', $mingxi[$keys]['bianhao']),"title"=>array('EQ',$mingxi[$keys]['title']),"_logic"=>"and");
						$count=M('chanpin')->where($bmap)->count();
						if ($count > 0) {
						M("chanpin")->where($bmap)->setDec('kucun',$xdata[$keys]['kucun']);
						}else{
						 $this->mtReturn(300,"出库失败，出库产品不存在",$_REQUEST['navTabId'],true);		
						}
						
						$bmap1= array();
						$bmap1[] = array("bianhao"=>array('EQ', $mingxi[$keys]['bianhao']),"shopid"=>array('EQ',session('shopid')),"_logic"=>"and");
						$count1=M('ku')->where($bmap1)->count();
						if ($count1 > 0) {
						M("ku")->where($bmap1)->setDec('kucun',$xdata[$keys]['kucun']);
						}else{
						 $this->mtReturn(300,"出库失败，出库产品不存在",$_REQUEST['navTabId'],true);		
						}
						
                }
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