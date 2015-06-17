<?php

/**
 * 根据当前域名生成静态文件的url
 * @param $str_url
 * @return string
 * @author yanrui@tizi.com
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




?>