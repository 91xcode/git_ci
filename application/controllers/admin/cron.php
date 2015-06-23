<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

header("Content-type: text/html; charset=utf-8");
class Cron extends CI_Controller {


	/**
	 * @permission eduv汉字注释
	 * @author yanrui_a@aspirecn.com
	 */
	public function scan(){
		$arr_all_permission =array();
		$result  = $this->db->query("SELECT * FROM my_admin_permission WHERE status =1")->result_array();
		if($result){
			foreach($result as $k => $v){
				$arr_all_permission[1][$v['controller'].'_'.$v['action']] = $v;
			}
		}
		$arr_dirs = array(
				'1' => APPPATH.'controllers/admin/'
		);
		foreach($arr_dirs as $key => $value){
			$arr_items = scandir($value);
			foreach($arr_items as $v){
				if(strpos($v,'.')!==false AND strpos($v,'.')!=0){
					if($value.$v=='/usr/local/nginx/html/git_ci/application/controllers/admin/cron.php'){
						continue;
					}
						
					include_once($value.$v);
					//echo $value.$v."<br>";continue;
					
					$str_filename = pathinfo($v,PATHINFO_FILENAME);
					$str_class_name = ucfirst($str_filename);
					$obj_class = new Reflectionclass($str_class_name);
					$arr_methods = $obj_class->getMethods(ReflectionMethod::IS_PUBLIC);
					
					foreach($arr_methods as $vv){
						$str_doc = $vv->getDocComment();
						//header('Content-type:text/html; charset:utf-8;');
						if(strpos($str_doc,'@permission')!==false){
							$str_1 = strstr($str_doc,'@permission');
							$str_name = strstr(trim(substr($str_1,0,strpos($str_1,'*'))),' ');
							$str_action = $vv->getName();
							//echo $str_name.'--/'.$str_filename.'/'.$str_action;die;
							//o($arr_all_permission,true);
							if($arr_all_permission){
								if(array_key_exists($str_filename.'_'.$str_action,$arr_all_permission[$key])){
									continue;
								}
							}
							$arr_param = array(
									'name' => $str_name,
									'controller' => $str_filename,
									'action' => $str_action
							);
							//o($arr_param,true);
							//$this->model_permission->create($arr_param);
							$this->db->insert("my_admin_permission",$arr_param);
						}
					}
					//var_dump($arr_methods);
					//exit;
				}
			}
		}
	}
}