<?php if (!defined('BASEPATH')) exit('No direct script access allowed');


class MY_Admin_Controller extends MY_Controller {

	protected $arr_not_need_login_controller = array('login');
	
    function __construct() {
        parent::__construct();
        $this->is_login = $this->check_login();
        if (!in_array($this->current['controller'],$this->arr_not_need_login_controller)) {
        	if ($this->is_login) {
        		$this->userinfo =  $this->session->all_userdata();
        	} else {
        		redirect('/login/index');
        	}
        }
    }

    
    
    /**
     * 检查登录
     * @return boolean
     */
    function check_login() {
    	return $this->session->userdata('id') > 0 ? true : false;
    }
    






}


