<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use think\Cache;
use think\Db;

use app\common\model\User as UserModel;
class Login extends HomeBase
{
	protected $site_config;
	protected $yzmarr;
	public function _initialize()
	{
		parent::_initialize();
		$this->site_config = Cache::get('site_config');
		
		$this->yzmarr=explode(',', $this->site_config['site_yzm']);
		
		if(in_array(1, $this->yzmarr)){
			$regyzm=1;
		}else{
			$regyzm=0;
		}
		if(in_array(2, $this->yzmarr)){
			$loginyzm=1;
		}else{
			$loginyzm=0;
		}
		if(in_array(3, $this->yzmarr)){
			$forgetyzm=1;
		}else{
			$forgetyzm=0;
		}
		$this->assign('regyzm',$regyzm);
		$this->assign('loginyzm',$loginyzm);
		$this->assign('forgetyzm',$forgetyzm);
		
		
	}

    public function reg()
    {
    	
    	
    	
    	$regswitch=Cache::get('site_config');
    	if(!$regswitch['user_reg']){
    		$this->error('网站已关闭会员注册功能',url('index/index'));
    	}
        $member = new UserModel();
        if (request()->isPost()) {
        	
        	if(!$regswitch['user_reg']){
        		
        		return json(array('code' => 0, 'msg' => '网站已关闭会员注册功能'));
        	}
        	
        	
        	$data            = $this->request->post();
        	$password = input('password');
        	//$passwords = input('confirm_password');
        	//return json(array('code' => 0, 'msg' => '注册失败'));
            if(in_array(1, $this->yzmarr)){
				if(!captcha_check(input('code'))){
				
					return json(array('code' => 0, 'msg' => '验证码错误'));
				
					 
				}
				 
			}
           
            $validate_result = $this->validate($data, 'User');
           
            if ($validate_result !== true) {
            	// $this->error($validate_result);
            	return json(array('code' => 0, 'msg' =>$validate_result));
            } else {
            	
            	$data['salt'] = generate_password(18);
            	$data['regtime'] = time();
            	$data['grades'] = 0;
            	$data['status'] = 1;//config('web.WEB_REG');
            	$data['point'] = $this->site_config['jifen_reg'];//config('point.REG_POINT');
            	$data['userhead'] = '/public/images/default.png';
            	$data['userip'] = $_SERVER['REMOTE_ADDR'];
            	$data['password'] = md5($password.$data['salt']);
            	
            
            	if ($member->allowField(true)->save($data)) {
            		
            		point_note($regswitch['jifen_reg'],$member->id,'reg');
            		
            		return json(array('code' => 200, 'msg' => '注册成功'));
            	} else {
            		
            		return json(array('code' => 0, 'msg' => '注册失败'));
            	}
            	
            	
            }
        }    
            
          //  $data = input('post.');
		
        return view();
    }

    
    public function resetpass(){
    	
    	$data=$this->request->param();
            if(in_array(3, $this->yzmarr)){
				if(!captcha_check(input('code'))){
				
					return json(array('code' => 0, 'msg' => '验证码错误'));
				
					 
				}
				 
			}
   
    		
    		if($data['pass']!=$data['repass']){
    			return json(array('code' => 0, 'msg' => '两次密码输入不一致'));
    		}else{
    			$n=Db::name('user')->where('id',$data['id'])->find();
    			Db::name('user')->where('id',$data['id'])->setField('password',md5($data['pass'].$n['salt']));
    			return json(array('code' => 200, 'msg' => '密码修改成功，请重新登录'));
    			
    			
    		}
    		
    		
    	
    	
    }
    
    
    public function resetmima(){
    	$data=$this->request->param();
    	$n=Db::name('user')->where('id',$data['mod'])->find();
    	if(md5($n['salt'].$n['id'].$n['usermail'])==$data['id']){
    		
    		$this->assign('userid',$n['id']);
    		$this->assign('username',$n['username']);
    		return view();
    	}else{
    		$this->error('非法操作',url('login/forget'));
    	}
    	
    }
    
    
    public function forget()
    {
    	
    	if (request()->isPost()) {
    		
    		
    		$datan=$this->request->param();
    		
    	if(in_array(3, $this->yzmarr)){
				if(!captcha_check(input('code'))){
				
					return json(array('code' => 0, 'msg' => '验证码错误'));
				
					 
				}
				 
			}
    		
    			
    			$n=Db::name('user')->where('usermail',$datan['usermail'])->find();
    			
    			if(empty($n)||($n['status']!=2&&$n['status']!=5)){
    				return json(array('code' => 0, 'msg' => '邮箱未激活或邮箱未注册'));
    			}else{
    				
    				$data['email']=$n['usermail'];
    				
    				$data['title']='找回密码';
    				$str=md5($n['salt'].$n['id'].$n['usermail']);
    				
    				$data['body']='http://'.$_SERVER['HTTP_HOST'].url('login/resetmima').'?mod='.$n['id'].'&id='.$str;
    				
    				
    				asyn_sendmail($data);
    				return json(array('code'=>200,'msg'=>'邮件已发送，请到邮箱进行查收'));
    				 
    				 
    				 
    			}
    		
    		

    		
    	}else{
    		
    	
    	}
    	return view();
  
    }
    public function logout()
    {
    	session("userstatus", NULL);
        session("userid", NULL);
        session("username", NULL);
		session("usermail", NULL);
        session("kouling", NULL);
        return json(array('code' => 200, 'msg' => '退出成功'));
      //  return NULL;
    }
}