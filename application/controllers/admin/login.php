<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('admin/admin_model');
	}
	
	/**
	 * 登录页面
	 */
	public function index() {
		$this->smarty->display( 'admin/login.html');
	}
	
	/**
	 *  登录提交
	 */
	public function checkLogin() {
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		if (empty($username) || empty($password)) {
			self::json_output(array('status'=>'error','msg'=>'用户名或密码不能为空'));
		}	
		$result =  $this->admin_model->checkLogin($username,$password);
		if (empty($result)) {
			self::json_output(array('status'=>'error','msg'=>'无效的登陆用户'));
		}
		
		if ($result['status'] != '1') {
			self::json_output(array('status'=>'error','msg'=>'该用户被禁用'));
		}
		
		$salt = $result['salt'];
		# md5（md5（password）+salt）
		if(md5(md5($password).$salt )===$result['password']) {
			$this->session->set_userdata($result);
			self::json_output(array('status'=>'ok','msg'=>''));
		} else {
			self::json_output(array('status'=>'error','msg'=>'用户名或密码不匹配'));
		}
	}
	
	/**
	 *  退出登录
	 */
	public function logout() {
		//未登录时，要跳转到首页
		$this->session->sess_destroy();
		redirect('/login');
	}
	
	
	
	
	
	
	
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */