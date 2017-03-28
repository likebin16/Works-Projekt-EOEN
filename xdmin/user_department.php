<?php
	include "conn/config.php";
	include "conn/page.php";
	//验证是否拥有管理权限
	$useid = $_SESSION['user_info']['uid'];
	$hrsud = "SELECT * from hk_admin where uid='{$useid}' and FIND_IN_SET('1000',flags)";
	$hrsql = $db->getOne($hrsud);
	if(!$hrsql){
		echo "<script>alert('您无权访问此页面！请联系IT人员。');</script>";die;
	}
	//分页
	$showrow = 3;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_depas where sid=''";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_depas where sid='' limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//一级部门禁用
	if(isset($_GET['bock_depa_up'])){
		$did=$_GET['did'];
		$bock = mysql_query("UPDATE hk_depas SET state='0' where `did`='".$did."' || `sid`='".$did."'");
		if($bock){
			echo "<script>location.href='user_department.php';</script>";
		}else{
			echo "<script>alert('禁用失败！');location.href='user_department.php';</script>";
		}
	} 
	//二级部门禁用
	if(isset($_GET['bock_depa'])){
		$did=$_GET['did'];
		$bock = mysql_query("UPDATE hk_depas SET state='0' where `did`='".$did."'");
		if($bock){
			echo "<script>location.href='user_department.php';</script>";
		}else{
			echo "<script>alert('禁用失败！');location.href='user_department.php';</script>";
		}
	} 
	//一级部门启用
	if(isset($_GET['open_depa_up'])){
		$did=$_GET['did'];
		$open = mysql_query("UPDATE hk_depas SET state='1' where `did`='".$did."' || `sid`='".$did."'");
		if($open){
			echo "<script>location.href='user_department.php';</script>";
		}else{
			echo "<script>alert('启用失败！');location.href='user_department.php';</script>";
		}
	} 
	//二级部门启用
	if(isset($_GET['open_depa'])){
		$did=$_GET['did'];
		$open = mysql_query("UPDATE hk_depas SET state='1' where `did`='".$did."'");
		if($open){
			echo "<script>location.href='user_department.php';</script>";
		}else{
			echo "<script>alert('启用失败！');location.href='user_department.php';</script>";
		}
	} 
	//一级部门删除
	if(isset($_GET['del_depa_up'])){
		$did=$_GET['did'];
		$del = mysql_query("delete from hk_depas where `did`='".$did."' || `sid`='".$did."'");
		if($del){
			echo "<script>location.href='user_department.php';</script>";
		}else{
			echo "<script>alert('删除失败！');location.href='user_department.php';</script>";
		}
	} 
	//二级部门删除
	if(isset($_GET['del_depa'])){
		$did=$_GET['did'];
		$del = mysql_query("delete from hk_depas where `did`='".$did."'");
		if($del){
			echo "<script>location.href='user_department.php';</script>";
		}else{
			echo "<script>alert('删除失败！');location.href='user_department.php';</script>";
		}
	} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>部门管理</title>
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
				<li class="layui-btn" onclick="window.location.href='user_department.php';"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
				<li class="layui-btn layui-btn-danger" id="add_depa"><i class="iconfont icon-quanxian2" data-icon="icon-quanxian2"></i>添加部门</li>
		    	<div class="handle-box">
					<ul>
						<li class="handle-item">
							<form action="" method="post">
							<div class="layui-input-inline">
								<input type="text" name="uid" autocomplete="off" placeholder="请输入ID或者名称" class="layui-input">
							</div>
							<button class="layui-btn mgl-20">查询</button>
							</form>
						</li>
					</ul>
				</div>
		    </ul>
        </blockquote>
		<div class="larry-personal-body clearfix">
			<table class="layui-table">
				 <colgroup>
					<col width="50">
					<col width="50">
					<col width="150">
					<col width="100">
					<col width="150">
					<col>
				  </colgroup>
				<thead>
					<tr>
						<th>部门排序</th>
						<th>部门ID</th>
						<th>部门名称</th>
						<th>部门状态</th>
						<th>部门管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>'.$val['pid'].'</td>
							<td>'.$val['did'].'</td>
							<td>'.$val['name'].'</td>
							<td>';
							if($val['state'] == 1){
								echo'<span class="label label-success radius">已启用</span>';
							}else{
								echo'<span class="label label-default radius">已停用</span>';
							}echo'
							</td>
							<td>';
							if($val['state'] == 1){
							?>
								<span onclick="layer.open({ icon: 7, content: '该部门下所有子部门都会停用！<br>确定要停用这个大部门吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_depa_up&did=<?php echo $val['did']; ?>' }); } });" class="layui-btn layui-btn-small layui-btn-primary">停用部门</span>
							<?php
							}else{
								echo'<span onclick="window.location=`?open_depa_up&did='.$val['did'].'`" class="layui-btn layui-btn-small layui-btn">启用部门</span>';
							}?>
								<span onclick="window.location=`?edit_depa&uid=<?php echo $val['did'] ?>`" class="layui-btn layui-btn-small layui-btn-normal">编辑部门</span>
								<span onclick="layer.open({ icon: 5, content: '该部门下所有子部门都会删除！<br>确定要删除这个大部门吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?del_depa_up&did=<?php echo $val['did'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-danger">删除部门</span>
							</td>
						</tr>
						<?php
						$sid = $val['did'];
						$slt = "SELECT * FROM hk_depas where sid='{$sid}'";
						$dst = $db->getAll($slt);
						foreach($dst as $key=>$sop){
							echo'<tr>
								<td>'.$sop['pid'].'</td>
								<td>'.$sop['did'].'</td>
								<td>|----- '.$sop['name'].'</td>
								<td>';
								if($sop['state'] == 1){
									echo'<span class="label label-success radius">已启用</span>';
								}else{
									echo'<span class="label label-default radius">已停用</span>';
								}echo'
								</td>
								<td>';
								if($sop['state'] == 1){
								?>
									<span onclick="layer.open({ icon: 7, content: '部门停用后将不能选择！<br>确定要停用这个部门吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_depa&did=<?php echo $sop['did']; ?>' }); } });" class="layui-btn layui-btn-small layui-btn-primary">停用部门</span>
								<?php
								}else{
									echo'<span onclick="window.location=`?open_depa&did='.$sop['did'].'`" class="layui-btn layui-btn-small layui-btn">启用部门</span>';
								}?>
									<span onclick="window.location=`?edit_depa&uid=<?php echo $val['did'] ?>`" class="layui-btn layui-btn-small layui-btn-normal">编辑部门</span>
									<span onclick="layer.open({ icon: 5, content: '删除后不能恢复，建议进行编辑！<br>确定要删除这个部门吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?del_depa&did=<?php echo $sop['did'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-danger">删除部门</span>
								</td>
							</tr>
						<?php
						}
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
		$('#add_depa').on('click', function(){
		layer.open({
		type: 2,
		title: '添加新部门',
		maxmin: true,
		area : ['700px' , '500px'],
		content: 'include/iframe/user.php?add_depa'
	  });
	});
	}); 
</script>
<?php
	//搜索
	if($_POST){
		$uid = htmlspecialchars($_POST['uid']);
		echo"<script type='text/javascript'>
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
				type: 2,
				title: '查询部门信息',
				maxmin: true,
				area : ['700px' , '500px'],
				content: 'include/iframe/user.php?depa&uid=".$uid."'
				});
		}); 
		</script>";
	}
	//编辑
	if(isset($_GET['edit_depa'])){
		$uid=$_GET['uid'];
		echo"<script type='text/javascript'>
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
				type: 2,
				title: '编辑部门信息',
				maxmin: true,
				area : ['700px' , '500px'],
				content: 'include/iframe/user.php?depa&uid=".$uid."'
				});
		}); 
		</script>";
	} 
?>
</body>
</html>