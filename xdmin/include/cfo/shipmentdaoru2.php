<?php 
	include '../../conn/admin.php';
	function mb_unserialize($serial_str) {
		$serial_str= preg_replace('!s:(\d+):"(.*?)";!se', "'s:'.strlen('$2').':\"$2\";'", $serial_str );
		$serial_str= str_replace("\r", "", $serial_str);      
		return unserialize($serial_str);
	}
	function asc_unserialize($serial_str) {
		$serial_str = preg_replace('!s:(\d+):"(.*?)";!se', '"s:".strlen("$2").":\"$2\";"',$serial_str );
		$serial_str= str_replace("\r", "", $serial_str);      
		return unserialize($serial_str);
	}
	
	require_once 'excel/reader.php';
	$tu1="";
	$action=$_GET['action'];
	if($action=="daoru" ){
		$type1=array("xls","xlsx");
		$fid1="file1";
		function fileext($filename)  {  
			return substr(strrchr($filename, '.'), 1);  
		} 	
		if(!in_array(strtolower(fileext($_FILES[$fid1]['name'])),$type1))  {  
			$text=implode(",",$type1);  
			echo "<script>alert('您只能上传以下类型文件: ".$text."');history.go(-1);</script>";
	 	}else{
			$name1=date("YmdHis");
		 	if (move_uploaded_file($_FILES[$fid1]['tmp_name'],"Excel/".$name1.".".strtolower(fileext($_FILES[$fid1]['name'])))){ 
				$tu1="Excel/".$name1.".".strtolower(fileext($_FILES[$fid1]['name']));
		 	}else{
			 	echo "<script>alert('上传文件失败。');history.go(-1);</script>";
				die();
		 	}
	 	}
	}
	if($action=="xieru" ){		
		$data = unserialize($_POST['parems']);		
		$user_id = $_POST['user_id'];
		$user_name = $_POST['user_name'];
		$email = $_POST['email'];
		$price = $_POST['price'];
		$time_add = $_POST['time_add'];
		$status_show = $_POST['status_show'] ? explode(',' , $_POST['status_show']) : '';
		if(count($data) < 2){//1为中文，2为内容
			echo "<script>alert('上传失败，表格没有数据！');history.go(-1);</script>";die;	
		}
		if(!$user_id){
			echo "<script>alert('上传失败，没有选择员工ID列！');history.go(-1);</script>";die;
		}
		if(!$time_add){
			echo "<script>alert('上传失败，没有选择工资月份列！');history.go(-1);</script>";die;
		}
		$title_data = $data[1];
		foreach($title_data as $k=>$title){//保存第一行中文数据
			$title_arr[$k]['name'] = $title;
			$title_arr[$k]['user_id'] = $k==$user_id ? $user_id : '';
			$title_arr[$k]['user_name'] = $k==$user_name ? $user_name : '';
			$title_arr[$k]['email'] = $k==$email ? $email : '';
			$title_arr[$k]['price'] = $k==$price ? $price : '';
			$title_arr[$k]['status'] = in_array($k , $status_show) ? 1 : 0;
						
		}
		$add_time = time();
		$uid = $_SESSION['admin_info']['user_id'];
		$content = serialize($title_arr);
		$sql_title = "INSERT INTO hk_excel_title(`add_time`,`mon_time`,`content`) VALUES('{$add_time}','{$time_add}','{$content}')";//插入数据库
		$re = mysql_query($sql_title);
		$insert_id = mysql_insert_id();
		if($insert_id < 1){
			echo "<script>alert('上传失败,数据保存失败！');history.go(-1);</script>";die;
		}
		unset($data[1]);
		$str = '';
		foreach($data as $key=>$val){//保存第二行开始的数据
			if(!$val['A']){continue;}
			$v_userId = $val[$user_id] ? $val[$user_id] : '';
			$v_userName = $val[$user_name] ? $val[$user_name] : '';
			$v_email = $val[$user_id] ? $val[$user_id] : '';
			$v_phone = $val[$user_id] ? $val[$user_id] : '';
			$v_price = $val[$user_id] ? $val[$user_id] : '';
			$v_monTime = $val[$user_id] ? $val[$user_id] : '';
			$v_content = serialize($val);
			$str .= ",('{$v_userId}','{$v_userName}','{$v_email}','{$v_phone}','{$v_price}','{$uid}','{$add_time}','{$time_add}','{$insert_id}','{$v_content}')";
			
		}
		$str = substr($str , 1);
		$sql_value = "INSERT INTO hk_excel_data(`user_id`,`user_name`,`email`,`phone`,`price`,`add_uid`,`add_time`,`mon_time`,`title_id`,`content`) VALUES{$str}";//插入数据库
		$res = mysql_query($sql_value);
		$value_id = mysql_insert_id();
		if($value_id){
			echo "<script>alert('上传完成！');self.location.href='../../cfo_wages.php';</script>";die;
		}else{
			//上传失败，删除中文数据
			$sql_del = "DELETE FROM hk_excel_title WHERE id={$insert_id}";
			mysql_query($sql_del);
			echo "<script>alert('上传失败！');history.go(-1);</script>";die;
		}
	}
	define('APP_ROOT', dirname(__FILE__));     //该常量只在后台使用
	define('ROOT_PATH', dirname(APP_ROOT));   //该常量是ECCore要求的
	$file_name = APP_ROOT.'/'.$tu1;			//文件路径
	require_once ROOT_PATH.'\cfo\phpexcel\PHPExcel.php';  //引入phpExcel
    require_once ROOT_PATH.'\cfo\phpexcel\PHPExcel\IOFactory.php';
    require_once ROOT_PATH.'\cfo\phpexcel\PHPExcel\Reader/Excel5.php';
    $obj = new PHPExcel();
    $objReader = PHPExcel_IOFactory::createReader('Excel2007' ); //创建一个2007的读取对象
	$objPHPExcel = $objReader->load ($file_name ); 
	$arr = array();
	$title_arr = array();
	$value_arr = array();
    foreach ($objPHPExcel->getWorksheetIterator() as $key=>$worksheet) {     //遍历工作表
    	if($key > 0){continue;}	
	    $num = 1;      
	    foreach ($worksheet->getRowIterator() as $row) {       //遍历行
	        $cellIterator = $row->getCellIterator();   //得到所有列
	        $cellIterator->setIterateOnlyExistingCells( false); // Loop all cells, even if it is not set
	        $i = 0; 
	        $n=1;
	        foreach ($cellIterator as $cell) {  //遍历列
	            if (!is_null($cell)) {  //如果列不给空就得到它的坐标和计算的值
	                $a = PHPExcel_Cell::stringFromColumnIndex($i);
	                $index_1 = substr($cell->getCoordinate(), 1);
	                $index_2 = substr($cell->getCoordinate(), 0 , 1);
	                $arr[$num][$a] = trim($cell->getCalculatedValue());
	                if($index_1 == 1){
	                    $title_arr[$index_2] = $cell->getCalculatedValue();
	                }else{
	                    $value_arr[$index_1][$a] = $cell->getCalculatedValue();
	                }
	            }
	            $n++;
	            $i++;
	        }
	        $num++;
	    }
	}
	unlink($file_name);
	$tab = '';
	$option_title = "<option value=''>请选择...</option>";
	$list_str = "";		//工资条输出选项
	$status_show = '';		//工资条输出选项  
	foreach($arr as $ke=>$va){//表格格式显示显示
		$tab .= '<tr>';
		foreach($va as $k=>$v){
			if($ke==1){
				if(empty($v))  continue;
				$status_show .= $status_show ? ','.$k : $k;
				$list_str .= "
					<li id='item_1' class='item'>
						<span class='col-6 d-ib'>{$v}</span>
						<label  class='col-6'>
							<input type='hidden' name='ids[]' value='{$k}'/>
							<input type='checkbox' id='box-1' name='exclude[]' value='{$k}' checked  onclick='fun_click_status();'/>
						</label>
					</li>			
				";
				$option_title .= "<option value='{$k}'>{$v}</option>";
			}
			$name = $ke == 1 ? 'th' : 'td';
			$tab .= "<{$name}>{$v}</{$name}>";
		}
		$tab .= '</tr>';
	}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>上传薪资</title>
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
<!-------- body1 -------->
<section class="layui-larry-box" id="iDBody1">
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<div class="cfo-body-letir">
				<div class="cfo-title">
					<button class="layui-btn layui-btn-disabled" style="background-color:#d2d2d2;">① 上传工资条</button>
					<button class="layui-btn layui-btn-disabled">② 预览工资项</button>
				</div>
				<form id="form1" name="form1" method="post" action="?action=xieru">
					<input type='hidden' name='parems' value='<?php echo serialize($arr);?>'/>
					<input type='hidden' value='<?php echo $status_show;?>'  id='status_show' name='status_show'/>
					<div class="Upload_log mrt20">				 
						<table class="Upload_log_table"><?php echo $tab;?></table>
					</div>
					<div class="Upload_log_filter">
						<ul class="Upload_log_filter_li clearfix">
							<li>员工ID：
								<select class="sel" name="user_id" id="user_id" style="width:100px">
									<?php echo $option_title;?>
								</select>
							</li>
							<li>姓名：
								<select class="sel" name="user_name" id="user_name" style="width:100px">
									<?php echo $option_title;?>
								</select>
							</li>
							<li>邮箱：
								<select class="sel" name="email" id="email" style="width:100px">
									<?php echo $option_title;?>
								</select>
							</li>
							<li>工资：
								<select class="sel" name="price" id="price" style="width:100px">
								   <?php echo $option_title;?>
								</select>
							</li> 
							<li>工资月份：<script language="javascript" type="text/javascript" src="../../jsplug/cfo/date/WdatePicker.js"></script>
							   <input style="width:100px" class="Wdate" name="time_add" type="text" onClick="WdatePicker({dateFmt:'yyyy-M-d'})" value="---请选择---"> 
							</li>
						</ul>
					</div>
				</form>
				<div class="Upload_log_btn clearfix">
					<form name="myfrom" id="myform" method="post" action="shipmentdaoru2.php?action=daoru" enctype="multipart/form-data">
						<div class="upfilebox" style="width: 300px;">
							<input type="file" name="file1" id="file1" onchange="test()" style="width:149px;height:39px;position:absolute;z-index:10;opacity:0;left:41px;margin:25px 0;"/>
							<label class="layui-btn layui-btn-normal fldsax">重新上传</label>
						</div>
					</form>
					<a href="javascript:changeBody(2)" class="layui-btn" id="Up" >下一步</a>
				</div>
			
			</div>
		</div>
	</div>
</section>
<!-------- body2 -------->
<section class="layui-larry-box" style="display: none;" id="iDBody2">
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<div class="cfo-body-letir">
				<div class="cfo-title">
					<button class="layui-btn layui-btn-disabled">① 上传工资条</button>
					<button class="layui-btn layui-btn-disabled" style="background-color:#d2d2d2;">② 预览工资项</button>
				</div>
				<div class="setout-item set-pot">
					<h4 class="">后台工资输出项</h4>
					<div class="b">
						<div class="tab-header">
							<span class="col-6 d-ib soid">列名</span>
							<label class="col-6" for="">
								<input type='hidden' id="salary_id" name='id' value="1150" />
								<span class="v-m poid"  onclick="allSelect();" id="but_span" >是否输出</span>
							</label>
						</div>
						<div class="scroll-tab" id="gzt-plist">
							<ul class=""><?php echo $list_str;?></ul>
						</div>
					</div>
				</div>
				<div class="set-out">
					<h4>前台工资显示项</h4>
					<div class="b mail-box setout-item">
						<div class="p-l p-r b-b bg-w">
							<span class="v-m pustd">列名</span>
							<span class="v-m sdmop">输出内容</span>
							<input type="hidden" id="detail_id" value="22150">
						</div>
						<div class="p check" id="right_list">
							<ul class="lmz">
								<?php
								foreach ($arr[1] as $k=>$v)
									if(isset($v)){
										if(empty($v))  continue;
											$i = $k;
										echo "<li class='plist_$k'><b class='bg-m2 v-m'></b><span class='v-m' ></span>$v</li>";
									}	
								?>	
							</ul>
							<ul class="bmz">
								<?php  
								foreach ($arr[2] as $k=>$v){
									echo "<li class='plist_$k'><span class='v-m' ></span>$v</li>";
										if($i == $k){break;}
								}
											
								?>	
							</ul>
							<div style="clear:both;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="btn-group " id="submit-btn" style="width: 850px;">
				<a href="javascript:changeBody(1)" class="btn lg w-200 pre-view layui-btn layui-btn-normal" style="float: left;width:150px;border-top-right-radius: 2px; border-bottom-right-radius: 2px;"><i class="icon-eye"></i>上一步</a>
				<button class="send-to btn lg w-200 layui-btn" type="button" onclick="CheckForm();return false;" style="float: right;width:150px;border-top-left-radius: 2px; border-bottom-left-radius: 2px;">
					<i class="icon-paper-plane"></i>发送工资条
				</button>
			</div>
        </div>
	</div>
</section>
	<script src="../../jsplug/cfo/jquery.artDialog.js?skin=default1"></script>
	<script src="../../jsplug/cfo/plugins/iframeTools.source.js"></script>
	<script src="../../jsplug/cfo/Dialog.js"></script>
	<script type="text/javascript">
	
	function CheckForm() { //检查输入信息
		var user_id = $('#user_id').val();
		var email = $('#email').val();
		var phone = $('#phone').val();
		var price = $('#price').val();
		var user_name = $('#user_name').val();
		var time_add = $('#time_add').val();
		if (user_id == '') {
			alert('请选择员工ID列...');
			return false;
		}
		if (user_name == '') {
			alert('请选择姓名列...');
			return false;
		}
		if (email == '') {
			alert('请选择邮箱列...');
			return false;
		}
		if (price == '') {
			alert('请选择工资列...');
			return false;
		}
		if (time_add == '') {
			alert('请选择工资月份列...');
			return false;
		}
		document.form1.submit();
	}
	function test(){
		document.getElementById("myform").submit();
	}
	
	function changeBody(index){
		switch(index){
			case 1:{
				document.getElementById('iDBody1').style.display = "";
				document.getElementById('iDBody2').style.display = "none";
				break;
			}
			case 2:{
				document.getElementById('iDBody1').style.display = "none";
				document.getElementById('iDBody2').style.display = "";
				break;
			}
		}
	}
	
	function allSelect() {	//全选，全不选	
		if($('#gzt-plist input:checked').length==0){
			$("#right_list li").css('display','');
		}else{
			$("#right_list li").css('display','none');						
		}
		if ($(":checkbox").attr("checked") != "checked") {
			$(":checkbox").attr("checked", "checked");
        }else{
            $(":checkbox").removeAttr("checked");
        }
		fun_click_status();
	}

	$(function (){
		$(":checkbox").click(function(){
			if($(this).attr('checked')=='checked')
			$(".plist_"+$(this).val()).css('display','');
			else
			$(".plist_"+$(this).val()).css('display','none');
		})
						
	})
	
	function fun_click_status(){//工资条输出选项
		var list_show = '';
		$(":checkbox").each(function(){
			if ($(this).is(':checked')) {
				var va = $(this).val();
				if(va != ''){
					list_show += list_show ? ','+va : va;
				}				
			}

		});
		$('#status_show').val(list_show);
	}
	</script>

</body>
<?php mysql_close($con);?>
</html>


