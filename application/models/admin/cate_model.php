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
		$sql = "select id,name,pid,path,concat(path,'-',id) as bpath from ".$this->_table." order by bpath asc";
		$result = $this->db->query($sql)->result_array();
		return $result;
	}
	
	/**
	 * 获取一条数据
	 */
	public function getOne($params) {
		$result = array();
		$sql = "SELECT * FROM ".$this->_table." WHERE id = ".$params['id'];
		$result = $this->db->query($sql)->row_array();
		return $result;
	}
	
	/**
	 * 添加
	 * @param array $prams
	 * @return boolean
	 */
	public function addCate($params){
		$this->db->insert($this->_table,$params);
		$insert_id = $this->db->insert_id();
		return $insert_id >0 ? true : false;
	}
	
	/**
	 * 获取子类
	 */
	public function getChild($params) {
		$result = array();
		$sql = "SELECT * FROM ".$this->_table." WHERE pid = ".$params['id'];
		$result = $this->db->query($sql)->result_array();
		return $result;
	}
	
	/**
	 * 删除
	 */
	public function delCate($params) {
		$this->db->delete($this->_table, $params);
		$row = $this->db->affected_rows();
		return $row;
	}
	
	/**
	 * 编辑
	 */
	public function editCate($set,$where) {
		$this->db->update($this->_table, $set,$where);
		$row = $this->db->affected_rows();
		return $row;
	}

}