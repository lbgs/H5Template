<?php
namespace Home\Controller;
use Think\Controller;
use Common\Controller\BaseController;
class BasicController extends BaseController {
	
	public function _initialize(){

		if(!session('uid')){
			redirect(U('Public/login'));
		}
       
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); 
	 
	}

  
   public function user(){
	    $info=M('user');
		if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   

       $key=I('keys');
	   if($key){
		$where=" (username like '%".$key."%' or truename like '%".$key."%' or phone like '%".$key."%' or qq like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }
		$where.=" and (shopid=".session('shopid')." )";

	   if(IS_POST&&isset($_REQUEST['filter']) && $_REQUEST['filter'] != ''){
		 $where.=' and (depname="'.I('filter').'")';
		}
	   
   $numPerPage=50;
   cookie('_currentUrl_', __SELF__);
   $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
	$this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage); 
	$filters=orgcateTree($pid=0,$level=0,$type=0);
    $this->assign('filters',$filters);
    $this->display();
   }
   
   public function huiyuan(){
	    $info=M('huiyuan');
		if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   

       $key=I('keys');
	   if($key){
		$where=" (kahao like '%".$key."%' or xingming like '%".$key."%' or dianhua like '%".$key."%' or sfz like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }

	   
   $numPerPage=50;
   cookie('_currentUrl_', __SELF__);
   $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
	$this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage); 
	$filters=orgcateTree($pid=0,$level=0,$type=0);
    $this->assign('filters',$filters);
    $this->display();
   }
   
   public function tjr(){
	    $info=M('huiyuan');
		if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   

       $key=I('keys');
	   if($key){
		$where=" (kahao like '%".$key."%' or xingming like '%".$key."%' or dianhua like '%".$key."%' or sfz like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }

	   
   $numPerPage=50;
   cookie('_currentUrl_', __SELF__);
   $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
	$this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage); 
	$filters=orgcateTree($pid=0,$level=0,$type=0);
    $this->assign('filters',$filters);
    $this->display();
   }
   
   	public function chanpin(){
    $info=M('chanpin');
       if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   
		
       $key=I('keys');
	   if($key){
		$where=" (title like '%".$key."%' or fenlei like '%".$key."%' or dalei like '%".$key."%' or bianhao like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }
	   if(session('iszb')!=='是'){
		$where.=" and (shopid=".session('shopid')."  or  shopid=0)";
		} 
	   if(IS_POST&&isset($_REQUEST['filter']) && $_REQUEST['filter'] != ''){
		 $where.=' and (fenlei="'.I('filter').'")';
		}

   $numPerPage=10;
   cookie('_currentUrl_', __SELF__);
    $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
    $filters = M("chanpin")->distinct('fenlei')->field('fenlei')->select();
    $this->assign('filters',$filters);
    $this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage); 
    $this->display();
   }
   
   public function ku(){
    $info=M('ku');
       if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   
		
       $key=I('keys');
	   if($key){
		$where=" (title like '%".$key."%' or fenlei like '%".$key."%' or dalei like '%".$key."%' or bianhao like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }

		$where.=" and (shopid=".session('shopid').")";

	   if(IS_POST&&isset($_REQUEST['filter']) && $_REQUEST['filter'] != ''){
		 $where.=' and (fenlei="'.I('filter').'")';
		}

   $numPerPage=10;
   cookie('_currentUrl_', __SELF__);
    $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
    $filters = M("ku")->distinct('fenlei')->field('fenlei')->select();
    $this->assign('filters',$filters);
    $this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage); 
    $this->display();
   }
   
   
    public function sale(){
    $info=M('ku');
       if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   
		
       $key=I('keys');
	   if($key){
		$where=" (title like '%".$key."%' or fenlei like '%".$key."%' or dalei like '%".$key."%' or bianhao like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }

		$where.=" and (shopid=".session('shopid').")";

	   if(IS_POST&&isset($_REQUEST['filter']) && $_REQUEST['filter'] != ''){
		 $where.=' and (fenlei="'.I('filter').'")';
		}

   $numPerPage=10;
   cookie('_currentUrl_', __SELF__);
    $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
    $filters = M("ku")->distinct('fenlei')->field('fenlei')->select();
    $this->assign('filters',$filters);
    $this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage);
    $this->assign('zhekou', I('zhekou'));
    $this->display();
   }

   public function cika(){
    $info=M('cika');
       if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   
		
       $key=I('keys');
	   if($key){
		$where=" (title like '%".$key."%' or bianhao like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }
		
	$where.=" and (hid=".I('hid').")";

   $numPerPage=10;
   cookie('_currentUrl_', __SELF__);
    $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
    $this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage); 
    $this->display();
   }
   
   
    public function lipin(){
    $info=M('lipin');
       if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $info->getPk();}
			
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}   
		
       $key=I('keys');
	   if($key){
		$where=" (title like '%".$key."%' or fenlei like '%".$key."%') " ;  
	   }else{
		$where=" id<>0 ";
	   }
		
	$where.=" and (shopid=".session('shopid').")";

   $numPerPage=10;
   cookie('_currentUrl_', __SELF__);
    $list=$info->where($where)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
    $this->assign('list',$list);
    $count = $info->where($where)->count();
    $this->assign('totalCount', $count);
    $this->assign('currentPage', !empty($_GET['pageNum']) ? $_GET['pageNum'] : 1);
    $this->assign('numPerPage', $numPerPage); 
    $this->display();
   }

    public function sktype(){
	$list = M("shou")->distinct('type')->field('type')->select();
    $this->assign('list', $list); 
    $this->display(); 
   }
   
   public function skleixing(){
	$list = M("shou")->distinct('leixing')->field('leixing')->select();
    $this->assign('list', $list); 
    $this->display(); 
   }
   
   public function fktype(){
	$list = M("fukuan")->distinct('type')->field('type')->select();
    $this->assign('list', $list); 
    $this->display(); 
   }
   
   public function fkleixing(){
	$list = M("fukuan")->distinct('leixing')->field('leixing')->select();
    $this->assign('list', $list); 
    $this->display(); 
   }
	
}