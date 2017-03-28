<?php
	include "xdmin/conn/config.php";
	if(!$_SESSION['user_info']['user_id']){
		header("Location:login.php");	
	}
	$user_id = $_SESSION['user_info']['user_id'];

	//获取数据
	$list = "SELECT * FROM hk_users where uid='{$user_id}'";
	$data = $db->getAll($list);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
	<title>企业协作系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/home/css/style.css" media="all">
	<script src="common/jquery.min.js"></script>
</head>
<body>
	<?php include "include/sider.php";?>
	<div class="site-content">
		<h1 class="site-h1">我的个人信息资料</h1>
		<fieldset class="layui-elem-field per-left">
			<legend>个人信息</legend>
			<div class="layui-field-box">
				<table class="layui-table">
					<colgroup>
						<col width="80">
						<col width="200">
					</colgroup>
					<tbody>
						<?php
						foreach($data as $key=>$val){
							echo'<tr>
									<td>我的工号</td>
									<td>'.$val['uid'].'</td>
								</tr>
								<tr>
									<td>我的姓名</td>
									<td>'.$val['name'].'</td>
								</tr>
								<tr>
									<td>我的部门</td>
									<td>';
									$depaid = $val['depa'];
									$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
									if(mysql_num_rows($depanm)){
										while($row = mysql_fetch_array($depanm)) {
											echo $row['name'];
										}
									}echo'
									</td>
								</tr>
								<tr>
									<td>工作QQ</td>
									<td>'.$val['qq'].'</td>
								</tr>
								<tr>
								<tr>
									<td>工作微信</td>
									<td>'.$val['wechat'].'</td>
								</tr>
								<tr>
									<td>工作手机</td>
									<td>'.$val['phone'].'</td>
								</tr>';
						}
						?>
					</tbody>
				</table>
			</div>
			<div class="layui-elem-quote">
				<p>如发现信息有误个联系HR进行修改</p>
			</div>
		</fieldset>
		<fieldset class="layui-elem-field per-right">
			<legend>资产信息</legend>
			<div class="layui-field-box">
					<!--
				<table class="layui-table">
					<colgroup>
						<col width="100">
						<col width="200">
					</colgroup>
					<thead>
						<tr>
							<th>资产编号</th>
							<th>资产名称</th>
						</tr> 
					</thead>
					<tbody>
						<tr>
							<td>HK201702191501</td>
							<td>虚拟机</td>
						</tr>
						<tr>
							<td>HK201702191501</td>
							<td>工作号码</td>
						</tr>
						<tr>
							<td>HK201702191501</td>
							<td>工作手机</td>
						</tr>
						<tr>
							<td>HK201702191501</td>
							<td>显示器</td>
						</tr>
						<tr>
							<td>HK201702191501</td>
							<td>鼠标键盘</td>
						</tr>
					</tbody>
				</table>
				-->
			</div>
			<div class="layui-elem-quote">
				<p>申请资产请联系部门组长或经理</p>
			</div>
		</fieldset>
	</div>
	<?php include "include/footer.php";?>