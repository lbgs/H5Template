<?php

/**
 *      微信菜单控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class WmenuController extends CommonController{

   public function _initialize() {
        parent::_initialize();
        $this->dbname = CONTROLLER_NAME;
    }
	
   function _filter(&$map) {
	   if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		   
	   }
	     

	}
	
  public function _befor_index(){ 
    $list=cateTree($pid=0,$level=0,$this->dbname);
    $this->assign('list',$list);	
  }
  

   
   public function _befor_add(){
    $list=cateTree($pid=0,$level=0,$this->dbname);
	 $attid=time();
	 $this->assign('attid',$attid);
     $this->assign('list',$list);
  }
  
  public function _befor_insert($data){
	 $pid = I('pid');
	 if ($pid==0){
	 $data['level']=0;
	 }else{
	 $level=D($this->dbname)->where('id='.$pid.'')->field('level')->limit(1)->select();
     $level=$level[0]['level']+1;
     $data['level']=$level;
	 }
	 return $data;
  }
  
  
  public function _befor_edit(){
     $list=cateTree($pid=0,$level=0,$this->dbname);
	 $model = D($this->dbname);
	 $info = $model->find(I('get.id'));
	 $attid=$info['attid'];
	 $this->assign('attid',$attid);
     $this->assign('list',$list);
  }
  
  public function _befor_update($data){
	 $pid = I('pid');
	 if ($pid==0){
	 $data['level']=0;
	 }else{
	 $level=D($this->dbname)->where('id='.$pid.'')->field('level')->limit(1)->select();
     $level=$level[0]['level']+1;
     $data['level']=$level;
	 }
	 return $data;
  }
  
  public function _befor_lock($id){
	  $data=D($this->dbname)->find($id);
	  D($this->dbname)->where(array("pid"=>$id))->setField('status',$data['status']);
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
		$list = $model->where($map)->field('id,level,pid,catename,type,alink')->select();
	    $headArr=array('ID','级别','上级ID','菜单名称','菜单类型','跳转网址');
	    $filename='微信菜单';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function send(){
		
		ob_clean();
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


		$class=M('wmenu')->where(array('pid'=>0))->limit(3)->order('sort asc')->select();
          $k=1;
        foreach($class as $key=>$vo){

         $c=M('wmenu')->where(array('pid'=>$vo['id']))->limit(5)->order('sort asc')->select();
         $count=M('wmenu')->where(array('pid'=>$vo['id']))->limit(5)->order('sort asc')->count();
          if($c!=false){
             $newmenu[$k-1]['name']=$vo['catename'];
              $i=1;
             foreach($c as $voo){
				   if($voo['type']=='跳转网址'){
			         $newmenu[$k-1]['sub_button'][$i-1]=array('type'=>'view','name'=>$voo['catename'],'url'=>$voo['alink']);
		           }else{
					 $newmenu[$k-1]['sub_button'][$i-1]=array('type'=>'click','name'=>$voo['catename'],'key'=>$voo['catename']);    
		          }
             $i++;
            }
         }else{
			    
                if($vo['type']=='跳转网址'){
				  $newmenu[$k-1]['type']='view';
				  $newmenu[$k-1]['name']=$vo['catename'];
				  $newmenu[$k-1]['url']=$vo['alink']; 
		          }else{
			      $newmenu[$k-1]['type']='click';
				  $newmenu[$k-1]['name']=$vo['catename'];
				  $newmenu[$k-1]['key']=$vo['catename'];    
		        }
          }
       $k++;
      }

        $WechatAuth->menuCreate($newmenu);
		$this->mtReturn(200,'发送生成菜单请求成功！微信更新菜单需要一定时间，或是取消关注，重新关注试试',$_REQUEST['navTabId'],false);
	
       }
	
	

}