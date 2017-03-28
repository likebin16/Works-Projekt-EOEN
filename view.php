<?php
	include "xdmin/conn/config.php";
	if(!$_SESSION['user_info']['user_id']){
		header("Location:/login");	
	}
	$user_id = $_SESSION['user_info']['user_id'];
	$id = intval($_GET['id']);
	$sql = "SELECT id,remark,msg_time,mon_time FROM hk_excel_data WHERE user_id='".$user_id."' AND id='".$id."'";
	$re1 = mysql_query($sql);
	$re = mysql_fetch_array($re1);
	//薪资明细
	$list = "SELECT t1.id,t1.remark,t1.msg_time,t1.content AS d_content,t2.content AS t_content FROM hk_excel_data AS t1 LEFT JOIN hk_excel_title AS t2 ON t1.title_id=t2.id WHERE t1.user_id='{$user_id}' AND t1.id='{$id}'";
	$ler = mysql_query($list);
	$rel = mysql_fetch_array($ler);
	$title_arr = unserialize($rel['t_content']);
	$value_arr = unserialize($rel['d_content']);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
	<title>企业协作系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/home/css/style.css" media="all">
	<script src="common/jquery.min.js"></script>
</head>
<body>
	<?php include "include/sider.php";?>
	<div class="site-content">
		<h1 class="site-h1"><?php echo $re['mon_time']?> 薪资明细</h1>
		<table class="layui-table view">
			<colgroup>
				<col width="100">
				<col width="200">
			</colgroup>
			<thead>
				<tr>
					<th>薪资类目</th>
					<th>薪资明细</th>
				</tr> 
			</thead>
			<tbody>
				<?php
				foreach($title_arr as $key=>$val){
					if(!$val['status']){continue;}
					echo'<tr>
						<td>'.$val['name'].'</td>
						<td>'.$value_arr[$key].'</td>
					</tr>';
				}
				?>
			</tbody>
		</table>
		<fieldset class="layui-elem-field" style="width:100%">
			<legend>如有问题，请留言</legend>
			<div class="layui-field-box">
				<div class="layui-form-item layui-form-text">
					<form action="check_form.php?app=msg_add" method="post">
						<textarea class="layui-textarea" name="remark" id="remark" placeholder="请描述你的问题"><?php echo $re['remark']?></textarea>
						<input type="hidden" name="id" value="<?php echo $re['id']?>" >
						<input type="submit"  class="layui-btn" value="提交留言" style="float: right; margin-top: 12px;"/>
					</form>
				</div>
			</div>
		</fieldset>
		<div class="layui-elem-quote">
			<p>如果发现薪资有误可在上面留言或者直接联系财务人员 <a href="tencent://message/?uin=2853792993" class="layui-btn layui-btn-danger layui-btn-small" targer="_blank">江敏</a></p>
		</div>
	</div>
	<?php include "include/footer.php";?>