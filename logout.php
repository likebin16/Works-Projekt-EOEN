<?php
	include "xdmin/conn/config.php";
	//清除SESSION
	if($_SESSION['user_info']){
		unset($_SESSION['user_info']['user_id']);
		unset($_SESSION['user_info']['user_name']);
		
	}
	header("Location:/login");
?>
