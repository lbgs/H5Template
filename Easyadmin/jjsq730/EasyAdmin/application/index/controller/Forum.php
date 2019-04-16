<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use think\Db;
use think\Cache;
use think\Session;
use app\index\model\Forum as ForumModel;
use app\common\model\Upload as UploadModel;



class Forum extends HomeBase
{
	public function _initialize()
	{
		parent::_initialize();
		
		
	}
    public function add()
    {
    	$site_config = Cache::get('site_config');
    
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $forum = new ForumModel();
            
          
            
            if (request()->isPost()) {
            	
            	if(session('userstatus')!=2&&session('userstatus')!=5&&$site_config['email_sh'] ==0){
            		return json(array('code' => 0, 'msg' => '您的邮箱还未激活'));
            	}
            	
            	
                $data = input('post.');
              
                if($data['tid']==0){
                	return json(array('code' => 0, 'msg' => '版块为空'));
                }
                if($data['content']==''){
                	return json(array('code' => 0, 'msg' => '内容为空'));
                }
                $data['time'] = time();
                $data['open'] =$site_config['forum_sh'];
                $data['view'] = 1;
                $data['uid'] = session('userid');
                $data['description'] = mb_substr(remove_xss($data['content']), 0, 200, 'utf-8');
                $data['content']= remove_xss($data['content']);
                
                
                $member = Db::name('user');
               // $member->where('id', session('userid'))->setInc('point', $site_config['jifen_add']);
                
                if ($forum->add($data)) {
                	
                	point_note($site_config['jifen_add'],session('userid'),'forumadd',$forum->id);
                	//$res=hook('forumattach',array('content'=>$data['content'],'id'=>$forum->id));
                	
                    return json(array('code' => 200, 'msg' => '添加成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '添加失败'));
                }
            }
           
            $category = Db::name('forumcate');
            $tptc = $category->where(array('show'=>1))->select();
            $this->assign('tptc', $tptc);
			$tags = $site_config['site_keyword'];
            $tagss = explode(',', $tags);
		    $this->assign('tagss', $tagss);
		    
		    $this->assign('title', '发布帖子');
		    
            return view();
        }
    }
    public function edit()
    {
    	$site_config = Cache::get('site_config');
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $id = input('id');
            
            
            session('editid',$id);
            
            
            $uid = session('userid');
            $forum = new ForumModel();
            $a = $forum->find($id);
            if (empty($id) || $a == null || $a['uid'] != $uid) {
                $this->error('亲！您迷路了');
            } else {
                if (request()->isPost()) {
                    $data = input('post.');
                    $data['id']=session('editid');
                    session('editid', null);
                    if($data['content']==''){
                    	return json(array('code' => 0, 'msg' => '内容为空'));
                    }
                    $data['description'] = mb_substr(remove_xss($data['content']), 0, 200, 'utf-8');
                  
                    $data['content']= remove_xss($data['content']);
                 
                    if ($forum->edit($data)) {
                    	
                    	
                    	//$res=hook('forumattach',array('content'=>htmlspecialchars_decode($data['content']),'id'=>$data['id']));
           
                        return json(array('code' => 200, 'msg' => '修改成功'));
                    } else {
                        return json(array('code' => 0, 'msg' => '修改失败'));
                    }
                }
      
                
                
                $category = Db::name('forumcate');
                $tptc = $forum->find($id);
                $tptcs = $category->where(array('show'=>1))->select();
                $this->assign(array('tptcs' => $tptcs, 'tptc' => $tptc));
                $tags = $site_config['site_keyword'];
                $tagss = explode(',', $tags);
		        $this->assign('tagss', $tagss);
		        $this->assign('title', '编辑帖子');
                return view();
            }
        }
    }
    public function doUploadPic()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
			
        	$uploadmodel =new UploadModel();
        	
        	 
        	 
        	$info=$uploadmodel->upfile('images','FileName');
        	echo $info['headpath'];

		}
    }
}