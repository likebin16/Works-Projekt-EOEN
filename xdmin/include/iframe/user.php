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
	if(isset($_GET['add_user'])){//添加新员工
	
	if($_POST)//添加员工表单
	{
		$tqq = htmlspecialchars($_POST['qq']);
		$uid = htmlspecialchars($_POST['uid']);
		$sex = htmlspecialchars($_POST['sex']);
		$dpa = htmlspecialchars($_POST['depa']);
		$nme = htmlspecialchars($_POST['name']);
		$poe = htmlspecialchars($_POST['phone']);
		$wct = htmlspecialchars($_POST['wechat']);
		$pas = htmlspecialchars($_POST['password']);
		
		$spid = mysql_query("SELECT * FROM hk_users where uid = '".$uid."'");//验证工号是否存在
		//$spoe = mysql_query("SELECT * FROM hk_users where phone = '".$poe."'");//验证手机号码是否存在
		$pwd = md5($pas);
		if($uid && $pas && $dpa && $nme && $sex){
			if(strlen($uid) == 4){
				if(!mysql_num_rows($spid)){
					$check = mysql_query("INSERT INTO hk_users (uid,name,password,sex,depa,phone,wechat,qq,state) VALUES ('".$uid."','".$nme."','".$pwd."','".$sex."','".$dpa."','".$poe."','".$wct."','".$tqq."',1)");
					if($check){
						echo "<script>alert('添加员工成功！');</script>";
					}else{
						$error = '员工添加失败，请重试';
					}
				}else{
					$error = '工号已经存在';
				}
			}else{
				$error = '工号必须是4个数字';
			}
		}else{
			$error = '工号、密码、部门、姓名、性别为必填项';
		}
	}
?>
<section class="layui-larry-box">
	<?php
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
						<input type="text" name="uid"  autocomplete="off"  class="layui-input" maxlength="4" placeholder="输入工号">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">登录密码<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="password"  autocomplete="off"  value="JJS6866" class="layui-input" placeholder="输入密码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属部门<span>*</span></label>
					<div class="layui-input-block">
						<select name="depa" lay-filter="aihao">
							<option value=""></option>
							<?php
							$list = "SELECT * FROM hk_depas where state='1' ORDER BY did";
							$data = $db->getAll($list);
							foreach($data as $key=>$val){
								echo'<option value="'.$val['did'].'">'.$val['name'].'</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名<span>*</span></label>
					<div class="layui-input-block">
						<input type="text" name="name"  autocomplete="off" class="layui-input" placeholder="输入名字">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-block">
						<input type="text" name="phone"  autocomplete="off" class="layui-input" placeholder="输入手机号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">QQ号码</label>
					<div class="layui-input-block">
						<input type="text" name="qq"  autocomplete="off" class="layui-input" placeholder="输入QQ号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">微信号码</label>
					<div class="layui-input-block">
						<input type="text" name="wechat"  autocomplete="off" class="layui-input" placeholder="输入微信号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别<span>*</span></label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="男" title="男" checked>
						<input type="radio" name="sex" value="女" title="女">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即录入</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<?php
	}
	if(isset($_GET['add_depa'])){//添加新部门
	
	if($_POST)//添加部门表单
	{
		$pid = htmlspecialchars($_POST['pid']);
		$bid = htmlspecialchars($_POST['bid']);
		$sid = htmlspecialchars($_POST['sid']);
		$sta = htmlspecialchars($_POST['sta']);
		$name = htmlspecialchars($_POST['name']);
		
		$spid = mysql_query("SELECT * FROM hk_depas where did = '".$bid."'");
		$snam = mysql_query("SELECT * FROM hk_depas where name = '".$name."'");
		
		if($pid && $bid && $name){
			if(strlen($bid) == 4){
				if(!mysql_num_rows($spid)){
					if(!mysql_num_rows($snam)){
						$check = mysql_query("INSERT INTO hk_depas (pid,did,sid,name,state) VALUES ('".$pid."','".$bid."','".$sid."','".$name."','".$sta."')");
						if($check){
							$error = '部门添加成功！';
						}else{
							$error = '部门添加失败，请重试';
						}
					}else{
						$error = '部门名称已经存在';
					}
				}else{
					$error = '部门ID已经存在';
				}
			}else{
				$error = '部门ID为4个数字';
			}
		}else{
			$error = '排序、ID、名称为必填项';
		}
		
	}

?>
<section class="layui-larry-box">
	<?php
	if(@$error){
		echo '<div id="err">'.$error.'</div>';
	}
	?>
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5" action="user.php?add_depa" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">部门排序</label>
					<div class="layui-input-block">  
						<input type="text" name="pid"  autocomplete="off"  class="layui-input" value="<?php echo''.@$pid.''; ?>" placeholder="输入数字">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">部门ID</label>
					<div class="layui-input-block">  
						<input type="text" name="bid"  autocomplete="off"  class="layui-input" value="<?php echo''.@$bid.''; ?>" placeholder="输入部门ID">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">部门名称</label>
					<div class="layui-input-block">  
						<input type="text" name="name"  autocomplete="off"  class="layui-input" value="<?php echo''.@$name.''; ?>" placeholder="输入部门名称">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">上级部门</label>
					<div class="layui-input-block">
						<select name="sid" lay-filter="aihao">
							<option value=""></option>
							<?php
							$list = "SELECT * FROM hk_depas where sid=''";
							$data = $db->getAll($list);
							foreach($data as $key=>$val){
								echo'<option value="'.$val['did'].'">'.$val['name'].'</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否启用</label>
					<div class="layui-input-block">
						<input type="radio" name="sta" value="1" title="启用" checked>
						<input type="radio" name="sta" value="0" title="禁用">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即新增</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<?php
	}
	if(isset($_GET['add_admin'])){//添加新管理员
		
	if($_POST)//添加管理员表单
	{
		$uid = htmlspecialchars($_POST['uid']);//工号
		$dpa = htmlspecialchars($_POST['depa']);//部门
		$nme = htmlspecialchars($_POST['name']);//姓名
		$pas = md5($_POST['pass']);//密码
		$sta = htmlspecialchars($_POST['state']);//状态
		$suo = $_POST['sudo'];//权限
		
		$sop = implode(",",$suo);
		
		$time = date('Y-m-d H:i:s' , time());
		$spid = mysql_query("SELECT * FROM hk_admin where uid = '".$uid."'");//验证用户名是否存在
		
		if($uid && $dpa && $nme && $sta && $pas){
			if(strlen($uid) == 4){
				if(!mysql_num_rows($spid)){
					$check = mysql_query("INSERT INTO hk_admin (uid,depa,name,pawd,times,flags,state) VALUES ('".$uid."','".$dpa."','".$nme."','".$pas."','".$time."','".$sop."','".$sta."')");
					if($check){
						echo "<script>alert('添加管理员成功！');</script>";
					}else{
						$error = '管理员添加失败，请重试';
					}
				}else{
					$error = '用户名已经存在';
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
						<input type="text" name="uid"  autocomplete="off"  class="layui-input" maxlength="4" placeholder="输入工号">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名<span>*</span></label>
					<div class="layui-input-block">
						<input type="text" name="name"  autocomplete="off" class="layui-input" placeholder="输入名字">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">登录密码<span>*</span></label>
					<div class="layui-input-block">
						<input type="text" name="pass"  autocomplete="off" class="layui-input" placeholder="输入密码">
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
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即录入</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<?php
	}
	if(isset($_GET['search'])){//搜索员工信息
		$uid=$_GET['uid'];
		$sql = "SELECT * FROM hk_users WHERE uid='{$uid}' || name='{$uid}'";
		$result = $db->getOne($sql);
		
		if($_POST){
			$tqq = htmlspecialchars($_POST['qq']);
			$uid = htmlspecialchars($_POST['uid']);
			$sex = htmlspecialchars($_POST['sex']);
			$dpa = htmlspecialchars($_POST['depa']);
			$nme = htmlspecialchars($_POST['name']);
			$poe = htmlspecialchars($_POST['phone']);
			$wct = htmlspecialchars($_POST['wechat']);
			
			if($uid && $dpa && $nme && $sex){
				if(strlen($uid) == 4){
					$check = mysql_query("UPDATE hk_users SET depa='{$dpa}',name='{$nme}',phone='{$poe}',qq='{$tqq}',wechat='{$wct}',sex='{$sex}' where `uid`='".$uid."' ");
					if($check){
						echo "<script>alert('编辑员工信息成功！');self.location=document.referrer;</script>";
					}else{
						$error = '编辑员工信息失败，请重试';
					}
				}else{
					$error = '工号必须是4个数字';
				}
			}else{
				$error = '工号、部门、姓名、性别为必填项';
			}
		}
?>
<section class="layui-larry-box">
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<?php
			if($result){
			if(@$error){
				echo '<div id="err">'.$error.'</div>';
			}
			?>
			<form class="layui-form col-lg-5" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="uid"  value="<?php echo $result['uid']; ?>"  class="layui-input layui-disabled" maxlength="4" placeholder="输入工号">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属部门<span>*</span></label>
					<div class="layui-input-block">
						<select name="depa" lay-filter="aihao">
							<option value="<?php echo $result['depa']; ?>" selected><?php echo $result['depa']; ?></option>
							<?php
							$list = "SELECT * FROM hk_depas where state='1' ORDER BY did";
							$data = $db->getAll($list);
							foreach($data as $key=>$val){
								echo'<option value="'.$val['did'].'">'.$val['name'].'（'.$val['did'].'）</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名<span>*</span></label>
					<div class="layui-input-block">
						<input type="text" name="name"  value="<?php echo $result['name']; ?>" class="layui-input" placeholder="输入名字">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-block">
						<input type="text" name="phone"  value="<?php echo $result['phone']; ?>" class="layui-input" placeholder="输入手机号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">QQ号码</label>
					<div class="layui-input-block">
						<input type="text" name="qq"  value="<?php echo $result['qq']; ?>" class="layui-input" placeholder="输入QQ号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">微信号码</label>
					<div class="layui-input-block">
						<input type="text" name="wechat"  value="<?php echo $result['wechat']; ?>" class="layui-input" placeholder="输入微信号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别<span>*</span></label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="<?php echo $result['sex']; ?>" title="<?php echo $result['sex']; ?>" checked>
						<input type="radio" name="sex" value="男" title="男">
						<input type="radio" name="sex" value="女" title="女">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">确认修改</button>
						<button type="reset" class="layui-btn layui-btn-primary">恢复</button>
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
	if(isset($_GET['depa'])){//搜索部门信息
		$uid=$_GET['uid'];
		$sql = "SELECT * FROM hk_depas WHERE did='{$uid}' || name='{$uid}'";
		$result = $db->getOne($sql);
		
		if($_POST){
			$pid = htmlspecialchars($_POST['pid']);
			$bid = htmlspecialchars($_POST['bid']);
			$sid = htmlspecialchars($_POST['sid']);
			$sta = htmlspecialchars($_POST['sta']);
			$name = htmlspecialchars($_POST['name']);
			
			if($pid && $bid && $name){
				if(strlen($bid) == 4){
					$check = mysql_query("UPDATE hk_depas SET pid='{$pid}',sid='{$sid}',name='{$name}',state='{$sta}' where `did`='".$bid."' ");
					if($check){
						echo "<script>alert('部门信息修改成功！');self.location=document.referrer;</script>";
					}else{
						$error = '部门修改失败，请重试';
					}
				}else{
					$error = '部门ID为4个数字';
				}
			}else{
				$error = '排序、ID、名称为必填项';
			}
		}
?>
<section class="layui-larry-box">
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<?php
			if($result){
			if(@$error){
				echo '<div id="err">'.$error.'</div>';
			}
			?>
			<form class="layui-form col-lg-5" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">部门排序</label>
					<div class="layui-input-block">  
						<input type="text" name="pid"  autocomplete="off"  class="layui-input" value="<?php echo $result['pid']; ?>" placeholder="输入数字">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">部门ID</label>
					<div class="layui-input-block">  
						<input type="text" name="bid"  autocomplete="off"  class="layui-input layui-disabled" value="<?php echo $result['did']; ?>" placeholder="输入部门ID">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">部门名称</label>
					<div class="layui-input-block">  
						<input type="text" name="name"  autocomplete="off"  class="layui-input" value="<?php echo $result['name']; ?>" placeholder="输入部门名称">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">上级部门</label>
					<div class="layui-input-block">
						<select name="sid" lay-filter="aihao">
							<option value="<?php echo $result['sid']; ?>" selected><?php echo $result['sid']; ?></option>
							<?php
							$list = "SELECT * FROM hk_depas where sid=''";
							$data = $db->getAll($list);
							foreach($data as $key=>$val){
								echo'<option value="'.$val['did'].'">'.$val['name'].'</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否启用</label>
					<div class="layui-input-block">
						<input type="radio" name="sta" value="1" title="启用" checked>
						<input type="radio" name="sta" value="0" title="禁用">
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
				echo '输入的部门ID或者名称不存在。请重新输入后在查询！';
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