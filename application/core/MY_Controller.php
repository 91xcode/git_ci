<?php if (!defined('BASEPATH')) exit('No direct script access allowed');


class MY_Controller extends CI_Controller {

	/**
	 * 用户信息
	 * @var unknown
	 */
	public $userinfo = array();
	/**
	 * 保存当前控制器和方法名
	 * @var unknown
	 */
	public $current = array();
	/**
	 * 登录状态
	 * @var unknown
	 */
	public $is_login = false;
	
    function __construct() {
        parent::__construct();
        $this->current['controller'] = $this->uri->rsegment(1);
        $this->current['action'] = $this->uri->rsegment(2);
    }

    
    
    
    
    



    /**
     * 以json格式输出
     * @param array $arr_param
     */
    protected static function json_output($arr_param) {
    	$arr_data = is_array($arr_param) ? $arr_param : array();
    	header('Content-Type: application/json');
    	die( (isset($_GET['callback'])) ? $_GET['callback'].'('.json_encode($arr_data).')' : json_encode($arr_data));
    }
    
    /**
     * if is ajax
     * @return bool
     */
    function is_ajax() {
    	return $this->input->is_ajax_request();
    }


}


require(APPPATH . 'core/MY_Admin_Controller.php');
require(APPPATH . 'core/MY_Www_Controller.php');


