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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('1','9001','9001','杨震南','e10adc3949ba59abbe56e057f20f883e','2017-02-28 17:34:42','2000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('2','9002','9001','周冠武','a7abf29b68607c9b4c2d2574475e5ce1','2017-02-28 18:16:32','4000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('3','9003','1001','陆祥林','a7abf29b68607c9b4c2d2574475e5ce1','2017-02-28 18:17:56','2000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('6','5001','9001','邓以秋','a24d7346db70aa84df8f6ee2c1e763e9','2017-02-28 07:57:14','1000,2000,3000,4000,5000','1');
insert into `hk_admin`(`id`,`uid`,`depa`,`name`,`pawd`,`times`,`flags`,`state`) values('8','9301','9002','江敏','d578c1c2faa16537f1bf2e50bb0e0f4a','2017-02-28 17:43:38','3000','1');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('1','HK201702283790','瘦客户机','100','97','3','0','华科瘦客户机-宏发682','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('2','HK201702285596','显示器','100','99','1','0','HKC19.5显示器，宏发682','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('3','HK201702286128','台式机','100','0','100','0','奔腾双核台式机，宏发682','1');
insert into `hk_assets`(`id`,`stoid`,`stonm`,`stosl`,`stokc`,`stock`,`stobf`,`stoad`,`stote`) values('4','HK201702287206','显示器','100','100','0','0','HKC显示器宏发682','0');
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
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('1','9001','IT部','HK201702283790,HK201702285596','0','0','','2017-02-28 08:16:01','5');
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('2','9002','IT部','HK201702283790,HK201702285596','0','0','','2017-02-28 08:22:41','5');
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('3','9001','IT部','HK201702283790,HK201702285596','0','5','','2017-02-28 08:46:52','5');
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('4','1006','销售一部一组','HK201702283790,HK201702285596','0','5','','2017-02-28 18:09:35','5');
insert into `hk_assig`(`id`,`auid`,`adpa`,`assid`,`asped`,`ascfo`,`anote`,`atime`,`astat`) values('5','1007','销售一部一组','HK201702283790','0','0','','2017-02-28 18:15:46','5');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('1','JJS201702285096','HK201702283790','9001','5001','2017-02-28 08:17:06','','0');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('2','JJS201702284203','HK201702285596','9001','9001','2017-02-28 08:17:17','','10');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('3','JJS201702285362','HK201702283790','9001','9002','2017-02-28 08:24:53','','10');
insert into `hk_asslist`(`id`,`zid`,`name`,`depa`,`user`,`time`,`note`,`state`) values('4','JJS201702286157','HK201702283790','1001','1001','2017-02-28 18:17:10','234254345','5');
CREATE TABLE `hk_depas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT '部门排序',
  `did` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT '部门ID',
  `sid` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT '上级部门',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '部门名称',
  `state` int(11) NOT NULL COMMENT '部门状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=gbk;
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
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('38','18','3005','3000','三部五组','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('32','32','9000','','后勤部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('33','32','9001','9000','IT部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('34','33','9002','9000','财务部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('35','34','9003','9000','人事部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('36','35','9004','9000','客服部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('37','36','9005','9000','行政部','1');
insert into `hk_depas`(`id`,`pid`,`did`,`sid`,`name`,`state`) values('39','37','9006','9000','推广部','1');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
insert into `hk_excel_data`(`id`,`user_id`,`user_name`,`email`,`phone`,`price`,`add_time`,`mon_time`,`title_id`,`add_uid`,`content`,`remark`,`msg_time`) values('1','5001','邓以秋','5001','5001','5001.00','1488275264','2017-2-1','1','0','a:5:{s:1:\"A\";s:4:\"5001\";s:1:\"B\";s:9:\"邓以秋\";s:1:\"C\";s:5:\"10000\";s:1:\"D\";s:10:\"1801175415\";s:1:\"E\";s:19:\"4.2452452475746E+15\";}','','');
CREATE TABLE `hk_excel_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `mon_time` varchar(20) DEFAULT NULL COMMENT '月份',
  `content` text COMMENT '中文内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;
insert into `hk_excel_title`(`id`,`add_time`,`mon_time`,`content`) values('1','1488275264','2017-2-1','a:5:{s:1:\"A\";a:6:{s:4:\"name\";s:6:\"工号\";s:7:\"user_id\";s:1:\"A\";s:9:\"user_name\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"price\";s:0:\"\";s:6:\"status\";i:1;}s:1:\"B\";a:6:{s:4:\"name\";s:6:\"姓名\";s:7:\"user_id\";s:0:\"\";s:9:\"user_name\";s:1:\"B\";s:5:\"email\";s:0:\"\";s:5:\"price\";s:0:\"\";s:6:\"status\";i:1;}s:1:\"C\";a:6:{s:4:\"name\";s:12:\"实发工资\";s:7:\"user_id\";s:0:\"\";s:9:\"user_name\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"price\";s:0:\"\";s:6:\"status\";i:1;}s:1:\"D\";a:6:{s:4:\"name\";s:6:\"手机\";s:7:\"user_id\";s:0:\"\";s:9:\"user_name\";s:0:\"\";s:5:\"email\";s:1:\"D\";s:5:\"price\";s:0:\"\";s:6:\"status\";i:0;}s:1:\"E\";a:6:{s:4:\"name\";s:9:\"银行卡\";s:7:\"user_id\";s:0:\"\";s:9:\"user_name\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"price\";s:1:\"E\";s:6:\"status\";i:0;}}');
CREATE TABLE `hk_sqlbk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '名字',
  `time` datetime NOT NULL COMMENT '时间',
  `data` varchar(32) NOT NULL COMMENT '大小',
  `user` varchar(32) NOT NULL COMMENT '操作员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;
insert into `hk_sqlbk`(`id`,`name`,`time`,`data`,`user`) values('1','HK-20170228912.sql','2017-02-28 09:12:47','67.0KB','杨震南');
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
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=gbk;
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('1','9001','杨震南','a24d7346db70aa84df8f6ee2c1e763e9','男','9001','15999955508','15999955508','2853792989','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('2','9002','周冠武','7b912a98bb5759da8b352c07f8df88c2','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('3','9003','陆祥林','b15ab3f829f0f897fe507ef548741afb','男','9001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('4','5001','邓以秋','7b912a98bb5759da8b352c07f8df88c2','男','9001','18011754158','qq51508693','51508693','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('5','1001','黄丽娜','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360820265','tzglsh','1982477732','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('6','1055','利百加','7b912a98bb5759da8b352c07f8df88c2','女','1000','18028070108','JJS2418769400','2418769400','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('7','1007','张爱珍','7b912a98bb5759da8b352c07f8df88c2','女','1001','15322321165','Slmndaq','1587474312','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('8','1076','赵谦','a2dca571895c3d2e2bda1b380f369f9c','男','1001','15322366007','jjs262','2628023103','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('9','1084','陈颖','7b912a98bb5759da8b352c07f8df88c2','女','1001','15361251572','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('10','1085','温清','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360593936','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('11','1086','卢宣艺','7b912a98bb5759da8b352c07f8df88c2','女','1001','15322081761','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('12','1006','谢碧云','7b912a98bb5759da8b352c07f8df88c2','女','1001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('13','1050','张华','7b912a98bb5759da8b352c07f8df88c2','男','1001','18028055570','jjszhanghua','2851203700','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('14','1035','李铭','72528fa0b1f203d64e1c3d9c9afc1c4a','男','1001','15322099917','Jujiashou123','2608666315','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('15','1003','包铮铮','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360535673','523942512','523942512','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('16','1037','丘冠华','b9cc82df98c2e79041c095675cc0fbf1','男','1001','15302468060','15302468060','1835006538','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('17','1058','李增辉','6aa765ae8e232d202b8f2ff56a64670c','男','1001','18028583583','jujiashou_lzh','1835759528','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('18','1049','陈欢','7b912a98bb5759da8b352c07f8df88c2','女','1001','15361291189','jujiashou613','2851203900','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('19','1043','苏灵灵','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360893575','jvjiashousyk','1633035607','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('20','1005','黄智玉','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360678017','zhiyuk888','2192900640','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('21','1053','余尚力','ed622b88311b548b08ad5cd53698c243','男','1001','15360596117','jjsyushangli','1471896241','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('22','1034','曾雪梅','7b912a98bb5759da8b352c07f8df88c2','女','1001','15360561256','tomeimei11','2635055711','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('23','1056','苏健','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322293738','jujiashou-sujian','951599472','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('24','1057','肖勇红','7b912a98bb5759da8b352c07f8df88c2','女','1001','15374022067','jujiashouxiao','2390207822','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('25','1015','徐强','7b912a98bb5759da8b352c07f8df88c2','男','1001','15360081219','xuqiang8730','2570002045','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('26','1028','王华兵','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322258335','jujias918','2503110370','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('27','1038','覃爱玲','7b912a98bb5759da8b352c07f8df88c2','女','1001','17728046473','jjsaling','2491106643','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('28','1039','王健康','7b912a98bb5759da8b352c07f8df88c2','男','1001','15322301859','jjs1314kk','960759357','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('29','1054','许敏','7b912a98bb5759da8b352c07f8df88c2','女','1001','15374011192','2569041245','2569041245','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('30','1069','林凯忠','7b912a98bb5759da8b352c07f8df88c2','男','1001','18026258515','jjs2517424162','2517424162','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('31','1080','庄琳玲','be8651bb07614b9678fa7cae67c75c52','女','1001','15323312385','jjs2508627244','2788075766','1');
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
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('43','1025','陈凤英','c0ac8802b5fad477fd680d1fac8f0103','女','1002','15323371577','jjs17727639952','2624037338','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('44','1072','黄圆忠','8efdaab2e02918493570e8064406656c','男','1002','15322285033','hyz1486296376','1486296376','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('45','1004','曹丽娟','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360816918','jjsclj516','2667183027','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('46','1019','潘林峰','25275fb51d6e5fdcf5fe7eeac45ef4e8','男','1002','15322320281','lq904266545','904266546','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('47','1040','杜永语','7b912a98bb5759da8b352c07f8df88c2','男','1002','15302209896','jjs2627414926','2627414926','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('48','1045','王多亮','7b912a98bb5759da8b352c07f8df88c2','男','1002','18011793866','jujiashoukuanglaoshi','1578571923','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('49','1018','姚晓曼','7b912a98bb5759da8b352c07f8df88c2','女','1002','15322246395','QQ1934027166','1934027166','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('50','1075','杨亚楠','7b912a98bb5759da8b352c07f8df88c2','女','1002','15322287338','jjs1486593951','1486593951','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('51','1009','王茂宇','7b912a98bb5759da8b352c07f8df88c2','女','1002','15338052530','wxid_jjs52530','2416463344','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('52','1026','钟兰燕','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360419269','jujiashou2622156923','2622156923','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('53','1010','曾敏','7b912a98bb5759da8b352c07f8df88c2','女','1002','15322057813','jjs15322057813','2460261339','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('54','1014','王传勇','7b912a98bb5759da8b352c07f8df88c2','男','1002','15361771691','jujiashou520','2282920197','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('55','1011','李华容','7b912a98bb5759da8b352c07f8df88c2','女','1002','15360528031','mybeauty-365','2518880568','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('56','1044','姚雪珍','443a29b42a4bd8f09f7ff067bdb2f4a9','女','1002','18011950356','yao18011950356','2844088273','1');
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
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('68','1032','廖士雄','fca812f055d5fdcd3a355b63ceaad991','男','1003','18027121361','jujiashou2260341370','2260341370','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('69','1029','谢辉','7b912a98bb5759da8b352c07f8df88c2','男','1003','15360406067','lms199304','2493040490','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('70','1041','杨伟明','7b912a98bb5759da8b352c07f8df88c2','男','1003','15322259311','jujiashou201314','956888246','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('71','1046','李丹凤','7b912a98bb5759da8b352c07f8df88c2','女','1003','15302372902','jujiashou610','2494336749','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('72','1002','陈媛媛','7b912a98bb5759da8b352c07f8df88c2','女','1003','18145707675','langcola','1517749773','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('73','1033','刘媛','7b912a98bb5759da8b352c07f8df88c2','女','1003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('74','1078','李小辉','7b912a98bb5759da8b352c07f8df88c2','男','1003','15360670265','jujias1078','760126540','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('75','1047','刘春献','7b912a98bb5759da8b352c07f8df88c2','女','1003','15360546806','jujias6162','2499496544','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('76','1081','郑伟','7b912a98bb5759da8b352c07f8df88c2','男','1003','15361788213','jjszw1990','2490021962','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('77','1023','黄继强','ef5401de6db890b7450872a9368d3715','男','1004','15360407957','1140450342','1140450342','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('78','1051','邓海亮','7b912a98bb5759da8b352c07f8df88c2','男','1004','15360683719','jujias8888','1508882496','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('79','1059','朱鹏程','7b912a98bb5759da8b352c07f8df88c2','男','1004','15323322191','jujiashouzhulaoshi','2974555012','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('80','1062','李幕','e40f01afbb1b9ae3dd6747ced5bca532','男','1004','18028607399','jujiashou666','2627305239','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('81','1063','颜文达','7b912a98bb5759da8b352c07f8df88c2','男','1004','18142882393','fshmywd198979','2945443755','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('82','1067','梁雄达','7b912a98bb5759da8b352c07f8df88c2','男','1004','18122450332','jujiashouliang','2627326604','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('83','1060','王多伟','7b912a98bb5759da8b352c07f8df88c2','男','1004','15360437506','jjs15360437506','3014253329','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('84','1061','罗丹','4cf483a725d92e1ff638fb8bac88612b','男','1004','18011957506','jujiashou525','2627437454','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('85','1070','刘浩','7b912a98bb5759da8b352c07f8df88c2','男','1004','18011751928','qq194487064','194487064','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('86','1077','谭素青','7b912a98bb5759da8b352c07f8df88c2','女','1004','18027251737','jujias18027251737','1330352085','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('87','1091','陈雯雯','ace9b3d44d6ed89d3c5825151754eec6','女','1004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('89','1013','梁翠兰','7b912a98bb5759da8b352c07f8df88c2','女','2000','15361779539','Shou520516','2438292662','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('90','2006','陈跃阳','7b912a98bb5759da8b352c07f8df88c2','男','2001','15323327322','jujias1311184026','1311184026','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('91','2011','陈伟科','783a0451cb1c496868dafb105514485a','男','2001','15322321756','jjs2350110497','2350110497','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('92','2009','彭裕新','7b912a98bb5759da8b352c07f8df88c2','男','2001','15338077433','jujias-516','1753522081','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('93','2010','吴玉华','cc3e6e88fc7b47fff875ab338435fa75','男','2001','15302240190','jujias2242091395','2242091395','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('94','2014','梁维锦','7b912a98bb5759da8b352c07f8df88c2','男','2001','18928796007','w18928796007','2669827379','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('95','2025','吴泽光','1d55e3632a4bcdfc130771fdb5fde056','男','2001','15322246231','jjswzg','1220974072','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('96','2030','黄海婷','8f29dad00be1e0986781bb69bca93e39','女','2001','18011952807','jjs2682295788','2682295788','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('97','2035','曾敏贤','7b912a98bb5759da8b352c07f8df88c2','男','2001','15322301150','zengjujiashou','2362509960','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('98','2048','苏秀丽','7b912a98bb5759da8b352c07f8df88c2','女','2001','18011792228','han484007','2355389460','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('99','2068','周月春','026b7dcf2350c824559b8cc00612de24','男','2001','18011793997','jujias518518','2851203871','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('100','2052','武健南','7b912a98bb5759da8b352c07f8df88c2','男','2001','15322073762','a15322073762','2355389463','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('101','2005','袁冲','5548bfa2ca6b5f3dea24d411224d0534','男','2002','18011802661','jjs824008139','824008139','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('102','2002','何志锋','7b912a98bb5759da8b352c07f8df88c2','男','2002','18028586580','hezhifeng1789654','1419838993','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('103','2026','易方河','17f7890eafc75c6c8989cf4b5302e8d3','男','2002','18011732308','jjs2026','1378575520','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('104','2076','李英杰','7b912a98bb5759da8b352c07f8df88c2','男','2002','15322253132','jujiashou2076','2853792833','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('105','2067','何博根','65a0ec385ca6a0c1e20d1f8270c28303','男','2002','15360090156','jjs2067','2851203728','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('106','2007','向林','7b912a98bb5759da8b352c07f8df88c2','男','2002','15361297915','jujias97606664','97606664','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('107','2075','秦忠红','43dc0218005dec578facf6dcc354243e','男','2002','15360632797','JuJiaShou516520','2853792830','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('108','2015','叶志强','7b912a98bb5759da8b352c07f8df88c2','男','2002','18011955997','jjs1398131809','1398131809','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('109','2041','柯兆城','4672bb7bbf8f3285f5572e2059be2fa2','男','2002','15374031795','jjskls','2853792831','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('110','2008','李欢欢','7b912a98bb5759da8b352c07f8df88c2','女','2002','15322062519','linjing621622','1912956660','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('111','2018','陈枫','7b912a98bb5759da8b352c07f8df88c2','男','2002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('112','2072','蔡吉冰','1033441ed569c6be13da8332b37397c1','女','2002','15322383910','jujiashou2072','2853792832','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('113','2019','武暖华','a54f591a9da320b6561af84b29173907','男','2002','15338062640','lsk2516970080','2516970080','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('114','2040','何利东','7b912a98bb5759da8b352c07f8df88c2','男','2002','15338098582','jujias15322368700','2853792790','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('115','2038','叶超均','74118acc06c503b8e3ef7b338c65e30b','男','2002','15302252319','jjsye24','2850594796','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('116','2001','谭小红','7b912a98bb5759da8b352c07f8df88c2','男','2003','18011740368','jujias518','346223120','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('117','2077','曾丽华','7b912a98bb5759da8b352c07f8df88c2','女','2003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('118','2017','向寒虎','7b912a98bb5759da8b352c07f8df88c2','男','2003','15322243621','xhh91581314','2498883522','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('119','2060','郞杰','7b912a98bb5759da8b352c07f8df88c2','男','2003','15302488667','L43678082','43678082','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('120','2013','袁国健','7b912a98bb5759da8b352c07f8df88c2','男','2003','15323371228','lamajujiashou','2228504804','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('121','2061','李锦升','7b912a98bb5759da8b352c07f8df88c2','男','2003','15302489223','jjs-ljs','2823298514','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('122','2028','黄思敏','7b912a98bb5759da8b352c07f8df88c2','女','2003','18122467122','jujiashou-hu','2817630768','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('123','2071','宋超洪','7b912a98bb5759da8b352c07f8df88c2','男','2003','15322015122','jujiashou2071','2851203943','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('124','2020','邓学婵','7b912a98bb5759da8b352c07f8df88c2','女','2003','18102624891','jujiashous','1538880649','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('125','2065','曾国辉','dbefeff800f6af58db5a13d2d0d8d584','男','2003','18011732663','Z2322112965','2322112965','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('126','2045','谭富盛','7b912a98bb5759da8b352c07f8df88c2','男','2003','15302470365','Jujiashoutam','2850594859','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('127','2027','郑丽爱','7b912a98bb5759da8b352c07f8df88c2','女','2003','18142838327','jujiashoulaoshi','2810902607','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('128','2047','秦佳铭','7b912a98bb5759da8b352c07f8df88c2','女','2003','15322365917','zhf199210102211','2851203552','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('129','2049','张贝贝','7b912a98bb5759da8b352c07f8df88c2','女','2003','15338076758','Jujiashou7026','2377153688','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('130','2073','朋亚枫','7b912a98bb5759da8b352c07f8df88c2','女','2003','15302255538','jjs52001','2851203504','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('131','2039','梁樱桃','7b912a98bb5759da8b352c07f8df88c2','女','2003','15360543376','2851203536','2851203536','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('132','2003','林木球','91004b6d32873af1cbb891c328b10fc0','男','2004','13392620939','Jujiashou13392620939','1146351346','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('133','2054','卢朝山','7b912a98bb5759da8b352c07f8df88c2','男','2004','15302225012','jjs2054','2853792823','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('134','2023','林伴','7b912a98bb5759da8b352c07f8df88c2','男','2004','18124246395','mengxin-951572898','2648447442','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('135','2022','陈月松','7b912a98bb5759da8b352c07f8df88c2','男','2004','18122437244','jjs18122437244','2335534076','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('136','2036','曾才全','7b912a98bb5759da8b352c07f8df88c2','男','2004','15322011077','zeng2289486887','2289486887','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('137','2029','谭建红','99f8f4cd869b0642c6b9cf0cf7a2ff50','男','2004','15360592106','15360592106','2298982968','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('138','2032','苏志斌','7b912a98bb5759da8b352c07f8df88c2','男','2004','18122410765','QQ1991470437','1991470437','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('139','2059','庄桂鑫','8404102e7830a6afc0f8ecde4039613c','男','2004','18122495976','jujiashou15384411151','2851200440','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('140','6002','吴柳锋','7b912a98bb5759da8b352c07f8df88c2','女','6000','15322339352','jjs_wu','2355592572','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('141','6004','宁纪玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','18011968531','chongfan6sui','1017531960','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('142','6003','杨小为','7b912a98bb5759da8b352c07f8df88c2','女','6000','15322357011','15322357011','2355592571','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('143','6009','罗小娥','316cf2ac89525f5decfe7f471a521d76','女','6000','18102780919','18102780919','2355843326','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('144','6013','黄洁凤','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360501151','15360501151','2355592579','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('145','6018','何黄芳','7b912a98bb5759da8b352c07f8df88c2','女','6000','15302215775','15302215775','2355843321','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('146','6005','李秀枝','52f43fdb84b989384404e48f3bc9ed77','女','6000','15360665652','15360665652','2355843320','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('147','6007','黄素婷','7b912a98bb5759da8b352c07f8df88c2','女','6000','15302450836','15302450836','2355843323','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('148','6017','张秋平','7b912a98bb5759da8b352c07f8df88c2','女','6000','15322057809','15322057809','2355843322','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('149','6006','吴丽秋','21456acd4e6b639421196cb647bfd513','女','6000','15338060807','15338060807','2355843325','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('150','6015','张伟慧','7b912a98bb5759da8b352c07f8df88c2','女','6000','15338054857','15338054857','2355843324','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('151','6008','吴雅晴','ad89af97e019150ab21852eb47ac657a','女','6000','13318747373','13318747373','2355843328','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('152','6016','敖小玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','15374018136','js15374018136','2355843327','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('153','6011','陈毓梅','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360500629','2355952630','2355952630','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('154','6020','梁锦霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','18122455670','2355952632','604638191','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('155','6010','张俏妍','7b912a98bb5759da8b352c07f8df88c2','女','6000','15302496967','jjszqy','2355952631','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('156','6021','江碧霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','18011961027','775050222','775050222','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('157','6023','刘金丹','7b912a98bb5759da8b352c07f8df88c2','女','6000','18922727445','18922727445','2355952635','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('158','6022','张海燕','7b912a98bb5759da8b352c07f8df88c2','女','6000','18925073894','18925073894','2355952636','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('159','6028','黄宝莹','7b912a98bb5759da8b352c07f8df88c2','女','6000','15302492683','15302492683','2850416367','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('160','6024','叶佩勋','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360444403','15360444403','2355952634','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('161','6026','殷冬宜','7b912a98bb5759da8b352c07f8df88c2','女','6000','15322080348','dongy1994','2850416366','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('162','6027','张浪','7b912a98bb5759da8b352c07f8df88c2','女','6000','15322002030','15322002030','2355952639','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('163','6030','甘裕霞','c36b6629587281c785a77575d350cfda','女','6000','15360591267','15360591267','2355592570','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('164','6029','胡燕玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360090715','15360090715','2850416368','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('165','6031','李碧梅','7b912a98bb5759da8b352c07f8df88c2','女','6000','7727762073','7727762073','2850416369','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('173','6033','梁玉婷','d5bb2217bceb76a364f7853c961f2556','女','6000','15322394295','15322394295','2850416371','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('167','6032','庞清霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360528911','lindapang123xia','2850416370','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('168','6040','关智泳','7b912a98bb5759da8b352c07f8df88c2','女','6000','17727763819','17727763819','2881941871','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('169','6041','梁楚彬','226bbdf45203603f0d1c804a8262d356','女','6000','18011779875','18011779875','2881941872','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('170','6038','吴佳平','7b912a98bb5759da8b352c07f8df88c2','女','6000','17727768859','17727768859','2850416375','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('171','6039','陈美茹','7b912a98bb5759da8b352c07f8df88c2','女','6000','18011953296','18011953296','2881941870','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('172','6037','林玉梅','f49dd93d3dc90fae518c7b2b0b4f6e0b','女','6000','18011957582','18011957582','2850416374','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('174','6034','杨玉婷','7b912a98bb5759da8b352c07f8df88c2','女','6000','18028535679','18028535679','2881941873','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('175','6035','林燕敏','7b912a98bb5759da8b352c07f8df88c2','女','6000','18011952126','18011952126','2850416372','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('176','6036','沈嘉玲','7b912a98bb5759da8b352c07f8df88c2','女','6000','18026232601','18026232601','2850416373','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('177','6044','尤丽佳','7b912a98bb5759da8b352c07f8df88c2','女','6000','18142805589','18142805589','2881941876','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('178','6046','杨仪桦','7b912a98bb5759da8b352c07f8df88c2','女','6000','18145702532','18145702532','2881941878','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('179','6047','陈彩娟','7b912a98bb5759da8b352c07f8df88c2','女','6000','18122431217','18122431217','2881941879','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('180','6045','黄秋霞','7b912a98bb5759da8b352c07f8df88c2','女','6000','18122418197','18122418197','2881941877','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('181','6042','麦雯涵','a941818e02d81b11007d291b02d41138','女','6000','15360420691','m15360240691','2881941874','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('182','6043','符云青','7b912a98bb5759da8b352c07f8df88c2','女','6000','18145701910','18145701910','2881941875','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('183','6048','吴文琪','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360501971','15360501971','2881941880','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('184','6049','吴巧婷','7b912a98bb5759da8b352c07f8df88c2','女','6000','15322012071','15322012071','2881941881','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('185','6051','陈如梦','7b912a98bb5759da8b352c07f8df88c2','女','6000','15361298963','15361298963','2881941883','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('186','6050','傅燕芬','11ccfd66616a23b91e52a3614160f71d','女','6000','15361758871','fyf1293907561','2881941882','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('187','6053','莫小凤','44831dbc4fe93a26a343096283a6e668','女','6000','15360600948','15360600948','2881941885','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('188','6052','朱兰芳','8b53d02e49a62a8bbb15cdc86b7f6fbd','女','6000','15322265628','15322265628','2881941884','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('189','6055','黄欣明','a14337a2e4aad2400b227d145ce39537','女','6000','15360500578','15360500578','3004200950','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('190','6056','谭敏谊','7b912a98bb5759da8b352c07f8df88c2','女','6000','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('191','6057','谢水娇 ','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360445121','qq2355952633','2355952633','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('192','6058','陈诗吟','8b81404f551dd67b3053e92d0d93c765','女','6000','15361779211','15361779211','2881941887','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('193','6059','李燕凤','7b912a98bb5759da8b352c07f8df88c2','女','6000','18028539217','18028539217','2355952638','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('194','6061','胡圣梅','7b912a98bb5759da8b352c07f8df88c2','女','6000','15338051628','15338051628','2881941888','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('195','6060','段亿','7b912a98bb5759da8b352c07f8df88c2','女','6000','15360501629','15360501629','2881941889','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('196','2050','吴瑞华','6d5d482a2a6fbb1755757c23122c4442','男','2004','15360028136','jjs_wang','2850594888','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('197','2034','黄贵阳','7b912a98bb5759da8b352c07f8df88c2','男','2004','18122453897','qq2335574505','2335574505','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('198','2053','林木桂','7b912a98bb5759da8b352c07f8df88c2','男','2004','18142861576','LIN15374059659','2851200186','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('199','2044','郑建群','a49de7973769de6b15dbcca6eb68b5db','男','2004','15322206059','jjs516_','2851200442','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('200','2037','梁瑜秋','7b912a98bb5759da8b352c07f8df88c2','男','2004','18142838930','lin2850594898','2292410422','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('201','2033','方伯林','7b912a98bb5759da8b352c07f8df88c2','男','2004','18124246273','j2284978735','2284978735','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('202','2024','刘森','7b912a98bb5759da8b352c07f8df88c2','男','2004','15322269077','A582066167','582066167','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('203','2062','陈玉花','7b912a98bb5759da8b352c07f8df88c2','女','2004','15322233079','jjs2062','2851200499','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('204','2012','唐钦羡','5101449cfb683aab90dcf73f2261bf12','男','2005','13902291253','2HK516520','2202410734','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('205','2004','刘子锋','e9fc6caae7e698115e4bb391d86ab60c','男','2005','15361789558','cx2352705557','2352705557','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('206','2016','王小群','7b912a98bb5759da8b352c07f8df88c2','女','2005','15323368508','JJS199','2574743877','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('207','2055','武暖芳','7b912a98bb5759da8b352c07f8df88c2','女','2005','15322047930','w15322047930','2853792793','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('208','2070','周小珊','7b912a98bb5759da8b352c07f8df88c2','女','2005','15338060758','zxs15338060758','2647064014','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('209','2069','梁俊杰','78c1794e0c201f7c6e5ae539b0f8ab7d','男','2005','15360810711','jj15360810711','2359658053','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('210','2064','龙海波','8dee2b40fbb1a155124a43c69b3beeb6','男','2005','15322248803','JJshou2016','2853792794','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('211','2057','沈美伶','7b912a98bb5759da8b352c07f8df88c2','女','2005','15302370961','jujiashou2','2850594821','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('212','3001','王旭','62085d0638ed2ec8c7e7e1c7f85c2d05','男','3000','18011740212','yjf33889966','1836419312','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('213','3016','陈彬','b4b9f9c2582ad3c4df419b33d90dacdc','男','3002','18102641703','jujiashoujianfei','1783766425','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('214','3017','覃健玲','afdd0b4ad2ec172c586e2150770fbf9e','女','3002','18142897875','jjs1094913688','2517106061','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('215','3067','钟利林','72abe5e0f067d8ec31eccef9c6c53bc3','男','3002','15360820199','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('216','3028','温才乐','7b912a98bb5759da8b352c07f8df88c2','男','3002','18122487587','jjs52051627','2972823148','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('217','3054','梁桂铭','7b912a98bb5759da8b352c07f8df88c2','男','3002','15322329617','jujiashou_jianfei','2850594969','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('218','3038','周大军','fbb133e097e58e5903fef625e40deec0','男','3002','18054283262','A15323329386','2853792612','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('219','3068','吴昌龙','7b912a98bb5759da8b352c07f8df88c2','男','3002','15323302353','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('220','3034','钟雪婷','7b912a98bb5759da8b352c07f8df88c2','女','3002','18142822015','ZGS1903230420','2518408590','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('221','3066','江锦超','7b912a98bb5759da8b352c07f8df88c2','男','3002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('222','3030','覃丽群','4d64147a755cf5c98e2cffc5aadbf21e','女','3002','18054207113','Q17727761090','2812147526','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('223','3053','李羽萍','7b912a98bb5759da8b352c07f8df88c2','女','3002','15360551839','JJS2850594636','2850594636','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('224','3009','曾小雄','7b912a98bb5759da8b352c07f8df88c2','男','3002','18142855365','jujias2545281319','2545281319','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('225','3061','陈佐滔','7b912a98bb5759da8b352c07f8df88c2','男','3002','15322329183','JJS2811135116','2811135116','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('226','3035','肖学鹏','7b912a98bb5759da8b352c07f8df88c2','男','3002','18124249503','jjsxls','2518602667','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('227','3021','杨佐兰','7b912a98bb5759da8b352c07f8df88c2','女','3002','15338097339','jujiashou1418985928','1418985928','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('228','3039','彭胜蓝','1e7ea4fea0b1b92ea65b882567b6b914','男','3002','15322380061','nancy_12520','2853792613','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('229','3010','温小梅','7b912a98bb5759da8b352c07f8df88c2','女','3003','15322237806','wen1397550456','397550456','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('230','3020','刘剑峰','7b912a98bb5759da8b352c07f8df88c2','男','3003','15322057810','liu2625495523','2625495523','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('231','3018','谭娟秀','7b912a98bb5759da8b352c07f8df88c2','女','3003','18142819752','jjs15322057814','2971415728','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('232','3015','温家信','7b912a98bb5759da8b352c07f8df88c2','男','3003','15384410729','jjs1743406200','1743406200','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('233','3052','黄明雄','7b912a98bb5759da8b352c07f8df88c2','男','3003','18011770738','huang2853792918','2853792918','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('234','3055','黎国坚','7b912a98bb5759da8b352c07f8df88c2','男','3003','15360832509','jjs3055','2853792919','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('235','3029','欧艳燕','7b912a98bb5759da8b352c07f8df88c2','女','3003','15361760677','jjs1337348125','1337348125','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('236','3013','黄超权','7b912a98bb5759da8b352c07f8df88c2','男','3003','18122421061','jujiashuang','2660152878','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('237','3044','叶王镇','7b912a98bb5759da8b352c07f8df88c2','男','3003','15322285396','jjschen88','2853792638','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('238','3046','彭锋云','7b912a98bb5759da8b352c07f8df88c2','男','3003','18011956381','jujias6789','2853792675','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('239','3040','周亮峰','7b912a98bb5759da8b352c07f8df88c2','男','3003','15302379657','jjswulaoshi','2853792917','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('240','3062','刘永富','eadf0df235a7e00aa1966f0293e73f89','男','3003','15322231852','jjsliulaoshi','2853792676','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('241','3011','许加恩','7b912a98bb5759da8b352c07f8df88c2','女','3003','18142836013','jujiashou_2811303857','2811303857','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('242','3014','许玉莲','7b912a98bb5759da8b352c07f8df88c2','女','3003','15338079892','jjs18122420647','214330599','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('243','3043','周欢','7fe94e5a4ffc0d2aa470e34d493507f4','男','3003','15374005119','JJS_RRR','2850594538','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('244','3051','梁育铭','7b912a98bb5759da8b352c07f8df88c2','男','3003','18122478053','chen2355389474','2355389474','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('245','3024','瞿永乐','3343dc3cdef3c95ca5900f1d21c37308','男','3003','18024523992','jujiashou2405282572','2405282572','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('246','3049','谭彩莲','7b912a98bb5759da8b352c07f8df88c2','女','3003','18011732697','jjs2850594635','2850594635','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('247','3063','周东洋','7b912a98bb5759da8b352c07f8df88c2','男','3003','15322033121','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('248','3022','陈家安','b0590f10d6a2d16b3ecd144f6906987f','男','3004','15361777198','q2582480705','2582480705','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('249','3037','钟柳春','b2359a43c5460086163fa91a3220473b','男','3004','18142817790','jjs2853792627','2853792627
','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('250','3027','陈存杰','e65b0094c63dfc23d603cb962740f3cd','男','3004','15302201382','msl2972500297','2972500297','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('251','3026','肖学云','7b912a98bb5759da8b352c07f8df88c2','男','3004','18142822096','jujiashou1314','2812054153','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('252','3056','李达湘','7b912a98bb5759da8b352c07f8df88c2','男','3004','15361752633','w2853792658','2853792658','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('253','3003','吴叶涵','38b03f60631dfe637660bd3dbbb40879','女','3004','18145706172','JJS2391562689','2391562689','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('254','3019','陈宝星','7b912a98bb5759da8b352c07f8df88c2','女','3004','15323338651','qq2220610471','2220610471','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('255','3008','麦仕洁','7b912a98bb5759da8b352c07f8df88c2','女','3004','15322025692','jiankangshoushen123','2363439354','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('256','3031','贺宏章','7b912a98bb5759da8b352c07f8df88c2','男','3004','18122140057','a17727762712
','2405432943','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('257','3045','吴晓舒','7b912a98bb5759da8b352c07f8df88c2','女','3004','15323397936','jjslai2850594627','851764741','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('258','3025','郑林翡','7b912a98bb5759da8b352c07f8df88c2','女','3004','15338052585','jujiashou688','2816822529','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('259','3041','胡天斌','7b912a98bb5759da8b352c07f8df88c2','男','3004','15360520027','jujiashou333','2819083021','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('260','3032','李路平','7b912a98bb5759da8b352c07f8df88c2','男','3004','18011751981','a15322395200','2812148486','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('261','3012','马楷斌','7b912a98bb5759da8b352c07f8df88c2','男','3005','18054207220','jjs1550631789','1550631789','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('262','3069','叶王凛','7b912a98bb5759da8b352c07f8df88c2','男','3005','15322355790','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('263','3070','陈植伟 ','da0cc921d62fdbf690eee5850f8a65db','男','3005','15360021783','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('264','3048','张燕萍','7b912a98bb5759da8b352c07f8df88c2','女','3005','15360830905','JJS2679283364','2679283364','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('265','3036','周俊杰','7b912a98bb5759da8b352c07f8df88c2','男','3005','18054226270','jujiashou','946257698','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('266','3004','叶亚明','7b912a98bb5759da8b352c07f8df88c2','男','3005','18122419303','JJS18102753661','2467428410','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('267','3007','江锦程','55857fd756e18b10926849ca164c29b1','男','3005','18142856697','JJS5161314','2659196386','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('268','3006','黄月珍','bfd6e3633429f74e1e9544c3049f8237','女','3005','15361278718','JuJias2696422586','2696422586','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('269','3058','骆伟琦','7b912a98bb5759da8b352c07f8df88c2','男','3005','15360521170','JJS2850594637','2850594637','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('270','3050','徐小平','7b912a98bb5759da8b352c07f8df88c2','男','3005','15322283372','jjs2518421430','2518421430','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('271','3071','蔡润华','7b912a98bb5759da8b352c07f8df88c2','男','3005','15361299553','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('272','3005','梁耀文','7b912a98bb5759da8b352c07f8df88c2','男','3000','15323308436','TF2805382081','2805382081','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('273','4001','林锦斌','7b912a98bb5759da8b352c07f8df88c2','男','4000','18011740628','jujias01','1360605423','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('274','4002','黄安帮','7b912a98bb5759da8b352c07f8df88c2','男','4001','15322331490','jjs_huang','1530805188','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('275','4080','邓宏曼','7b912a98bb5759da8b352c07f8df88c2','女','4001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('276','4073','谢裔泰','0a2cb03c4dc29cfc0d56afa46ae8fd2e','男','4001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('277','4013','薛少敏','7b912a98bb5759da8b352c07f8df88c2','女','4001','18122472512','jujiasss','1729972722','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('278','4018','吴劲超','f57669603fcff3763a5286cd075e1884','男','4001','18142832983','jujiashou-43','1907185504','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('279','4046','何廷叶','7b912a98bb5759da8b352c07f8df88c2','女','4001','15360594921','h1615657989','1615657989','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('280','4020','曾翠潘','ca486c223902f93d322e94933aea86d3','女','4001','18054219860','JJS258','2271713565','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('281','4023','宁华荣','a5160dc953b936480989ac2a6d259d80','女','4001','15322205079','15QQ1660497805','1660497805','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('282','4058','陈红','9ed038d2f7b9179780eb1a379b7e98c8','女','4001','15322386299','jujiashou4058','1652448188','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('283','4012','梁美萍','7b912a98bb5759da8b352c07f8df88c2','女','4001','15323316152','jjss-liang','1903037381','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('284','4022','谢小怡','7b912a98bb5759da8b352c07f8df88c2','女','4001','18054237581','jujiasQ2297415536','2297415536','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('285','4040','陈树衡','86a07ea6fbd2aee8a0360335aefa9c74','男','4001','18122445196','jjs235','jjs235','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('286','4038','杨昆宏','7b912a98bb5759da8b352c07f8df88c2','男','4001','15302295902','jujiashou-yang','2850596849','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('287','4033','何滔滔','7b912a98bb5759da8b352c07f8df88c2','女','4001','15302273797','L2850597113','1697421711','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('288','4051','朱奎','7b912a98bb5759da8b352c07f8df88c2','男','4001','15360582581','15360582581','2529638252','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('289','4059','陈玉婵','7b912a98bb5759da8b352c07f8df88c2','女','4001','15322257599','jjs-1799681514','1799681514','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('290','4039','李晓玲','7b912a98bb5759da8b352c07f8df88c2','女','4001','18028508126','HK2007_JJS','2355389483','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('291','4003','李静','781052dfea799e8ee456516122410c28','女','4002','15374099605','shiliaojf520','2518526001','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('292','4009','方竹晴','34f76cce67accd24fb9093a4a17a47ec','女','4002','18122487198','jujias520516','2823404933','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('293','4072','吴柳妹','7b912a98bb5759da8b352c07f8df88c2','女','4002','15322307892','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('294','4077','王志','7b912a98bb5759da8b352c07f8df88c2','男','4002','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('295','4024','陈曼娇','7b912a98bb5759da8b352c07f8df88c2','女','4002','18122452759','jjs-cmj2867500197','2867500197','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('296','4027','冯托','7b912a98bb5759da8b352c07f8df88c2','男','4002','15302258220','FT1029423518','1029423518','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('297','4042','周茂兵','08b57e9865dad94f793edcb330283955','男','4002','18011957830','jjs_2853792946','1031118978','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('298','4054','赖勇斌','6b514a54ce6d8aa628b6f8526e176c41','男','4002','15360532606','mtyjwx06','1061412059','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('299','4041','廖红','7b912a98bb5759da8b352c07f8df88c2','女','4002','15302489589','L15302451250','2518086308','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('300','4021','凌叶聪','e10adc3949ba59abbe56e057f20f883e','男','4002','18142838375','HK2007-JJS','1043149340','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('301','4007','杨土郁','7b912a98bb5759da8b352c07f8df88c2','男','4002','15322342786','jjs1793652648','1793652648','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('302','4019','潘建微','7b912a98bb5759da8b352c07f8df88c2','女','4002','18054200107','shiliaoshoufen','2824192212','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('303','4035','桂超','7b912a98bb5759da8b352c07f8df88c2','女','4002','15322273782','jujias_gc','1090779734','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('304','4034','谢祈益','03c217207426ee05cf33d9eef9439552','男','4002','18142835027','a2850597067','2518230488','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('305','4067','陈德龙','7b912a98bb5759da8b352c07f8df88c2','男','4002','15360584249','jjs1263193810','1263193810
','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('306','4066','陈智爽','7b912a98bb5759da8b352c07f8df88c2','男','4002','15322262090','jujiashou15322262090','1264045861','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('307','4004','孙秋涛','7b912a98bb5759da8b352c07f8df88c2','男','4003','18054219830','jujias8383','1365618383','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('308','9101','段成斌','7b912a98bb5759da8b352c07f8df88c2','男','9006','13922246364','13922246364','2355843329','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('309','4071','彭惟忧','7b912a98bb5759da8b352c07f8df88c2','女','4003','15323351695','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('310','9102','王国兴','7b912a98bb5759da8b352c07f8df88c2','男','9006','18802051894','w18802051894','2853792998','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('311','4006','余晓丹','f52f6c606441fb98fbb451ec436646cd','女','4003','15322296286','GzJujias520516','1764704822','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('312','4017','邓紫颜','923d1ac0944d7dc29964973b31cb4f7c','女','4003','18054237552','jujiashou2481434905','2481434905','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('313','4036','李靥','7b912a98bb5759da8b352c07f8df88c2','女','4003','15323382057','jjs2966852258','2966852258','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('314','4044','周益文','4d6509669a41c82f53dbcfc1b46df3c5','男','4003','18054220929','jujiashou4006','2853792696','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('315','4063','严志文','40f13653e11c456683c2bb12a33b49f8','男','4003','15322213167','jujiashou007','1066220101','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('316','4049','王蓉','8b9f9ff96582536a3913f0927eab3577','女','4003','15322282723','jujiashou126','1300515907','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('317','4015','李灏','1104959d53dc3b60f2d40cd4a47d79e7','男','4003','18054218195','jujiashou520520','1964460650','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('318','4016','刘志刚','7b912a98bb5759da8b352c07f8df88c2','男','4003','18054207161','JJS2274831463','2274831463','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('319','4010','张映芬','7b912a98bb5759da8b352c07f8df88c2','女','4003','15323338072','jjs1138058250','1138058250','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('320','4068','邓剑锋','f67d37ab95b1f05ea169c60f6ca6d1a1','男','4003','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('321','4011','钟春青','7b912a98bb5759da8b352c07f8df88c2','女','4004','18028648683','jjs520516','359748038','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('322','4047','梁宇晴','93e0e34bd28aefc5a41039dc167aab34','女','4004','18054208023','jujias88QQ','1963733149','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('323','4048','吴日锐','336fa0477ac830206417de85fbb2b828','男','4004','15302203951','jjs2853792714','2853792714','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('324','4060','朱小玲','7b912a98bb5759da8b352c07f8df88c2','女','4004','15338084561','jjs4561','1426154028','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('325','4075','周茂桥','7b912a98bb5759da8b352c07f8df88c2','男','4004','15322216892','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('326','4076','苏国荣','baa48261986bf6881f008efab1e117cd','男','4004','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('327','4014','赖康威','7b912a98bb5759da8b352c07f8df88c2','男','4004','15384451229','Jujia520516','2216644382','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('328','4037','吴文浩','7b912a98bb5759da8b352c07f8df88c2','男','4004','15338061752','jack334072','2850596820','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('329','4032','廖政隆','7b912a98bb5759da8b352c07f8df88c2','男','4004','15322055571','jujias007','1903948023','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('330','4030','李素红','7b912a98bb5759da8b352c07f8df88c2','女','4004','15322072517','jujias520-516','1808958575','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('331','4053','刘振鑫','7b912a98bb5759da8b352c07f8df88c2','男','4004','15360500821','jujias0007','2853792728','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('332','4069','黄丹红','7b912a98bb5759da8b352c07f8df88c2','女','4004','15302487127','jujias400-520516','1993436985','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('333','4029','郑思华','bdde00fcecfa0427b8092f3bc683ef2e','女','4004','15338068536','jjs_516','1875753147','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('334','4043','卓川纯','e10adc3949ba59abbe56e057f20f883e','女','4004','15322365616','qq1875132535','1875132535','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('335','9103','刘裕锋','7b912a98bb5759da8b352c07f8df88c2','男','9006','13662345511','13662345511','2853792997','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('336','4005','郭璐','022b150ae5b6cbed66ae1201494bd24e','女','4005','15384435967','jjs_520516','982995639','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('337','4079','吴晓锋','7b912a98bb5759da8b352c07f8df88c2','男','4005','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('338','4074','林俊任','7b912a98bb5759da8b352c07f8df88c2','男','4005','15323375008','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('339','9111','庞莉','9f188076b20d02570418821b5f469b78','女','9006','15302458613','15302458613','2853792992','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('340','4008','陈旭忠','7b912a98bb5759da8b352c07f8df88c2','男','4005','18142830231','alex1924888700','1924888700','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('341','4052','尤秀珍','7b912a98bb5759da8b352c07f8df88c2','女','4005','15322081099','Y2485061681','2485061681','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('342','9112','董香云','7b912a98bb5759da8b352c07f8df88c2','女','9006','18889677950','dongnownow','2853792990','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('343','4055','詹小广','7b912a98bb5759da8b352c07f8df88c2','女','4005','15322006518','zhan66sunshine','2486249540','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('344','9113','陈泫枝','7b912a98bb5759da8b352c07f8df88c2','男','9006','13378488818','xam-1992','529538008','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('345','4056','陈思敏','7b912a98bb5759da8b352c07f8df88c2','女','4005','15360833632','JJS4056','2485057216','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('346','4061','陈长根','7b912a98bb5759da8b352c07f8df88c2','男','4005','15360475712','jujiashou_czg','2484938112','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('347','4064','程运','7b912a98bb5759da8b352c07f8df88c2','女','4005','15322023056','jujiashou15322023056','2484274435','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('348','4065','罗晓','7b912a98bb5759da8b352c07f8df88c2','女','4005','15322326700','jujiashou15322326700','1303409312','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('349','5002','况美涵','7b912a98bb5759da8b352c07f8df88c2','女','5000','15323305850','2629416448','2629416448','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('350','5006','朱运宗','7b912a98bb5759da8b352c07f8df88c2','男','5001','17727636686','jjs5006','3067212325','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('351','5008','冯肖','7b912a98bb5759da8b352c07f8df88c2','女','5001','15384438005','FX3351531385','3351531385','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('352','5009','黄彩凤','7b912a98bb5759da8b352c07f8df88c2','女','5001','15323331095','jjias6086','2583284586','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('353','1016','陈苑虹','7b912a98bb5759da8b352c07f8df88c2','女','5001','','','','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('354','5004','潘洁燕','7b912a98bb5759da8b352c07f8df88c2','女','5001','15384450831','p3282520270','3282520270','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('355','5005','陈燃','7b912a98bb5759da8b352c07f8df88c2','男','5001','15302226939','jjs-15302226933','2390008360','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('356','9104','肖艳飞','3f2be4909f33375e884d4545ef0b1198','女','9004','13068816830','13068816830','364309976','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('357','5007','陈锦清','7b912a98bb5759da8b352c07f8df88c2','女','5001','18142810859','jjs5007','2156757215','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('358','9105','杨琳','a9beda6748ea2e8eab3cc80a0c7225a5','女','9004','13826037746','13826037746','736349499','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('359','9302','黄海燕','1d6a46fc5300d2301b7543ea71d06517','女','9005','13570530663','love520hy88','2853792987','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('360','9303','肖燕','7b912a98bb5759da8b352c07f8df88c2','女','9005','15920441233','466210315','2853792995','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('361','9304','崔俊','ffd404b0b3b41b2ec6cd6a4dd87fa7df','女','9005','18320241777','765288088','3082983912','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('362','9301','江敏','1063fccac07d2662370126d337c4ac6c','女','9002','13229433488','13229433488','2853792993','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('363','9201','陈薪羽','0b117d9d2a1313ba56d7958a2d508c2c','女','9003','18613100382','591282913','2931143984','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('364','9202','梁美艳','67eaca8c5a32d0b82bf75e56b11e9aab','女','9003','13423518277','hg11318521','991294636','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('365','9203','罗美苑','1a8a7d9d7ed28fcf11fc3ec5b5d76c27','女','9003','13725138153','395486960','395486960','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('366','9401','李敏慧','e99a18c428cb38d5f260853678922e03','女','9004','13660202440','13660202440','2853792996','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('367','9402','钟旖卉','ea6813e4522d05d13c770be49bc0dc15','女','9004','15917441728','15917441728','2853792891','1');
insert into `hk_users`(`id`,`uid`,`name`,`password`,`sex`,`depa`,`phone`,`wechat`,`qq`,`state`) values('368','1000','KHIK','7b912a98bb5759da8b352c07f8df88c2','男','1000','','','','1');
