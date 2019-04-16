<?php

/**
 *      提成记录控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class TichengController extends CommonController{

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
       if(isset($_REQUEST['type']) && $_REQUEST['type'] != ''){$map['type'] =array('EQ', urldecode(I('type'))); }
	   if(isset($_REQUEST['juname']) && $_REQUEST['juname'] != ''){$map['juname'] =array('EQ', urldecode(I('juname'))); }


	}
	
   public function _befor_index(){ 
    if(session('iszb')!=='是'){
	  $junamelist =  M($this->dbname)->where(array('juname'=>array('neq','',),'shopid'=>array('eq',session('shopid'))))->distinct('juname')->field('juname')->select();	 
	}else{
	  $junamelist =  M($this->dbname)->where(array('juname'=>array('neq','')))->distinct('juname')->field('juname')->select();
	} 
 $this->assign('junamelist', $junamelist); $typelist =  M($this->dbname)->where(array('type'=>array('neq','')))->distinct('type')->field('type')->select();
 $this->assign('typelist', $typelist); 
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
     
   }

   public function outxls() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$list = $model->where($map)->field('id,shopid,juid,juname,danhao,type,jine,title')->select();
	    $headArr=array('ID','所在店铺','人员ID','员工姓名','提成账单','提成类型','提成金额','详情');
	    $filename='提成记录';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function fenxi(){
	 $this->display();
	}
	
	

}