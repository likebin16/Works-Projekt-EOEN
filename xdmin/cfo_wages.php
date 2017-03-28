<?php
	include "conn/config.php";
	//验证是否拥有管理权限
	$useid = $_SESSION['user_info']['uid'];
	$cwsud = "SELECT * from hk_admin where uid='{$useid}' and FIND_IN_SET('3000',flags)";
	$cwsql = $db->getOne($cwsud);
	if(!$cwsql){
		echo "<script>alert('您无权访问此页面！请联系IT人员。');</script>";die;
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>已发薪资</title>
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
	<script src="jsplug/cfo/jquery.js"></script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>已发薪资管理</span>
		</header>
		<div class="larry-personal-body clearfix" id="list">
		</div>
	</div>
</section>
<script src="jsplug/cfo/jquery.artDialog.js?skin=default1"></script>
<script src="jsplug/cfo/plugins/iframeTools.source.js"></script>
<script src="jsplug/cfo/Dialog.js"></script>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
	function GetList(){//ajax获取列表
		$.get("include/cfo/ajax/yifaList.php",{randomcount:Math.random()*(100-1)+1},
				function(data){
					$("#list").html($(data).filter("div#AjaxList").html());
					
				}
		);	
	}
	$(document).ready(function(){
		GetList();
	});
	function Del(DelID,DelAction,DelTitle){//删除类别
		art.dialog.confirm(DelTitle, 
				function(){	
				$.get("include/cfo/ajax/yifaList.php",{id:DelID,action:DelAction,randomcount:Math.random()*(100-1)+1},
				function(data){
					eval($(data).filter("div#notice").html())
					$("#list").html($(data).filter("div#AjaxList").html());
				}
				);
				});	
				return false	
	}
</script>
</body>
</html>