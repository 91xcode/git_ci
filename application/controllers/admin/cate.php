<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

header("Content-type: text/html; charset=utf-8");
class Cate extends MY_Admin_Controller {

	function __construct(){
		parent::__construct();
		//$this->load->library('category');
		$this->load->model('admin/cate_model');
	}
	
	/**
	 * 列表
	 */
	public function index() {
		$tree = $this->getTree();
		$this->smarty->assign('tree', $tree);
		$this->smarty->assign('view', 'cate_index');
		$this->smarty->display('admin/layout.html');
	}
	
	/**
	 * 添加
	 */
	public function ajaxAddCate() {
		$name = $this->input->post('name');
		$pid = $this->input->post('pid');
		$pid = isset($pid) ? $pid:0;
		if (empty($name)) {
			self::json_output(array('status'=>'error','msg'=>'分类名称不能为空'));
		}
		if($pid == 0 && !empty($name)){
			$path = 0;
		} else {
			$result = $this->cate_model->getOne(array('id'=>$pid));
			$path = $result['path'].'-'.$pid;
		}
		
		$bool = $this->cate_model->addCate(array('name'=>$name,'pid'=>$pid,'path'=>$path));
		if ($bool) {
			self::json_output(array('status'=>'ok','msg'=>'添加成功'));
		} else {
			self::json_output(array('status'=>'error','msg'=>'添加失败'));
		}
	}
	
	/**
	 * 删除
	 */
	public function ajaxDelCate() {
		$id = intval($this->input->post('id'));
		if (empty($id)) {
			self::json_output(array('status'=>'error','msg'=>'参数错误'));
		}
		#判断是否有子类
		$result = $this->cate_model->getChild(array('id'=>$id));
		if ($result) {
			self::json_output(array('status'=>'error','msg'=>'该分类下有子类，请先删除子类'));
		}
			
		$bool = $this->cate_model->delCate(array('id'=>$id));
		if ($bool) {
			self::json_output(array('status'=>'ok','msg'=>'删除成功'));
		} else {
			self::json_output(array('status'=>'error','msg'=>'删除失败'));
		}
	}
	
	/**
	 * 编辑页面
	 */
	public function editCate() {
		$id = intval($this->input->post('id'));
		if (empty($id)) {
			self::json_output(array('status'=>'error','msg'=>'参数错误'));
		}
		#获取一条数据
		$result = $this->cate_model->getOne(array('id'=>$id));
		$msg = array(
				'result'=>$result
		);
		if ($result) {
			self::json_output(array('status'=>'ok','msg'=>'获取数据成功','msg'=>$msg));
		} else {
			self::json_output(array('status'=>'error','msg'=>'获取数据失败'));
		}
	}
	
	/**
	 * 编辑
	 */
	public function ajaxEditCate() {
		$name = $this->input->post('name');
		if (empty($name)) {
			self::json_output(array('status'=>'error','msg'=>'分类名称不能为空'));
		}
		$id = intval($this->input->post('id'));
		if (empty($id)) {
			self::json_output(array('status'=>'error','msg'=>'参数错误'));
		}
		$bool = $this->cate_model->editCate(array('name'=>$name),array('id'=>$id));
		if ($bool>=0) {
			self::json_output(array('status'=>'ok','msg'=>'编辑成功'));
		} else {
			self::json_output(array('status'=>'error','msg'=>'编辑失败'));
		}
	}
	
	/**
	 * 获取树形结构
	 */
	public function getTree() {
		$result = array();
		#获取所有分类
		$result = $this->cate_model->getAll();
		foreach($result as $key=>$value) {
			$num = count(explode('-',$value['path']));
			$result[$key]['html'] = str_repeat('|-', $num-1);
		}
		return $result;
	}
	
	/**
	 * 获取json所需的结构
	 */
	function genJsonTree($items,$id='id',$pid='pid',$son = 'children'){
		$tree = array(); 
		$tmpMap = array(); 
	
		foreach ($items as $item) {
			$tmpMap[$item[$id]] = $item;
		}
	
		foreach ($items as $item) {
			if (isset($tmpMap[$item[$pid]])) {
				$tmpMap[$item[$pid]][$son][] = &$tmpMap[$item[$id]];
			} else {
				$tree[] = &$tmpMap[$item[$id]];
			}
		}
		unset($tmpMap);
		return $tree;
	}
}