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
	$sql = "SELECT * FROM hk_asslist where state in (0,5,10)";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_asslist where state in (0,5,10) ORDER BY state desc limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//报废
	if(isset($_GET['bock_ass'])){
		$id = $_GET['id'];
		$kid = $_GET['kid'];
		
		$upbf = mysql_query("UPDATE hk_assets SET stobf=stobf +1 WHERE stoid='".$kid."' ");
		$open = mysql_query("UPDATE hk_asslist SET state='100' where `zid`='".$id."' ");
		if($open){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('资产报废失败！');self.location=document.referrer;</script>";
		}
	} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>资产列表</title>
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
		    	<li class="layui-btn" onclick="window.location.href='assets_list.php';"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
		    	<div class="handle-box">
					<ul>
						<li class="handle-item">
							<form action="" method="post">
							<div class="layui-input-inline">
								<input type="text" name="id" autocomplete="off" placeholder="请输入资产编号" class="layui-input">
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
						<th>资产编号</th>
						<th>资产名称</th>
						<th>登记部门</th>
						<th>使用人员</th>
						<th>登记日期</th>
						<th>资产备注</th>
						<th>资产状态</th>
						<th>资产管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>'.$val['zid'].'</td>
							<td>';
							$use = $val['name'];
							$uda = mysql_query("SELECT * FROM hk_assets WHERE stoid='{$use}'");
							if(mysql_num_rows($uda)){
								while($row = mysql_fetch_array($uda)) {
									echo $row['stonm'];
								}
							}echo'
							</td>
							<td>';
							$dse = $val['depa'];
							$ftp = mysql_query("SELECT * FROM hk_depas WHERE did='{$dse}'");
							if(mysql_num_rows($ftp)){
								while($row = mysql_fetch_array($ftp)) {
									echo $row['name'];
								}
							}echo'
							</td>
							<td>';
							$npd = $val['user'];
							$opp = mysql_query("SELECT * FROM hk_users WHERE uid='{$npd}'");
							if(mysql_num_rows($opp)){
								while($row = mysql_fetch_array($opp)) {
									echo $row['name'];
								}
							}echo'
							</td>
							<td>'.$val['time'].'</td>
							<td>'.$val['note'].'</td>
							<td>';
							if($val['state'] == 10){
								echo'<span class="label label-success radius">使用中</span>';
							}
							if($val['state'] == 5){
								echo'<span class="label label-default radius">未使用</span>';
							}
							if($val['state'] == 0){
								echo'<span class="label label-default radius">退回</span>';
							}
							echo'</td>
							<td>';
							if($val['state'] == 0 || $val['state'] == 5){
								echo '<span onclick="window.location=`?edit_stock&id='.$val['zid'].'`" class="layui-btn layui-btn-small layui-btn-normal">编辑</span>';
							}else{
								echo'<span class="layui-btn layui-btn-small layui-btn-disabled">编辑</span>';
							}
							if($val['state'] == 0){
							?>
								<span onclick="layer.open({ icon: 5, content: '报废后将不会在列表出现！<br>确定要报废这件资产吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_ass&id=<?php echo $val['zid'];?>&kid=<?php echo $val['name'];?>' }); } });" class="layui-btn layui-btn-small layui-btn-danger">报废</span>
							<?php
							}else{
								echo'<span class="layui-btn layui-btn-small layui-btn-disabled">报废</span>';
							}
							echo'
							</td>
						</tr>'; 
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
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
         layui.upload({ 
             url: '' ,
             success: function(res){
              console.log(res) 
            } 
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
				title: '查询资产信息',
				maxmin: true,
				area : ['700px' , '600px'],
				content: 'include/iframe/assets.php?stock_list_edit&id=".$id."'
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
				title: '编辑资产信息',
				maxmin: true,
				area : ['700px' , '600px'],
				content: 'include/iframe/assets.php?stock_list_edit&id=".$id."'
				});
		}); 
		</script>";
	} 
?>
</body>
</html>