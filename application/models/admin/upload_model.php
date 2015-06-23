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
	
	/**
	 * 获取列表信息
	 * @param string $table
	 * @param string $where
	 * @param int $offset
	 * @param int $num
	 * @param string $order
	 * @return array
	 */
	public function getAll($where='1=1',$offset='0',$num='10',$order='id asc'){
		$result = array();
		$result = $this->db->query("SELECT * FROM ".$this->_table." WHERE  ".$where." ORDER BY ".$order." LIMIT ".$offset.",".$num)->result_array();
// 		echo "SELECT * FROM ".$this->_table." WHERE  ".$where." ORDER BY ".$order." LIMIT ".$offset.",".$num;
		return $result;
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
}