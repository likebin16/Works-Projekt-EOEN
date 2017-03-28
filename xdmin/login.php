<?php
	include "conn/config.php";
	if(isset($_COOKIE['hkadminuser'])){
		echo "<script>top.location='index.php'</script>";//跳转到管理界面
		die();
	}
	if($_POST){//登陆验证
		$name = htmlspecialchars($_POST['name']);
		$pwd = htmlspecialchars($_POST['pwd']);
		$sql = "SELECT uid,name,pawd,flags FROM hk_admin WHERE uid='{$name}'";
		$result = $db->getOne($sql);
		//生成用户SESSION
		setcookie('hkadminuser',$result['name'],0);
		$_SESSION['user_info']['uid'] = $result['uid'];
		$_SESSION['user_info']['name'] = $result['name'];
		//保存登陆时间
		$time = date('Y-m-d H:i:s' , time());
		$sql = "UPDATE hk_admin SET times='{$time}' WHERE uid=".$result['uid'];
		$db->query($sql);
		echo header("Location:index.php");
	}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
	<title>登录-企业协作系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/login.css" media="all">
	<script src="../common/jquery.min.js"></script>
</head>
<body>
<div class="login_bg">
    <div class="login_box">
        <div class="login_tit"><i class="layui-icon">&#xe62e;</i> <br/>企业协作系统后台</div>
        <div class="login_form">
        	<form action="" method="post" onsubmit='return loginForm();'>
            <ul class="login_form_li clearfix">
                <li>
                    <div class="fl login_form_input">
                        <i class="layui-icon">&#xe612;</i>   
                        <input type="text" class="txt" name="name" id='name' placeholder="请输入你的工号" onkeyup='loninName();'/>
                    </div>
                    <div class="login_form_tips">
                        <div class="login_form_tips_txt name_msg"></div>
                    </div>
                </li>
                <li>
                    <div class="fl login_form_input">
                        <i class="layui-icon">&#xe611;</i>  
                        <input type="password" class="txt" name="pwd" id='pwd' placeholder="请输入你的密码"  onkeyup='loninPwd();'/>
                    </div>
                    <div class="login_form_tips">
                        <div class="login_form_tips_txt pwd_msg"></div>
                    </div>
                </li> 
				<!-- 关闭验证码
				<li>
                    <div class="fl login_form_input">
                        <i class="layui-icon">&#xe617;</i>  
                        <input type="text" class="txt" name="code" id='code' placeholder="验证码"  maxlength="4" onkeyup='loninCode();'/>
						 <img src="conn/code_gg.php" id="getcode" title="看不清，点击换一张" align="absmiddle">
                    </div>
                    <div class="login_form_tips">
                        <div class="login_form_tips_txt code_msg"></div>
                    </div>
                </li> 
				-->
                <li>
                    <input type="submit" name='submit' class="layui-btn layui-btn-normal fix blue" value="登 录" />
					<p class="jump"><a href="/" target="_blank"><i class="layui-icon">&#xe623;</i> 打开前台网站</a></p>
                </li>
            </ul>
            </form>
        </div>
    </div>
</div>
<script type='text/javascript'>
	$("#getcode").click(function(){
		$(this).attr("src",'conn/code_gg.php?' + Math.random());
	});
	function loninName(){
		var name = $('#name').val();
		if(name == ''){
			$('.name_msg').html('请输入用户名！');
		}else{
			$('.name_msg').html('');
		}
	}
	function loninPwd(){
		var pwd = $('#pwd').val();
		if(pwd == ''){
			$('.pwd_msg').html('请输入密码！');
		}else{
			$('.pwd_msg').html('');
		}
	}/* 关闭验证码
	function loninCode(){
		var code = $('#code').val();
		if(code == ''){
			$('.code_msg').html('请输入验证码！');
		}else{
			$('.code_msg').html('');
		}
	}*/
	function loginForm(){
		var name = $('#name').val();
		var pwd = $('#pwd').val();
		var code = $("#code").val();
		var t = 0;
		if(name == ''){
			$('.name_msg').html('请输入用户名！');
			return false;
		}
		if(pwd == ''){
			$('.pwd_msg').html('请输入密码！');
			return false;
		}/* 关闭验证码
		if(code == ''){
			$('.code_msg').html('请输入验证码！');
			return false;
		}*/
		var flag = true;
		$.ajax({
			type: 'post',
			url:	'include/form.php?app=admin_check',
			data:	'name='+name+'&pwd='+pwd,
			dataType: 'json',
			async:false,  
			success: function(re){
				if(re.code === 1){
					$('.name_msg').html('');
					$('.pwd_msg').html('');
					$('.code_msg').html('');
					flag = true;
				}
				if(re.code == 2){
					$('.name_msg').html(re.msg);
					flag = false;
				}
				if(re.code == 3){
					$('.pwd_msg').html(re.msg);
					flag = false;
				}/* 关闭验证码
				if(re.code == 4){
					$('.code_msg').html(re.msg);
					flag = false;
				}*/
			}	
		})
		if(!flag)
	    return false;
	}
</script>
</body>
</html>