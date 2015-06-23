<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Avatar extends MY_Admin_Controller {

	function __construct(){
		parent::__construct();
	}

	/**
	 * 头像视图
	 */
	public function index() {
		$this->smarty->assign('view', 'avatar_index');
		$this->smarty->display('admin/layout.html');
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
