<?php
namespace Admin\Controller;
use Think\Controller;
class PublicController extends Controller {

    
   
   public function attfile(){
       $attid=I('attid');
	   $this->assign('attid',$attid);
       $this->display();
   }
   
   public function uploads(){
	   if(!cookie('aid')){
			redirect(U('index/login'));
		}
	   $list=M('files')->where('attid='.I("attid"))->select();
	   $this->assign('list',$list);
       $this->display();
   }
   
   public function filelock(){
	   if(!cookie('aid')){
			redirect(U('index/login'));
		}
		$model = D('files');
		$id = I('get.id');
		if($id){
			$data=$model->find($id);
			$data['id']=$id;
			if($data['status']==1){
				$data['status']=0;
				$msg='锁定';
				if (method_exists($this, '_befor_lock')) {
                $this->_befor_lock($id);
                 }	
			}else{
				$data['status']=1;
				$msg='启用';
			}
			$model->save($data);
			$data['statusCode']=200;
			$data['message']=$msg.$id;
			$data['tabid']=$_REQUEST['navTabId'];
			$data['closeCurrent']='true';
			$data['forward']='';
		    $this->dwzajaxReturn($data);
		}

	}
   
    public function upload(){
	 if(!cookie('aid')){
			redirect(U('index/login'));
		}
     $upload = new \Think\Upload();
	 $upload->maxSize   =     C('UPLOAD_MAXSIZE') ;
	 $upload->exts      =     C('UPLOAD_EXTS');
	 $upload->savePath  =     C('UPLOAD_SAVEPATH');
	 $info   =  $upload->upload(); 
	 $gourl = 'index.php/admin/public/attfile/attid/'.I('attid').'/'; 
	 if(!$info) {
        echo "<script language='javascript' type='text/javascript'>"; 
		echo "alert('上传失败！$upload->getError()');";
		echo "window.location.href='$gourl'"; 
		echo "</script>";  			 
	   //$this->error($upload->getError());    
	}else{     
	   //dump($info);
	   $image = new \Think\Image(); 
	   $image->open('Uploads/'.str_replace('./','',$info["filename"]["savepath"]).$info["filename"]["savename"].'');
	   $width = $image->width(); 
	   if($width>800){
		   $image->thumb(800, 800)->save('Uploads/'.str_replace('./','',$info["filename"]["savepath"]).$info["filename"]["savename"].'');
	   }
	   $data['attid']=I('attid');
	   $data['folder']='Uploads/'.str_replace('./','',$info["filename"]["savepath"]);
	   $data['filename']=$info["filename"]["savename"];
	   $data['filetype']=$info["filename"]["ext"];
	   $data['filedesc']=$info["filename"]["name"];
	   $data['uid']=cookie('aid');
	   $data['addtime']=date("Y-m-d H:i:s",time());
	   //dump($data);
	   M('files')->data($data)->add();
		$filename=$info["filename"]["name"];
		echo "<script language='javascript' type='text/javascript'>"; 
		echo "alert('文件$filename 上传成功,如果无需再上传图片，请点▼提交▼按钮');";
		echo "window.location.href='$gourl'"; 
		echo "</script>";  
	  }
	}
   
	
   	

   

	
}