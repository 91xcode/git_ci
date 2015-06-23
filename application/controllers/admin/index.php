<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Index extends MY_Admin_Controller {

	function __construct(){
		parent::__construct();
	}

	
	public function index() {
		$this->smarty->assign('userinfo',$this->userinfo);
		$this->smarty->assign('view', 'welcome');
		$this->smarty->display('admin/layout.html');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
