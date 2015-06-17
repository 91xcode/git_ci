<?php if (!defined('BASEPATH')) exit('No direct script access allowed');


class MY_Controller extends CI_Controller {

    function __construct() {
        parent::__construct();
    }

    
    
    
    
    



    /**
     * 以json格式输出
     * @param array $arr_param
     * @author yanrui@91waijiao.com
     */
    protected static function json_output($arr_param) {
    	$arr_data = is_array($arr_param) ? $arr_param : array();
    	header('Content-Type: application/json');
    	die( (isset($_GET['callback'])) ? $_GET['callback'].'('.json_encode($arr_data).')' : json_encode($arr_data));
    }


}


