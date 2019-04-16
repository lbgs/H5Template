<?php
namespace Home\Service;

class AdminService extends CommonService {
   
    public function login($admin) {
		

       
        if (!$this->existAccount($admin['username'])) {
			return array('status' => 0,
                     'data' => '用户不存在！');
        }

        $account = M('user')->getByUsername($admin['username']);
       
        if ($account['password'] != $this->encrypt($admin['password'])) {
			return array('status' => 0,
                     'data' => '密码不正确！');
        }

       session('uid',$account['id']);
	   session('username',$account['username']);
	   session("truename",$account['truename']);
	   session('shopid',$account['shopid']);
	   session('shopname',get_shop_name($account['shopid']));
	   session('depname',$account['depname']);
	   session('posname',$account['posname']);
	   session('phone',$account['phone']);
	   session('email',$account['email']);
	   session('loginip',get_client_ip());
	   session('logintime',date("Y-m-d H:i:s",time()));
	   session('logins',$account['logins']);
       $iszb=M('shop')->where(array("id"=>$account['shopid']))->getField('iszb');
	   session('iszb',$iszb);
        $data['id'] = session('uid');
        $data['logintime'] = date("Y-m-d H:i:s",time());
        $data['loginip'] = get_client_ip();
		$data['logins'] = array('exp','logins+1');
		$data['update_time']=time();
        M("user")->save($data);
		  
		 
          
        $dat['username'] = session('username');
        $dat['content'] = '登录成功！';
		$dat['os']=$_SERVER['HTTP_USER_AGENT'];
        $dat['url'] = U();
        $dat['addtime'] = date("Y-m-d H:i:s",time());
        $dat['ip'] = get_client_ip();
        M("log")->add($dat);

        return array('status' => 1);
    }


    public function logout() {
		$dat['username'] = session('username');
        $dat['content'] = '退出成功！';
		$dat['os']=$_SERVER['HTTP_USER_AGENT'];
        $dat['url'] = U();
        $dat['addtime'] = date("Y-m-d H:i:s",time());
        $dat['ip'] = get_client_ip();
        M("log")->add($dat);
        session_unset();
		session_destroy();
    }


	
	 public function existAccount($username) {
        if (M('user')->where(array("username"=>$username,"status"=>1))->count() > 0) {
            return true;
        }
        return false;
    }
	
	
    public function encrypt($data) {
        //return md5(C('AUTH_MASK') . md5($data));
		return md5(md5($data));
    }
}
