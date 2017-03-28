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
	<title>上传薪资</title>
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
		<div class="larry-personal-body clearfix">
			<form class="layui-form" name="myfrom" id="myform" method="post" action="include/cfo/shipmentdaoru2.php?action=daoru" enctype="multipart/form-data">
				<div class="cfo-body-letir">
					<div class="cfo-title">
						<button class="layui-btn layui-btn-disabled" style="background-color:#d2d2d2;">① 上传工资条</button>
						<button class="layui-btn layui-btn-disabled">② 预览工资项</button>
					</div>
					<div class="cfo-uoload">
						<input type="file" name="file1" id="file1"  onchange="test()"/>
						<span class="layui-btn upfilebox"><i class="layui-icon">&#xe61f;</i>    上传薪资文件</span>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="jsplug/cfo/jquery.artDialog.js?skin=default1"></script>
<script src="jsplug/cfo/plugins/iframeTools.source.js"></script>
<script src="jsplug/cfo/Dialog.js"></script>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
	function test(){
		document.getElementById("myform").submit();
	}
</script>
</body>
</html>