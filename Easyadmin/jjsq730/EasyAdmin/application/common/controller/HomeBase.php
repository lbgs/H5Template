<?php
namespace app\common\controller;

use think\Cache;
use think\Controller;
use think\Db;
use think\Config;
use think\Session;
use think\captcha\Captcha;
class HomeBase extends Controller
{

     public function captcha(){
       $m = new Captcha(Config::get('captcha'));
       $img = $m->entry();
       return $img;
    }
    protected function _initialize()
    {
        parent::_initialize();
        $this->getSystem();
        $this->getNav();
      //  $this->getSlide();

      //  $controller = $this->request->controller();
       // $action     = $this->request->action();
      //  $this->assign('controller', strtolower($controller));
      //  $this->assign('action', strtolower($action));
    
        $show['show'] = 1;
        $status['status'] = 1;
		$open['open'] = 1;
		$choice['choice'] = 1;
	//	$tptm = Db::name('user')->order('id desc')->limit(12)->select();
		$tptm =  Db::name('forum')->alias('f')->join('user u', 'f.uid=u.id')
		->field('u.*,count(f.id) as forumnum')
		->group('uid')->order('forumnum desc')->limit(12)
		->select();
		
		//$tptm =  Db::name('user')->alias('u')->join('forum f', 'f.uid=u.id')->field('u.*,count(f.id) as forumnum')->order('forumnum desc')->limit(12)->select();
		
	
        $this->assign('tptm', $tptm);
       /*  $tptl = Db::name('link')->where($status)->order('id desc')->select();
        $this->assign('tptl', $tptl); */
		$tpte = Db::name('forum')->where($open)->where($choice)->order('id desc')->limit(9)->select();
        $this->assign('tpte', $tpte);
		$tptf = Db::name('forum')->where($open)->order('view desc')->limit(9)->select();
        $this->assign('tptf', $tptf);
		$tpto = Db::name('forumcate')->where($show)->order('sort desc')->limit(12)->select();
        $this->assign('tpto', $tpto);
    }
    /**
     * 添加邮件到队列
     */
    protected function _mail_queue($to, $subject, $body, $priority = 1,$bool=false) {
    	$to_emails = is_array($to) ? $to : array($to);
    	$mails = array();
    	$time = time();
    	foreach ($to_emails as $_email) {
    		$mails[] = array(
    				'mail_to' => $_email,
    				'mail_subject' => $subject,
    				'mail_body' => $body,
    				'priority' => $priority,
    				'add_time' => $time,
    				'lock_expiry' => $time,
    		);
    	}
    	$user = model('MailQueue');
    	$user->addAll($mails);
    
    	//异步发送邮件
    	$this->db_send_mail($bool);
    }
    /**
     * 发送邮件
     */
    public function db_send_mail($is_sync = true) {
    	if (!$is_sync) {
    		//异步
    		session('async_sendmail', true);
    		return true;
    	} else {
    		//同步
    		session('async_sendmail', null);
    		$user = model('MailQueue');
    		return $user->send();
    	}
    }
    /**
     * 获取站点信息
     */
    protected function getSystem()
    {
        if (Cache::has('site_config')) {
            $site_config = Cache::get('site_config');
        } else {
            $site_config = Db::name('system')->field('value')->where('name', 'site_config')->find();
            $site_config = unserialize($site_config['value']);
            Cache::set('site_config', $site_config);
        }

        $this->assign('site_config',$site_config);
    }

    /**
     * 获取前端导航列表
     */
    protected function getNav()
    {
        if (Cache::has('nav')) {
            $nav = Cache::get('nav');
        } else {
            $nav = Db::name('nav')->where(['status' => 1])->order(['sort' => 'ASC'])->select();
           
            if (!empty($nav)) {
                Cache::set('nav', $nav);
            }
        }

        $this->assign('nav', $nav);
       
    }


}