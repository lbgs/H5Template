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

class FxhuiyuanController extends CommonController{

    public function _initialize() {
        parent::_initialize();
        $this->dbname = 'huiyuan';
    }
	
   function _filter(&$map) {
	   
	    if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		  if(session('iszb')!=='是'){
			$map['shopid'] = array('EQ', session('shopid'));  
		  } 
	   }
	  
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['addtime'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}
       if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }
       if(isset($_REQUEST['juname']) && $_REQUEST['juname'] != ''){$map[] =array('juname'=>array('EQ', urldecode(I('juanme'))),'juname'=>array('EQ', urldecode(I('juname'))),'_logic'=>'or'); }
	}
	
   
    public function _befor_index(){ 
     $junamelist =  M($this->dbname)->where(array('juname'=>array('neq','')))->distinct('juname')->field('juname')->select();
     $this->assign('junamelist', $junamelist); 
   }
   
   public function dengji(){
   $this->_fenxi('dengji','会员等级',1);
  }
 
   public function zhuangtai(){
    $this->_fenxi('zhuangtai','会员状态',1);
   }
   
  
    public function juname(){
    import("Org.Util.Chart");
        $chart = new \Chart;
		$model = D($this->dbname);
		$this->fd='juname';
		$map = $this->_search();
	    if (method_exists($this, '_filter')) {
	      $this->_filter($map);
	    }
		$list = $model->where($map)->distinct($this->fd)->field($this->fd)->select();
	    foreach ($list as $key =>$vo){	
			$info=$info.",".$vo[$this->fd];
			$co = $model->where(array($this->fd=>$vo[$this->fd]))->where($map)->count('id');
			$count=$count.",".$co;
		}
    $title = '业务员分析'; 
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
	$chart->createcolumnar($title,$data,$size,$height,$width,$legend);

   }
   
   
  public function qushi(){
	import("Org.Util.Chart");
    $chart = new \Chart;
	if(session('iszb')!=='是'){
	  $jingban=" and shopid=".session('shopid')."";
      $shopname=get_shop_name(session('shopid'));	  
	}else{
	 if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){
	  $jingban=" and shopid='".$_REQUEST['shopid']."'";
      $shopname=get_shop_name($_REQUEST['shopid']);		  
	 }	
	}
	if(isset($_REQUEST['juname']) && $_REQUEST['juname'] != ''){
	  $jingban.=" and juname='".$_REQUEST['juname']."'";	
	}
	if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''){
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%0".$i."-%'".$jingban)->count('id');
			}else{
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%".$i."-%'".$jingban)->count('id');
			}
			$count=$count.",".$co;
		}
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年会员增长趋势'; 
	}else{
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%0".$i."-%'".$jingban)->count('id');
			}else{
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%".$i."-%'".$jingban)->count('id');
			}
			$count=$count.",".$co;
		}
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年会员增长趋势'; 	
	}
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
    $chart->createcolumnar($title,$data,$size,$height,$width,$legend);
	}
	

	


}