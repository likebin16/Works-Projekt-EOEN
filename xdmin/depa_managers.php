<?php
	include "conn/config.php";
	include "conn/page.php";
	//验证是否拥有管理权限
	$useid = $_SESSION['user_info']['uid'];
	$dpsud = "SELECT * from hk_admin where uid='{$useid}' and FIND_IN_SET('2000',flags)";
	$dpsql = $db->getOne($dpsud);
	if(!$dpsql){
		echo "<script>alert('您无权访问此页面！请联系IT人员。');</script>";die;
	}
	//部门
	$useid = $_SESSION['user_info']['uid'];
	$sql = "SELECT * FROM hk_admin WHERE uid='".$useid."'";
	$re1 = mysql_query($sql);
	$re = mysql_fetch_array($re1);
	$dp = $re['depa'];
	//分页
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_asslist where depa='{$dp}' and state in (5,10)";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_asslist where depa='{$dp}' and state in (5,10) ORDER BY user limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//退回
	if(isset($_GET['bock_ass'])){
		$id=$_GET['id'];
		$open = mysql_query("UPDATE hk_asslist SET state='0' where `zid` = '".$id."' ");
		if($open){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('退回资产失败！');self.location=document.referrer;</script>";
		}
	} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>员工管理</title>
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
		<blockquote class="layui-elem-quote mylog-info-tit">
            <ul class="layui-tab-title">
				<li class="layui-btn" onclick="window.location.href='depa_managers.php';"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
		    	<li class="layui-btn layui-btn-danger" id="all"><i class="iconfont icon-icon1" data-icon="icon-icon1"></i>申请记录</li>
		    </ul>
        </blockquote>
		<div class="larry-personal-body clearfix">
			<table class="layui-table">
				<thead>
					<tr>
						<th>员工工号</th>
						<th>员工姓名</th>
						<th>登记部门</th>
						<th>资产编号</th>
						<th>资产名称</th>
						<th>资产备注</th>
						<th>资产状态</th>
						<th>资产管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>'.$val['user'].'</td>
							<td>';
							$upm = $val['user'];
							$snm = mysql_query("SELECT * FROM hk_users WHERE uid='{$upm}'");
							if(mysql_num_rows($snm)){
								while($row = mysql_fetch_array($snm)) {
									echo $row['name'];
								}
							}echo'</td>
							<td>';
							$dpm = $val['depa'];
							$spm = mysql_query("SELECT * FROM hk_depas WHERE did='{$dpm}'");
							if(mysql_num_rows($spm)){
								while($row = mysql_fetch_array($spm)) {
									echo $row['name'];
								}
							}echo'</td>
							<td>'.$val['zid'].'</td>
							<td>';
							$znm = $val['name'];
							$zom = mysql_query("SELECT * FROM hk_assets WHERE stoid='{$znm}'");
							if(mysql_num_rows($zom)){
								while($row = mysql_fetch_array($zom)) {
									echo $row['stonm'];
								}
							}echo'</td>
							<td>'.$val['note'].'</td>
							<td>';
							if($val['state'] == 10){
								echo'<span class="label label-success radius">使用中</span>';
							}
							if($val['state'] == 5){
								echo'<span class="label label-default radius">未使用</span>';
							}echo'
							</td>
							<td>
								<span onclick="window.location=`?edit_ass&id='.$val['zid'].'`" class="layui-btn layui-btn-small layui-btn-normal">编辑</span>';
							?>
							<?php
							if($val['state'] == 5){
							?>
								<span onclick="layer.open({ icon: 7, content: '退回后将不会出现在部门资产！<br>确定要退回这件资产吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_ass&id=<?php echo $val['zid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-danger">退回</span>
							<?php
							}else{
								echo '<span class="layui-btn layui-btn-small layui-btn-disabled">退回</span>';
							}?>
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
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use('layer', function(){
		var layer = layui.layer;
		$('#all').on('click', function(){
			layer.open({
			type: 2,
			title: '资产申请记录',
			maxmin: true,
			area : ['900px' , '660px'],
			content: 'include/iframe/assets.php?depa_mg'
			});
		});
	}); 
</script>
<?php
	//编辑
	if(isset($_GET['edit_ass'])){
		$id=$_GET['id'];
		echo"<script type='text/javascript'>
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
				type: 2,
				title: '编辑固定资产信息',
				maxmin: true,
				area : ['700px' , '420px'],
				content: 'include/iframe/assets.php?edit_ass&id=".$id."'
				});
		}); 
		</script>";
	} 
?>
</body>
</html>