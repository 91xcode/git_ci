<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Upload_Model extends CI_Model {
	
	private $_table="my_upload";
	
	function __construct() {
        parent::__construct();
	}
	
	/**
	 * 保存图片
	 * @param unknown $params
	 * @return boolean
	 */
	public function save($params) {
		$this->db->insert($this->_table,$params);
		$insert_id = $this->db->insert_id();
		return $insert_id >0 ? true : false;
	}
}