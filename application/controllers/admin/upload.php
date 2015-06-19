<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Upload extends MY_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('admin/user_model');
	}
	
	public function index() {
		
	}
}