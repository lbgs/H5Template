<?php
namespace app\index\controller;
use app\common\controller\HomeBase;

use think\Db;
use app\common\model\User as UserModel;


class User extends HomeBase
{
	public function _initialize()
	{
		parent::_initialize();
	}
    public function topic()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $forum = Db::name('forum');
            $uid = session('userid');
            $count=$forum->where("uid = {$uid}")->count();
            $tptc = $forum->where("uid = {$uid}")->order('id desc')->paginate(10);
            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);
            $this->assign('count', $count);
            return view();
        }
    }
    public function message()
    {
    	if (!session('userid') || !session('username')) {
    		$this->error('亲！请登录',url('index/login'));
    	} else {
    	
    	
    		//$readmessage = Db::name('readmessage');
            $uid = session('userid');
          
           $arr= Db::name('readmessage')->alias('rm')->where(array('uid'=>$uid))->column('mid');
         
          if(!empty($arr)){
          //	$arrimplode=implode(',', $arr);
          	$tptc = Db::name('message')->alias('me')->join('user u', 'me.uid=u.id','LEFT')->field('me.*,u.id as userid,u.username')
          	->where('me.touid',['=',0],['=',$uid],'or')
          	->where('me.id','not in',$arr)
          	->order('me.time desc')->paginate(5);
          
          
        //  	$tptc = Db::name('message')->alias('me')->join('user u', 'me.uid=u.id','LEFT')->field('me.*,u.id as userid,u.username')->where(array('me.touid'=>0))->where('me.id','not in',$arr)->whereOr(array('me.touid'=>$uid))->order('me.time desc')->paginate(5);
          //  dump( Db::name('message'));
       
          }else{
          	
          	$tptc =Db::name('message')->alias('me')->join('user u', 'me.uid=u.id','LEFT')->field('me.*,u.id as userid,u.username')->where('me.touid',$uid)->whereOr('me.touid',0)->order('me.time desc')->paginate(5);

          
          }
            
           
            
            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);
          
            return view();
    	}
    }
    
    public function delallmessage()
    {
    	
    	$uid = session('userid');
    	$tptc = Db::name('message')->where(array('touid'=>0))->column('id');
    	$tptc1 =array();
    	$tptc1 = Db::name('readmessage')->where(array('uid'=>$uid))->column('mid');
    	
    	
    	
    	if(Db::name('message')->where(array('touid'=>$uid))->count()>0){
    		if (Db::name('message')->where(array('touid'=>$uid))->delete()) {
    		
    			
    		
    		
    			if(!empty($tptc)){
    				foreach ($tptc as $k =>$v){
    					if(!in_array($v, $tptc1)){
    						$messdata['uid']=$uid;
    						$messdata['mid']=$v;
    						Db::name('readmessage')->insert($messdata);
    					}
    		
    					 
    				}
    			}
    		
    			//$this->success('删除成功');
    			return json(array('code' => 200, 'msg' => '删除成功'));
    		} else {
    			// $this->error('删除失败');
    			return json(array('code' => 0, 'msg' => '删除失败'));
    		}
    	}else{
    		

    		if(!empty($tptc)){
    			
    			if(count($tptc)!=count($tptc1)){
    			
    			foreach ($tptc as $k =>$v){
    				if(!in_array($v, $tptc1)){
    					$messdata['uid']=$uid;
    					$messdata['mid']=$v;
    					Db::name('readmessage')->insert($messdata);
    				}
    		
    		
    			}
    			return json(array('code' => 200, 'msg' => '删除成功'));
    			}else{
    				return json(array('code' => 0, 'msg' => '您无任何消息可删除'));
    			}
    		}else{
    			return json(array('code' => 0, 'msg' => '您无任何消息可删除'));
    			
    		}
    	}
    	

    }
    
    public function delsysmessage($id)
    {
    	
    	$uid = session('userid');
    	$messdata['uid']=$uid;
    	$messdata['mid']=$id;
    	
    	
    	
    	if (Db::name('readmessage')->insert($messdata)) {
    		 
    		return json(array('code' => 200, 'msg' => '删除成功'));
    	} else {
    		return json(array('code' => 0, 'msg' => '删除失败'));
    	}

    }
    public function delmessage($id)
    {
    
    	if (Db::name('message')->delete($id)) {
    		//$this->success('删除成功');
    		return json(array('code' => 200, 'msg' => '删除成功'));
    	} else {
    		// $this->error('删除失败');
    		return json(array('code' => 0, 'msg' => '删除失败'));
    	}
    }
	public function comment()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $comment = Db::name('comment');
            $uid = session('userid');
            $tptc = $comment->alias('c')->join('forum f', 'f.id=c.fid')->field('c.*,f.title')->where("c.uid = {$uid}")->order('c.id desc')->paginate(5);
            
           
           
       
           
            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);
            return view();
        }
    }
    public function home()
    {
        $id = input('id');
        if (empty($id)) {
            return $this->error('亲！你迷路了');
        } else {
            $member = new UserModel();
            $m = $member->where("id = {$id}")->find($id);
            if ($m) {
                $this->assign('m', $m);
				$forum = Db::name('forum');
				$map['open']=1;
				$map['uid']=$id;
                $tptc = $forum->where($map)->order('id desc')->limit(10)->select();
              
                $this->assign('tptc', $tptc);
				$comment = Db::name('comment');
                $tpte = $comment->alias('c')->join('forum f', 'f.id=c.fid')->field('c.*,f.title')->where("c.uid = {$id}")->order('c.id desc')->limit(5)->select();
                $this->assign('tpte', $tpte);
                return view();
            } else {
                return $this->error('亲！你迷路了');
            }
        }
    }
    public function set()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
            //return json(array('code' => 0, 'msg' => '亲！请登录','url'=>url('login/index')));
        } else {
            $member = new UserModel();
            $uid = session('userid');
            $tptc = $member->where(array('id'=>$uid))->find();
            
            if (request()->isPost()) {
                $data =  $this->request->post();
               
                $data['id']=$uid;
                
                $validate_result = $this->validate($data,'User');
                
                if ($validate_result !== true) {
                	// $this->error($validate_result);
                	return json(array('code' => 0, 'msg' =>$validate_result
                
                	));
                } else {
                
                
                
                if ($member->save($data,['id'=>$uid])) {
                    return json(array('code' => 200, 'msg' => '修改成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '修改失败'));
                }
                }
            }
           
            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);
            return view();
        }
    }
    public function setedit()
    {
        if (!session('userid') || !session('username')) {
        	
            $this->error('亲！请登录',url('index/login'));
        } else {
            $member = new UserModel();
            $uid = session('userid');
            $tptc = $member->find($uid);
           
            if (request()->isPost()) {
               $data =  $this->request->post();
              
                
                $validate_result = $this->validate($data,'User.passwordedit');
                
                if ($validate_result !== true) {
                	// $this->error($validate_result);
                	return json(array('code' => 0, 'msg' =>$validate_result
                
                	));
                } else {
                	if($data['password']==$data['nowpass']){
                		return json(array('code' => 0, 'msg' =>'密码未修改'));
                	
                	}
                	if($tptc['password']!=md5($data['nowpass'].$tptc['salt']))
                	{
                		return json(array('code' => 0, 'msg' =>'原始密码错误'));
                	}else{
                		$datam['password'] = md5($data['password'].$tptc['salt']);
                		if ($member->save($datam,['id'=>$uid])) {
                			return json(array('code' => 200, 'msg' => '修改成功'));
                		} else {
                			return json(array('code' => 0, 'msg' => '修改失败'));
                		}
                	}
                	
                	
                	
                }
                
                
            
            }
          
            $this->assign('tptc', $tptc);
            return view();
        }
    }
	public function headedit()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $member = new UserModel();
            $uid = session('userid');
            if (request()->isPost()) {
                   $data =  $this->request->post();
                  
                if ($member->allowField(['userhead'])->save($data,['id'=>$uid])) {
                	
                	session('userhead', $data['userhead']);
                	
                    return json(array('code' => 200, 'msg' => '修改成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '修改失败'));
                }
            }
            $tptc = $member->find($uid);
            $this->assign('tptc', $tptc);
            return view();
        }
    }
}