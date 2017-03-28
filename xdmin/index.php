<?php 
	include "conn/config.php";
	if(!isset($_COOKIE['hkadminuser'])){
		echo "<script>top.location='login.php'</script>";//跳转到管理界面
		die();
	}
	include "include/layout.php"; 
	include "include/header.php"; 
	include "include/slider.php";
?>
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #1AA094;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>修改密码</em></li>
			</ul>
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" data-id='0' src="password.php"></iframe>
				</div>
			</div>
		</div>
	</div>
<?php 
	include "include/footer.php"; 
?>