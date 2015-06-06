<?php
 class Mycommon {       
         function __construct(){
                 include './config.inc.php';
                 include './uc_client/client.php';
         }
        
         function getUserId() {
                 return $this->_uid;
         }
        
         function getUserName() {
                 return ucwords ( strtolower ( $this->_username ) );
         }
        
         function login($uid) {
                 return uc_user_synlogin ( $uid );
         }
        
         function login_out() {
                 return uc_user_synlogout ();
         }
        
         function regediter($username,$password,$email){
                 return uc_user_register($username,$password,$email);                               
         }
}
?>