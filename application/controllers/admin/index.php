<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Index extends CI_Controller {

	function __construct(){
		parent::__construct();
	}

	
	public function index() {
		$userinfo = $this->session->all_userdata();
		if (!$userinfo){
			redirect('/');
		}
		$this->smarty->assign('userinfo',$userinfo);
		$this->smarty->assign('view', 'welcome');
		$this->smarty->display('admin/layout.html');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
