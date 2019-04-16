<?php

/**
 *      出库明细表控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class ChukusController extends CommonController{

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
       if(isset($_REQUEST['fenlei']) && $_REQUEST['fenlei'] != ''){$map[] =array('fenlei'=>array('EQ', urldecode(I('fenlei'))),'dalei'=>array('EQ', urldecode(I('fenlei'))),'_logic'=>'or'); }


	}
	
   public function _befor_index(){ 
     
   }
  
  
  public function _befor_add(){
	  $attid=time();
	  $this->assign('attid',$attid);
    
  }
  
  public function _befor_insert($data){

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
	   
   }
   
    public function _after_del(){
	 M($this->dbname)->where(array('shenhe'=>'等待审核'))->delete(); 
   }

   public function outxls() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$list = $model->where($map)->field('id,hid,number,bianhao,title,fenlei,type,danwei,shuliang,beizhu,jingban,shijian,shenhe,xid,edit')->select();
	    $headArr=array('ID','合同ID','合同编号','产品编号','产品名称','产品分类','产品规格','计量单位','出库数量','备注','经办人','出库时间','审核状态','相关ID','是否编辑');
	    $filename='出库明细表';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function fenxi(){
	 $this->display();
	}
	
	

}