<?php //作业：敲三遍。数据库类
header('content-type:text/html;charset=utf-8;');
error_reporting(0);
@session_start();

class DB{
	public $dbHost;
	public $userName;
	public $userPwd;
	public $dbName;
	public $links;
	function __construct($dh, $us, $up, $dbn){//连接库
		$this->dbHost = $dh;
		$this->userName = $us;
		$this->userPwd = $up;
		$this->dbName = $dbn;
		$this->links = mysql_connect($this->dbHost, $this->userName, $this->userPwd);
		mysql_select_db($this->dbName);
		mysql_query('set names utf8');
	}
	function query($sql){//执行sql语句
		return mysql_query($sql);
	}
	function count($sql){//得到总记录数
		$num = $this->query($sql);
		return mysql_num_rows($num);
	}
	function affectedRows(){//执行sql语句时，受影响的记录条数
		return mysql_affected_rows();
	}
	function getOne($sql){//得到一条记录，并已关联数组返回
		$re = $this->query($sql);
		return mysql_fetch_assoc($re);
	}
	function getAll($sql){//得到多条记录，并已关联数组返回
		$row = $this->query($sql);
		
		while($re = mysql_fetch_assoc($row))
		{
			$arr[] = $re;
		}
		return @$arr;
	}
	
	function __destruct(){
		$this->dbHost = NULL;
		$this->userName = NULL;
		$this->userPwd = NULL;
		$this->dbName = NULL;
		$this->links = NULL;
		mysql_close();
	}
	
}
$db = new DB("localhost","root","QVnVRRnJZX4CJwcC","xiezuo");














