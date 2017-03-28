<?php 
	include '../../conn/admin.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>查看留言</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="../../../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../../../common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="../../../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../../css/personal.css" media="all">
	<script src="../../jsplug/cfo/jquery.js"></script>
</head>
<body>
<div id="iframediv" style="width:670px;height:520px;_height:510px;overflow:auto; top:expression_r(this.style.pixelHeight + document.body.scrollTop+520);">
    <div class="Salary_msg">
        <ul class="Salary_msg_li">
			<?php
			$id=$_GET['id'];
			$sql=mysql_query("select * from hk_excel_data where mon_time='".$id."' and remark!=''");
			$re=mysql_num_rows($sql);
			if($re>0){
				while($arr=mysql_fetch_array($sql)){
				?>
				<li>
					<div class="tit"><b><?php echo $arr['user_name']?></b><?php echo $arr['msg_time']?></div>
					<div class="txt"><?php echo $arr['remark']?></div>
					<div class="detail">
						<span>ID:<?php echo $arr['user_id']?></span>
						<span>姓名：<?php echo $arr['user_name']?></span>
						<span>邮箱：<?php echo $arr['email']?></span>
						<span>手机：<?php echo $arr['phone']?></span>                    
						<span>实发工资：<?php echo $arr['price']?></span>
					</div>
				</li>
				<?php
				}
			}else{
			?>
			<div style="text-align: center;font-size: 20px;line-height: 200px;">暂时没有人留言</div>
			<?php
			}
			?>
        </ul>
    </div>
</div>
</body>
<?php mysql_close($con);?>
</html>