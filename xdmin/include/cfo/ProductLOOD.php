<?php 
	include '../../conn/admin.php';
	$id=$_GET['id'];
	$sql = "SELECT t1.id,t1.user_id,t1.user_name,t1.content AS d_content,t2.content AS t_content FROM hk_excel_data AS t1 LEFT JOIN hk_excel_title AS t2 ON t1.title_id=t2.id WHERE t1.mon_time='{$id}'";
	$res = mysql_query($sql);
	while( $re = mysql_fetch_assoc($res) ){
		$re['d_content'] = unserialize($re['d_content']);
		$re['t_content'] = unserialize($re['t_content']);
		$arr[] = $re;
	}
	$li_str = '';
	$view_str = '';
	foreach($arr as $key=>$val){
		$check_name = $key == 0 ? "hover" : "";
		$li_str .= "<li class='titles t_{$val['id']} {$check_name}' onclick='show_this({$val['id']})'>{$val['user_name']}</li>";
		$is_show = $key == 0 ? "" : "style='display: none;'";
		$view_str .= "<ul class='Salary_detail_li show_box_{$val['id']}' {$is_show}>";
		foreach($val['t_content'] as $ke=>$va){
			$val_str = is_object($arr[$key]['d_content'][$ke]) ? '' : $arr[$key]['d_content'][$ke];
			$view_str .= "<li>
							<div class='tit'>{$va['name']}</div>
							<div class='txt'>{$val_str}</div>
						</li>";
			
		}
		$view_str .= "</ul>";
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>查看明细</title>
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
<section class="layui-larry-box">
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<div class="lood_body">
				<div id="iframediv" class="lood_left">
					<h4>员工姓名</h4>
					<div class="Salary_detail clearfix">
						<div class="Salary_detail_menu fl">
							<ul class="Salary_detail_menu_li"><?php echo $li_str;?></ul>
						</div>
					</div>
				</div>
				<div id="iframediv" class="lood_right">
					<h4>薪资明细</h4>
					<div class="sfbiry">
						<?php echo $view_str;?>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type='text/javascript'>
	function show_this( id ){
		$('.titles').removeClass('hover');
		$('.t_'+id).addClass('hover');
		$('.Salary_detail_li').hide();
		$('.show_box_'+id).show();
	}
</script>
</body>
<?php mysql_close($con);?>
</html>