<?php
	include "../../conn/config.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../../css/personal.css" media="all">
	<link rel="stylesheet" type="text/css" href="style.css" media="all">
</head>
<body>
<?php
	if(isset($_GET['admin_edit'])){//搜索管理员
		$id=$_GET['id'];
		$sql = "SELECT * FROM hk_admin WHERE uid='{$id}' || name='{$id}'";
		$result = $db->getOne($sql);
		
		if($_POST){
			$uid = htmlspecialchars($_POST['uid']);//工号
			$dpa = htmlspecialchars($_POST['depa']);//部门
			$nme = htmlspecialchars($_POST['name']);//姓名
			$sta = htmlspecialchars($_POST['state']);//状态
			$suo = $_POST['sudo'];//权限
			
			$sop = implode(",",$suo);
			
			if($uid && $dpa && $nme && $sta){
				if(strlen($uid) == 4){
					$check = mysql_query("UPDATE hk_admin SET name='{$nme}',depa='{$dpa}',flags='{$sop}',state='{$sta}' where `uid`='".$uid."' ");
					if($check){
						echo "<script>alert('编辑管理员信息成功！');self.location=document.referrer;</script>";
					}else{
						$error = '编辑管理员信息失败，请重试';
					}
				}else{
					$error = '用户名必须是4个数字';
				}
			}else{
				$error = '所有项目均为必填';
			}
		}
?>
<section class="layui-larry-box">
	<?php
	if($result){
	if(@$error){
		echo '<div id="err">'.$error.'</div>';
	}
	?>
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="uid"  value="<?php echo $result['uid']; ?>"  class="layui-input layui-disabled" maxlength="4" placeholder="输入工号">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名<span>*</span></label>
					<div class="layui-input-block">
						<input type="text" name="name"  value="<?php echo $result['name']; ?>" class="layui-input" placeholder="输入名字">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">管理部门<span>*</span></label>
					<div class="layui-input-block">
						<select name="depa" lay-filter="aihao">
							<option value=""></option>
							<?php
							$list = "SELECT * FROM hk_depas ORDER BY did";
							$data = $db->getAll($list);
							foreach($data as $key=>$val){
								echo'<option value="'.$val['did'].'">'.$val['name'].'</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属权限<span>*</span></label>
					<div class="layui-input-block">
						<?php
						$sudo = mysql_query("SELECT * FROM hk_sudo ORDER BY sid");
						if(mysql_num_rows($sudo)){
							while($row = mysql_fetch_array($sudo)) {
								echo '<input type="checkbox" name="sudo[]" value="'.$row['sid'].'" title="'.$row['name'].'">';
							}
						}
						?>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否启用<span>*</span></label>
					<div class="layui-input-block">
						<input type="radio" name="state" value="1" title="启用" checked>
						<input type="radio" name="state" value="0" title="禁用">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">确认修改</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
			<?php
			}else{
				echo '输入的工号或者姓名不存在。请重新输入后在查询！';
			}
			?>
		</div>
	</div>
</section>
<?php
	}
?>
<script type="text/javascript" src="/common/layui/layui.js"></script>
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
		var box=document.getElementById('err');
		box.style.display='none'; 
	}
	setTimeout('codefans()',3000);
</script>
</body>
</html>