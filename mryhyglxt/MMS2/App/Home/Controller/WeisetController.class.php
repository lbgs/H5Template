<?php

/**
 *      账号设置控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class WeisetController extends CommonController{

   public function _initialize() {
        parent::_initialize();
        $this->dbname = CONTROLLER_NAME;
    }
	
   function _filter(&$map) {
	   if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		   
	   }

	}
	


  
  public function edit(){
	 if(IS_POST){
		M($this->dbname)->save(I('post.'));
		$this->mtReturn(200,"更新成功".$id,$_REQUEST['navTabId'],false); 
	 } 
	 $id=1;
     $model = D($this->dbname);
	 $info = $model->find($id);
	 $attid=$info['attid'];
	 $this->assign('attid',$attid);
	 $this->assign('Rs',$info);
	 $this->display();
  }
   
  public function _befor_update($data){

  }
  
    public function _after_edit($id){
     
   }

	

}