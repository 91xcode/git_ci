<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Picture extends MY_Admin_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('admin/upload_model');
	}
	
	/**
	 * 图片列表
	 * @permission 图片列表
	 */
	public function index() {
		$timestamp = time();
		$token = md5('unique_salt'.$timestamp);
		$this->smarty->assign('timestamp', $timestamp);
		$this->smarty->assign('token', $token);
		
		$this->load->library('pagination');
		$config = config_item('page_admin');
		$config['num_links'] = 3;
		$config['uri_segment'] = '4';//设为页面的参数，如果不添加这个参数分页用不了
		$config['use_page_numbers']   = TRUE;
		$config['page_query_string']  = TRUE;
		
		$config['per_page'] = 10;//每页显示的数据数
		$current_page       = intval($this->input->get_post('per_page',true)); //获取当前分页页码数
		//page还原
		if(0 == $current_page){
			$current_page = 1;
		}
		$offset = ($current_page - 1 ) * $config['per_page']; //设置偏移量 限定 数据查询 起始位置（从 $offset 条开始）
		
		$config['base_url'] = '/picture/index?';
		$where = '1=1 ';
		

		$count =  $this->upload_model->getCount($where);
		$config['total_rows'] = $count;
		$this->pagination->initialize($config);
		$show_page = $this->pagination->create_links();
		$list = $this->upload_model->getAll($where,$offset,$config['per_page'],$order='id desc');
// 		var_dump($list);die;
		$this->smarty->assign('count', $count);
		$this->smarty->assign('page', $show_page);
		$this->smarty->assign('list', $list);
		$this->smarty->assign('view', 'pic_index');
		$this->smarty->display('admin/layout.html');
	}
	
}