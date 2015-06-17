<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Import_Model extends NH_Model {
	
	function __construct()
	{
        parent::__construct();
	}
	
	/**
	 * 获取学校数据
	 * @return $array_result
	 */
	public function get_school(){
		$result = array();
		$sql = "SELECT name FROM lxc_school ";
		$result = $this->db->query($sql)->result_array();
		return $result;
	}
	
	/**
	 * 获取列表信息总数
	 */
	public function get_count($table,$where){
		$total = $this->db->query("SELECT * FROM ".$table." WHERE ".$where)->num_rows();
		return $total;
	}
	/**
	 * 获取列表信息
	 */
	public function get_all($table,$where,$offset,$num,$order='id desc'){
		$result = $this->db->query("SELECT * FROM ".$table." WHERE  ".$where." ORDER BY ".$order." LIMIT ".$offset.",".$num)->result_array();
		return $result;
	}
	
	
}