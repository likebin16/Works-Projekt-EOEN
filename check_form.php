<?php
	include "xdmin/conn/config.php";
	
	$action = $_REQUEST['app'];

	// 登陆提交事件，检验是否通过
	if($action == 'log_user'){	
	
		$name = htmlspecialchars($_POST['name']);
		$pwd = htmlspecialchars($_POST['pwd']);
		$sql = "SELECT * FROM hk_users WHERE uid='{$name}'";
		$result = $db->getOne($sql);
		if(!$result){
			echo json_encode(array('code'=>2,'msg'=>'用户名不存在！'));die;
		}
		if($result['state'] == 0){
			echo json_encode(array('code'=>2,'msg'=>'你的账户已经被禁用！'));die;
		}
		if($result['password'] != md5($pwd)){
			echo json_encode(array('code'=>3,'msg'=>'密码错误！'));die;
		}
		echo json_encode(array('code'=>1,'msg'=>''));die;
		
	}

	// 提交留言
	if($action == 'msg_add'){
		
		$user_id = $_SESSION['user_info']['user_id'];
		$id = $_POST['id'];
		$content = $_POST['remark'];
		$time = time();
		if($content){
			$sql = "UPDATE hk_excel_data SET remark='{$content}',msg_time='{$time}' WHERE user_id='{$user_id}' AND id='{$id}'";
			$re =	$db->query($sql);
			if($re > 0){
				echo "<script>alert('留言成功 ！');self.location='/view?id=".$id."'</script>";
			}else{
				echo "<script>alert('留言失败 ！');self.location='/view?id=".$id."'</script>";
			}
		}else{
			echo "<script>alert('既然有问题就说清楚在提交吧！');self.location='/view?id=".$id."'</script>";
		}
		
	}
	
	// 用户重置密码
	if($action == 'reset'){
		$user_id = $_SESSION['user_info']['user_id'];
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
		$sql = "SELECT * FROM hk_users WHERE uid={$user_id}";	
		$re = $db->getOne($sql);
		if(!$re || $re['password'] != md5($passwod)){
			echo json_encode(array('code'=>0,'msg'=>'重置失败，原密码错误'));die;
		}
		$pwd = md5($newpawd);
		if($pwd == $re['password']){
			echo json_encode(array('code'=>0,'msg'=>'重置失败，新密码和原密码一致！'));die;
		}
		$update_sql = "UPDATE hk_users SET password='{$pwd}' WHERE uid={$user_id}";
		$db->query($update_sql);
		$re = $db->affectedRows();
		if($re > 0){
			echo json_encode(array('code'=>1,'msg'=>'重置密码成功，请重新登陆...'));die;
		}else{
			echo json_encode(array('code'=>0,'msg'=>'重置失败...'));die;
		}
	}