<?php /* Smarty version Smarty-3.1.14, created on 2015-06-17 17:56:05
         compiled from "/usr/local/nginx/html/git_ci/application/views/admin/nav.html" */ ?>
<?php /*%%SmartyHeaderCode:23095752855814435e14b25-69460628%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b810c2581a2fdaf2b1294238a88936f4be03fad8' => 
    array (
      0 => '/usr/local/nginx/html/git_ci/application/views/admin/nav.html',
      1 => 1434534950,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '23095752855814435e14b25-69460628',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_55814435e16d10_95688289',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_55814435e16d10_95688289')) {function content_55814435e16d10_95688289($_smarty_tpl) {?>        <!-- 导航 -->
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="admin.php?c=board">管理中心</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="admin.php?c=music">期刊</a></li>
                    <li><a href="admin.php?c=song">音乐</a></li>
                    <li><a href="admin.php?c=yue">阅读</a></li>
                    <li><a href="admin.php?c=pic">图片</a></li>
                    <li><a href="admin.php?c=users">用户</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="index.php" target="_black">网站</a></li>
                    <li><a href="admin.php?c=logout">注销</a></li>
                                </ul>
            </div>
        </div>
    </nav><?php }} ?>