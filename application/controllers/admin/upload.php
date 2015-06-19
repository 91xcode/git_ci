<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Upload extends MY_Admin_Controller {

	function __construct(){
		parent::__construct();
	}
	
	/**
	 * 图片列表
	 * 
	 */
	public function index() {
		
		$this->smarty->assign('view', 'upload_index');
		$this->smarty->display('admin/layout.html');
	}
}