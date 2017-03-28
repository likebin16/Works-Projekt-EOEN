<?php
session_start();

$action = $_GET['act'];
$code = trim($_POST['code']);
if($action=='gg'){
	if(strtolower($code)==$_SESSION["code_gg"]){
       echo '1';
    }
}else{

}

//处理接收中文字符串
function uniDecode($str, $charcode) {
	$text = preg_replace_callback("/%u[0-9A-Za-z]{4}/", toUtf8, $str);
	return mb_convert_encoding($text, $charcode, 'utf-8');
}
function toUtf8($ar) {
	foreach ($ar as $val) {
		$val = intval(substr($val, 2), 16);
		if ($val < 0x7F) { // 0000-007F
			$c .= chr($val);
		}
		elseif ($val < 0x800) { // 0080-0800
			$c .= chr(0xC0 | ($val / 64));
			$c .= chr(0x80 | ($val % 64));
		} else { // 0800-FFFF
			$c .= chr(0xE0 | (($val / 64) / 64));
			$c .= chr(0x80 | (($val / 64) % 64));
			$c .= chr(0x80 | ($val % 64));
		}
	}
	return $c;
}
?>
