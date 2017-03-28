<?php
	include "xdmin/conn/config.php";
	include "xdmin/conn/page.php";
	if(!$_SESSION['user_info']['user_id']){
		header("Location:/login");	
	}
	$user_id = $_SESSION['user_info']['user_id'];
	//分页
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_excel_data";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//查询工资条
	$sql = "SELECT * FROM hk_excel_data WHERE user_id={$user_id} ORDER BY mon_time DESC LIMIT ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($sql);

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
		<h1 class="site-h1">查看我的薪资文件</h1>
		<table class="layui-table">
			<thead>
				<tr>
					<th>薪资名称</th>
					<th>上传时间</th>
					<th>薪资操作</th>
				</tr> 
			</thead>
			<tbody>
				<?php
				foreach($data as $key=>$val){
					echo'<tr>
						<td>'.$val['mon_time'].' 工资条</td>
						<td>'.date('Y-m-d H:i',$val['add_time']).'</td>
						<td><a href="/view?id='.$val['id'].'" class="layui-btn layui-btn-small">查看明细</button></td>
					</tr>';
				}
				?>
			</tbody>
		</table>
		<div class="layui-elem-quote">
			<p>如果发现薪资有误可联系财务人员 <a href="tencent://message/?uin=1172007555" class="layui-btn layui-btn-danger layui-btn-small" targer="_blank">admin</a></p>
		</div>
	</div>
	<?php include "include/footer.php";?>