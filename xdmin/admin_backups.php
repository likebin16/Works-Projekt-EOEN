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
	//备份数据库
	if(isset($_GET['sql'])){
		mysql_query("set names 'utf8'");
		$mysql = "set charset utf8;\r\n";
		$q1 = mysql_query("show tables");
		while ($t = mysql_fetch_array($q1))
		{
			$table = $t[0];
			$q2 = mysql_query("show create table `$table`");
			$sql = mysql_fetch_array($q2);
			$mysql .= $sql['Create Table'] . ";\r\n";
			$q3 = mysql_query("select * from `$table`");
			while ($data = mysql_fetch_assoc($q3))
			{
				$keys = array_keys($data);
				$keys = array_map('addslashes', $keys);
				$keys = join('`,`', $keys);
				$keys = "`" . $keys . "`";
				$vals = array_values($data);
				$vals = array_map('addslashes', $vals);
				$vals = join("','", $vals);
				$vals = "'" . $vals . "'";
				$mysql .= "insert into `$table`($keys) values($vals);\r\n";
			}
		}
		$filename = "HK-" . date('Ymjgi') . ".sql"; 
		$fp = fopen('./SQLbackup/'.$filename.'', 'w');
		fputs($fp, $mysql);
		fclose($fp);
		
		function getsize($size, $format) {  
			$p = 0;  
			if ($format == 'kb') {  
				$p = 1;  
			} elseif ($format == 'mb') {  
				$p = 2;  
			} elseif ($format == 'gb') {  
				$p = 3;  
			}  
			$size /= pow(1024, $p);  
			return number_format($size, 1);  
		}  

		$user = $_SESSION['user_info']['name'];
		$time = date('Y-m-d H:i:s' , time());
		$data = filesize('./SQLbackup/'.$filename.'');
		$size = getsize($data, 'kb').'KB';
		mysql_query("INSERT INTO hk_sqlbk (name,time,data,user) VALUES ('".$filename."','".$time."','".$size."','".$user."')");
		echo "<script>alert('数据库备份成功！');location.href='admin_backups.php';</script>";die;
	}
	//删除数据
	if(isset($_GET['del']))
		{
			$name = $_GET['name'];
			$del = mysql_query("delete from hk_sqlbk where `name` = '".$name."' ");
			unlink('./SQLbackup/'.$name.'');
			if($del)
			{
				echo "<script>alert('删除成功！');location.href='admin_backups.php';</script>";
			}else 
			{
				echo "<script>alert('删除失败！');</script>";
			}
		} 
	//分页
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_sqlbk";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_sqlbk ORDER BY id limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>网站备份</title>
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
				<li onclick="location.reload();" class="layui-btn"><i class="iconfont icon-wenzhang1"></i>刷新页面</li>
		    	<li class="layui-btn layui-btn-danger" onclick="location.href='admin_backups.php?sql'"><i class="iconfont icon-SQLServershujuku" data-icon="icon-SQLServershujuku"></i>立即备份数据库</li>
		    </ul>
        </blockquote>
		<div class="larry-personal-body clearfix">
			<table class="layui-table">
				<thead>
					<tr>
						<th>备份编号</th>
						<th>备份名称</th>
						<th>备份时间</th>
						<th>数据大小</th>
						<th>操作员</th>
						<th>备份管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>'.$val['id'].'</td>
							<td>'.$val['name'].'</td>
							<td>'.$val['time'].'</td>
							<td>'.$val['data'].'</td>
							<td>'.$val['user'].'</td>
							<td>
								<a href="SQLbackup/'.$val['name'].'" download="'.$val['name'].'"><span class="layui-btn layui-btn-small layui-btn-normal">导出</span></a>
								<a href="admin_backups.php?del&name='.$val['name'].'"><span class="layui-btn layui-btn-small layui-btn-danger">删除</span></a>
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
</body>
</html>