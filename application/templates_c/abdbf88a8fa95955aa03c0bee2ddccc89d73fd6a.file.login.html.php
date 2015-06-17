<?php /* Smarty version Smarty-3.1.14, created on 2015-06-17 17:42:26
         compiled from "/usr/local/nginx/html/git_ci/application/views/admin/login.html" */ ?>
<?php /*%%SmartyHeaderCode:916859700558141021db8b7-70586093%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'abdbf88a8fa95955aa03c0bee2ddccc89d73fd6a' => 
    array (
      0 => '/usr/local/nginx/html/git_ci/application/views/admin/login.html',
      1 => 1434533928,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '916859700558141021db8b7-70586093',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_5581410222c5d4_34943920',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5581410222c5d4_34943920')) {function content_5581410222c5d4_34943920($_smarty_tpl) {?><!DOCTYPE html>
<html class="login-bg">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="<?php echo static_url('/bootstrap-3.3.4-dist/css/bootstrap.min.css');?>
" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" href="<?php echo static_url('/admin/css/signin.css');?>
" type="text/css" media="screen" />
  </head>
  <body>
    
    
    <noscript>
	<div class="xh-topmessage">
		<div class="xh-topnotice">
			<div class="xh-topnotice-bd">
				您的浏览器已禁用JavaScript脚本，这会影响您的正常访问。为了拥有更好的浏览体验，请启用脚本。
			</div>
		</div>
	</div>
</noscript><!--noscript over-->

    <div class="login-wrapper">
        <a href="index.html">
            <img class="logo" src="<?php echo static_url('/admin/images/logo-white.png');?>
">
        </a>

        <div class="box">
            <div class="content-wrap">
                <h6>n5后台管理登录</h6>
                <form  method="post" onsubmit="return false;">
                <input class="form-control" type="text" placeholder="用户名" name="username" id="username" autofocus>
                <input class="form-control" type="password" placeholder="密码" name="password" id="password">
                <button type="submit" id="login_submit" class="btn btn-lg btn-primary btn-block">Sign in</button>
                </form>
            </div>
        </div>
    </div>
    
    
    
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo static_url('/bootstrap-3.3.4-dist/js/bootstrap.min.js');?>
"></script>
    
    
    
    <script type="text/javascript"> 
    $(function(){
		$("#login_submit").click(function(){
		    var username = $("#username").val();
		    alert(username)
		    var password = $("#password").val();
		    $.ajax({
		        url : '/login/checkLogin',
		        type : 'POST',
		        data : {'username':username,'password':password},
		        dataType : 'json',
		        success : function (result) {
		            if(result.status == 'error') {
						alert(result.msg)
		            } else {
		            	 window.location.href="/"
		            }
		        }
		    });
		})
	})
    </script>
	
  </body>
</html><?php }} ?>