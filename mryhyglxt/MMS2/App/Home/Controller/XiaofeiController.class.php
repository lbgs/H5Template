<?php

/**
 *      消费记录控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class XiaofeiController extends CommonController{

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
	   $map['zhuangtai']=	array('NEQ', '挂单');
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['addtime'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}

	   if(isset($_REQUEST['type']) && $_REQUEST['type'] != ''){$map['type'] =array('EQ', urldecode(I('type'))); }
if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }


	}
	
   public function _befor_index(){ 
     $typelist =  M($this->dbname)->where(array('type'=>array('neq','')))->distinct('type')->field('type')->select();
 $this->assign('typelist', $typelist); $shopidlist =  M($this->dbname)->where(array('shopid'=>array('neq','')))->distinct('shopid')->field('shopid')->select();
 $this->assign('shopidlist', $shopidlist); 
   }
  
  public function liushui() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		if (isset($_REQUEST ['orderField'])) {$order = $_REQUEST ['orderField'];}
		if($order=='') {$order = $model->getPk();}
		if (isset($_REQUEST ['orderDirection'])) {$sort = $_REQUEST ['orderDirection'];}
		if($sort=='') {$sort = $asc ? 'asc' : 'desc';}

		if (isset($_REQUEST ['pageCurrent'])) {$pageCurrent = $_REQUEST ['pageCurrent'];}
		if($pageCurrent=='') {$pageCurrent =1;}
	   $numPerPage=C('PERPAGE');
	   $list = $model->where($map)->order("`" . $order . "` " . $sort)->limit($numPerPage)->page($pageCurrent.','.$numPerPage.'')->select();
	   $count = $model->where($map)->count();
	   $typelist =  M($this->dbname)->where(array('type'=>array('neq','')))->distinct('type')->field('type')->select();
       $this->assign('typelist', $typelist); 
	   $this->assign('list', $list); 
	   $this->assign('totalCount', $count);//数据总数
	   $this->assign('currentPage', !empty($_REQUEST[C('VAR_PAGE')]) ? $_REQUEST[C('VAR_PAGE')] : 1);//当前的页数，默认为1
	   $this->assign('numPerPage', $numPerPage); //每页显示多少条
	   cookie('_currentUrl_', __SELF__);
	   $this->display();
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
		$list = $model->where($map)->field('id,danhao,hid,xingming,kahao,type,jine,jian,fukuan,jifen,shopid')->select();
	    $headArr=array('ID','订单编号','会员ID','会员姓名','会员卡号','消费类型','消费金额','优惠金额','实际付款','获得积分','消费店铺');
	    $filename='消费记录';
		$this->xlsout($filename,$headArr,$list);
	}
	
	 public function guadan(){ 
        $model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$map['zhuangtai']  =  array('eq','挂单');
		$list = $model->where($map)->select();
	    $this->assign('list', $list);
		$this->display();
   }

   
   public function chedan(){

		$id=I('get.id');
		if($id){
			
		
		$frs=M('xiaofei')->find($id);
		if($frs['hid']==0){
		  $hid=0;
		  $xingming='散客';
		  $kahao="无卡号";
		}else{
		  $hid=$frs['hid'];
		  $xingming=$frs['xingming'];
		  $kahao=$frs['kahao'];
		}
		
		if($frs['type']=='消费撤单'||$frs['type']=='计次消费'||$frs['type']=='会员充次'||$frs['zhuangtai']=='已撤单'){
			$this->mtReturn(300,'对不起！该类型不能撤单或已经撤单！',$_REQUEST['navTabId'],false);
		}
		M('xiaofei')->where(array('id'=>$id))->setField('zhuangtai','已撤单');
		M('xiaofeis')->where(array('xid'=>$id))->setField('zhuangtai','已撤单');
		
		$odanhao=$frs['danhao'];
		$zhuangtai='消费撤单';	
		$danhao='CD'.$this->noid(C('BIANHAO_NUM'),1);
		$data['zhuangtai']=$zhuangtai;
		$data['hid']=$hid;
		$data['danhao']=$danhao;
		$data['xingming']=$xingming;
		$data['kahao']=$kahao;
		$data['type']='消费撤单';
		$data['yue']='-'.$frs['yue'];
		$data['jine']='-'.$frs['jine'];
		$data['jian']='-'.$frs['jian'];
		$data['fukuan']='-'.$frs['fukuan'];
		$data['jifen']='-'.$frs['jifen'];
		$data['shopid']=session('shopid');
		$data['uid']=session('uid');
		$data['uname']=session('truename');
		$data['addtime'] = date("Y-m-d H:i:s",time());
		M('xiaofei')->add($data);
		$xid = M('xiaofei')->getLastInsID();
		
		$yue=$frs['yue'];
		$xianjin=$frs['xianjin'];
        $pos=$frs['pos'];
		$jian=$frs['jian'];
		$jine=$frs['jine'];
        $shishou=$frs['shishou'];
		$title=$frs['title'];
		
		 $mingxi=M('xiaofeis')->where(array("xid"=>$id))->select();
		 if($mingxi){
		 foreach ($mingxi as $keys=>$v) {
		 $xdata[]=array(    
		                    'bianhao'=>$mingxi[$keys]['bianhao'],
							'title'=>$mingxi[$keys]['title'],
							'xjiage'=>$mingxi[$keys]['xjiage'],
							'zjiage'=>$mingxi[$keys]['zjiage'],
							'shuliang'=>$mingxi[$keys]['shuliang'],
							'xiaoji'=>$mingxi[$keys]['xiaoji'],
							'jifen'=>$mingxi[$keys]['jifen'],
							'juid'=>$mingxi[$keys]['juid'],
							'juname'=>$mingxi[$keys]['juname'],
							'shopid'=>$mingxi[$keys]['shopid'],
							'danhao'=>$danhao,
							'zhuangtai'=>$zhuangtai,
							'xid'=>$xid,
							 'uid'=>session('uid'),
							 'uname'=>session('truename'),
							 'addtime'=>date("Y-m-d H:i:s",time())
                          );
						$jifen+=$xdata[$keys]['jifen']; 
						D('xiaofeis')->add($xdata[$keys]);
                        
						if($mingxi[$keys]['juid']!==0&&$mingxi[$keys]['juname']!==''){
							//退提成//
						  $title='卡号['.$kahao.']消费撤单['.$xdata[$keys]['title'].']退提成';
						  $tctype=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('tctype');
						  $ticheng=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->getField('ticheng');
						  if($tctype==0){
						  	$tichengjine="-".($xdata[$keys]['xiaoji']*$ticheng/100);
						  }else{
							$tichengjine="-".($ticheng*$xdata[$keys]['shuliang']);
						  }
	                      $this->addticheng($xdata[$keys]['juid'],$xdata[$keys]['juname'],$danhao,'消费撤单',$tichengjine,$title);
						}
						
						
						
						$crs=M('chanpin')->where(array('bianhao'=>$xdata[$keys]['bianhao']))->find();
						  $cdata['title']=$crs['title'];
						  $cdata['bianhao']=$crs['bianhao'];
						  $cdata['shopid']=session('shopid');
						  $cdata['dalei']=$crs['dalei'];
						  $cdata['fenlei']=$crs['fenlei'];
						  $cdata['type']=$crs['danwei'];
						  $cdata['danwei']=$crs['danwei'];
						  $cdata['shuliang']=$xdata[$keys]['shuliang'];
						  $cdata['jingban']=session('truename');
						  $cdata['shijian']=date("Y-m-d H:i:s",time());
						  $cdata['shenhe']='审核通过';
						  $cdata['beizhu']='卡号['.$kahao.']消费撤单,返还入库';
						M('rukus')->add($cdata);
						$bmap= array();
						$bmap[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"title"=>array('EQ',$xdata[$keys]['title']),"_logic"=>"and");
						$count=M('chanpin')->where($bmap)->count();
						if ($count > 0) {
						M("chanpin")->where($bmap)->setInc('kucun',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"入库失败，入库产品不存在",$_REQUEST['navTabId'],false);		
						}
						
						$bmap1= array();
						$bmap1[] = array("bianhao"=>array('EQ', $xdata[$keys]['bianhao']),"shopid"=>array('EQ',session('shopid')),"_logic"=>"and");
						$count1=M('ku')->where($bmap1)->count();
						if ($count1 > 0) {
						M("ku")->where($bmap1)->setInc('kucun',$xdata[$keys]['shuliang']);
						}else{
						 $this->mtReturn(300,"入库失败，入库产品不存在",$_REQUEST['navTabId'],false);		
						}				 					  
	    }
	    $sdata['id']=$xid;
	    $sdata['jifen']=$jifen;
	    M('xiaofei')->save($sdata);
	  }else{
		 $jifen=$frs['jifen'];
	  }
	  
	 
     
	 
	    $yhrs=M('zijin')->where(array('danhao'=>$odanhao))->find();
		$yue=$yhrs['yue'];
		$yue1="-".$yhrs['yue'];
		$xianjin="-".$yhrs['xianjin'];
		$shishou="-".$yhrs['jine'];
		$pos="-".$yhrs['pos'];
		$jian="-".$yhrs['jian'];
		if($yue>0){
		  $title='卡号['.$kahao.']商品消费撤单,卡退款'.$yue;
	      }else{
		  $title='卡号['.$kahao.']商品消费撤单,退回'.$shishou;
	    }  

	    $this->addzijin($hid,$danhao,'消费撤单',$shishou,$title,$yue1,$xianjin,$pos,0,$jian);
	    $this->updatezijin($hid,'增加',$yue); 
	 
	 
	 if($jifen>0){
		$title='卡号['.$kahao.']商品消费撤单，扣除积分';
		$jifen1='-'.$jifen;
		$this->addjifen($hid,$danhao,'消费撤单',$jifen1,$title);
		$this->updatejifen($hid,'减少',$jifen);
	 }	
	    $this->addxiaofei($hid,$shishou);
		//sms
	  $shouji=M('huiyuan')->where(array('id'=>$hid))->getField('dianhua');
	  $kayue=M('huiyuan')->where(array('id'=>$hid))->getField('jine');
	  if(C('SMS_HOST')!=''&& strlen($shouji)==11){
	   $content='亲:您的卡号:'.I('kahao').'于'.date("Y-m-d H:i:s",time()).'消费撤单'.$shishou.',卡余额:'.$kayue;
       $this->sendSMS($shouji,$content,$navTabId=""); 
	  }
	 //
        $this->mtReturn(200,'消费撤单成功 ','zijin',false);
	
	} 
   }

	

}