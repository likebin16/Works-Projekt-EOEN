<?php
	include "../../../conn/admin.php";
	$action = $_GET['action'];
	if($action=="del"){	
		$id=$_GET['id'];	
		$sql=mysql_query("delete from hk_excel_data where mon_time = '".$id."'");
		$sql=mysql_query("delete from hk_excel_title where mon_time = '".$id."'");
		if($sql){
			echo "<script>alert('添加成功！');art.dialog.close();</script>";
		}else {
			echo "<div id='notice'>FailNotice('删除失败！',function(){});</div>";
		}
	} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>已发薪资</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="../../../../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../../../../common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="../../../../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../../../css/personal.css" media="all">
	<script src="../../../jsplug/cfo/jquery.js"></script>
</head>
<body>
	<div id="AjaxList">
		<table class="layui-table">
			<thead>
				<tr>
					<th>薪资名称</th>
					<th>员工人数</th>
					<th>发送时间</th>
					<th>部门管理</th>
				</tr> 
			</thead>
			<tbody>
				<?php
				$sql=mysql_query("select * from hk_excel_title  group by mon_time  ");
               	while($ary=mysql_fetch_array($sql)){ 
                   	$s=mysql_query("select * from hk_excel_data where mon_time='".$ary['mon_time']."'");
                   	$row1 = mysql_num_rows($s);
                   	$arr=mysql_fetch_array($s);
                ?>
                <tr>
                   <td><?php echo $ary['mon_time'];?> 薪资</td>
                   <td><?php echo $row1?>人</td>
				   <td><?php echo date('Y-m-d H:i:s',$arr['add_time']);?></td>
                   <td>
                       <a href="include/cfo/ProductAdd.php?id=<?php echo $ary['mon_time'];?>" class="layui-btn layui-btn-small layui-btn-normal">查看留言</a>
                       <a href="include/cfo/ProductLOOD.php?id=<?php echo $ary['mon_time'];?>" class="layui-btn layui-btn-small layui-btn-warm">查看明细</a>
                       <a href="##" onclick="return Del('<?php echo $ary['mon_time'];?>','del','删除后员工不能查看<br>确定要删除吗？')" class="layui-btn layui-btn-small layui-btn-danger">删除工资条</a>
                   </td>
                </tr>
				<?php 
               	}
               	?>
			</tbody>
		</table>
    </div>
</body>
<?php mysql_close($con);?>
</html>