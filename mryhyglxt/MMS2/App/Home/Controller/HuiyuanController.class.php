<?php

/**
 *      会员管理控制器
 *      [X-Mis] (C)2007-2099  
 *      This is NOT a freeware, use is subject to license terms
 *      http://www.xinyou88.com
 *      tel:400-000-9981
 *      qq:16129825
 */

namespace Home\Controller;
use Think\Controller;

class HuiyuanController extends CommonController{

   public function _initialize() {
        parent::_initialize();
        $this->dbname = CONTROLLER_NAME;
    }
	
   function _filter(&$map) {
	   if(!in_array(session('uid'),C('ADMINISTRATOR'))){
		   
	   }
	   if(isset($_REQUEST['time1']) && $_REQUEST['time1'] != ''&&isset($_REQUEST['time2']) && $_REQUEST['time2'] != ''){$map['addtime'] =array(array('egt',I('time1').' 00:00:00'),array('elt',I('time2').' 59:59:59'));}
       if(isset($_REQUEST['shopid']) && $_REQUEST['shopid'] != ''){$map['shopid'] =array('EQ', urldecode(I('shopid'))); }
	   if(isset($_REQUEST['dengji']) && $_REQUEST['dengji'] != ''){$map['dengji'] =array('EQ', urldecode(I('dengji'))); }
if(isset($_REQUEST['zhuangtai']) && $_REQUEST['zhuangtai'] != ''){$map['zhuangtai'] =array('EQ', urldecode(I('zhuangtai'))); }


	}
	
   public function _befor_index(){ 
     $dengjilist =  M($this->dbname)->where(array('dengji'=>array('neq','')))->distinct('dengji')->field('dengji')->select();
 $this->assign('dengjilist', $dengjilist); $zhuangtailist =  M($this->dbname)->where(array('zhuangtai'=>array('neq','')))->distinct('zhuangtai')->field('zhuangtai')->select();
 $this->assign('zhuangtailist', $zhuangtailist); 
   }
  
  
  public function _befor_add(){
	  $attid=time();
	  $this->assign('attid',$attid);
    
  }
  
  public function _befor_insert($data){
	if(I('tjr')){
	 $danhao='BK'.$this->noid(C('BIANHAO_NUM'),C('BIANHAO_GUIZE'));
	 $title='推荐会员['.I('xingming').']办卡['.I('kahao').']';
	 $hid=M('huiyuan')->where(array('kahao'=>I('tjr')))->getField('id');
	  if($hid){
		 $this->addjifen($hid,$danhao,'增加',C('HUIYUAN_TUIJIAN'),$title);
		 $this->updatejifen($hid,'增加',C('HUIYUAN_TUIJIAN'));
	  }
	 
	} 
	if(I('juid')){
	 $danhao='BK'.$this->noid(C('BIANHAO_NUM'),C('BIANHAO_GUIZE'));
	 $title='推荐会员['.I('xingming').']办卡['.I('kahao').']';
	 $this->addticheng(I('juid'),I('juname'),$danhao,'会员登记提成',C('ZHUCE_TICHENG'),$title);
	} 
    $data['shopid']=session('shopid');
	return $data;
  }
	
   public function _after_add($id){
    if(I('jine')>0){
	 $danhao='CZ'.$this->noid(C('BIANHAO_NUM'),C('BIANHAO_GUIZE'));
	 $title='首次办卡['.I('kahao').']充值['.I('jine').'],赠送'.I('song');
	 $this->addzijin($id,$danhao,'充值',I('jine'),$title,0,I('jine'),0,I('song'),0);
	 $title='首次办卡['.I('kahao').']充值['.I('jine').']获得提成';
	 $ticheng=I('jine')*C('CHONGZHI_TICHENG')/100;
	 $this->addticheng(I('juid'),I('juname'),$danhao,'会员充值提成',$ticheng,$title);
	}
	if(C('SMS_HOST')!=''&& strlen(I('dianhua'))==11){
	 $jine=M('huiyuan')->where(array('id'=>$id))->getField('jine');
	 $content='亲:恭喜您于'.date("Y-m-d H:i:s",time()).'成为本店会员,级别:'.I('dengji').',卡号:'.I('kahao').',卡余额:'.$jine;
     $this->sendSMS(I('dianhua'),$content,$navTabId=""); 
	}
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
		$list = $model->where($map)->field('id,shopid,kahao,xingming,mima,sex,dianhua,dengji,sfz,shengri,dizhi,zhuangtai,jifen,jine,jici,jztime,tjr,juid,juname,beizhu')->select();
	    $headArr=array('ID','所属店铺','卡号','姓名','会员密码','性别','联系电话','会员等级','身份证号','会员生日','联系地址','会员状态','会员积分','会员余额','计次','过期时间','推荐人卡号','业务员ID','业务员','备注');
	    $filename='会员管理';
		$this->xlsout($filename,$headArr,$list);
	}
	
	public function weixiaofei() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$map['updatetime']  =  array('elt',date("Y-m-d",strtotime("-1 month")));
		$list = $model->where($map)->select();
	    $this->assign('list', $list);
		$this->display();
	}
	
	public function shengri() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$benyue=date("-m-",time());
		$xiayue=date("-m-",strtotime("+1 month"));
		$map[]  =  "shengri like '%".$benyue."%' or shengri like '%".$xiayue."%'";
		$list = $model->where($map)->select();
	    $this->assign('list', $list);
		$this->display();
	}
	
	
	public function yue() {
		$model = D($this->dbname);
		$map = $this->_search();
		if (method_exists($this, '_filter')) {
			$this->_filter($map);
		}
		$map['jine']  =  array('elt',100);
		$list = $model->where($map)->select();
	    $this->assign('list', $list);
		$this->display();
	}
	

}