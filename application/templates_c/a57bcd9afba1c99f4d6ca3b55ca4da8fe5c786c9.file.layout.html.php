<?php /* Smarty version Smarty-3.1.14, created on 2015-06-17 17:56:05
         compiled from "/usr/local/nginx/html/git_ci/application/views/admin/layout.html" */ ?>
<?php /*%%SmartyHeaderCode:49686608355814435d68132-87105799%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a57bcd9afba1c99f4d6ca3b55ca4da8fe5c786c9' => 
    array (
      0 => '/usr/local/nginx/html/git_ci/application/views/admin/layout.html',
      1 => 1434532531,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '49686608355814435d68132-87105799',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'view' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_55814435e02cb6_61231954',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_55814435e02cb6_61231954')) {function content_55814435e02cb6_61231954($_smarty_tpl) {?><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <?php echo $_smarty_tpl->getSubTemplate ("admin/header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</head>
<body>
 	<?php echo $_smarty_tpl->getSubTemplate ("admin/nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

 	
 	
	<div class="container" >
    <?php echo $_smarty_tpl->getSubTemplate ((('admin/').($_smarty_tpl->tpl_vars['view']->value)).('.html'), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	</div>
	
	
    <?php echo $_smarty_tpl->getSubTemplate ("admin/footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</body>
</html>
<?php }} ?>