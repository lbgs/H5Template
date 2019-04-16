<?php

/**
 *      入库记录控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class RukuController extends CommonController{

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
   $this->assign('bianhao',C('BIANHAO_AUTO'));
   $this->assign('stype',I('stype'));
    
  }
  
  public function _befor_insert($data){

    if(C('BIANHAO_AUTO')=='自动编号'){
	 unset($data['bianhao']);
     $data['bianhao'] = $this->noid(C('BIANHAO_NUM'),C('BIANHAO_GUIZE'));		
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
							'beizhu'=>$_POST['xbeizhu'][$keys],
							'shenhe'=>'等待审核',
							'shopid'=>session('shopid'),
							'xid'=>$id
                          );
						$shuliang+=$xdata[$keys]['shuliang'];
						$title=$title.",".$xdata[$keys]['title'];
						D('rukus')->add($xdata[$keys]);	
						  
	 }
	$data['id']=$id;
	$data["shuliang"]=$shuliang;
	$data['title']=substr($title, 1);
	M($this->dbname)->save($data);
	 
   }


  
  public function _befor_edit(){
	 $edata['edit']=0;
     M("rukus")->where(array("xid"=>I("id")))->save($edata);
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
							'beizhu'=>$_POST['xbeizhu'][$keys],
							'shopid'=>session('shopid'),
							'shenhe'=>'等待审核',
							'xid'=>$id,
							'edit'=>1,	 
                          );
						$shuliang+=$xdata[$keys]['shuliang'];
						$title=$title.",".$xdata[$keys]['title'];
						$count=M("rukus")->where(array('id'=>$_POST['mid'][$keys]))->count();
					    if ($count>0){
					    D('rukus')->save($xdata[$keys]);  
					    }else{
					    D('rukus')->add($xdata[$keys]);   
					    }
						  
	 }
	D('rukus')->where(array("edit"=>0,'xid'=>$id))->delete();
	$data['id']=$id;
	$data["shuliang"]=$shuliang;
	$data['title']=substr($title, 1);
	M($this->dbname)->save($data);
   }

   public function _befor_view($id){
	   
   }
   
   public function _befor_del($id){
	 M('rukus')->where(array('xid'=>$id))->delete();
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
		$list = $model->where($map)->field('id,bianhao,type,title,shuliang,shijian,jingban,shenheren')->select();
	    $headArr=array('ID','入库单号','来源','入库产品','入库数量','入库时间','经办人','审核人');
	    $filename='入库记录';
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
		   $mingxi=M('rukus')->where(array("xid"=>I("xid")))->select();
		   M('rukus')->where(array("xid"=>I("xid")))->setField('shenhe','审核通过');
		   foreach ($mingxi as $keys=>$v) {
                       $xdata[]=array(
                            'title'=>$mingxi[$keys]['title'],
							'dalei'=>$mingxi[$keys]['dalei'],
							'fenlei'=>$mingxi[$keys]['fenlei'],
							'bianhao'=>$mingxi[$keys]['bianhao'],
							'type'=>$mingxi[$keys]['type'],
							'danwei'=>$mingxi[$keys]['danwei'],
							'kucun'=>$mingxi[$keys]['shuliang'],
							'shopid'=>$mingxi[$keys]['shopid'],
                        );
						$bmap= array();
						$bmap[] = array("bianhao"=>array('EQ', $mingxi[$keys]['bianhao']),"title"=>array('EQ',$mingxi[$keys]['title']),"_logic"=>"and");
						$count=M('chanpin')->where($bmap)->count();
						if ($count > 0) {
						M("chanpin")->where($bmap)->setInc('kucun',$xdata[$keys]['kucun']);
						}else{
						$xdata[$keys]['uid']=session('uid');
                        $xdata[$keys]['uname']=session('truename');	
                        $xdata[$keys]['addtime']=date("Y-m-d H:i:s",time());							
						D('chanpin')->add($xdata[$keys]);	
						}
						
						$bmap1= array();
						$bmap1[] = array("bianhao"=>array('EQ', $mingxi[$keys]['bianhao']),"shopid"=>array('EQ',$mingxi[$keys]['shopid']),"_logic"=>"and");
						$count1=M('ku')->where($bmap1)->count();
						if ($count1 > 0) {
						M("ku")->where($bmap1)->setInc('kucun',$xdata[$keys]['kucun']);
						}else{							
						D('ku')->add($xdata[$keys]);	
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