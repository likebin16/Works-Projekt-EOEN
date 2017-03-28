set charset utf8;
CREATE TABLE `hk_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(4) NOT NULL COMMENT '工号',
  `depa` int(4) NOT NULL COMMENT '部门',
  `name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  `pawd` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `times` datetime NOT NULL COMMENT '时间',
  `flags` text CHARACTER SET utf8 NOT NULL COMMENT '权限',
  `state` int(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('1','9001','9001','杨震南','e10adc3949ba59abbe56e057f20f883e','2017-02-27 09:26:51','1000,2000,3000,4000,5000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('2','9002','9000','周冠武','7b912a98bb5759da8b352c07f8df88c2','2017-02-27 10:04:20','1000,4000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('3','9003','9000','陆祥林','7b912a98bb5759da8b352c07f8df88c2','2017-02-27 11:13:01','1000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('4','5001','1000','邓以秋','a24d7346db70aa84df8f6ee2c1e763e9','2017-02-27 11:10:07','6000','1');
CREATE TABLE `hk_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stoid` varchar(32) NOT NULL COMMENT '库存编码',
  `stonm` varchar(64) NOT NULL COMMENT '入库名称',
  `stosl` int(32) NOT NULL COMMENT '入库数量',
  `stokc` int(32) NOT NULL COMMENT '库存数量',
  `stock` int(32) NOT NULL COMMENT '出库数量',
  `stobf` int(32) NOT NULL COMMENT '报废数量',
  `stoad` varchar(64) NOT NULL COMMENT '存放地点',
  `stote` varchar(32) NOT NULL COMMENT '资产状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('1','HK201702276873','虚拟机','100','99','1','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('3','HK201702279717','显示器','100','100','0','0','测试','0');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('4','HK201702271460','鼠标键盘','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('5','HK201702271531','工作手机','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('6','HK201702279772','手机号码','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('7','HK201702276441','体重秤','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('8','HK201702275180','食物称','100','100','0','0','测试','1');
CREATE TABLE `hk_assig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auid` int(4) NOT NULL COMMENT '申请人',
  `adpa` varchar(32) NOT NULL COMMENT '申请部门',
  `assid` text NOT NULL COMMENT '资产ID',
  `asped` int(4) NOT NULL COMMENT '是否加急',
  `anote` varchar(64) NOT NULL COMMENT '申请备注',
  `atime` datetime NOT NULL COMMENT '申请时间',
  `astat` int(4) NOT NULL COMMENT '申请状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`anote`,`atime`,`astat`) values('1','9001','IT部','HK201702276441,HK201702275180','1','测试 13800138000','2017-02-27 11:06:34','10');
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`anote`,`atime`,`astat`) values('2','1055','销售一部','HK201702276441,HK201702275180','1','122324','2017-02-27 11:17:47','10');
CREATE TABLE `hk_asslist` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `zid` varchar(32) NOT NULL COMMENT '资产ID',
  `name` varchar(32) NOT NULL COMMENT '资产名称',
  `depa` varchar(32) NOT NULL COMMENT '登记部门',
  `user` varchar(32) NOT NULL COMMENT '使用人员',
  `time` datetime NOT NULL COMMENT '登记日期',
  `note` text NOT NULL COMMENT '资产备注',
  `state` int(4) NOT NULL COMMENT '资产状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('1','JJS201702228501','HK201702209434','1004','1002','2017-02-22 19:51:46','123456
123456','10');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('2','JJS201702223361','HK201702209434','1004','1002','2017-02-22 20:00:18','123456
123456','5');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('3','JJS201702229265','HK201702214047','1004','1002','2017-02-22 21:07:00','哈哈哈<br />嘎嘎嘎<br />急啊回家啊哈','0');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('4','JJS201702232428','HK201702227189','1001','1002','2017-02-23 11:07:31','213213','0');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('5','JJS201702275763','HK201702276873','1000','1055','2017-02-27 11:23:05','123','10');
CREATE TABLE `hk_depas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(4) NOT NULL COMMENT '部门排序',
  `did` varchar(4) NOT NULL COMMENT '部门ID',
  `sid` varchar(4) NOT NULL COMMENT '上级部门',
  `name` varchar(64) NOT NULL COMMENT '部门名称',
  `state` int(11) NOT NULL COMMENT '部门状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=gbk;
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('1','1','1000','','销售一部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('2','2','1001','1000','销售一部一组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('3','3','1002','1000','销售一部二组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('4','4','1003','1000','销售一部三组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('5','5','1004','1000','销售一部四组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('7','7','2000','','销售二部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('8','8','2001','2000','销售二部一组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('9','9','2002','2000','销售二部二组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('10','10','2003','2000','销售二部三组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('11','11','2004','2000','销售二部四组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('12','12','2005','2000','销售二部五组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('13','13','3000','','销售三部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('14','14','3001','3000','销售三部一组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('15','15','3002','3000','销售三部二组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('16','16','3003','3000','销售三部三组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('17','17','3004','3000','销售三部四组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('18','18','4000','','销售四部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('19','19','4001','4000','销售四部一组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('20','20','4002','4000','销售四部二组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('21','21','4003','4000','销售四部三组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('22','22','4004','4000','销售四部四组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('23','23','4005','4000','销售四部五组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('24','24','5000','','销售五部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('25','25','5001','5000','销售五部一组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('26','26','6000','','营养部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('27','27','6001','6000','营养师一组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('28','28','6002','6000','营养师二组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('29','29','6003','6000','营养师三组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('30','30','6004','6000','营养师四组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('31','31','6005','6000','营养师五组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('32','32','9000','','后勤部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('33','32','9001','9000','IT部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('34','33','9002','9000','财务部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('35','34','9003','9000','人事部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('36','35','9004','9000','客服部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('37','36','9005','9000','行政部','1');
CREATE TABLE `hk_excel_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '员工ID',
  `user_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `price` decimal(10,2) DEFAULT NULL COMMENT '工资',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `mon_time` varchar(20) DEFAULT NULL COMMENT '工资月份',
  `title_id` int(11) DEFAULT NULL COMMENT '对应中文说明的id',
  `add_uid` int(11) DEFAULT NULL COMMENT '创建人',
  `content` text,
  `remark` text COMMENT '用户留言',
  `msg_time` int(11) DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
CREATE TABLE `hk_excel_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `mon_time` varchar(20) DEFAULT NULL COMMENT '月份',
  `content` text COMMENT '中文内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;
CREATE TABLE `hk_sqlbk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '名字',
  `time` datetime NOT NULL COMMENT '时间',
  `data` varchar(32) NOT NULL COMMENT '大小',
  `user` varchar(32) NOT NULL COMMENT '操作员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=gbk;
insert into `hk_sqlbk`(`id`,`name`,`time`,`data`,`user`) values('22','HK-201702271124.sql','2017-02-27 11:24:25','28.9KB','');
insert into `hk_sqlbk`(`id`,`name`,`time`,`data`,`user`) values('20','HK-201702171006.sql','2017-02-17 10:06:52','7.9KB','杨震南');
insert into `hk_sqlbk`(`id`,`name`,`time`,`data`,`user`) values('21','HK-201702171009.sql','2017-02-17 10:09:06','8.0KB','杨震南');
CREATE TABLE `hk_sudo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT '管理组ID',
  `name` varchar(32) NOT NULL COMMENT '管理组名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;
insert into `hk_sudo`(`id`,`sid`,`name`) values('1','1000','人事管理');
insert into `hk_sudo`(`id`,`sid`,`name`) values('2','2000','部门管理');
insert into `hk_sudo`(`id`,`sid`,`name`) values('3','3000','财务管理');
insert into `hk_sudo`(`id`,`sid`,`name`) values('4','4000','资产管理');
insert into `hk_sudo`(`id`,`sid`,`name`) values('5','5000','后台管理');
insert into `hk_sudo`(`id`,`sid`,`name`) values('6','6000','最高管理');
CREATE TABLE `hk_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(4) NOT NULL COMMENT '工号',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `depa` varchar(32) NOT NULL COMMENT '部门',
  `phone` varchar(11) NOT NULL COMMENT '手机',
  `wechat` varchar(32) NOT NULL COMMENT '微信',
  `qq` varchar(32) NOT NULL COMMENT 'QQ',
  `state` int(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=gbk;
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('1','9001','杨震南','f379eaf3c831b04de153469d1bec345e','男','9001','15999955508','totorohost','1172007555','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('2','9002','周冠武','7b912a98bb5759da8b352c07f8df88c2','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('3','9003','陆祥林','7b912a98bb5759da8b352c07f8df88c2','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('4','5001','邓以秋','7b912a98bb5759da8b352c07f8df88c2','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('5','1001','黄丽娜','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('6','1055','利百加','7b912a98bb5759da8b352c07f8df88c2','女','1000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('7','1007','张爱珍','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('8','1076','赵谦','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('9','1084','陈颖','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('10','1085','温清','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('11','1086','卢宝艺','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('12','1006','谢碧云','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('13','1050','张华','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('14','1035','李铭','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('15','1003','包铮铮','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('16','1037','丘冠华','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('17','1058','李增辉','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('18','1049','陈欢','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('19','1043','苏灵灵','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('20','1005','黄智玉','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('21','1053','余尚力','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('22','1034','曾雪梅','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('23','1056','苏健','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('24','1057','肖勇红','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('25','1015','徐强','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('26','1028','王华兵','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('27','1038','覃爱玲','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('28','1039','王健康','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('29','1054','许敏','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('30','1069','林凯忠','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('31','1080','庄琳玲','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('32','1082','钟森强','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('33','1088','黄飞任','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('34','1048','陈欢2','7b912a98bb5759da8b352c07f8df88c2','男','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('35','1021','韦升昂','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('36','1052','廖小玲','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('37','1071','廖基诚','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('38','1089','张捷','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('39','1087','罗美香','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('40','1017','甘文君','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('41','1024','李秀芳','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('42','1020','黎福金','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('43','1025','陈凤英','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('44','1072','黄圆忠','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('45','1004','曹丽娟','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('46','1019','潘林峰','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('47','1040','杜永语','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('48','1045','王多亮','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('49','1018','姚晓曼','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('50','1075','杨亚楠','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('51','1009','王茂宇','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('52','1026','钟兰燕','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('53','1010','曾敏','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('54','1014','王传勇','7b912a98bb5759da8b352c07f8df88c2','男','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('55','1011','李华容','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('56','1044','姚雪珍','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('57','1064','邓杨欣','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('58','1073','杨铃','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('59','1079','吴春华','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('60','1008','彭志成','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('61','1065','李良正','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('62','1068','潘庆东','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('63','1083','钟尚城','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('64','1090','甘文彬','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('65','1027','曾秀芳','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('66','1031','郭晓凤','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('67','1030','徐小美','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('68','1032','廖士雄','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('69','1029','谢辉','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('70','1041','杨伟明','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('71','1046','李丹凤','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('72','1002','陈媛媛','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('73','1033','刘媛','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('74','1078','李小辉','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('75','1047','刘春献','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('76','1081','郑伟','7b912a98bb5759da8b352c07f8df88c2','男','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('77','1023','黄继强','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('78','1051','邓海亮','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('79','1059','朱鹏程','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('80','1062','李幕','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('81','1063','颜文达','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('82','1067','梁雄达','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('83','1060','王多伟','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('84','1061','罗丹','7b912a98bb5759da8b352c07f8df88c2','女','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('85','1070','刘浩','7b912a98bb5759da8b352c07f8df88c2','男','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('86','1077','谭素青','7b912a98bb5759da8b352c07f8df88c2','女','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('87','1091','陈雯雯','7b912a98bb5759da8b352c07f8df88c2','女','1004','','','','1');
