<?php
namespace Home\Controller;
use Think\Controller;

class WeixinController extends Controller{
    
	 public function _initialize(){
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); 
    }
	
    public function index($id = ''){

    ob_clean();
	$wrs=M('weiset')->find(1);
	$token = $wrs['token']; 
	$appid = $wrs['appid'];
	$secret = $wrs['appsecret'];
	$wechat = new \Com\Wechat ( $token );
    $data = $wechat->request();
	
	
	if ($data['MsgType']=='text'){
		$keyword=$data['Content'];
		$sdata['openid']=$data['FromUserName'];
		$sdata['title']=$data['Content'];
		$sdata['addtime']=date("Y-m-d H:i:s",time());
		$where=" keyword like '%".$keyword."%' and status=1 ";
		$count=M('replay')->where($where)->count('id');
		if($count>0){
			$sdata['content']='已按指定规则回复';
			$RRS=M('replay')->where($where)->order('id desc')->find();
			if($RRS['type']=='文本'){
			 M('replays')->add($sdata);
			 $wechat->replyText($RRS['title']); 
		    }else{
			 $class=M('replay')->where($where)->order('id desc')->limit(10)->select();
			 $k=1;
             foreach($class as $key=>$vo){
			 $contents[$k-1]=array($vo['biaoti'],$vo['content'],$vo['url'],$this->getpic($vo['attid']));
              $k++;							
			 }
			 $type    = 'news'; 
			 M('replays')->add($sdata);
			 $wechat->response($contents, $type); 
		  }
		}else{
		  $rs=M('replay')->where("keyword='默认回复'")->order('id desc')->find();
		  if($rs['type']=='文本'){
			 M('replays')->add($sdata);
			 $wechat->replyText($rs['title']); 
		  }else{
			 $content=array( array($rs['biaoti'],$rs['content'],$rs['url'],$this->getpic($rs['attid']))); 
			 $type    = 'news'; 
			 M('replays')->add($sdata);
			 $wechat->response($content, $type); 
		  }
		}		
	}
	
	
	
	if ($data['MsgType']=='event') {
			switch ($data['Event']){
				case 'subscribe'://首次关注返回
				        $sdata['openid']=$data['FromUserName'];
		                $sdata['addtime']=date("Y-m-d H:i:s",time());
						M('guanzhu')->add($sdata);
				        $RS=M('replay')->where("keyword='首次关注'")->order('id desc')->find();
		                  if($RS['type']=='文本'){
			              $wechat->replyText($RS['title']); 
		                  }else{
			              $content=array(array($RS['biaoti'],$RS['content'],$RS['url'],$this->getpic($RS['attid']))); 
			              $type    = 'news'; 
			              $wechat->response($content, $type); 
		                  }
						 break;
				case 'unsubscribe'://取消关注
						M('guanzhu')->where(array('openid'=>$data['FromUserName']))->delete();
						break;			 
				case 'CLICK':
						$keyword=$data['EventKey'];
						$where=" keyword like '%".$keyword."%' and status=1 ";
						$count=M('replay')->where($where)->order('id desc')->count('id');
						if ($count>1){
							$class=M('replay')->where($where)->order('id desc')->limit(10)->select();
							$k=1;
                            foreach($class as $key=>$vo){
							 $contents[$k-1]=array($vo['biaoti'],$vo['content'],$vo['url'],$this->getpic($vo['attid']));
                             $k++;							
							}
							$type    = 'news'; 
			              $wechat->response($contents, $type); 
						}else{
						  $RS=M('replay')->where($where)->order('id desc')->find();
						  if($RS['type']=='文本'){
			              $wechat->replyText($RS['title']); 
		                  }else{
			              $content=array(array($RS['biaoti'],$RS['content'],$RS['url'],$this->getpic($RS['attid']))); 
			              $type    = 'news'; 
			              $wechat->response($content, $type); 
		                  }
						}
		                  
					break;
			}
	}
   
   
	}
	
	
	protected function getpic($attid) {
	  $trs=M('files')->where(array('attid'=>$attid))->order('id desc')->find();
	  $pic='http://'.$_SERVER['SERVER_NAME'].__ROOT__.'/'.$trs['folder'].$trs['filename'];
	  return $pic;
	}
}
