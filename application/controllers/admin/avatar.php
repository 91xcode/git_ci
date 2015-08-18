<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


require_once APPPATH.'libraries/vendor/autoload.php';

use Qiniu\Auth;
use Qiniu\Storage\UploadManager;


class Avatar extends MY_Admin_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('admin/upload_model');
	}

	/**
	 * 头像视图
	 */
	public function index() {
		$this->smarty->assign('view', 'avatar_index');
		$this->smarty->display('admin/layout.html');
	}
	
	
	
	/**
	 * 头像处理
	 */
	public function update_avatar() {
		//var_dump($_FILES);die;
		$auth = new Auth(NH_QINIU_ACCESS_KEY, NH_QINIU_SECRET_KEY);
		$bucket = NH_QINIU_BUCKET;
		$token = $auth->uploadToken($bucket);
		$uploadMgr = new UploadManager();
		//user photo name
		$this->load->helper('string');
		$str_salt = random_string('alnum', 6);
		$source_key = 'source_avatar'.date('YmdHis',time()).'_i'.$str_salt;//图片在qiniu上的key
		$detect_res = $this->detect_avatar($_FILES['__source']);
		if($detect_res['code'] == 1) {
			list($ret, $err) = $uploadMgr->putFile($token, $source_key, $_FILES['__source']['tmp_name']);
			if($err === null) {
				#保存文件名到数据库
				$bool = $this->upload_model->save(array('filename'=>$ret['key'],'type'=>'2','description'=>''));
				if ($bool) {
					self::json_output(array('status'=>'ok','msg'=>'添加成功','avatar_key'=>$ret['key']));
				} else {
					self::json_output(array('status'=>'error','msg'=>'添加失败'));
				}
			}
		} else {
			self::json_output(array('status'=>'error','msg'=>$detect_res['msg']));
		}
	}
	
	/**
	 * 侦测上传的头像是否符合规定
	 * @param resource $avatar_data  图片数据
	 */
	public function detect_avatar($avatar_data)
	{
		$detect_res = 0;
		if(!isset($avatar_data['error']) || $avatar_data['error'] > 0) {
			$detect_res =  -1; //上传失败
		}
	
// 		if (!$detect_res) {
// 			$file_type = $avatar_data['type'];
// 			$allowed = array("image/jpeg", "image/gif", "image/png", "image/jpg");
// 			if(!in_array($file_type, $allowed)) {
// 				$detect_res = -2; //图片类型不对
// 			}
// 		}
		
		if(!$detect_res) {
			//$avatar_size_limit = $this->config->item('avatar_size_limit');
			if(!isset($avatar_data['size']) || $avatar_data['size'] > (1024 * 1024 * 2)) {
				 $detect_res = -3;//文件过大
			}
		}
	
		switch($detect_res) {
			case -1:$arr_return = array("code"=> $detect_res, "msg"=>"上传失败");break;
			case -2:$arr_return = array("code"=> $detect_res,"msg"=>"格式错误");break;
			case -3:$arr_return = array("code"=> $detect_res,"msg"=>"文件过大");break;
			default:$arr_return = array("code"=>1);break;
		}
	
		return $arr_return;
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
