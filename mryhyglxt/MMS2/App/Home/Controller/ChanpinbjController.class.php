<?php

/**
 *      产品管理控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class ChanpinbjController extends CommonController{

   public function _initialize() {
        parent::_initialize();
        $this->dbname = 'ku';
    }
	
   function _filter(&$map) {
	   if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		  if(session('iszb')!=='是'){
			$map['shopid'] = array('EQ', session('shopid'));  
		  } 
	   }
	   
	   if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }
       if(isset($_REQUEST['fenlei']) && $_REQUEST['fenlei'] != ''){$map[] =array('fenlei'=>array('EQ', urldecode(I('fenlei'))),'dalei'=>array('EQ', urldecode(I('fenlei'))),'_logic'=>'or'); }


	}
	
   public function baojing(){ 
        $model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$map['kucun']  =  array('elt',10);
		$list = $model->where($map)->select();
	    $this->assign('list', $list);
		$this->display('index');
   }
  


   public function outxls() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$list = $model->where($map)->field('id,bianhao,shopid,title,dalei,fenlei,type,danwei,kucun,beizhu')->select();
	    $headArr=array('ID','产品编号','所属店铺','产品名称','产品大类','产品分类','产品规格','计量单位','库存数量','备注');
	    $filename='库存报警';
		$this->xlsout($filename,$headArr,$list);
	}
	

	

}