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
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_users";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_users ORDER BY uid limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//禁用
	if(isset($_GET['bock_user'])){
		$uid=$_GET['uid'];
		$bock = mysql_query("UPDATE hk_users SET state='0' where `uid` = '".$uid."' ");
		if($bock){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('禁用失败！');self.location=document.referrer;</script>";
		}
	} 
	//启用
	if(isset($_GET['open_user'])){
		$uid=$_GET['uid'];
		$open = mysql_query("UPDATE hk_users SET state='1' where `uid` = '".$uid."' ");
		if($open){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('启用失败！');self.location=document.referrer;</script>";
		}
	} 
	//删除
	if(isset($_GET['del_user'])){
		$uid=$_GET['uid'];
		$del = mysql_query("delete from hk_users where `uid` = '".$uid."' ");
		if($del){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('删除失败！');self.location=document.referrer;</script>";
		}
	} 
	//密码
	if(isset($_GET['pass_user'])){
		$uid = $_GET['uid'];
		$pas = md5('JJS6866');
		$open = mysql_query("UPDATE hk_users SET password='{$pas}' where `uid` = '".$uid."' ");
		if($open){
			
		}else{
			echo "<script>alert('密码重置失败！');</script>";
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
				<li class="layui-btn" onclick="window.location.href='user_managers.php';"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
		    	<li class="layui-btn layui-btn-danger" id="add_user"><i class="iconfont icon-yonghu1" data-icon="icon-yonghu1"></i>添加员工</li>
		    	<div class="handle-box">
					<ul>
						<li class="handle-item">
							<form action="" method="post">
							<div class="layui-input-inline">
								<input type="text" name="uid" autocomplete="off" placeholder="请输入工号或者姓名" class="layui-input">
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
				<thead>
					<tr>
						<th>员工工号</th>
						<th>员工姓名</th>
						<th>性别</th>
						<th>所属部门</th>
						<th>手机号码</th>
						<th>微信号码</th>
						<th>QQ号码</th>
						<th>状态</th>
						<th>员工管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>'.$val['uid'].'</td>
							<td>'.$val['name'].'</td>
							<td>'.$val['sex'].'</td>
							<td>';
							$dpa = $val['depa'];
							$sdpa = mysql_query("SELECT * FROM hk_depas WHERE did='{$dpa}'");
							if(mysql_num_rows($sdpa)){
								while($row = mysql_fetch_array($sdpa)) {
									echo $row['name'];
								}
							}echo'
							</td>
							<td>'.$val['phone'].'</td>
							<td>'.$val['wechat'].'</td>
							<td>'.$val['qq'].'</td>
							<td>';
							if($val['state'] == 1){
								echo'<span class="label label-success radius">已启用</span>';
							}else{
								echo'<span class="label label-default radius">已禁用</span>';
							}echo'
							</td>
							<td>';
							if($val['state'] == 1){?>
								<span onclick="layer.open({ icon: 7, content: '禁用后员工则不能登录！<br>确定要禁用这位员工吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_user&uid=<?php echo $val['uid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-primary">禁用</span>
							<?php
							}else{
								echo'<span onclick="window.location=`?open_user&uid='.$val['uid'].'`" class="layui-btn layui-btn-small layui-btn">启用</span>';
							}?>
								<span onclick="window.location=`?edit_user&uid=<?php echo $val['uid'] ?>`" class="layui-btn layui-btn-small layui-btn-normal">编辑</span>
								<span onclick="layer.open({ icon: 5, content: '删除后不能恢复，建议进行编辑！<br>确定要删除这位员工吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?del_user&uid=<?php echo $val['uid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-danger">删除</span>
								<span onclick="layer.open({ icon: 3, content: '初始密码：JJS6866<br>是否要重置为初始密码？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?pass_user&uid=<?php echo $val['uid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-warm">密码</span>
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
		$('#add_user').on('click', function(){
			layer.open({
			type: 2,
			title: '添加新员工',
			maxmin: true,
			area : ['700px' , '640px'],
			content: 'include/iframe/user.php?add_user'
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
				title: '查询员工数据',
				maxmin: true,
				area : ['700px' , '600px'],
				content: 'include/iframe/user.php?search&uid=".$uid."'
				});
		}); 
		</script>";
	}
	//编辑
	if(isset($_GET['edit_user'])){
		$uid=$_GET['uid'];
		echo"<script type='text/javascript'>
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
				type: 2,
				title: '编辑员工数据',
				maxmin: true,
				area : ['700px' , '600px'],
				content: 'include/iframe/user.php?search&uid=".$uid."'
				});
		}); 
		</script>";
	} 
?>
</body>
</html>