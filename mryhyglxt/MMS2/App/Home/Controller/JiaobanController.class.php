<?php

/**
 *      控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class JiaobanController extends CommonController{

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
	  
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['shijian'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}
        if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }

	}
	
   
  public function index(){
	   $model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
	   $list=$model->where($map)->select();
       $this->assign('list', $list); 
	   $this->display();
   }
   
	
	public function dayin(){
	   $model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
	   $list=$model->where($map)->select();
       $this->assign('list', $list); 
	   $this->display();
   }
	
	
}