<?php
	include "../conn/config.php";
	
	$action = $_REQUEST['app'];
	// 用户重置密码
	if($action == 'reset'){
		$user_id = $_SESSION['user_info']['uid'];
		$passwod = $_POST['password'];
		$newpawd = $_POST['newpawd'];
		$chkpawd = $_POST['chkpawd'];
		foreach($_POST as $key=>$val){
			if(strlen($val) < 6 || strlen($val) > 12){
				echo json_encode(array('code'=>0,'msg'=>'重置失败，密码正确格式为6-12个字符'));die;
			}
		}
		if($newpawd != $chkpawd){
			echo json_encode(array('code'=>0,'msg'=>'重置失败，新密码格式和确认密码格式不一致！'));die;
		}
		$sql = "SELECT * FROM hk_admin WHERE uid={$user_id}";	
		$re = $db->getOne($sql);
		if(!$re || $re['pawd'] != md5($passwod)){
			echo json_encode(array('code'=>0,'msg'=>'重置失败，原密码错误'));die;
		}
		$pwd = md5($newpawd);
		if($pwd == $re['pawd']){
			echo json_encode(array('code'=>0,'msg'=>'重置失败，新密码和原密码一致！'));die;
		}
		$update_sql = "UPDATE hk_admin SET pawd='{$pwd}' WHERE uid={$user_id}";
		$db->query($update_sql);
		$re = $db->affectedRows();
		if($re > 0){
			echo json_encode(array('code'=>1,'msg'=>'重置密码成功，请重新登陆...'));die;
		}else{
			echo json_encode(array('code'=>0,'msg'=>'重置失败...'));die;
		}
	}

	// 登陆提交事件，检验是否通过
	if($action == 'admin_check'){	
		$cogg = $_SESSION['code_gg'];
		$name = htmlspecialchars($_POST['name']);
		$pwd = htmlspecialchars($_POST['pwd']);
		$code = htmlspecialchars($_POST['code']);
		$sql = "SELECT * FROM hk_admin WHERE uid='{$name}'";
		$result = $db->getOne($sql);
		if(!$result){
			echo json_encode(array('code'=>2,'msg'=>'用户名不存在！'));die;
		}
		if($result['state'] == 0){
			echo json_encode(array('code'=>2,'msg'=>'你的账户已经被禁用！'));die;
		}
		if($result['pawd'] != md5($pwd)){
			echo json_encode(array('code'=>3,'msg'=>'密码错误！'));die;
		}
		if($code != $cogg){
			echo json_encode(array('code'=>4,'msg'=>'验证码错误！'));die;
		}
		echo json_encode(array('code'=>1,'msg'=>''));die;
		
	}















