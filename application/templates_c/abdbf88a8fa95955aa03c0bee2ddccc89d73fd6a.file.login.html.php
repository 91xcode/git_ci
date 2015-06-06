<?php /* Smarty version Smarty-3.1.14, created on 2015-06-06 22:30:28
         compiled from "/usr/local/nginx/html/git_ci/application/views/admin/login.html" */ ?>
<?php /*%%SmartyHeaderCode:173303066557304049e0712-83494520%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'abdbf88a8fa95955aa03c0bee2ddccc89d73fd6a' => 
    array (
      0 => '/usr/local/nginx/html/git_ci/application/views/admin/login.html',
      1 => 1433600829,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '173303066557304049e0712-83494520',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_55730404a275a7_01351055',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_55730404a275a7_01351055')) {function content_55730404a275a7_01351055($_smarty_tpl) {?><!DOCTYPE html>
<html class="login-bg">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="http://static.gitci.com/;"/>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" href="admin/css/signin.css" type="text/css" media="screen" />
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
            <img class="logo" src="admin/images/logo-white.png">
        </a>

        <div class="box">
            <div class="content-wrap">
                <h6>n5后台管理登录</h6>
                <form action="http://www.note520.com/admin/login/checkLogin" method="post">
                <input class="form-control" type="text" placeholder="用户名" name="uname" autofocus>
                <input class="form-control" type="password" placeholder="密码" name="upass">
                            	<input type="hidden" name="word" value=''/>
                <div class="remember">
                    <input id="remember-me" type="checkbox">
                    <label for="remember-me">记住我</label>
                </div>
               
                <button type="submit" class="btn btn-lg btn-primary btn-block">Sign in</button>
                </form>
            </div>
        </div>
    </div>
    
    
    
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  </body>
</html><?php }} ?>