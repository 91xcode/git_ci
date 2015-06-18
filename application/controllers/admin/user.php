<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends MY_Controller {

	function __construct(){
		parent::__construct();
	}
	
	public function index() {
		
		$int_start = $this->uri->segment(3) ? $this->uri->segment(3) : 0;
		$per_page_no = 10;
		$arr_data = $this->db->query("SELECT * FROM my_user ORDER BY id DESC LIMIT ".$int_start.",10")->result_array();
		$int_count = $this->db->query("SELECT * FROM my_user")->num_rows();
		#分页
		$this->load->library('pagination');
		$config = config_item('page_admin');
		$config['base_url'] = '/user/index';
		$config['total_rows'] = $int_count;
		$config['per_page'] = $per_page_no;
		$config['use_page_numbers'] = false;
		$config['uri_segment'] = '3';//设为页面的参数，如果不添加这个参数分页用不了
		 
		$this->pagination->initialize($config);
		$show_page = $this->pagination->create_links();
		$this->smarty->assign('count', $int_count);
		$this->smarty->assign('page', $show_page);
		$this->smarty->assign('list', $arr_data);
		$this->smarty->assign('view', 'user_index');
		$this->smarty->display('admin/layout.html');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
