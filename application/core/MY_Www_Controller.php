<?php if (!defined('BASEPATH')) exit('No direct script access allowed');


class MY_Www_Controller extends MY_Controller {

	protected $arr_need_login_controller = array('member');
	
    function __construct() {
        parent::__construct();
        $this->is_login = $this->check_login();
        if (in_array($this->current['controller'],$this->arr_need_login_controller)) {
        	if ($this->is_login) {
        		$this->userinfo =  $this->session->all_userdata();
        	} else {
        		redirect('/login/index');
        	}
        } else {
        	$this->userinfo = $this->session->userdata('id') ? $this->session->all_userdata() : $this->userinfo;
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


