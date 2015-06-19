<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_Model extends CI_Model {
	
	private $_table="my_user";
	
	function __construct() {
        parent::__construct();
	}
	
	
	/**
	 * 获取列表信息总数
	 * @param string $table
	 * @param string $where
	 * @return int
	 */
	public function getCount($where){
		$total = $this->db->query("SELECT id FROM ".$this->_table." WHERE ".$where)->num_rows();
		return $total;
	}
	
	/**
	 * 获取列表信息
	 * @param string $table
	 * @param string $where
	 * @param int $offset
	 * @param int $num
	 * @param string $order
	 * @return array
	 */
	public function getAll($where,$offset,$num,$order){
		$result = array();
		$result = $this->db->query("SELECT * FROM ".$this->_table." WHERE  ".$where." ORDER BY ".$order." LIMIT ".$offset.",".$num)->result_array();
		return $result;
	}
	
}