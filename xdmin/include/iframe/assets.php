<?php
	include "../../conn/config.php";
	//重新申请
	if(isset($_GET['star_ass'])){
		$id=$_GET['id'];
		$open = mysql_query("UPDATE hk_assig SET astat='10' where `id` = '".$id."' ");
		if($open){
			echo "<script>self.location=document.referrer;</script>";
		}else{
			echo "<script>alert('启用失败！');self.location=document.referrer;</script>";
		}
	} 
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
	if(isset($_GET['add_stock'])){//入库新资产
	if($_POST)//入库新资产表单
	{
		$stoid = htmlspecialchars($_POST['stoid']);
		$stonm = htmlspecialchars($_POST['stonm']);
		$stosl = htmlspecialchars($_POST['stosl']);
		$stoad = htmlspecialchars($_POST['stoad']);
		$stote = htmlspecialchars($_POST['stote']);
	
		$spid = mysql_query("SELECT * FROM hk_assets where stoid = '".$stoid."'");//验证库存编码是否存在
		
		if($stoid && $stonm && $stosl && $stoad){
			if(!mysql_num_rows($spid)){
				$check = mysql_query("INSERT INTO hk_assets (stoid,stonm,stosl,stokc,stoad,stote) VALUES ('".$stoid."','".$stonm."','".$stosl."','".$stosl."','".$stoad."','".$stote."')");
				if($check){
					echo "<script>alert('添加资产成功！');</script>";
				}else{
					$error = '库存添加失败，请重试';
				}
			}else{
				$error = '库存编码已经存在';
			}
		}else{
			$error = '所有项目均为必填项';
		}
	}
	//随机生成库存编码
	$kcid = "HK".date('Ymd') . str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
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
					<label class="layui-form-label">库存编码<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="stoid"  autocomplete="off" class="layui-input" value="<?php echo$kcid; ?>">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">入库名称<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="stonm"  autocomplete="off" class="layui-input" placeholder="输入入库名称">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">入库数量<span>*</span></label>  
					<div class="layui-input-block">  
						<input type="text" name="stosl"  autocomplete="off" class="layui-input" placeholder="输入入库数量">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">存放地点<span>*</span></label>
					<div class="layui-input-block">
						<input type="text" name="stoad"  autocomplete="off" class="layui-input" placeholder="输入存放地点">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产状态</label>
					<div class="layui-input-block">
						<input type="radio" name="stote" value="1" title="正常分配" checked>
						<input type="radio" name="stote" value="0" title="禁止分配">
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
	if(isset($_GET['assets_new'])){//入库新资产
	if($_POST)//入库新资产表单
	{
		$zid = htmlspecialchars($_POST['zid']);
		$name = htmlspecialchars($_POST['name']);
		$depa = htmlspecialchars($_POST['depa']);
		$user = htmlspecialchars($_POST['user']);
		$note = nl2br($_POST['note']);
	
		$spid = mysql_query("SELECT * FROM hk_asslist where zid = '".$zid."'");//验证资产编码是否存在
		$time = date('Y-m-d H:i:s' , time());
		
		if($zid && $name && $depa && $user){
			if(!mysql_num_rows($spid)){
				$upkcd = mysql_query("UPDATE hk_assets SET stock=stock +1,stokc=stokc -1 WHERE stoid='{$name}'");
				if($upkcd){
					$check = mysql_query("INSERT INTO hk_asslist (zid,name,depa,user,time,note,state) VALUES ('".$zid."','".$name."','".$depa."','".$user."','".$time."','".$note."',10)");
					if($check){
						echo "<script>alert('添加资产成功！');</script>";
					}else{
						$error = '资产添加失败，请重试';
					}
				}else{
					$error = '资产添加失败，请重试';
				}
			}else{
				$error = '资产编码已经存在';
			}
		}else{
			$error = '红色标注均为必填项';
		}
	}
	//随机生成资产编码
	$kcid = "JJS".date('Ymd') . str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
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
					<label class="layui-form-label">资产编码<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="zid"  autocomplete="off" class="layui-input" value="<?php echo$kcid; ?>">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产名称<span>*</span></label>
					<div class="layui-input-block">
						<select name="name" lay-filter="aihao">
							<option value=""></option>
							<?php
							$zist = "SELECT * FROM hk_assets where stote='1' ORDER BY id";
							$zida = $db->getAll($zist);
							foreach($zida as $key=>$val){
								echo'<option value="'.$val['stoid'].'">'.$val['stonm'].'</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">登记部门<span>*</span></label>
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
					<label class="layui-form-label">使用人员<span>*</span></label>
					<div class="layui-input-block">
						<select name="user" lay-filter="aihao">
							<option value=""></option>
							<?php
							$uist = "SELECT * FROM hk_assig where astat='10' ORDER BY auid";
							$usnm = $db->getAll($uist);
							foreach($usnm as $key=>$val){
								$uids = $val['auid'];
								$udaa = mysql_query("SELECT * FROM hk_users WHERE uid='{$uids}'");
								if(mysql_num_rows($udaa)){
									while($row = mysql_fetch_array($udaa)) {
										echo $row['name'].'('.$row['uid'].')';
										echo'<option value="'.$row['uid'].'">'.$row['name'].'('.$row['uid'].')</option>';
									}
								}
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产备注</label>
					<div class="layui-input-block">  
						<textarea name="note" placeholder="可选输入备注信息" class="layui-textarea"></textarea>
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
	if(isset($_GET['depa_mg'])){//资产申请记录
	//部门
	$user_id = $_SESSION['user_info']['uid'];
	$sql = "SELECT * FROM hk_admin WHERE uid='".$user_id."'";
	$re1 = mysql_query($sql);
	$re = mysql_fetch_array($re1);
	$dp = $re['depa'];
	$dpaa = "SELECT * FROM hk_depas WHERE did='".$dp."'";
	$re2 = mysql_query($dpaa);
	$ree = mysql_fetch_array($re2);
	$dpo = $ree['name'];
	//分页
	$showrow = 12;
	$curpage = empty($_GET['page'])?1:$_GET['page'];
	$url = "?page={page}";
	$sql = "SELECT * FROM hk_assig where adpa='{$dpo}'";
	$query = mysql_query($sql);
	$total = mysql_num_rows($query);
	if(!empty($_GET['page']) && $total !=0 && $curpage > ceil($total/$showrow))
	$curpage = ceil($total_rows/$showrow);
	//获取数据
	$list = "SELECT * FROM hk_assig where adpa='{$dpo}' ORDER BY astat desc limit ".($curpage-1)*$showrow.",{$showrow}";
	$data = $db->getAll($list);
?>
<section class="layui-larry-box">
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<table class="layui-table">
				<thead>
					<tr>
						<th>申请人</th>
						<th>申请部门</th>
						<th>申请资产</th>
						<th>是否加急</th>
						<th>财务审批</th>
						<th>申请备注</th>
						<th>申请状态</th>
						<th>申请管理</th>
					</tr> 
				</thead>
				<tbody>
					<?php
					foreach($data as $key=>$val){
						echo'<tr>
							<td>';
							$upm = $val['auid'];
							$snm = mysql_query("SELECT * FROM hk_users WHERE uid='{$upm}'");
							if(mysql_num_rows($snm)){
								while($row = mysql_fetch_array($snm)) {
									echo $row['name'];
								}
							}echo'</td>
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
							<td>'.$val['anote'].'</td>
							<td>';
							if($val['astat'] == 10){
								echo'<span class="label label-success radius">申请中</span>';
							}
							if($val['astat'] == 5){
								echo'<span class="label label-success radius">申请成功</span>';
							}
							if($val['astat'] == 0){
								echo'<span class="label label-default radius">申请失败</span>';
							}echo'
							</td>
							<td>';
							if($val['astat'] == 0){
								echo'<span onclick="window.location=`assets.php?star_ass&id='.$val['id'].'`" class="layui-btn layui-btn-small layui-btn-normal">重新申请</span>';
							}else{
								echo'<span class="layui-btn layui-btn-small layui-btn-disabled">重新申请</span>';
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
<?php
	}
	if(isset($_GET['edit_depa'])){//搜索部门信息
		$id=$_GET['id'];
		$sql = "SELECT * FROM hk_assets WHERE stoid='{$id}' || stonm='{$id}'";
		$result = $db->getOne($sql);
		
		if($_POST){
			$stoid = htmlspecialchars($_POST['stoid']);
			$stonm = htmlspecialchars($_POST['stonm']);
			$stosl = htmlspecialchars($_POST['stosl']);
			$stoad = htmlspecialchars($_POST['stoad']);
			$stote = htmlspecialchars($_POST['stote']);
			
			if($stoid && $stonm && $stosl && $stoad){
				$check = mysql_query("UPDATE hk_assets SET stonm='{$stonm}',stosl='{$stosl}',stokc='{$stosl}',stoad='{$stoad}',stote='{$stote}' where `stoid`='".$stoid."' ");
				if($check){
					echo "<script>alert('库存信息修改成功！');self.location=document.referrer;</script>";
				}else{
					$error = '库存修改失败，请重试';
				}
			}else{
				$error = '红色标记项均为必填项';
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
					<label class="layui-form-label">库存编码<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="stoid" class="layui-input layui-disabled" value="<?php echo $result['stoid']; ?>">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">入库名称<span>*</span></label>
					<div class="layui-input-block">  
						<input type="text" name="stonm" class="layui-input" value="<?php echo $result['stonm']; ?>" placeholder="输入入库名称">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">入库数量<span>*</span></label>  
					<div class="layui-input-block">  
						<input type="text" name="stosl" class="layui-input" value="<?php echo $result['stosl']; ?>" placeholder="输入入库数量">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">存放地点<span>*</span></label>
					<div class="layui-input-block">
						<input type="text" name="stoad" class="layui-input" value="<?php echo $result['stoad']; ?>" placeholder="输入存放地点">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产状态</label>
					<div class="layui-input-block">
						<input type="radio" name="stote" value="1" title="正常分配" checked>
						<input type="radio" name="stote" value="0" title="禁止分配">
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
				echo '输入的资产编码或者名称不存在。请重新输入后在查询！';
			}
			?>
		</div>
	</div>
</section>
<?php
	}
	if(isset($_GET['edit_ass'])){//部门修改固定资产
		$id=$_GET['id'];
		$sql = "SELECT * FROM hk_asslist WHERE zid='{$id}'";
		$result = $db->getOne($sql);
		$zcnm = $result['name'];
		$zccx = "SELECT * FROM hk_assets WHERE stoid='{$zcnm}'";
		$zcrs = $db->getOne($zccx);
		//获取数据
		$user_id = $_SESSION['user_info']['uid'];
		$sqqo = "SELECT * FROM hk_admin WHERE uid='".$user_id."'";
		$re1 = mysql_query($sqqo);
		$re = mysql_fetch_array($re1);
		$dp = $re['depa'];
		//获取人员
		$list = "SELECT * FROM hk_users WHERE depa='".$dp."'";
		$data = $db->getAll($list);
		
		
		if($_POST){
			$user = htmlspecialchars($_POST['assuser']);
			$stat = htmlspecialchars($_POST['stote']);
			$zid = htmlspecialchars($_POST['zid']);
			
			if($user && $stat){
				$check = mysql_query("UPDATE hk_asslist SET user='{$user}',state='{$stat}' where `zid`='".$zid."' ");
				if($check){
					echo "<script>alert('资产信息修改成功！');self.location=document.referrer;</script>";
				}else{
					$error = '资产信息修改失败，请重试';
				}
			}else{
				$error = '红色标记项均为必填项';
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
					<label class="layui-form-label">资产编码</label>
					<div class="layui-input-block">  
						<input type="text" name="zid" class="layui-input layui-disabled" value="<?php echo $result['zid']; ?>">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产名称</label>
					<div class="layui-input-block">  
						<input type="text" class="layui-input layui-disabled" value="<?php echo $zcrs['stonm']; ?>" placeholder="输入入库名称">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">使用人员<span>*</span></label>
					<div class="layui-input-block">
						<select name="assuser" lay-filter="aihao">
							<option value="<?php echo $result['user']; ?>"><?php echo $result['user']; ?></option>
							<?php
							foreach($data as $key=>$val){
								echo '<option value="'.$val['uid'].'">'.$val['name'].'（'.$val['uid'].'）</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产状态<span>*</span></label>
					<div class="layui-input-block">
						<input type="radio" name="stote" value="10" title="使用中" checked>
						<input type="radio" name="stote" value="5" title="未使用">
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
				echo '输入的资产编码或者名称不存在。请重新输入后在查询！';
			}
			?>
		</div>
	</div>
</section>
<?php
	}
	if(isset($_GET['stock_list_edit'])){//部门修改固定资产
		$id=$_GET['id'];
		$sql = "SELECT * FROM hk_asslist WHERE zid='{$id}'";
		$result = $db->getOne($sql);
		//获取资产名称
		$zcnm = $result['name'];
		$zccx = "SELECT * FROM hk_assets WHERE stoid='{$zcnm}'";
		$zcrs = $db->getOne($zccx);
		//获取人员
		$list = "SELECT * FROM hk_users ORDER BY uid";
		$data = $db->getAll($list);
		//获取部门
		$depa = "SELECT * FROM hk_depas ORDER BY did";
		$depe = $db->getAll($depa);
		
		
		if($_POST){
			$zid = htmlspecialchars($_POST['zid']);
			$use = htmlspecialchars($_POST['assuser']);
			$dpa = htmlspecialchars($_POST['asdepa']);
			$sto = htmlspecialchars($_POST['stote']);
			$not = nl2br($_POST['assnote']);
			
			if($zid && $use && $dpa && $sto){
				$check = mysql_query("UPDATE hk_asslist SET user='{$use}',state='{$sto}',note='{$not}' where `zid`='".$zid."' ");
				if($check){
					echo "<script>alert('资产信息修改成功！');self.location=document.referrer;</script>";
				}else{
					$error = '资产信息修改失败，请重试';
				}
			}else{
				$error = '红色标记项均为必填项';
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
					<label class="layui-form-label">资产编码</label>
					<div class="layui-input-block">  
						<input type="text" name="zid" class="layui-input layui-disabled" value="<?php echo $result['zid']; ?>">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产名称</label>
					<div class="layui-input-block">  
						<input type="text" class="layui-input layui-disabled" value="<?php echo $zcrs['stonm']; ?>" placeholder="输入入库名称">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">使用人员<span>*</span></label>
					<div class="layui-input-block">
						<select name="assuser" lay-filter="aihao">
							<option value="<?php echo $result['user']; ?>"><?php echo $result['user']; ?></option>
							<?php
							foreach($data as $key=>$val){
								echo '<option value="'.$val['uid'].'">'.$val['name'].'（'.$val['uid'].'）</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">使用部门<span>*</span></label>
					<div class="layui-input-block">
						<select name="asdepa" lay-filter="aihao">
							<option value="<?php echo $result['depa']; ?>"><?php echo $result['depa']; ?></option>
							<?php
							foreach($depe as $key=>$val){
								echo '<option value="'.$val['did'].'">'.$val['name'].'（'.$val['did'].'）</option>';
							}
							?>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产备注</label>
					<div class="layui-input-block">
						<textarea name="assnote" placeholder="可选输入备注信息" class="layui-textarea"><?php echo $result['note']; ?></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">资产状态<span>*</span></label>
					<div class="layui-input-block">
						<input type="radio" name="stote" value="10" title="使用中" checked>
						<input type="radio" name="stote" value="5" title="未使用">
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
				echo '输入的资产编码或者名称不存在。请重新输入后在查询！';
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
		var box=document.getElementById("err");
		box.style.display="none"; 
	}
	setTimeout("codefans()",3000);
</script>
</body>
</html>