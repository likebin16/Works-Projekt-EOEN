<?php
	include "conn/config.php";
	if(!$_SESSION['user_info']['uid']){
		header("Location:login.php");	
	}
	$user = $_SESSION['user_info']['uid'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改密码</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>修改登录密码</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">  
						<input type="text" name="name" autocomplete="off" class="layui-input layui-disabled" value="<?php echo $user; ?>" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-block">  
						<input type="password" name="password" id="password" autocomplete="off" class="layui-input" placeholder="请输入之前的密码" onKeyUp="value=value.replace(/[\W]/g,'')">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-block">  
						<input type="text" name="newpawd" id="newpawd" autocomplete="off" class="layui-input" placeholder="请输入新的密码" onKeyUp="value=value.replace(/[\W]/g,'')">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">  
						<input type="text" name="chkpawd" id="chkpawd" autocomplete="off" class="layui-input" placeholder="请在输入一次密码" onKeyUp="value=value.replace(/[\W]/g,'')">
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
	</div>
</section>
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../common/layui/layui.js"></script>
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
			url: 'include/form.php?app=reset',
			data: 'password='+password+'&newpawd='+newpawd+'&chkpawd='+chkpawd,
			dataType: 'json',
			success: function(re){
				alert(re.msg);
				if(re.code === 1){
					window.top.location.href='logout.php';
				}
			}
		})
	})
</script>
</body>
</html>