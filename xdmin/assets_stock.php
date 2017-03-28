<?php
	include "conn/config.php";
	include "conn/page.php";
	//验证是否拥有管理权限
	$useid = $_SESSION['user_info']['uid'];
	$zcsud = "SELECT * from hk_admin where uid='{$useid}' and FIND_IN_SET('4000',flags)";
	$zcsql = $db->getOne($zcsud);
	if(!$zcsql){
		echo "<script>alert('您无权访问此页面！请联系IT人员。');</script>";die;
	}
	//分页
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_assets";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_assets ORDER BY id limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//禁用
	if(isset($_GET['bock_stock'])){
		$id=$_GET['id'];
		$bock = mysql_query("UPDATE hk_assets SET stote='0' where `stoid` = '".$id."' ");
		if($bock){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('禁用失败！');self.location=document.referrer;</script>";
		}
	} 
	//启用
	if(isset($_GET['open_stock'])){
		$id=$_GET['id'];
		$open = mysql_query("UPDATE hk_assets SET stote='1' where `stoid` = '".$id."' ");
		if($open){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('启用失败！');self.location=document.referrer;</script>";
		}
	} 
	//删除
	if(isset($_GET['del_stock'])){
		$id=$_GET['id'];
		$del = mysql_query("delete from hk_assets where `stoid` = '".$id."' ");
		if($del){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('删除失败！');self.location=document.referrer;</script>";
		}
	} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>资产库存</title>
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
		    	<li class="layui-btn" onclick="window.location.href='assets_stock.php';"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
		    	<li class="layui-btn layui-btn-danger" id="add_stock"><i class="iconfont icon-database" data-icon="icon-database"></i>资产入库</li>
		    	<div class="handle-box">
					<ul>
						<li class="handle-item">
							<form action="" method="post">
							<div class="layui-input-inline">
								<input type="text" name="id" autocomplete="off" placeholder="请输入编码或者名称" class="layui-input">
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
						<th>库存编码</th>
						<th>入库名称</th>
						<th>入库数量</th>
						<th>库存数量</th>
						<th>出库数量</th>
						<th>报废数量</th>
						<th>存放地点</th>
						<th>资产状态</th>
						<th>资产管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>'.$val['stoid'].'</td>
							<td>'.$val['stonm'].'</td>
							<td>'.$val['stosl'].'</td>
							<td>'.$val['stokc'].'</td>
							<td>'.$val['stock'].'</td>
							<td>'.$val['stobf'].'</td>
							<td>'.$val['stoad'].'</td>
							<td>';
							if($val['stote'] == 1){
								echo'<span class="label label-success radius">正常分配</span>';
							}else{
								echo'<span class="label label-default radius">禁止分配</span>';
							}echo'
							</td>
							<td>';
							if($val['stote'] == 1){
							?>
								<span onclick="layer.open({ icon: 7, content: '禁用后部门不能进行申请！<br>确定要禁用这个资产吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_stock&id=<?php echo $val['stoid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-primary">禁用</span>
							<?php
							}else{
								echo'<span onclick="window.location=`?open_stock&id='.$val['stoid'].'`" class="layui-btn layui-btn-small layui-btn">启用</span>';
							}?>
								<span onclick="window.location=`?edit_stock&id=<?php echo $val['stoid'] ?>`" class="layui-btn layui-btn-small layui-btn-normal">编辑</span>
							<?php
							if(!$val['stock'] >= 1){
							?>
								<span onclick="layer.open({ icon: 5, content: '库存删除后将不能恢复！<br>确定要删除这个库存吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?del_stock&id=<?php echo $val['stoid'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-danger">删除</span>
							<?php
							}else{
								echo '<span class="layui-btn layui-btn-small layui-btn-danger layui-btn-disabled">删除</span>';
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
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use('layer', function(){
		var layer = layui.layer;
		$('#add_stock').on('click', function(){
			layer.open({
			type: 2,
			title: '入库新资产',
			maxmin: true,
			area : ['700px' , '500px'],
			content: 'include/iframe/assets.php?add_stock'
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
				title: '查询库存信息',
				maxmin: true,
				area : ['700px' , '500px'],
				content: 'include/iframe/assets.php?edit_depa&id=".$id."'
				});
		}); 
		</script>";
	}
	//编辑
	if(isset($_GET['edit_stock'])){
		$id=$_GET['id'];
		echo"<script type='text/javascript'>
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
				type: 2,
				title: '编辑库存信息',
				maxmin: true,
				area : ['700px' , '500px'],
				content: 'include/iframe/assets.php?edit_depa&id=".$id."'
				});
		}); 
		</script>";
	} 
?>
</body>
</html>