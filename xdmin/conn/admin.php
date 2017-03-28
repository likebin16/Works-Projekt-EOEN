<?php
	session_start();
	header('content-type:text/html;charset=utf-8');
	$con = mysql_connect("localhost","root","QVnVRRnJZX4CJwcC");
	mysql_query("SET NAMES 'utf8'");
	mysql_select_db("xiezuo",$con);
	if(!$con)
	{
		echo "数据库无法连接";
		die();
	}
	date_default_timezone_set('Asia/Shanghai');//设置为中国时区
?>