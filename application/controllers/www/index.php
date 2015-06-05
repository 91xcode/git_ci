<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Index extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	
	function __construct (){
		parent:: __construct();
	}
	
	public function index(){

		$a = 'ss';
		$this->smarty->assign( 'a', $a);
		$this->load->library('mycommon');
		//登录
		//$a = $this->mycommon->login(1);
		//注册 密码：加密方式为md5(md5(原始密码)+6位随机字符)
		//$salt = '123456';//随机的6位字符
		//$password = md5( md5('123456') . $salt );
		$a = $this->mycommon->regediter('liu','123456','123@qq.com');
		var_dump($a);
		$this->smarty->display( 'www/index.html');

		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */