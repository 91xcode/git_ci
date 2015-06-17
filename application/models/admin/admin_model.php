<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin_Model extends CI_Model {
	
	private $_table="my_admin";
	
	function __construct() {
        parent::__construct();
	}
	
	/**
	 * 根据userid获取用户信息
	 * @param  int $user_id
	 * @return 
	 */
	function getOne($user_id)
	{
		$result = array();
		$sql = "SELECT * FROM ".$this->_table." where id = ".$user_id;
		$result = $this->db->query($sql)->row_array();
		return $result;
	}
	
	/**
	 * 登陆检测
	 */
	public function checkLogin($username,$password) {
		$result = array();
		$sql = "SELECT * FROM ".$this->_table." where username = '".$username."'";
		$result = $this->db->query($sql)->row_array();
		return $result;
	}
}