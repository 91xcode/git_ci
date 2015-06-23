<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Auth extends MY_Admin_Controller {
	
	function __construct(){
		parent::__construct();
	}
	
	/**
	 * @permission 权限列表
	 */
	public function index() {
		$this->smarty->assign('view', 'auth_index');
		$this->smarty->display('admin/layout.html');
	}
}