<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Upload extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('admin/upload_model');
	}
	

	
	public function saveQiNiu() {
// 		var_dump($_FILES);die();
		require_once APPPATH . 'libraries/qiniu/rs.php';
		require_once APPPATH . 'libraries/qiniu/io.php';
		Qiniu_SetKeys ( NH_QINIU_ACCESS_KEY, NH_QINIU_SECRET_KEY );
		$obj_putPolicy = new Qiniu_RS_PutPolicy ( NH_QINIU_BUCKET );
		$str_upToken = $obj_putPolicy->Token ( null );
		$putExtra = new Qiniu_PutExtra();
		$putExtra->Crc32 = 1;
		//user photo name
		$this->load->helper('string');
		$str_salt = random_string('alnum', 6);
		$source_key = 'source_'.date('YmdHis',time()).'_i'.$str_salt;//图片在qiniu上的key
		$detect_res = $this->detect_avatar($_FILES['Filedata']);
// 		var_dump($detect_res);die;
		if($detect_res['code'] == 1) {
			list($ret, $err) = Qiniu_PutFile($str_upToken, $source_key, $_FILES['Filedata']['tmp_name'], $putExtra);
			if($err === null) {
				//var_dump($ret);die;
				#保存文件名到数据库
				$inserd_id = $this->upload_model->save(array('filename'=>$ret['key'],'type'=>'1'));
				if ($inserd_id) {
					self::json_output(array('status'=>'ok','msg'=>'添加成功'));
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
	
// 		if(!$detect_res) {
// 			$img_info = getimagesize($avatar_data['tmp_name']);
// 			$image_type = $this->config->item('image_type');
// 			if(empty($img_info) || !array_key_exists($img_info[2], $image_type)) {
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