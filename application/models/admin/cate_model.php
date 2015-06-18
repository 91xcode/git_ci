<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cate_Model extends CI_Model {
	
	private $_table="my_category";
	
	function __construct() {
        parent::__construct();
	}
	
	/**
	 * 获取所有分类
	 * @return array
	 */
	public function getAll() {
		$result = array();
		$sql = "SELECT * FROM ".$this->_table;
		$result = $this->db->query($sql)->result_array();
		return $result;
	}
	
	/**
	 * 获取一条数据
	 */
	public function getOne($prams) {
		$result = array();
		$sql = "SELECT * FROM ".$this->_table." WHERE id = ".$prams['id'];
		$result = $this->db->query($sql)->row_array();
		return $result;
	}
	
	/**
	 * 添加
	 * @param array $prams
	 * @return boolean
	 */
	public function addCate($prams){
		$this->db->insert($this->_table,$prams);
		$insert_id = $this->db->insert_id();
		return $insert_id >0 ? true : false;
	}
	
	/**
	 * 获取子类
	 */
	public function getChild($prams) {
		$result = array();
		$sql = "SELECT * FROM ".$this->_table." WHERE id = ".$prams['id'];
		$result = $this->db->query($sql)->result_array();
		return $result;
	}
	
	/**
	 * 删除
	 */
	public function delCate($prams) {
		$this->db->delete($this->_table, $prams);
		$row = $this->db->affected_rows();
		return $row;
	}

}