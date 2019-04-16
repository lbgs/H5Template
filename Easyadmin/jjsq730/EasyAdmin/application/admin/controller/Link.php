<?php
namespace app\admin\controller;

use app\common\model\Link as LinkModel;
use app\common\controller\AdminBase;
use think\Db;

/**
 * 友情链接
 * Class Link
 * @package app\admin\controller
 */
class Link extends AdminBase
{
    protected $link_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->link_model = new LinkModel();
    }

    /**
     * 友情链接
     * @return mixed
     */
    public function index()
    {
        $link_list = $this->link_model->paginate(10);

        return $this->fetch('index', ['link_list' => $link_list]);
    }

    /**
     * 添加友情链接
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存友情链接
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Link');

            if ($validate_result !== true) {
               return json(array('code' => 0, 'msg' =>$validate_result));
            } else {
                if ($this->link_model->allowField(true)->save($data)) {
                   return json(array('code' => 200, 'msg' => '添加成功'));
                } else {
                   return json(array('code' => 0, 'msg' => '添加失败'));
                }
            }
        }
    }

    /**
     * 编辑友情链接
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $link = $this->link_model->find($id);

        return $this->fetch('edit', ['link' => $link]);
    }

    /**
     * 更新友情链接
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Link');

            if ($validate_result !== true) {
                 return json(array('code' => 0, 'msg' => $validate_result));
            } else {
                if ($this->link_model->allowField(true)->save($data, $id) !== false) {
                     return json(array('code' => 200, 'msg' => '更新成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '更新失败'));
                }
            }
        }
    }

    /**
     * 删除友情链接
     * @param $id
     */
    public function delete($id)
    {
        if ($this->link_model->destroy($id)) {
           return json(array('code' => 200, 'msg' => '删除成功'));
        } else {
            return json(array('code' => 0, 'msg' => '删除失败'));
        }
    }
}