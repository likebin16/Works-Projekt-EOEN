<?php
	include "conn/config.php";
	//清除SESSION
	setcookie('hkadminuser','',time()-3600);
	unset($_SESSION['admin_info']['user_id']);
	header("Location:login.php");
?>
