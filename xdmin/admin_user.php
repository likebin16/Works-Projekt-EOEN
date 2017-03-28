<?php
	include "conn/config.php";
	include "conn/page.php";
	//验证是否拥有管理权限
	$useid = $_SESSION['user_info']['uid'];
	$htsud = "SELECT * from hk_admin where uid='{$useid}' and FIND_IN_SET('5000',flags)";
	$htsql = $db->getOne($htsud);
	if(!$htsql){
		echo "<script>alert('您无权访问此页面！请联系IT人员。');</script>";die;
	}
	//分页
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_admin";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_admin ORDER BY uid limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//禁用
	if(isset($_GET['bock_user'])){
		$id=$_GET['id'];
		$bock = mysql_query("UPDATE hk_admin SET state='0' where `uid`='".$id."' ");
		if($bock){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('禁用失败！');self.location=document.referrer;</script>";
		}
	} 
	//启用
	if(isset($_GET['del_user'])){
		$id=$_GET['id'];
		$del = mysql_query("delete from hk_admin where `uid`='".$id."' ");
		if($del){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('删除失败！');self.location=document.referrer;</script>";
		}
	}
	//密码
	if(isset($_GET['pass_user'])){
		$id = $_GET['id'];
		$pas = md5('HKjjs6866');
		$open = mysql_query("UPDATE hk_admin SET pawd='{$pas}' where `uid`='".$id."' ");
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
	<title>用户列表</title>
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
		    	<li class="layui-btn" onclick="window.location.href='admin_user.php';"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
		    	<li class="layui-btn layui-btn-danger" id="add_user"><i class="iconfont icon-yonghu1" data-icon="icon-yonghu1"></i>添加管理员</li>
		    	<div class="handle-box">
					<ul>
						<li class="handle-item">
							<form action="" method="post">
							<div class="layui-input-inline">
								<input type="text" name="id" autocomplete="off" placeholder="请输入工号或者姓名" class="layui-input">
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
						<th>用户名</th>
						<th>姓名</th>
						<th>管理部门</th>
						<th>所属权限</th>
						<th>状态</th>
						<th>管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>'.$val['uid'].'</td>
							<td>'.$val['name'].'</td>
							<td>';
							$dpa = $val['depa'];
							$sdpa = mysql_query("SELECT * FROM hk_depas WHERE did='{$dpa}'");
							if(mysql_num_rows($sdpa)){
								while($row = mysql_fetch_array($sdpa)) {
									echo $row['name'];
								}
							}echo'
							</td>
							<td>';
							$flag = $val['flags'];
							$Arre = explode(',', $flag);
							$sdop = count($Arre);
							for($i = 0; $i < $sdop; $i++){
								$c1 = $Arre[$i];  
								$c2 = explode("|",$c1);  
								$c3 = $c2[0]; 
								$flas = mysql_query("SELECT * FROM hk_sudo WHERE sid='{$c3}'");
								while($row = mysql_fetch_array($flas)) {
									echo '|----- '.$row['name'].'<br>';
								}
							}echo'
							</td>
							<td>';
							if($val['state'] == 1){
								echo'<span class="label label-success radius">已启用</span>';
							}else{
								echo'<span class="label label-default radius">已禁用</span>';
							}echo'
							</td>
							<td>';
							if($val['state'] == 1){
							?>
								<span onclick="layer.open({ icon: 7, content: '禁用后员工则不能登录！<br>确定要禁用这位员工吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_user&id=<?php echo $val['uid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-primary">禁用</span>
							<?php
							}else{
								echo'<span onclick="window.location=`?open_user&id='.$val['uid'].'`" class="layui-btn layui-btn-small layui-btn">启用</span>';
							}?>
								<span onclick="window.location=`?edit_user&id=<?php echo $val['uid']; ?>`" class="layui-btn layui-btn-small layui-btn-normal">编辑</span>
								<span onclick="layer.open({ icon: 5, content: '删除后不能恢复，建议进行编辑！<br>确定要删除这位管理员吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?del_user&id=<?php echo $val['uid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-danger">删除</span>
								<span onclick="layer.open({ icon: 3, content: '初始密码：HKjjs6866<br>是否要重置为初始密码？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?pass_user&id=<?php echo $val['uid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-warm">密码</span>
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
			title: '添加新管理员',
			maxmin: true,
			area : ['700px' , '550px'],
			content: 'include/iframe/user.php?add_admin'
			});
		});
	}); 
</script>
<?php
	//搜索
	if($_POST){
		$id = htmlspecialchars($_POST['id']);
		echo"<script type='text/javascript'>
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
				type: 2,
				title: '查询管理员信息',
				maxmin: true,
				area : ['700px' , '500px'],
				content: 'include/iframe/admin.php?admin_edit&id=".$id."'
				});
		}); 
		</script>";
	}
	//编辑
	if(isset($_GET['edit_user'])){
		$id=$_GET['id'];
		echo"<script type='text/javascript'>
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
				type: 2,
				title: '编辑管理员信息',
				maxmin: true,
				area : ['700px' , '500px'],
				content: 'include/iframe/admin.php?admin_edit&id=".$id."'
				});
		}); 
		</script>";
	} 
?>
</body>
</html>