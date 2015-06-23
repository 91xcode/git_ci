<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends MY_Admin_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('admin/user_model');
	}
	
	/**
	 * @permission 用户列表
	 */
	public function index() {
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
		
		$config['base_url'] = '/user/index?';
		$where = '1=1 ';
		
		if (!empty($_GET['email'])) {
			$where .= " AND email  like '%".$_GET['email']."'";
			$config['base_url'].="email=".$_GET['email'];
		}
		if (!empty($_GET['start_time']) && empty($_GET['start_time'])) {
			$where .= " AND register_time  >= '".strtotime($_GET['start_time'])."'";
			$config['base_url'].="&start_time=".$_GET['start_time'];
		}
		if (empty($_GET['end_time']) && !empty($_GET['end_time'])) {
			$where .= " AND register_time  <= '".strtotime($_GET['end_time'])."'";
			$config['base_url'].="&end_time=".$_GET['end_time'];
		}
		if (!empty($_GET['start_time']) && !empty($_GET['end_time'])) {
			$where .= " AND register_time  >='".strtotime($_GET['start_time'])."' AND register_time  <='".strtotime($_GET['end_time'])."'";
			$config['base_url'].="&start_time=".$_GET['start_time']."&end_time=".$_GET['end_time'];
		}
		$count =  $this->user_model->getCount($where);
		$config['total_rows'] = $count;
		$this->pagination->initialize($config);
		$show_page = $this->pagination->create_links();
		$list = $this->user_model->getAll($where,$offset,$config['per_page'],$order='id desc');
		$this->smarty->assign('count', $count);
		$this->smarty->assign('page', $show_page);
		$this->smarty->assign('list', $list);
		$this->smarty->assign('view', 'user_index');
		$this->smarty->display('admin/layout.html');
		
		
		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
