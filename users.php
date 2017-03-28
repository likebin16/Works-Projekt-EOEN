<?php
	include "xdmin/conn/config.php";
	include "xdmin/conn/page.php";
	if(!$_SESSION['user_info']['user_id']){
		header("Location:login.php");	
	}
	//分页
	$showrow = 15;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_users where state='1'";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_users where state='1' ORDER BY uid limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//获取一级部门
	$depa = "SELECT * FROM hk_depas where sid='' ORDER BY did";
	$pata = $db->getAll($depa);

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
		<h1 class="site-h1">企业内部通讯录</h1>
		<div class="layui-tab layui-tab-card">
		  <ul class="layui-tab-title">
			<li class="layui-this">所有人员</li>
			<?php
			foreach($pata as $key=>$val){
				echo'<li>'.$val['name'].'</li>';
			}
			?>
		  </ul>
		  <div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<table class="layui-table">
					<thead>
						<tr>
							<th>工号</th>
							<th>姓名</th>
							<th>部门</th>
							<th>工作QQ</th>
							<th>工作微信</th>
							<th>工作手机</th>
						</tr> 
					</thead>
					<tbody>
						<?php
						foreach($data as $key=>$val){
							echo'<tr>
								<td>'.$val['uid'].'</td>
								<td>'.$val['name'].'</td>
								<td>';
								$depaid = $val['depa'];
								$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
								if(mysql_num_rows($depanm)){
									while($row = mysql_fetch_array($depanm)) {
										echo $row['name'];
									}
								}echo'
								</td>
								<td>'.$val['qq'].'</td>
								<td>'.$val['wechat'].'</td>
								<td>'.$val['phone'].'</td>
								</tr>';
						}
						?>
					</tbody>
				</table>
				<div id="page" class="page">
					<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-0">
						<?php
							if($total>$showrow){//总记录数大于每页显示数，显示分页
							 $page = new page($total,$showrow,$curpage,$url,2);
							 echo $page->myde_write();
							}
						 ?>
					</div>
				</div>
			</div>
			<?php
			$user1 = "SELECT * FROM hk_users where depa=1000 || depa=1001 || depa=1002 || depa=1003 || depa=1004 || depa=1005 ORDER BY uid";
			$usda1 = $db->getAll($user1);
			echo'<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>部门</th>
								<th>工作QQ</th>
								<th>工作微信</th>
								<th>工作手机</th>
							</tr> 
						</thead>
						<tbody>';
			foreach($usda1 as $key=>$val){
				echo'<tr>
						<td>'.$val['uid'].'</td>
						<td>'.$val['name'].'</td>
						<td>';
						$depaid = $val['depa'];
						$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
						if(mysql_num_rows($depanm)){
							while($row = mysql_fetch_array($depanm)) {
								echo $row['name'];
							}
						}echo'
						</td>
						<td>'.$val['qq'].'</td>
						<td>'.$val['wechat'].'</td>
						<td>'.$val['phone'].'</td>
					</tr>';
			}
			echo'
						</tbody>
					</table>
				</div>';
			?>
			<?php
			$user2 = "SELECT * FROM hk_users where depa=2000 || depa=2001 || depa=2002 || depa=2003 || depa=2004 || depa=2005 ORDER BY uid";
			$usda2 = $db->getAll($user2);
			echo'<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>部门</th>
								<th>工作QQ</th>
								<th>工作微信</th>
								<th>工作手机</th>
							</tr> 
						</thead>
						<tbody>';
			foreach($usda2 as $key=>$val){
				echo'<tr>
						<td>'.$val['uid'].'</td>
						<td>'.$val['name'].'</td>
						<td>';
						$depaid = $val['depa'];
						$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
						if(mysql_num_rows($depanm)){
							while($row = mysql_fetch_array($depanm)) {
								echo $row['name'];
							}
						}echo'
						</td>
						<td>'.$val['qq'].'</td>
						<td>'.$val['wechat'].'</td>
						<td>'.$val['phone'].'</td>
					</tr>';
			}
			echo'
						</tbody>
					</table>
				</div>';
			?>
			<?php
			$user3 = "SELECT * FROM hk_users where depa=3000 || depa=3001 || depa=3002 || depa=3003 || depa=3004 || depa=3005 ORDER BY uid";
			$usda3 = $db->getAll($user3);
			echo'<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>部门</th>
								<th>工作QQ</th>
								<th>工作微信</th>
								<th>工作手机</th>
							</tr> 
						</thead>
						<tbody>';
			foreach($usda3 as $key=>$val){
				echo'<tr>
						<td>'.$val['uid'].'</td>
						<td>'.$val['name'].'</td>
						<td>';
						$depaid = $val['depa'];
						$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
						if(mysql_num_rows($depanm)){
							while($row = mysql_fetch_array($depanm)) {
								echo $row['name'];
							}
						}echo'
						</td>
						<td>'.$val['qq'].'</td>
						<td>'.$val['wechat'].'</td>
						<td>'.$val['phone'].'</td>
					</tr>';
			}
			echo'
						</tbody>
					</table>
				</div>';
			?>
			<?php
			$user4 = "SELECT * FROM hk_users where depa=4000 || depa=4001 || depa=4002 || depa=4003 || depa=4004 || depa=4005 ORDER BY uid";
			$usda4 = $db->getAll($user4);
			echo'<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>部门</th>
								<th>工作QQ</th>
								<th>工作微信</th>
								<th>工作手机</th>
							</tr> 
						</thead>
						<tbody>';
			foreach($usda4 as $key=>$val){
				echo'<tr>
						<td>'.$val['uid'].'</td>
						<td>'.$val['name'].'</td>
						<td>';
						$depaid = $val['depa'];
						$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
						if(mysql_num_rows($depanm)){
							while($row = mysql_fetch_array($depanm)) {
								echo $row['name'];
							}
						}echo'
						</td>
						<td>'.$val['qq'].'</td>
						<td>'.$val['wechat'].'</td>
						<td>'.$val['phone'].'</td>
					</tr>';
			}
			echo'
						</tbody>
					</table>
				</div>';
			?>
			<?php
			$user5 = "SELECT * FROM hk_users where depa=5000 || depa=5001 || depa=5002 || depa=5003 || depa=5004 || depa=5005 ORDER BY uid";
			$usda5 = $db->getAll($user5);
			echo'<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>部门</th>
								<th>工作QQ</th>
								<th>工作微信</th>
								<th>工作手机</th>
							</tr> 
						</thead>
						<tbody>';
			foreach($usda5 as $key=>$val){
				echo'<tr>
						<td>'.$val['uid'].'</td>
						<td>'.$val['name'].'</td>
						<td>';
						$depaid = $val['depa'];
						$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
						if(mysql_num_rows($depanm)){
							while($row = mysql_fetch_array($depanm)) {
								echo $row['name'];
							}
						}echo'
						</td>
						<td>'.$val['qq'].'</td>
						<td>'.$val['wechat'].'</td>
						<td>'.$val['phone'].'</td>
					</tr>';
			}
			echo'
						</tbody>
					</table>
				</div>';
			?>
			<?php
			$user6 = "SELECT * FROM hk_users where depa=6000 || depa=6001 || depa=6002 || depa=6003 || depa=6004 || depa=6005 ORDER BY uid";
			$usda6 = $db->getAll($user6);
			echo'<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>部门</th>
								<th>工作QQ</th>
								<th>工作微信</th>
								<th>工作手机</th>
							</tr> 
						</thead>
						<tbody>';
			foreach($usda6 as $key=>$val){
				echo'<tr>
						<td>'.$val['uid'].'</td>
						<td>'.$val['name'].'</td>
						<td>';
						$depaid = $val['depa'];
						$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
						if(mysql_num_rows($depanm)){
							while($row = mysql_fetch_array($depanm)) {
								echo $row['name'];
							}
						}echo'
						</td>
						<td>'.$val['qq'].'</td>
						<td>'.$val['wechat'].'</td>
						<td>'.$val['phone'].'</td>
					</tr>';
			}
			echo'
						</tbody>
					</table>
				</div>';
			?>
			<?php
			$user7 = "SELECT * FROM hk_users where depa=9000 || depa=9001 || depa=9002 || depa=9003 || depa=9004 || depa=9005 || depa=9006 ORDER BY uid";
			$usda7 = $db->getAll($user7);
			echo'<div class="layui-tab-item">
				<table class="layui-table">
					<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>部门</th>
								<th>工作QQ</th>
								<th>工作微信</th>
								<th>工作手机</th>
							</tr> 
						</thead>
						<tbody>';
			foreach($usda7 as $key=>$val){
				echo'<tr>
						<td>'.$val['uid'].'</td>
						<td>'.$val['name'].'</td>
						<td>';
						$depaid = $val['depa'];
						$depanm = mysql_query("SELECT * FROM hk_depas WHERE did='{$depaid}'");
						if(mysql_num_rows($depanm)){
							while($row = mysql_fetch_array($depanm)) {
								echo $row['name'];
							}
						}echo'
						</td>
						<td>'.$val['qq'].'</td>
						<td>'.$val['wechat'].'</td>
						<td>'.$val['phone'].'</td>
					</tr>';
			}
			echo'
						</tbody>
					</table>
				</div>';
			?>
		  </div>
		</div>
		<div class="layui-elem-quote">
			<p>通讯录仅供内部信息查询使用，勿对外公布</p>
		</div>
	</div>
	<?php include "include/footer.php";?>