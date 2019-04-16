<?php

/**
 *      回复列表控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class ReplaysController extends CommonController{

   public function _initialize() {
        parent::_initialize();
        $this->dbname = CONTROLLER_NAME;
    }
	
   function _filter(&$map) {
	   if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		   
	   }
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['addtime'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}

	   if(isset($_REQUEST['title']) && $_REQUEST['title'] != ''){$map['title'] =array('EQ', urldecode(I('title'))); }


	}
	
   public function _befor_index(){ 
     $titlelist =  M($this->dbname)->where(array('title'=>array('neq','')))->distinct('title')->field('title')->select();
 $this->assign('titlelist', $titlelist); 
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
		$list = $model->where($map)->field('id,openid,title,content')->select();
	    $headArr=array('ID','OPENID','接收关键字','回复内容');
	    $filename='回复列表';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function send(){
	ob_clean();
	$id=I('get.id');
	$openid=M('replays')->where(array('id'=>$id))->getField('openid');
	$text=M('replays')->where(array('id'=>$id))->getField('content');
	$wrs=M('weiset')->find(1);
	$token = $wrs['token']; 
	$appid = $wrs['appid'];
	$secret = $wrs['appsecret'];	
	if(S('S_accessToken') || is_array(S('S_accessToken'))){
        $WechatAuth = new  \Com\WechatAuth($appid,$secret,S('S_accessToken'));
     }else{
		$WechatAuth = new  \Com\WechatAuth($appid,$secret);
	    $S_accessToken=$WechatAuth->getAccessToken();
		S('S_accessToken',$S_accessToken['access_token'],7000);
	 }
	$WechatAuth->sendText($openid,$text);
	$this->mtReturn(200,'发送到微信成功！微信发送者会收到您发送的消息的',$_REQUEST['navTabId'],false);
   }
	
	

}