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

class FxcaiwuController extends CommonController{

    public function _initialize() {
        parent::_initialize();
        $this->dbname = 'zijin';
    }
	
   function _filter(&$map) {
	   
	    if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		  if(session('iszb')!=='是'){
			$map['shopid'] = array('EQ', session('shopid'));  
		  } 
	   }
	  
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['addtime'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}
       if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }
	}
	
   

   public function leixing() {
		import("Org.Util.Chart");
        $chart = new \Chart;
		$model = D('fukuan');
		$this->fd='leixing';
		$map = $this->_search();
	    if (method_exists($this, '_filter')) {
	      $this->_filter($map);
	    }
		$list = $model->where($map)->distinct($this->fd)->field($this->fd)->select();
	    foreach ($list as $key =>$vo){	
			$info=$info.",".$vo[$this->fd];
			$co = $model->where(array($this->fd=>$vo[$this->fd]))->where($map)->sum('jine');
			$count=$count.",".$co;
		}
    $title ='费用支出类型占比分析'; 
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 550; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
	$chart->create3dpie($title,$data,$size,$height,$width,$legend);
     
	}
	
	public function juname() {
		import("Org.Util.Chart");
        $chart = new \Chart;
		$model = D('ticheng');
		$this->fd='juname';
		$map = $this->_search();
	    if (method_exists($this, '_filter')) {
	      $this->_filter($map);
	    }
		$list = $model->where($map)->distinct($this->fd)->field($this->fd)->select();
	    foreach ($list as $key =>$vo){	
			$info=$info.",".$vo[$this->fd];
			$co = $model->where(array($this->fd=>$vo[$this->fd]))->where($map)->sum('jine');
			$count=$count.",".$co;
		}
    $title ='业务员提成占比分析'; 
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 550; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
	$chart->create3dpie($title,$data,$size,$height,$width,$legend);
     
	}
	

   
   
  public function shuliang(){
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
	  //$jingban.=" and juname='".$_REQUEST['juname']."'";	
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
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年业务(数量)增长趋势'; 
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
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年业务(数量)增长趋势'; 	
	}
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
    $chart->createcolumnar($title,$data,$size,$height,$width,$legend);
	}
	
	public function jine(){
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
	  //$jingban.=" and juname='".$_REQUEST['juname']."'";	
	}
	if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''){
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%0".$i."-%'".$jingban)->sum('jine');
			}else{
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%".$i."-%'".$jingban)->sum('jine');
			}
			$count=$count.",".$co;
		}
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年业务(营业额)增长趋势'; 
	}else{
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%0".$i."-%'".$jingban)->sum('jine');
			}else{
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%".$i."-%'".$jingban)->sum('jine');
			}
			$count=$count.",".$co;
		}
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年业务(营业额)增长趋势'; 	
	}
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
    $chart->createcolumnar($title,$data,$size,$height,$width,$legend);
	}

	 
	 public function xianjin(){
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
	  //$jingban.=" and juname='".$_REQUEST['juname']."'";	
	}
	if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''){
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%0".$i."-%'".$jingban)->sum('xianjin');
			}else{
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%".$i."-%'".$jingban)->sum('xianjin');
			}
			$count=$count.",".$co;
		}
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年业务(现金收款)增长趋势'; 
	}else{
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%0".$i."-%'".$jingban)->sum('xianjin');
			}else{
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%".$i."-%'".$jingban)->sum('xianjin');
			}
			$count=$count.",".$co;
		}
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年业务(现金收款)增长趋势'; 	
	}
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
    $chart->createcolumnar($title,$data,$size,$height,$width,$legend);
	}
	
	
	public function pos(){
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
	  //$jingban.=" and juname='".$_REQUEST['juname']."'";	
	}
	if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''){
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%0".$i."-%'".$jingban)->sum('pos');
			}else{
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%".$i."-%'".$jingban)->sum('pos');
			}
			$count=$count.",".$co;
		}
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年业务(银联收款)增长趋势'; 
	}else{
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%0".$i."-%'".$jingban)->sum('pos');
			}else{
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%".$i."-%'".$jingban)->sum('pos');
			}
			$count=$count.",".$co;
		}
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年业务(银联收款)增长趋势'; 	
	}
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
    $chart->createcolumnar($title,$data,$size,$height,$width,$legend);
	}

	public function yue(){
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
	  //$jingban.=" and juname='".$_REQUEST['juname']."'";	
	}
	if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''){
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%0".$i."-%'".$jingban)->sum('yue');
			}else{
			$co = M($this->dbname)->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%".$i."-%'".$jingban)->sum('yue');
			}
			$count=$count.",".$co;
		}
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年业务(卡余额支付)增长趋势'; 
	}else{
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%0".$i."-%'".$jingban)->sum('yue');
			}else{
			$co = M($this->dbname)->where("addtime like '%".date("Y",time())."-%' and addtime like '%".$i."-%'".$jingban)->sum('yue');
			}
			$count=$count.",".$co;
		}
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年业务(卡余额支付)增长趋势'; 	
	}
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
    $chart->createcolumnar($title,$data,$size,$height,$width,$legend);
	}
	
	public function ticheng(){
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
	  //$jingban.=" and juname='".$_REQUEST['juname']."'";	
	}
	if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''){
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M('ticheng')->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%0".$i."-%'".$jingban)->sum('jine');
			}else{
			$co = M('ticheng')->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%".$i."-%'".$jingban)->sum('jine');
			}
			$count=$count.",".$co;
		}
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年业务提成增长趋势'; 
	}else{
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M('ticheng')->where("addtime like '%".date("Y",time())."-%' and addtime like '%0".$i."-%'".$jingban)->sum('jine');
			}else{
			$co = M('ticheng')->where("addtime like '%".date("Y",time())."-%' and addtime like '%".$i."-%'".$jingban)->sum('jine');
			}
			$count=$count.",".$co;
		}
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年业务提成增长趋势'; 	
	}
    $data = explode(",", substr ($count, 1)); 
    $size = 140; 
    $width = 1100; 
    $height = 300; 
    $legend = explode(",", substr ($info, 1));
    ob_end_clean();
    $chart->createcolumnar($title,$data,$size,$height,$width,$legend);
	}
	
	public function fukuan(){
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
	  //$jingban.=" and juname='".$_REQUEST['juname']."'";	
	}
	if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''){
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M('fukuan')->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%0".$i."-%'".$jingban)->sum('jine');
			}else{
			$co = M('fukuan')->where("addtime like '%".substr($_REQUEST['time1'],0,4)."-%' and addtime like '%".$i."-%'".$jingban)->sum('jine');
			}
			$count=$count.",".$co;
		}
		$title = get_shop_name($_REQUEST['shopid']).$_REQUEST['juname'].substr($_REQUEST['time1'],0,4).'年费用支出增长趋势'; 
	}else{
		for($i=1;$i<=12;$i++){ 	
			$info=$info.",".$i;
			if($i<10){
			$co = M('fukuan')->where("addtime like '%".date("Y",time())."-%' and addtime like '%0".$i."-%'".$jingban)->sum('jine');
			}else{
			$co = M('fukuan')->where("addtime like '%".date("Y",time())."-%' and addtime like '%".$i."-%'".$jingban)->sum('jine');
			}
			$count=$count.",".$co;
		}
	 $title = $shopname.$_REQUEST['juname'].date("Y",time()).'年费用支出增长趋势'; 	
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