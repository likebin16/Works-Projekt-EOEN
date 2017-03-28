<?php
	include "xdmin/conn/config.php";
	if(!$_SESSION['user_info']['user_id']){
		header("Location:login.php");	
	}
	$user_id = $_SESSION['user_info']['user_id'];

	//查询我的所有工资条
	$sql = "SELECT * FROM excel_data WHERE user_id = {$user_id} ORDER BY mon_time DESC LIMIT {$begin},{$page_num}";
	$data = $db->getAll($sql);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
	<title>企业协作系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/home/css/style.css" media="all">
	<script src="common/jquery.min.js"></script>
</head>
<body>
	<?php include "include/sider.php";?>
	<div class="site-content">
		<h1 class="site-h1">修改系统登录密码</h1>
		<div class="pass-form">
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-block">
						<input type="password" id="password" required  lay-verify="required" placeholder="请输入之前的密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-block">
						<input type="password" id="newpawd" required  lay-verify="required" placeholder="请输入新的密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">
						<input type="password" id="chkpawd" required  lay-verify="required" placeholder="请在输入一次密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" id="submit" lay-submit="" lay-filter="demo1">立即修改</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
		<div class="layui-elem-quote">
			<p>密码最少6位数，建议大写+小写+数字以便保护你的账户安全</p>
		</div>
	</div>
	<?php include "include/footer.php";?>
<script>
	$('#submit').click(function(){
		var password = $("#password").val();
		var newpawd = $("#newpawd").val();
		var chkpawd = $("#chkpawd").val();
		if(password.length < 6 || password.length > 20){
			alert('密码正确格式为6-20位字符');
			return false;
		}
		if(newpawd.length < 6 || newpawd.length > 20){
			alert('密码正确格式为6-20位字符');
			return false;
		}
		if(chkpawd.length < 6 || chkpawd.length > 20){
			alert('密码正确格式为6-20位字符');
			return false;
		}
		if(newpawd != chkpawd){
			alert('新密码和确认密码输入不一致');
			return false;
		}
		$.ajax({
			type: 'post',
			url: 'check_form.php?app=reset',
			data: 'password='+password+'&newpawd='+newpawd+'&chkpawd='+chkpawd,
			dataType: 'json',
			success: function(re){
				alert(re.msg);
				if(re.code = 1){
					window.top.location.href='/logout';
				}
			}
		})
	})
</script>