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
	$sql = "SELECT * FROM hk_assig";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_assig ORDER BY astat desc limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
	//驳回申请
	if(isset($_GET['bock_ass'])){
		$aid=$_GET['aid'];
		$bock = mysql_query("UPDATE hk_assig SET astat='0' where `id`='".$aid."'");
		if($bock){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('驳回申请失败，请重试！');self.location=document.referrer;</script>";
		}
	} 
	//分配完成
	if(isset($_GET['open_ass'])){
		$aid=$_GET['aid'];
		$open = mysql_query("UPDATE hk_assig SET astat='5' where `id`='".$aid."'");
		if($open){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('分配资产失败，请重试！');self.location=document.referrer;</script>";
		}
	} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>资产分配</title>
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
				<li class="layui-btn" onclick="location.reload();"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
				<li class="layui-btn layui-btn-danger" id="assets"><i class="iconfont icon-qingchuhuancun" data-icon="icon-qingchuhuancun"></i>分配资产</li>
		    </ul>
        </blockquote>
		<div class="larry-personal-body clearfix">
			<table class="layui-table">
				<thead>
					<tr>
						<th>申请人</th>
						<th>申请部门</th>
						<th>申请资产</th>
						<th>加急状态</th>
						<th>财务审批</th>
						<th>申请备注</th>
						<th>申请时间</th>
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
							$asid = $val['assid'];
							$Arre = explode(',', $asid);
							$sdop = count($Arre);
							for($i = 0; $i < $sdop; $i++){ 
								$c1 = $Arre[$i];  
								$c2 = explode("|",$c1);  
								$c3 = $c2[0]; 
								$flas = mysql_query("SELECT * FROM hk_assets WHERE stoid='{$c3}'");
								while($row = mysql_fetch_array($flas)) {
									echo $row['stonm'].'<br>';
								}
							}echo'</td>
							<td>';
							if($val['asped'] == 1){
								echo'<span class="label label-success radius">是</span>';
							}else{
								echo'<span class="label label-default radius">否</span>';
							}echo'
							</td>
							<td>';
							if($val['ascfo'] == 0){
								echo'<span class="label label-success radius">无需审核</span>';
							}
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
							<td>'.$val['anote'].'</td>
							<td>'.$val['atime'].'</td>
							<td>';
							if($val['astat'] == 10){
								echo'<span class="label label-success radius">申请中</span>';
							}
							if($val['astat'] == 5){
								echo'<span class="label label-success radius">申请成功</span>';
							}
							if($val['astat'] == 0){
								echo'<span class="label label-default radius">申请失败</span>';
							}
							echo'</td>
							<td>';
							if($val['astat'] == 10){
							?>
								<span onclick="layer.open({ icon: 7, content: '驳回后可进行修改在重新申请！<br>确定要驳回该申请单吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?bock_ass&aid=<?php echo $val['id']; ?>' }); } });" class="layui-btn layui-btn-small layui-btn-primary">驳回申请</span>
								<span onclick="layer.open({ icon: 1, content: '分配完成后该申请单就结束了！<br>确定已经分配完成了吗？' ,btn: ['确定', '取消'] ,yes: function(index, layero){ var btn = layero.find('.layui-layer-btn'); btn.find('.layui-layer-btn0').attr({ href: '?open_ass&aid=<?php echo $val['id']; ?>' }); } });" class="layui-btn layui-btn-small layui-btn-normal">分配完成</span>
							<?php
							}else{
								echo'<span class="layui-btn layui-btn-small layui-btn-disabled">驳回申请</span>
									<span class="layui-btn layui-btn-small layui-btn-disabled">分配完成</span>';
							}echo'
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
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use('layer', function(){
		var layer = layui.layer;
		$('#assets').on('click', function(){
			layer.open({
			type: 2,
			title: '分配固定资产',
			maxmin: true,
			area : ['700px' , '550px'],
			content: 'include/iframe/assets.php?assets_new'
			});
		});
	}); 
</script>
</body>
</html>