<?php
	$php_self = addslashes(htmlspecialchars($_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME']));
	$url_path = substr($php_self, 1,-4);
?>
<div class="layui-header header header-doc">
	<div class="layui-main">
		<a class="logo" href="/">
			企业协作系统
		</a>
		<ul class="layui-nav">
			<li class="layui-nav-item <?php if($url_path == 'index' || $url_path == 'view'){echo 'layui-this';}?>">
				<a href="/"><i class="layui-icon">&#xe60f;</i> 薪资查询</a>
			</li>
			<li class="layui-nav-item <?php if($url_path == 'users'){echo 'layui-this';}?>">
				<a href="/users"><i class="layui-icon">&#xe613;</i> 员工信息</a>
			</li>
			<li class="layui-nav-item <?php if($url_path == 'personal'){echo 'layui-this';}?>">
				<a href="/personal"><i class="layui-icon">&#xe614;</i> 个人中心</a>
			</li>
		</ul>
	</div>
</div>
<div class="layui-main site-inline">
	<div class="site-tree">
		<ul class="layui-tree">
			<li><h2>系统功能</h2></li>
			<li class="site-tree-noicon <?php if($url_path == 'index' || $url_path == 'view'){echo 'layui-this';}?>">
				<a href="/"><cite><i class="layui-icon">&#xe615;</i> 查询工资条</cite></a>
			</li>
			<li class="site-tree-noicon <?php if($url_path == 'users'){echo 'layui-this';}?>">
				<a href="/users"><cite><i class="layui-icon">&#xe62a;</i> 内部通讯录</cite></a>
			</li>
			<li><h2>个人中心</h2></li>
			<li class="site-tree-noicon <?php if($url_path == 'personal'){echo 'layui-this';}?>">
				<a href="/personal"><cite><i class="layui-icon">&#xe63c;</i> 信息资料</cite></a>
			</li>
			<li class="site-tree-noicon <?php if($url_path == 'password'){echo 'layui-this';}?>">
				<a href="/password"><cite><i class="layui-icon">&#xe628;</i> 修改密码</cite></a>
			</li>
			<li class="site-tree-noicon">
				<a href="/logout"><cite><i class="layui-icon">&#xe633;</i> 退出系统</cite></a>
			</li>
		</ul>
	</div>