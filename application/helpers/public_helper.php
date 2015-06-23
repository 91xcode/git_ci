<?php

/**
 * 根据当前域名生成静态文件的url
 * @param $str_url
 * @return string
 */
function static_url($str_url){
	//    return STATIC_FILE_URL . $str_url . '?v=' . STATIC_FILE_VERSION;
	if(ENVIRONMENT=='production'){
		$str_static_url = 'http://static.gitci.com'.$str_url . '?v=' . config_item('version');
	}elseif(ENVIRONMENT=='testing'){
		$str_static_url = 'http://static.gitci.com'.$str_url . '?v=' . config_item('version');
	}elseif(ENVIRONMENT=='development'){
		$str_static_url = 'http://static.gitci.com'.$str_url . '?v=' . config_item('version');
	}
	return $str_static_url;
}


/**
 * 判断是否有权限
 * @param string $ctrl
 * @param string $act
 * @return bool
 */
function pass($ctrl = '', $act = '') {
	static $permissions = null;
	if ($permissions === null) {
		$CI =& get_instance();
		$permissions = false;

		if ($CI->userinfo) {
			$user = $CI->userinfo;
			$admin_group = $CI->db->query("SELECT *  FROM my_admin_permission_relation WHERE admin_id = ".$user['id'])->row_array();
			if ((!empty($admin_group)&&($admin_group['group_id'] == 5))) {
				$permissions = true;
			} else{
				$data = $CI->db->query("SELECT  p.controller, p.action FROM  my_admin_permission_relation  AS apr
						LEFT JOIN my_admin_permission AS p ON apr.permission_id = p.id
						WHERE  apr.admin_id = ".$user['id'])->result_array();
				$res = array();
				foreach($data as $item) {
					$res[strtolower($item['controller'])][strtolower($item['action'])] = true;
				}
				$permissions = $res;
			}
		}
	}
	if (is_bool($permissions)) {
		return $permissions;
	}
	return isset($permissions[strtolower($ctrl)][strtolower($act)]);
}

?>