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
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('1','9001','1004','杨震南','e10adc3949ba59abbe56e057f20f883e','2017-02-27 19:21:49','1000,2000,3000,4000,5000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('2','9002','9000','周冠武','7b912a98bb5759da8b352c07f8df88c2','2017-02-27 10:04:20','1000,4000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('3','9003','9000','陆祥林','7b912a98bb5759da8b352c07f8df88c2','2017-02-27 17:30:00','1000','1');
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('1','HK201702276873','虚拟机','100','98','2','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('3','HK201702279717','显示器','100','100','0','0','测试','0');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('4','HK201702271460','鼠标键盘','100','99','1','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('5','HK201702271531','工作手机','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('6','HK201702279772','手机号码','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('7','HK201702276441','体重秤','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('8','HK201702275180','食物称','100','100','0','0','测试','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('9','HK20170224544477757','f','1000','1000','0','0','ed','1');
CREATE TABLE `hk_assig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auid` int(4) NOT NULL COMMENT '申请人',
  `adpa` varchar(32) NOT NULL COMMENT '申请部门',
  `assid` text NOT NULL COMMENT '资产ID',
  `asped` int(4) NOT NULL COMMENT '是否加急',
  `ascfo` int(4) NOT NULL COMMENT '财务审批',
  `anote` varchar(64) NOT NULL COMMENT '申请备注',
  `atime` datetime NOT NULL COMMENT '申请时间',
  `astat` int(4) NOT NULL COMMENT '申请状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('4','5001','IT部','HK201702276873,HK201702271460,HK201702271531','0','0','','2017-02-27 11:48:03','5');
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('3','9001','IT部','HK201702276441,HK201702275180','1','10','123456','2017-02-27 11:39:04','10');
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('5','1055','销售一部','HK201702276441,HK201702275180','0','1','','2017-02-27 12:13:37','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('1','JJS201702228501','HK201702209434','1004','1002','2017-02-22 19:51:46','123456
123456','10');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('2','JJS201702223361','HK201702209434','1004','1002','2017-02-22 20:00:18','123456
123456','5');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('3','JJS201702229265','HK201702214047','1004','1002','2017-02-22 21:07:00','哈哈哈<br />嘎嘎嘎<br />急啊回家啊哈','5');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('4','JJS201702232428','HK201702227189','1001','1002','2017-02-23 11:07:31','213213','5');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('5','JJS201702275763','HK201702276873','1000','1055','2017-02-27 11:23:05','123','10');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('6','JJS201702276160','HK201702271460','1002','5001','2017-02-27 12:24:35','测试','10');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('7','JJS201702275128','HK201702276873','9001','9001','2017-02-27 15:27:40','123<br />
','10');
CREATE TABLE `hk_depas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(4) NOT NULL COMMENT '部门排序',
  `did` varchar(4) NOT NULL COMMENT '部门ID',
  `sid` varchar(4) NOT NULL COMMENT '上级部门',
  `name` varchar(64) NOT NULL COMMENT '部门名称',
  `state` int(11) NOT NULL COMMENT '部门状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=gbk;
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
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('13','13','3000','3000','销售三部','1');
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
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('38','18','3005','3000','三部五组','1');
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=gbk;
insert into `hk_sqlbk`(`id`,`name`,`time`,`data`,`user`) values('23','HK-201702271126.sql','2017-02-27 11:26:37','29.0KB','杨震南');
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
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=gbk;
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('1','9001','杨震南','f379eaf3c831b04de153469d1bec345e','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('2','9002','周冠武','7b912a98bb5759da8b352c07f8df88c2','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('3','9003','陆祥林','7b912a98bb5759da8b352c07f8df88c2','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('4','5001','邓以秋','7b912a98bb5759da8b352c07f8df88c2','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('5','1001','黄丽娜','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360820265','tzglsh','1982477732','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('6','1055','利百加','7b912a98bb5759da8b352c07f8df88c2','女','1000','18028070108','JJS2418769400','2418769400','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('7','1007','张爱珍','7b912a98bb5759da8b352c07f8df88c2','女','1001','15322321165','Slmndaq','1587474312','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('8','1076','赵谦','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322366007','jjs262','2628023103','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('9','1084','陈颖','7b912a98bb5759da8b352c07f8df88c2','女','1001','15361251572','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('10','1085','温清','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360593936','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('11','1086','卢宣艺','7b912a98bb5759da8b352c07f8df88c2','女','1001','15322081761','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('12','1006','谢碧云','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('13','1050','张华','7b912a98bb5759da8b352c07f8df88c2','男','1001','18028055570','jjszhanghua','2851203700','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('14','1035','李铭','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322099917','Jujiashou123','2608666315','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('15','1003','包铮铮','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360535673','523942512','523942512','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('16','1037','丘冠华','7b912a98bb5759da8b352c07f8df88c2','男','1001','15302468060','15302468060','1835006538','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('17','1058','李增辉','7b912a98bb5759da8b352c07f8df88c2','男','1001','18028583583','jujiashou_lzh','1835759528','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('18','1049','陈欢','7b912a98bb5759da8b352c07f8df88c2','女','1001','15361291189','jujiashou613','2851203900','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('19','1043','苏灵灵','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360893575','jvjiashousyk','1633035607','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('20','1005','黄智玉','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360678017','zhiyuk888','2192900640','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('21','1053','余尚力','7b912a98bb5759da8b352c07f8df88c2','男','1001','15360596117','jjsyushangli','1471896241','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('22','1034','曾雪梅','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360561256','tomeimei11','2635055711','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('23','1056','苏健','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322293738','jujiashou-sujian','951599472','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('24','1057','肖勇红','7b912a98bb5759da8b352c07f8df88c2','女','1001','15374022067','jujiashouxiao','2390207822','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('25','1015','徐强','7b912a98bb5759da8b352c07f8df88c2','男','1001','15360081219','xuqiang8730','2570002045','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('26','1028','王华兵','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322258335','jujias918','2503110370','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('27','1038','覃爱玲','7b912a98bb5759da8b352c07f8df88c2','女','1001','17728046473','jjsaling','2491106643','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('28','1039','王健康','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322301859','jjs1314kk','960759357','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('29','1054','许敏','7b912a98bb5759da8b352c07f8df88c2','女','1001','15374011192','2569041245','2569041245','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('30','1069','林凯忠','7b912a98bb5759da8b352c07f8df88c2','男','1001','18026258515','jjs2517424162','2517424162','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('31','1080','庄琳玲','7b912a98bb5759da8b352c07f8df88c2','女','1001','15323312385','jjs2508627244','2788075766','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('32','1082','钟森强','7b912a98bb5759da8b352c07f8df88c2','男','1001','15323385076','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('33','1088','黄飞任','7b912a98bb5759da8b352c07f8df88c2','男','1001','15360533583','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('34','1048','陈欢2','7b912a98bb5759da8b352c07f8df88c2','女','1001','15302386201','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('35','1021','韦升昂','7b912a98bb5759da8b352c07f8df88c2','男','1002','15360528271','food_beauty','2034778859','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('36','1052','廖小玲','7b912a98bb5759da8b352c07f8df88c2','女','1002','15384487112','jjs2851204275','1586903759','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('37','1071','廖基诚','7b912a98bb5759da8b352c07f8df88c2','男','1002','15361272258','jjszh888','1453471823','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('38','1089','张捷','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('39','1087','罗美香','7b912a98bb5759da8b352c07f8df88c2','女','1002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('40','1017','甘文君','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360899286','try-something-new','2425455392','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('41','1024','李秀芳','7b912a98bb5759da8b352c07f8df88c2','女','1002','18122417708','a15360027396','790065119','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('42','1020','黎福金','7b912a98bb5759da8b352c07f8df88c2','男','1002','15323332559','jjs1574780898','1574780898','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('43','1025','陈凤英','7b912a98bb5759da8b352c07f8df88c2','女','1002','15323371577','jjs17727639952','2624037338','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('44','1072','黄圆忠','7b912a98bb5759da8b352c07f8df88c2','男','1002','15322285033','hyz1486296376','1486296376','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('45','1004','曹丽娟','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360816918','jjsclj516','2667183027','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('46','1019','潘林峰','7b912a98bb5759da8b352c07f8df88c2','男','1002','15322320281','lq904266545','904266546','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('47','1040','杜永语','7b912a98bb5759da8b352c07f8df88c2','男','1002','15302209896','jjs2627414926','2627414926','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('48','1045','王多亮','7b912a98bb5759da8b352c07f8df88c2','男','1002','18011793866','jujiashoukuanglaoshi','1578571923','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('49','1018','姚晓曼','7b912a98bb5759da8b352c07f8df88c2','女','1002','15322246395','QQ1934027166','1934027166','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('50','1075','杨亚楠','7b912a98bb5759da8b352c07f8df88c2','女','1002','15322287338','jjs1486593951','1486593951','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('51','1009','王茂宇','7b912a98bb5759da8b352c07f8df88c2','女','1002','15338052530','wxid_jjs52530','2416463344','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('52','1026','钟兰燕','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360419269','jujiashou2622156923','2622156923','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('53','1010','曾敏','7b912a98bb5759da8b352c07f8df88c2','女','1002','15322057813','jjs15322057813','2460261339','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('54','1014','王传勇','7b912a98bb5759da8b352c07f8df88c2','男','1002','15361771691','jujiashou520','2282920197','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('55','1011','李华容','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360528031','mybeauty-365','2518880568','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('56','1044','姚雪珍','7b912a98bb5759da8b352c07f8df88c2','女','1002','18011950356','yao18011950356','2844088273','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('57','1064','邓杨欣','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360076459','jujiashouzhangyongyi','2490866066','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('58','1073','杨铃','7b912a98bb5759da8b352c07f8df88c2','女','1002','18011797512','yl3274839264','3274839264','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('59','1079','吴春华','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360411590','jujiashou1079','3238798787','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('60','1008','彭志成','7b912a98bb5759da8b352c07f8df88c2','男','1003','15338088595','Jjs2642127771','2642127771','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('61','1065','李良正','7b912a98bb5759da8b352c07f8df88c2','男','1003','15384435619','jjs66188','2491872225','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('62','1068','潘庆东','7b912a98bb5759da8b352c07f8df88c2','男','1003','15360446367','JJSPLS','928254990','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('63','1083','钟尚城','7b912a98bb5759da8b352c07f8df88c2','男','1003','15322057867','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('64','1090','甘文彬','7b912a98bb5759da8b352c07f8df88c2','男','1003','15338069183','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('65','1027','曾秀芳','7b912a98bb5759da8b352c07f8df88c2','女','1003','15338095240','jujiashou516','2583919156','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('66','1031','郭晓凤','7b912a98bb5759da8b352c07f8df88c2','女','1003','15302227661','gzjujiashou','2544359573','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('67','1030','徐小美','7b912a98bb5759da8b352c07f8df88c2','女','1003','18122406869','LOVINGYOU605547445','2736852199','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('68','1032','廖士雄','7b912a98bb5759da8b352c07f8df88c2','男','1003','18027121361','jujiashou2260341370','2260341370','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('69','1029','谢辉','7b912a98bb5759da8b352c07f8df88c2','男','1003','15360406067','lms199304','2493040490','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('70','1041','杨伟明','7b912a98bb5759da8b352c07f8df88c2','男','1003','15322259311','jujiashou201314','956888246','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('71','1046','李丹凤','7b912a98bb5759da8b352c07f8df88c2','女','1003','15302372902','jujiashou610','2494336749','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('72','1002','陈媛媛','7b912a98bb5759da8b352c07f8df88c2','女','1003','18145707675','langcola','1517749773','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('73','1033','刘媛','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('74','1078','李小辉','7b912a98bb5759da8b352c07f8df88c2','男','1003','15360670265','jujias1078','760126540','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('75','1047','刘春献','7b912a98bb5759da8b352c07f8df88c2','女','1003','15360546806','jujias6162','2499496544','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('76','1081','郑伟','7b912a98bb5759da8b352c07f8df88c2','男','1003','15361788213','jjszw1990','2490021962','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('77','1023','黄继强','7b912a98bb5759da8b352c07f8df88c2','男','1004','15360407957','1140450342','1140450342','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('78','1051','邓海亮','7b912a98bb5759da8b352c07f8df88c2','男','1004','15360683719','jujias8888','1508882496','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('79','1059','朱鹏程','7b912a98bb5759da8b352c07f8df88c2','男','1004','15323322191','jujiashouzhulaoshi','2974555012','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('80','1062','李幕','7b912a98bb5759da8b352c07f8df88c2','男','1004','18028607399','jujiashou666','2627305239','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('81','1063','颜文达','7b912a98bb5759da8b352c07f8df88c2','男','1004','18142882393','fshmywd198979','2945443755','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('82','1067','梁雄达','7b912a98bb5759da8b352c07f8df88c2','男','1004','18122450332','jujiashouliang','2627326604','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('83','1060','王多伟','7b912a98bb5759da8b352c07f8df88c2','男','1004','15360437506','jjs15360437506','3014253329','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('84','1061','罗丹','7b912a98bb5759da8b352c07f8df88c2','男','1004','18011957506','jujiashou525','2627437454','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('85','1070','刘浩','7b912a98bb5759da8b352c07f8df88c2','男','1004','18011751928','qq194487064','194487064','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('86','1077','谭素青','7b912a98bb5759da8b352c07f8df88c2','女','1004','18027251737','jujias18027251737','1330352085','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('87','1091','陈雯雯','7b912a98bb5759da8b352c07f8df88c2','女','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('89','1013','梁翠兰','7b912a98bb5759da8b352c07f8df88c2','女','2000','15361779539','Shou520516','2438292662','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('90','2006','陈跃阳','7b912a98bb5759da8b352c07f8df88c2','男','2001','15323327322','jujias1311184026','1311184026','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('91','2011','陈伟科','7b912a98bb5759da8b352c07f8df88c2','男','2001','15322321756','jjs2350110497','2350110497','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('92','2009','彭裕新','7b912a98bb5759da8b352c07f8df88c2','男','2001','15338077433','jujias-516','1753522081','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('93','2010','吴玉华','7b912a98bb5759da8b352c07f8df88c2','男','2001','15302240190','jujias2242091395','2242091395','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('94','2014','梁维锦','7b912a98bb5759da8b352c07f8df88c2','男','2001','18928796007','w18928796007','2669827379','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('95','2025','吴泽光','7b912a98bb5759da8b352c07f8df88c2','男','2001','15322246231','jjswzg','1220974072','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('96','2030','黄海婷','7b912a98bb5759da8b352c07f8df88c2','女','2001','18011952807','jjs2682295788','2682295788','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('97','2035','曾敏贤','7b912a98bb5759da8b352c07f8df88c2','男','2001','15322301150','zengjujiashou','2362509960','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('98','2048','苏秀丽','7b912a98bb5759da8b352c07f8df88c2','女','2001','18011792228','han484007','2355389460','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('99','2068','周月春','7b912a98bb5759da8b352c07f8df88c2','男','2001','18011793997','jujias518518','2851203871','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('100','2052','武健南','7b912a98bb5759da8b352c07f8df88c2','男','2001','15322073762','a15322073762','2355389463','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('101','2005','袁冲','7b912a98bb5759da8b352c07f8df88c2','男','2002','18011802661','jjs824008139','824008139','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('102','2002','何志锋','7b912a98bb5759da8b352c07f8df88c2','男','2002','18028586580','hezhifeng1789654','1419838993','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('103','2026','易方河','7b912a98bb5759da8b352c07f8df88c2','男','2002','18011732308','jjs2026','1378575520','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('104','2076','李英杰','7b912a98bb5759da8b352c07f8df88c2','男','2002','15322253132','jujiashou2076','2853792833','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('105','2067','何博根','7b912a98bb5759da8b352c07f8df88c2','男','2002','15360090156','jjs2067','2851203728','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('106','2007','向林','7b912a98bb5759da8b352c07f8df88c2','男','2002','18011732358','jujias97606664','97606664','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('107','2075','秦忠红','7b912a98bb5759da8b352c07f8df88c2','男','2002','15360632797','JuJiaShou516520','2853792830','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('108','2015','叶志强','7b912a98bb5759da8b352c07f8df88c2','男','2002','18011955997','jjs1398131809','1398131809','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('109','2041','柯兆城','7b912a98bb5759da8b352c07f8df88c2','男','2002','15374031795','jjskls','2853792831','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('110','2008','李欢欢','7b912a98bb5759da8b352c07f8df88c2','女','2002','15322062519','linjing621622','1912956660','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('111','2018','陈枫','7b912a98bb5759da8b352c07f8df88c2','男','2002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('112','2072','蔡吉冰','7b912a98bb5759da8b352c07f8df88c2','女','2002','15322383910','jujiashou2072','2853792832','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('113','2019','武暖华','7b912a98bb5759da8b352c07f8df88c2','男','2002','15338062640','lsk2516970080','2516970080','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('114','2040','何利东','7b912a98bb5759da8b352c07f8df88c2','男','2002','15338098582','jujias15322368700','2853792790','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('115','2038','叶超均','7b912a98bb5759da8b352c07f8df88c2','男','2002','15302252319','jjsye24','2850594796','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('116','2001','谭小红','7b912a98bb5759da8b352c07f8df88c2','男','2003','18011740368','jujias518','346223120','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('117','2077','曾丽华','7b912a98bb5759da8b352c07f8df88c2','女','2003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('118','2017','向寒虎','7b912a98bb5759da8b352c07f8df88c2','男','2003','15322243621','xhh91581314','2498883522','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('119','2060','郞杰','7b912a98bb5759da8b352c07f8df88c2','男','2003','15302488667','L43678082','43678082','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('120','2013','袁国健','7b912a98bb5759da8b352c07f8df88c2','男','2003','15323371228','lamajujiashou','2228504804','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('121','2061','李锦升','7b912a98bb5759da8b352c07f8df88c2','男','2003','15302489223','jjs-ljs','2823298514','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('122','2028','黄思敏','7b912a98bb5759da8b352c07f8df88c2','女','2003','18122467122','jujiashou-hu','2817630768','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('123','2071','宋超洪','7b912a98bb5759da8b352c07f8df88c2','男','2003','15322015122','jujiashou2071','2851203943','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('124','2020','邓学婵','7b912a98bb5759da8b352c07f8df88c2','女','2003','18102624891','jujiashous','1538880649','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('125','2065','曾国辉','7b912a98bb5759da8b352c07f8df88c2','男','2003','18011732663','Z2322112965','2322112965','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('126','2045','谭富盛','7b912a98bb5759da8b352c07f8df88c2','男','2003','15302470365','Jujiashoutam','2850594859','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('127','2027','郑丽爱','7b912a98bb5759da8b352c07f8df88c2','女','2003','18142838327','jujiashoulaoshi','2810902607','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('128','2047','秦佳铭','7b912a98bb5759da8b352c07f8df88c2','女','2003','15322365917','zhf199210102211','2851203552','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('129','2049','张贝贝','7b912a98bb5759da8b352c07f8df88c2','女','2003','15338076758','Jujiashou7026','2377153688','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('130','2073','朋亚枫','7b912a98bb5759da8b352c07f8df88c2','女','2003','15302255538','jjs52001','2851203504','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('131','2039','梁樱桃','7b912a98bb5759da8b352c07f8df88c2','女','2003','15360543376','2851203536','2851203536','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('132','2003','林木球','7b912a98bb5759da8b352c07f8df88c2','男','2004','13392620939','Jujiashou13392620939','1146351346','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('133','2054','卢朝山','7b912a98bb5759da8b352c07f8df88c2','男','2004','15302225012','jjs2054','2853792823','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('134','2023','林伴','7b912a98bb5759da8b352c07f8df88c2','男','2004','18124246395','mengxin-951572898','2648447442','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('135','2022','陈月松','7b912a98bb5759da8b352c07f8df88c2','男','2004','18122437244','jjs18122437244','2335534076','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('136','2036','曾才全','7b912a98bb5759da8b352c07f8df88c2','男','2004','15322011077','zeng2289486887','2289486887','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('137','2029','谭建红','7b912a98bb5759da8b352c07f8df88c2','男','2004','15360592106','15360592106','2298982968','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('138','2032','苏志斌','7b912a98bb5759da8b352c07f8df88c2','男','2004','18122410765','QQ1991470437','1991470437','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('139','2059','庄桂鑫','7b912a98bb5759da8b352c07f8df88c2','男','2004','18122495976','jujiashou15384411151','2851200440','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('140','6002','吴柳锋','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('141','6004','宁纪玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('142','6003','杨小为','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('143','6009','罗小娥','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('144','6013','黄洁凤','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('145','6018','何黄芳','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('146','6005','李秀枝','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('147','6007','黄素婷','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('148','6017','张秋平','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('149','6006','吴丽秋','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('150','6015','张伟慧','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('151','6008','吴雅晴','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('152','6016','敖小玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('153','6011','陈毓梅','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('154','6020','梁锦霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('155','6010','张俏妍','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('156','6021','江碧霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('157','6023','刘金丹','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('158','6022','张海燕','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('159','6028','黄宝莹','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('160','6024','叶佩勋','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('161','6026','殷冬宜','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('162','6027','张浪','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('163','6030','甘裕霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('164','6029','胡燕玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('165','6031','李碧梅','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('173','6033','梁玉婷','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('167','6032','庞清霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('168','6040','关智泳','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('169','6041','梁楚彬','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('170','6038','吴佳平','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('171','6039','陈美茹','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('172','6037','林玉梅','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('174','6034','杨玉婷','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('175','6035','林燕敏','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('176','6036','沈嘉玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('177','6044','尤丽佳','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('178','6046','杨仪桦','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('179','6047','陈彩娟','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('180','6045','黄秋霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('181','6042','麦雯涵','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('182','6043','符云青','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('183','6048','吴文琪','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('184','6049','吴巧婷','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('185','6051','陈如梦','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('186','6050','傅燕芬','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('187','6053','莫小凤','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('188','6052','朱兰芳','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('189','6055','黄欣明','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('190','6056','谭敏谊','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('191','6057','谢水娇 ','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('192','6058','陈诗吟','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('193','6059','李燕凤','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('194','6061','胡圣梅','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('195','6060','段亿','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('196','2050','吴瑞华','7b912a98bb5759da8b352c07f8df88c2','男','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('197','2034','黄贵阳','7b912a98bb5759da8b352c07f8df88c2','男','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('198','2053','林木桂','7b912a98bb5759da8b352c07f8df88c2','男','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('199','2044','郑建群','7b912a98bb5759da8b352c07f8df88c2','男','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('200','2037','梁瑜秋','7b912a98bb5759da8b352c07f8df88c2','男','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('201','2033','方伯林','7b912a98bb5759da8b352c07f8df88c2','男','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('202','2024','刘森','7b912a98bb5759da8b352c07f8df88c2','男','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('203','2062','陈玉花','7b912a98bb5759da8b352c07f8df88c2','女','2004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('204','2012','唐钦羡','7b912a98bb5759da8b352c07f8df88c2','男','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('205','2004','刘子锋','7b912a98bb5759da8b352c07f8df88c2','男','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('206','2016','王小群','7b912a98bb5759da8b352c07f8df88c2','女','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('207','2055','武暖芳','7b912a98bb5759da8b352c07f8df88c2','女','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('208','2070','周小珊','7b912a98bb5759da8b352c07f8df88c2','女','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('209','2069','梁俊杰','7b912a98bb5759da8b352c07f8df88c2','男','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('210','2064','龙海波','7b912a98bb5759da8b352c07f8df88c2','男','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('211','2057','沈美伶','7b912a98bb5759da8b352c07f8df88c2','女','2005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('212','3001','王旭','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('213','3016','陈彬','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('214','3017','覃健玲','7b912a98bb5759da8b352c07f8df88c2','女','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('215','3067','钟利林','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('216','3028','温才乐','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('217','3054','梁桂铭','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('218','3038','周大军','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('219','3068','吴昌龙','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('220','3034','钟雪婷','7b912a98bb5759da8b352c07f8df88c2','女','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('221','3066','江锦超','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('222','3030','覃丽群','7b912a98bb5759da8b352c07f8df88c2','女','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('223','3053','李羽萍','7b912a98bb5759da8b352c07f8df88c2','女','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('224','3009','曾小雄','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('225','3061','陈佐滔','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('226','3035','肖学鹏','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('227','3021','杨佐兰','7b912a98bb5759da8b352c07f8df88c2','女','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('228','3039','彭胜蓝','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('229','3010','温小梅','7b912a98bb5759da8b352c07f8df88c2','女','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('230','3020','刘剑峰','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('231','3018','谭娟秀','7b912a98bb5759da8b352c07f8df88c2','女','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('232','3015','温家信','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('233','3052','黄明雄','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('234','3055','黎国坚','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('235','3029','欧艳燕','7b912a98bb5759da8b352c07f8df88c2','女','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('236','3013','黄超权','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('237','3044','叶王镇','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('238','3046','彭锋云','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('239','3040','周亮峰','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('240','3062','刘永富','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('241','3011','许加恩','7b912a98bb5759da8b352c07f8df88c2','女','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('242','3014','许玉莲','7b912a98bb5759da8b352c07f8df88c2','女','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('243','3043','周欢','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('244','3051','梁育铭','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('245','3024','瞿永乐','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('246','3049','谭彩莲','7b912a98bb5759da8b352c07f8df88c2','女','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('247','3063','周东洋','7b912a98bb5759da8b352c07f8df88c2','男','3003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('248','3022','陈家安','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('249','3037','钟柳春','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('250','3027','陈存杰','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('251','3026','肖学云','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('252','3056','李达湘','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('253','3003','吴叶涵','7b912a98bb5759da8b352c07f8df88c2','女','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('254','3019','陈宝星','7b912a98bb5759da8b352c07f8df88c2','女','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('255','3008','麦仕洁','7b912a98bb5759da8b352c07f8df88c2','女','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('256','3031','贺宏章','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('257','3045','吴晓舒','7b912a98bb5759da8b352c07f8df88c2','女','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('258','3025','郑林翡','7b912a98bb5759da8b352c07f8df88c2','女','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('259','3041','胡天斌','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('260','3032','李路平','7b912a98bb5759da8b352c07f8df88c2','男','3004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('261','3012','马楷斌','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('262','3069','叶王凛','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('263','3070','陈植伟 ','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('264','3048','张燕萍','7b912a98bb5759da8b352c07f8df88c2','女','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('265','3036','周俊杰','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('266','3004','叶亚明','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('267','3007','江锦程','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('268','3006','黄月珍','7b912a98bb5759da8b352c07f8df88c2','女','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('269','3058','骆伟琦','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('270','3050','徐小平','7b912a98bb5759da8b352c07f8df88c2','男','3005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('271','3071','蔡润华','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('272','3005','梁耀文','7b912a98bb5759da8b352c07f8df88c2','男','3000','','','','1');
