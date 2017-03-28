<?php
	include "xdmin/conn/config.php";
	if($_SESSION['user_info']['user_id']){
		header("Location:/");
	}
	if($_POST){//登陆验证
		$name = htmlspecialchars($_POST['name']);
		$pwd = htmlspecialchars($_POST['pwd']);
		$sql = "SELECT * FROM hk_users WHERE uid='{$name}'";
		$result = $db->getOne($sql);
		$_SESSION['user_info']['user_id'] = $result['uid'];
		$_SESSION['user_info']['user_name'] = $result['name'];
		echo header("Location:/");
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
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/home/css/login.css" media="all">
	<script src="common/jquery.min.js"></script>
</head>
<body>
<div class="login_bg">
    <div class="login_box">
        <div class="login_tit"><i class="layui-icon">&#xe62e;</i> <br/>企业协作系统</div>
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
                        <input type="password" class="txt" name="pwd" id='pwd' placeholder="请输入你的密码" onkeyup='loninPwd();'/>
                    </div>
                    <div class="login_form_tips">
                        <div class="login_form_tips_txt pwd_msg"></div>
                    </div>
                </li>               
                <li>
                    <input type="submit" name='submit' class="layui-btn layui-btn-danger fix blue" value="登 录" />
                    <p class="jump"><i class="layui-icon">&#xe623;</i> 注册帐号请联系HR</p>
                </li>
            </ul>
            </form>
        </div>
    </div>
</div>
<script type='text/javascript'>
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
	}
	function loginForm(){
		var name = $('#name').val();
		var pwd = $('#pwd').val();
		var t = 0;
		if(name == ''){
			$('.name_msg').html('请输入用户名！');
			return false;
		}
		if(pwd == ''){
			$('.pwd_msg').html('请输入密码！');
			return false;
		}
		var flag = true;
		$.ajax({
			type: 'post',
			url:	'check_form.php?app=log_user',
			data:	'name='+name+'&pwd='+pwd,
			dataType: 'json',
			async:false,  
			success: function(re){
				if(re.code === 1){
					$('.name_msg').html('');
					$('.pwd_msg').html('');
					flag = true;
				}else if(re.code == 2){
					$('.name_msg').html(re.msg);
					flag = false;
				}else{
					$('.pwd_msg').html(re.msg);
					flag = false;
				}
			}	
		})
		if(!flag)
	    return false;
	}
</script>
</body>
</html>
