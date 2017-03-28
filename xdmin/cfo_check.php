<?php
	include "conn/config.php";
	//验证是否拥有管理权限
	$useid = $_SESSION['user_info']['uid'];
	$cwsud = "SELECT * from hk_admin where uid='{$useid}' and FIND_IN_SET('3000',flags)";
	$cwsql = $db->getOne($cwsud);
	if(!$cwsql){
		echo "<script>alert('您无权访问此页面！请联系IT人员。');</script>";die;
	}
	//分页
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_assig where ascfo='1' || ascfo='5' || ascfo='10'";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_assig where ascfo='1' || ascfo='5' || ascfo='10' ORDER BY ascfo limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//审核通过
	if(isset($_GET['check_ok'])){
		$id=$_GET['id'];
		$bock = mysql_query("UPDATE hk_assig SET ascfo='5' where `id`='".$id."'");
		if($bock){
			echo "<script>location.href='cfo_check.php';</script>";
		}else{
			echo "<script>alert('审核失败，请重试败！');location.href='cfo_check.php';</script>";
		}
	} 
	//审核失败
	if(isset($_GET['check_off'])){
		$id=$_GET['id'];
		$bock = mysql_query("UPDATE hk_assig SET ascfo='10' where `id`='".$id."'");
		if($bock){
			echo "<script>location.href='cfo_check.php';</script>";
		}else{
			echo "<script>alert('审核失败，请重试败！');location.href='cfo_check.php';</script>";
		}
	} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>资产审核</title>
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
		<blockquote class="layui-elem-quote mylog-info-tit">
            <ul class="layui-tab-title">
				<li class="layui-btn" onclick="window.location.href='cfo_check.php';"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
		    </ul>
        </blockquote>
		<div class="larry-personal-body clearfix">
			<table class="layui-table">
				<thead>
					<tr>
						<th>申请人</th>
						<th>申请部门</th>
						<th>加急状态</th>
						<th>申请时间</th>
						<th>申请备注</th>
						<th>申请状态</th>
						<th>申请管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>';
							$use = $val['auid'];
							$uda = mysql_query("SELECT * FROM hk_users WHERE uid='{$use}'");
							if(mysql_num_rows($uda)){
								while($row = mysql_fetch_array($uda)) {
									echo $row['name'].'('.$row['uid'].')';
								}
							}echo'
							</td>
							<td>'.$val['adpa'].'</td>
							<td>';
							if($val['asped'] == 1){
								echo'<span class="label label-success radius">是</span>';
							}else{
								echo'<span class="label label-default radius">否</span>';
							}echo'
							</td>
							<td>'.$val['atime'].'</td>
							<td>'.$val['anote'].'</td>
							<td>';
							if($val['ascfo'] == 1){
								echo'<span class="label label-success radius">待审核</span>';
							}
							if($val['ascfo'] == 5){
								echo'<span class="label label-success radius">通过</span>';
							}
							if($val['ascfo'] == 10){
								echo'<span class="label label-default radius">未通过</span>';
							}echo'
							</td>
							<td>';
							if($val['ascfo'] == 1){
								echo '<span onclick="window.location=`?check_ok&id='.$val['id'].'`" class="layui-btn layui-btn-small">审核通过</span>
									  <span onclick="window.location=`?check_off&id='.$val['id'].'`" class="layui-btn layui-btn-small layui-btn-danger">审核失败</span>';
							}
							if($val['ascfo'] == 5){
								echo '<span class="layui-btn layui-btn-small layui-btn-primary layui-btn-disabled">审核通过</span>
									  <span class="layui-btn layui-btn-small layui-btn-primary layui-btn-disabled">审核失败</span>';
							}
							if($val['ascfo'] == 10){
								echo '<span onclick="window.location=`?check_ok&id='.$val['id'].'`" class="layui-btn layui-btn-small">审核通过</span>
									  <span class="layui-btn layui-btn-small layui-btn-primary layui-btn-disabled">审核失败</span>';
							}
							?>
							</td>
						</tr>
					<?php
					}
					?>
				</tbody>
			</table>
			<div class="larry-table-page clearfix">
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
		</div>
	</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
</body>
</html>