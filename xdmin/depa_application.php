<?php
	include "conn/config.php";
	//验证是否拥有管理权限
	$useid = $_SESSION['user_info']['uid'];
	$dpsud = "SELECT * from hk_admin where uid='{$useid}' and FIND_IN_SET('2000',flags)";
	$dpsql = $db->getOne($dpsud);
	if(!$dpsql){
		echo "<script>alert('您无权访问此页面！请联系IT人员。');</script>";die;
	}
	//申请表单验证
	if($_POST){

		$user = htmlspecialchars($_POST['assuser']);//使用人
		$depa = htmlspecialchars($_POST['assdepa']);//使用部门
		$sped = htmlspecialchars($_POST['asssped']);//是否加急
		$scfo = htmlspecialchars($_POST['asscfo']);//财务审批
		$note = htmlspecialchars($_POST['assnote']);//申请备注
		$appl = $_POST['assappl'];//选择资产
		
		$asss = implode(",",$appl);//转换数据
		
		$time = date('Y-m-d H:i:s' , time());
		if($user && $depa){
			$check = mysql_query("INSERT INTO hk_assig (auid,adpa,asped,ascfo,anote,assid,atime,astat) VALUES ('".$user."','".$depa."','".$sped."','".$scfo."','".$note."','".$asss."','".$time."',10)");
			if($check){
				echo "<script>alert('资产申请成功，请等待后台通过！');self.location='depa_application.php'; </script>";
			}else{
				$error = '资产申请失败，请重试';
			}
		}else{
			$error = '标注星号的均为必填项';
		}
	}
	//获取数据
	$user_id = $_SESSION['user_info']['uid'];
	$sql = "SELECT * FROM hk_admin WHERE uid='".$user_id."'";
	$re1 = mysql_query($sql);
	$re = mysql_fetch_array($re1);
	$dp = $re['depa'];
	//获取人员
	$list = "SELECT * FROM hk_users WHERE depa='".$dp."'";
	$data = $db->getAll($list);
	//获取部门
	$sdpa = mysql_query("SELECT * FROM hk_depas WHERE did='".$dp."'");
	$ree = mysql_fetch_array($sdpa);
	$dpp = $ree['name'];
	//获取资产
	$asse = "SELECT * FROM hk_assets WHERE stote='1' ORDER BY id";
	$alet = $db->getAll($asse);
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>申请资产</title>
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
	<style type="text/css">
	.layui-form-label span {
		color: red;
		top: 14px;
		right: 3px;
		font-size: 21px;
		position: absolute;
	}
	</style>
</head>
<body>
<section class="layui-larry-box">
	<?php
	if(@$error){
		echo '<div id="err">'.$error.'</div>';
	}
	?>
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>申请固定资产</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">申请人<span>*</span></label>
					<div class="layui-input-block">
						<select name="assuser" lay-filter="aihao">
							<option value=""></option>
							<?php
							foreach($data as $key=>$val){
								echo '<option value="'.$val['uid'].'">'.$val['name'].'（'.$val['uid'].'）</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">申请部门<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="assdepa" autocomplete="off" class="layui-input layui-disabled" value="<?php echo $dpp; ?>">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">选择资产<span>*</span></label>
					<div class="layui-input-block">  
						<?php
						foreach($alet as $key=>$val){
							if($val['stokc'] == 0){
								echo'<input type="checkbox" name="assappl[]" value="'.$val['stoid'].'" title="'.$val['stonm'].'" disabled>';
							}else{
								echo'<input type="checkbox" name="assappl[]" value="'.$val['stoid'].'" title="'.$val['stonm'].'">';
							}
						}
						?>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否加急</label>
					<div class="layui-input-block">  
						<input type="radio" name="asssped" value="1" title="是">
						<input type="radio" name="asssped" value="0" title="否" checked>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">财务审批</label>
					<div class="layui-input-block">  
						<input type="radio" name="asscfo" value="1" title="是">
						<input type="radio" name="asscfo" value="0" title="否" checked>
						<div class="layui-form-mid layui-word-aux" style="float:right; margin-right:135px;">申请食物称、体重秤必须要经过财务审批</div>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">申请备注</label>
					<div class="layui-input-block">  
						<textarea name="assnote" placeholder="可选输入备注信息" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即申请</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
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
	function codefans(){
		var box=document.getElementById("err");
		box.style.display="none"; 
	}
	setTimeout("codefans()",3000);
</script>
</body>
</html>