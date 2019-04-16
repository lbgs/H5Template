<?php
namespace app\index\controller;


use think\Db;
use app\index\model\Comment as CommentModel;
use app\common\controller\HomeBase;
use think\Cache;

class Comment extends HomeBase
{
	public function _initialize()
	{
		parent::_initialize();
	}
    public function add()
    {
    	
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录');
        } else {
        	$site_config = Cache::get('site_config');
            $comment = new CommentModel();
            $id = input('id');
            $uid = session('userid');
            if (request()->isPost()) {
            	if(session('userstatus')!=2&&session('userstatus')!=5&&$site_config['email_sh'] ==0){
            		return json(array('code' => 0, 'msg' => '您的邮箱还未激活'));
            	}
            	
            	
                $data = input('post.');
                $data['time'] = time();
                $data['fid'] = $id;
                $data['uid'] = session('userid');
                
              //  $data['content']=htmlspecialchars_encode($data['content']);
                
				$member = Db::name('user');
				//$member->where('id', session('userid'))->setInc('point', $site_config['jifen_comment']);
				$forum = Db::name('forum');
				$forum->where('id', $id)->setInc('reply', 1);
				$forumuser=$forum->where('id', $id)->value('uid');
				$messdata['type']=2;
				$messdata['content']=$id;
				$messdata['status']=1;
				$messdata['uid']=session('userid');
				$messdata['touid']=$forumuser;
				$messdata['time']=time();
				Db::name('message')->insert($messdata);
				if($data['tid']>0){
					Db::name('comment')->where('id',$data['tid'])->setInc('reply');
				}
				$data['content']= remove_xss($data['content']);
                if ($comment->add($data)) {
                	point_note($site_config['jifen_comment'],session('userid'),'commentadd',$comment->id);
                    return json(array('code' => 200, 'msg' => '回复成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '回复失败'));
                }
            }
        }
    }
	public function edit()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录');
        } else {
            $id = input('id');
            session('commenteditid',$id);
            
            
            $uid = session('userid');
            $comment = new CommentModel();
            $a = $comment->find($id);
            if (empty($id) || $a == null || $a['uid'] != $uid) {
                $this->error('亲！您迷路了');
            } else {
                if (request()->isPost()) {
                    $data = input('post.');
                    $data['id']=session('commenteditid');
                    session('commenteditid', null);
                    $data['content']= remove_xss($data['content']);
                    if ($comment->edit($data)) {
                        return json(array('code' => 200, 'msg' => '修改成功'));
                    } else {
                        return json(array('code' => 0, 'msg' => '修改失败'));
                    }
                }
                $tptc = $comment->alias('c')->join('forum f', 'f.id=c.fid')->field('c.*,f.title')->find($id);
		        $this->assign('tptc', $tptc);
                return view();
            }
        }
    }
    public function doUploadPic()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录');
        } else {
			$file = request()->file('FileName');
			$info = $file->move(ROOT_PATH . DS . 'uploads');
			if ($info) {
				$path = WEB_URL . DS . 'uploads' . DS . $info->getSaveName();
				echo str_replace("\\", "/", $path);
			}
		}
    }
    public function dels()
    {
        if (session('userid')!=1) {
            $this->error('亲！你迷路了');
        } else {
			$id = input('id');
			if (db('comment')->delete(input('id'))) {
				return json(array('code' => 200, 'msg' => '删除成功'));
			} else {
				return json(array('code' => 0, 'msg' => '删除失败'));
			}
		}
    }
}