<?php /* Smarty version Smarty-3.1.14, created on 2015-06-17 17:51:08
         compiled from "/usr/local/nginx/html/git_ci/application/views/admin/index.html" */ ?>
<?php /*%%SmartyHeaderCode:11888062625581430ce75842-48982310%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5ff355e149ea8c7006447c25dc8524395c6881eb' => 
    array (
      0 => '/usr/local/nginx/html/git_ci/application/views/admin/index.html',
      1 => 1433743692,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11888062625581430ce75842-48982310',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_5581430ced7de7_86326875',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5581430ced7de7_86326875')) {function content_5581430ced7de7_86326875($_smarty_tpl) {?><!DOCTYPE html>
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
     <link href="http://cdn.staticfile.org/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.staticfile.org/normalize/3.0.1/normalize.min.css" rel="stylesheet">
        <link href="http://xixi.fm/dist/css/bootstrap-tagsinput.css" rel="stylesheet">
    <link rel="stylesheet" href="admin/css/layout.css" type="text/css" media="screen" />
  </head>
  <body>

    
        <!-- 导航 -->
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
    </nav>
    

<div class="container">
    <ol class="breadcrumb">
    	    						<li><a href="http://xixi.fm/admin.php?c=board">管理中心</a></li>
			    	    						<li class="active">音乐</li>
			    	    </ol>
</div><div class="container">
	<div class="col-xs-12 text-center" style="margin-bottom: 10px;">
		<a href="admin.php?c=add" class="btn btn-default" role="button">添 加</a>
	</div>
		<form class="form-horizontal" id="qiniuform" action="http://upload.qiniu.com/" method="post" enctype="multipart/form-data" role="form">
        <input name="token" type="hidden" value="pDb-6tzXxTm6d1l62o4K_ekuEzv5Qg7KZpoySo4K:pj7AlEo7Vwa_89_mZix6L-hE7QM=:eyJzY29wZSI6InhpeGlmbSIsImRlYWRsaW5lIjoxNDMzNTgwMzY0LCJzYXZlS2V5Ijoic2QyRDdQNkwxbGZzNVhBRFM2bHIwRzE3c1NJRHNVb3giLCJyZXR1cm5VcmwiOiJodHRwOlwvXC94aXhpLmZtXC9hZG1pbi5waHA_Yz1zb25nJm09cWluaXUiLCJyZXR1cm5Cb2R5Ijoie1wia2V5XCI6ICQoa2V5KSwgXCJzaXplXCI6ICQoZnNpemUpfSJ9">
        <div class="form-group text-center">
      		<div class="fileUpload btn btn-info">
			    <span>上 传</span>
			    <input name="file" type="file" class="upload" id="qiniufile"/>
			</div>
			<input type="submit" class="hide"/>
        </div>
	</form>
		<table class="table table-striped table-hover" style="margin-top: 20px;">
		<thead>
			<tr>
				<th>编号</th>
				<th>名称</th>
				<th>歌手</th>
				<th>来源</th>
				<th>风格</th>
				<th>语言</th>
				<th>心情</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
						<tr>
				<td># 26</td>
				<td>好了歌</td>
				<td>
					王立平				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=26"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=26" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 25</td>
				<td>分骨肉</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=25"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=25" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 24</td>
				<td>题帕三绝</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=24"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=24" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 23</td>
				<td>引子</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=23"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=23" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 22</td>
				<td>红豆曲</td>
				<td>
					王洁实				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=22"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=22" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 21</td>
				<td>叹香菱</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=21"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=21" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 20</td>
				<td>紫菱洲歌</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=20"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=20" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 19</td>
				<td>枉凝眉</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=19"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=19" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 18</td>
				<td>秋窗风雨夕</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=18"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=18" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
						<tr>
				<td># 17</td>
				<td>葬花吟</td>
				<td>
					陈力				</td>
				<td>网易云音乐</td>
				<td>流行</td>
				<td>国语</td>
				<td>怀旧</td>
				<td><a href="admin.php?c=song&m=updateSong&song=17"><i class="fa fa-pencil-square-o"></i></a>
					<a href="admin.php?c=song&m=delete&song=17" style="margin-left: 15px;"><i class="fa fa-times"></i></a>
				</td>
			</tr>
					</tbody>
	</table>
	<div class="text-right">
	<nav class="pagination"><li class="active disabled"><a href="javascript:void(0)">1</a></li><li><a href="admin.php?c=song&m=index&amp;page=2">2</a></li><li><a href="admin.php?c=song&m=index&amp;page=3">3</a></li><li><a href="admin.php?c=song&m=index&amp;page=2">下一页</a></li></nav>	</div>
</div>
    
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  </body>
</html><?php }} ?>