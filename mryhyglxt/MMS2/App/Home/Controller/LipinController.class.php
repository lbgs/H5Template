<?php

/**
 *      礼品列表控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class LipinController extends CommonController{

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
	   
	   if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }
if(isset($_REQUEST['fenlei']) && $_REQUEST['fenlei'] != ''){$map['fenlei'] =array('EQ', urldecode(I('fenlei'))); }


	}
	
   public function _befor_index(){ 
     $shopidlist =  M($this->dbname)->where(array('shopid'=>array('neq','')))->distinct('shopid')->field('shopid')->select();
 $this->assign('shopidlist', $shopidlist); $fenleilist =  M($this->dbname)->where(array('fenlei'=>array('neq','')))->distinct('fenlei')->field('fenlei')->select();
 $this->assign('fenleilist', $fenleilist); 
   }
  
  
  public function _befor_add(){
	  $attid=time();
	  $this->assign('attid',$attid);
    
  }
  
  public function _befor_insert($data){
    $data['shopid']=session('shopid');
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
	   
   }
   
   public function _after_del(){
     
   }

   public function outxls() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$list = $model->where($map)->field('id,shopid,title,fenlei,jifen,kucun,content')->select();
	    $headArr=array('ID','所在店铺','礼品名称','礼品分类','所需积分','库存数量','详情说明');
	    $filename='礼品列表';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function fenxi(){
	 $this->display();
	}
	
	

}