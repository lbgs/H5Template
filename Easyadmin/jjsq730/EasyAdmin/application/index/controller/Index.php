<?php
namespace app\index\controller;
use org\Http;
use app\common\controller\HomeBase;
use think\Controller;
use think\Session;
use think\Db;
use think\Model;
use think\Cache;
use app\common\model\User as UserModel;
class Index extends  HomeBase
{
    public function _initialize()
    {
    	parent::_initialize();
    }
    public function login()
    {
    	$site_config = Cache::get('site_config');
    	$yzmarr=explode(',', $site_config['site_yzm']);
    	

    	if(in_array(2, $yzmarr)){
    		$loginyzm=1;
    	}else{
    		$loginyzm=0;
    	}
 
    
    	$this->assign('loginyzm',$loginyzm);
    	$member = new UserModel();
    	if (request()->isPost()) {
    
    
    		if(in_array(2, $yzmarr)){
    			if(!captcha_check(input('code'))){
    
    				return json(array('code' => 0, 'msg' => '验证码错误'));
    
    
    			}
    				
    		}
    		$data = input('post.');
    		$status['status'] = array('gt',0);
    		$user = $member->where($status)->where('usermail', $data['email'])->find();
    		if ($user) {
    			if ($user['password'] == md5($data['pass'].$user['salt'])) {
    				 
    				if($user['userhead']==''){
    					$user['userhead']='/public/images/default.png';
    				}
    				session('userstatus', $user['status']);
    				session('grades', $user['grades']);
    				session('userhead', $user['userhead']);
    				session('username', $user['username']);
    				session('userid', $user['id']);
    				session('point', $user['point']);
    				$member->update(
    						[
    								'last_login_time' => time(),
    								'last_login_ip'   => $this->request->ip(),
    								'id'              => $user['id']
    						]
    				);
    					
    				//$member->where('id',session('userid'))->setInc('point',$site_config['jifen_login']);
    				
    				point_note($site_config['jifen_login'],session('userid'),'login');
    				
    				return json(array('code' => 200, 'msg' => '登录成功'));
    			} else {
    				return json(array('code' => 0, 'msg' => '密码错误'));
    			}
    		} else {
    			return json(array('code' => 0, 'msg' => '账号错误'));
    		}
    	}
    	return view();
    }
    public function index()
    {  

    	
    	
  $forum = Db::name('forum');
        $open['open'] = 1;
        $settop['settop'] = 1;
        $nosettop['settop'] = 0;
        $tptc = $forum->alias('f')->join('forumcate c', 'c.id=f.tid')->join('user m', 'm.id=f.uid')->field('f.*,c.id as cid,m.id as userid,m.userhead,m.username,c.name')->where($open)->where($settop)->order('f.id desc')->limit(5)->select();
        $this->assign('tptc', $tptc);
        $tptcs = $forum->alias('f')->join('forumcate c', 'c.id=f.tid')->join('user m', 'm.id=f.uid')->field('f.*,c.id as cid,m.id as userid,m.userhead,m.username,c.name')->where($open)->where($nosettop)->order('f.id desc')->paginate(15);
        $this->assign('tptcs', $tptcs);
    	
  
        return view();
    }
    public function right(){
    	
    	
    	
    }
    public function zan(){
    	 
    	$data=$this->request->param();
    	$uid = session('userid');
    	if (!session('userid') || !session('username')) {
    		return json(array('code'=>0,'msg'=>'请先登录'));
    	}else{
    		
    		$insertdata['type']=2;
    		$insertdata['uid']=$uid;
    		$insertdata['sid']=$data['id'];
    		
    		$n=Db::name('zan')->where($insertdata)->find();
    		if(empty($n)){
    			$insertdata['time']=time();
    			if(Db::name('zan')->insert($insertdata)){
    				
    				Db::name('comment')->where('id',$data['id'])->setInc('praise');
    				
    				return json(array('code'=>200,'msg'=>'操作成功'));
    			}else{
    				return json(array('code'=>0,'msg'=>'操作失败'));
    			}
    			
    			
    			
    		}else{
    			return json(array('code'=>0,'msg'=>'你已经赞过该评论'));
    		}
    		
    	}
    	
    	
    	
    	 
    }
    public function yzemailurl($id){
    	if (!session('userid') || !session('username')) {
    		 
    		$this->error('亲！请登录',url('index/login'));
    	} else {
    		$uid = session('userid');
    		$user=db('user')->where(array('id'=>$uid))->find();
    		
    		if($id==md5($user['salt'].$uid.$user['usermail'])){
    			if($user['status']==1){
    			
    			db('user')->where(array('id'=>$uid))->setField('status',2);
    			
    			}else{
    				db('user')->where(array('id'=>$uid))->setField('status',5);
    				
    			}
    			$site_config = Cache::get('site_config');
    			
    			point_note($site_config['jifen_email'],$uid,'yzemail');
    			$this->success('验证成功',url('user/set'));
    			
    			
    		}else{
    			$this->error('非法验证',url('user/set'));
    		}
    		
    	}
    	
    	
    	
    	
    }
    public function yzemail(){
    	
    	$mail=$this->request->param();
    	$uid = session('userid');
    	$user=db('user')->where(array('id'=>$uid))->find();
    	$mailarr=db('user')->column('usermail');
    	if(in_array($mail['email'], $mailarr)&&$user['usermail']!=$mail['email']){
    		return json(array('code'=>0,'msg'=>'该邮箱已经被其他账号注册'));
    	}else{
    		$n['usermail']=$mail['email'];
    		db('user')->where(array('id'=>$uid))->update($n);
    		$data['email']=$mail['email'];
    		$data['title']='邮箱验证';
    		$str=md5($user['salt'].$uid.$data['email']);
    		$data['body']='http://'.$_SERVER['HTTP_HOST'].url('index/yzemailurl').'?id='.$str;
    		asyn_sendmail($data);
    		return json(array('code'=>1,'msg'=>'邮件已发送，请到邮箱进行查收'));
    		
    		
    	}
    	
    	
    	
    	
    	
    	
    	
    }
    public function reyzemail(){
    	 
    	$mail=$this->request->param();
    	$uid = session('userid');
    	$user=db('user')->where(array('id'=>$uid))->find();
    	
    	
    	$mailarr=db('user')->column('usermail');
    	if(in_array($mail['email'], $mailarr)&&$user['usermail']!=$mail['email']){
    		return json(array('code'=>0,'msg'=>'该邮箱已经被其他账号注册'));
    	}else{
    		
    		$n['usermail']=$mail['email'];
    		if($user['status']==2){
    			$n['status']=1;
    		}else{
    			$n['status']=3;
    		}
    		
    		
    		
    		db('user')->where(array('id'=>$uid))->update($n);
    		
    		$data['email']=$mail['email'];
    		$data['title']='邮箱验证';
    		$str=md5($user['salt'].$uid.$data['email']);
    		$data['body']='http://'.$_SERVER['HTTP_HOST'].url('index/yzemailurl').'?id='.$str;
    		asyn_sendmail($data);
    		return json(array('code'=>1,'msg'=>'邮箱登录已更改为新邮箱，请到邮箱查收验证'));
    	}
    	
    	 
    	 
    	
    	 
    }
    
    public function send_mail()
    {
    	
    		
     	$mail=$this->request->param();
     	
        $res=send_mail_local($mail['email'], $mail['title'], $mail['body']);
    
    if($res==1){
    	return json(array('code'=>1,'msg'=>'邮件已发送，请到邮箱进行查收'));
    //	$this->success('邮件已发送，请到邮箱进行查收');
    }else{
    	return json(array('code'=>0,'msg'=>'邮件发送失败，请检查邮箱设置'));
    	//$this->error('邮件发送失败，请检查邮箱设置');
    }
     }
	public function search()
    {
        $ks=input('ks');
        if (empty($ks)) {
            return $this->error('亲！你迷路了');
        } else {
			$forum = Db::name('forum');
			$open['open'] = 1;
		
			$map['f.title|f.keywords'] = ['like', "%{$ks}%"];
			
			$tptc = $forum->alias('f')->join('forumcate c', 'c.id=f.tid')->join('user m', 'm.id=f.uid')->field('f.*,c.id as cid,m.id as userid,m.userhead,m.username,c.name')->order('f.id desc')->where($open)->where($map)->paginate(15,false,$config = ['query'=>array('ks'=>$ks)]);
			$this->assign('tptc', $tptc);
			return view();
		}
    }
    public function view()
    {
        $id = input('id');
        if (empty($id)) {
            return $this->error('亲！你迷路了');
        } else {
            $category = Db::name('forumcate');
            $c = $category->where("id = {$id}")->find();
            if ($c) {
                $forum = Db::name('forum');
                $open['open'] = 1;
                $tptc = $forum->alias('f')->join('forumcate c', 'c.id=f.tid')->join('user m', 'm.id=f.uid')->field('f.*,c.id as cid,m.id as userid,m.userhead,m.username,c.name')->where("f.tid={$id}")->where($open)->order('f.id desc')->paginate(15);
                $this->assign('tptc', $tptc);
                
                
                $this->assign('name', $c['name']);
                return view();
            } else {
                $this->error("亲！你迷路了！");
            }
        }
    }
	public function forum()
    {
        return view();      
    }
    public function choice()
    {
        $forum = Db::name('forum');
        $open['open'] = 1;
		$choice['choice'] = 1;
        $tptc = $forum->alias('f')->join('forumcate c', 'c.id=f.tid')->join('user m', 'm.id=f.uid')->field('f.*,c.id as cid,m.id as userid,m.userhead,m.username,c.name')->where($open)->where($choice)->order('f.id desc')->paginate(15);
        $this->assign('tptc', $tptc);
        return view();
    }
	public function errors()
    {
        return view();      
    }
    public function download($url,$name,$local)
    {
    	$down = new Http();
    	if($local==1){
    		$down->download($url,$name);
    	}else{
    		
    	//echo 	$down->curlDownload($url,$name);
    		
    	}
    	
    	
    } 
	public function thread()
    {
        $id = input('id');
        if (empty($id)) {
            return $this->error('亲！你迷路了');
        } else {
            $forum = Db::name('forum');
            $a = $forum->where("id = {$id}")->find();
            if ($a) {
                $forum->where("id = {$id}")->setInc('view', 1);
                $t = $forum->alias('f')->join('forumcate c', 'c.id=f.tid')->join('user m', 'm.id=f.uid')->field('f.*,c.id as cid,c.name,m.id as userid,m.grades,m.point,m.userhead,m.username')->find($id);
                $this->assign('t', $t);
                $content = $t['content'];
                
               // $content = htmlspecialchars_decode($content);
                
               
                
                
                $this->assign('content', $content);
                $tptc = Db::name('comment')->alias('c')->join('user m', 'm.id=c.uid')->where("fid = {$id}")->order('c.id asc')->field('c.*,m.id as userid,m.grades,m.point,m.userhead,m.username')->paginate(15);
              
                $this->assign('tptc', $tptc);
                return view();
            } else {
                return $this->error('亲！你迷路了');
            }
        }
    }
}