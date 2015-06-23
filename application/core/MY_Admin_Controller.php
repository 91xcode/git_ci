<?php if (!defined('BASEPATH')) exit('No direct script access allowed');


class MY_Admin_Controller extends MY_Controller {

	protected $arr_not_need_login_controller = array('login','save');
	
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
        
        //判断是否有访问当前类和方法的权限
        $is_permission = pass($this->current['controller'],$this->current['action']);
        if(!in_array($this->current['controller'], array('login','index'))) {
        	if(!$is_permission){
        		if(self::is_ajax()){
        			self::json_output(array('msg' => 'No Permission to Pass'));
        		}else{
        			die('No Permission to Pass');
        		}
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


