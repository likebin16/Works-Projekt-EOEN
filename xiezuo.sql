-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 03 月 28 日 15:25
-- 服务器版本: 5.5.47
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `xiezuo`
--

-- --------------------------------------------------------

--
-- 表的结构 `hk_admin`
--

CREATE TABLE IF NOT EXISTS `hk_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(4) NOT NULL COMMENT '工号',
  `depa` int(4) NOT NULL COMMENT '部门',
  `name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  `pawd` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `times` datetime NOT NULL COMMENT '时间',
  `flags` text CHARACTER SET utf8 NOT NULL COMMENT '权限',
  `state` int(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `hk_admin`
--

INSERT INTO `hk_admin` (`id`, `uid`, `depa`, `name`, `pawd`, `times`, `flags`, `state`) VALUES
(1, 1000, 1000, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-03-28 14:55:06', '1000,2000,3000,4000,5000', 1);

-- --------------------------------------------------------

--
-- 表的结构 `hk_assets`
--

CREATE TABLE IF NOT EXISTS `hk_assets` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `hk_assets`
--

INSERT INTO `hk_assets` (`id`, `stoid`, `stonm`, `stosl`, `stokc`, `stock`, `stobf`, `stoad`, `stote`) VALUES
(1, 'HK201702283790', '瘦客户机', 100, 97, 3, 0, '华科瘦客户机', '1'),
(2, 'HK201702285596', '显示器', 100, 99, 1, 0, 'HKC19.5显示器', '1'),
(3, 'HK201702286128', '台式机', 100, 0, 100, 0, '奔腾双核台式机', '1'),
(4, 'HK201702287206', '显示器', 100, 100, 0, 0, 'HKC显示器', '0');

-- --------------------------------------------------------

--
-- 表的结构 `hk_assig`
--

CREATE TABLE IF NOT EXISTS `hk_assig` (
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
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `hk_asslist`
--

CREATE TABLE IF NOT EXISTS `hk_asslist` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `zid` varchar(32) NOT NULL COMMENT '资产ID',
  `name` varchar(32) NOT NULL COMMENT '资产名称',
  `depa` varchar(32) NOT NULL COMMENT '登记部门',
  `user` varchar(32) NOT NULL COMMENT '使用人员',
  `time` datetime NOT NULL COMMENT '登记日期',
  `note` text NOT NULL COMMENT '资产备注',
  `state` int(4) NOT NULL COMMENT '资产状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `hk_depas`
--

CREATE TABLE IF NOT EXISTS `hk_depas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT '部门排序',
  `did` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT '部门ID',
  `sid` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT '上级部门',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '部门名称',
  `state` int(11) NOT NULL COMMENT '部门状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `hk_depas`
--

INSERT INTO `hk_depas` (`id`, `pid`, `did`, `sid`, `name`, `state`) VALUES
(1, '1', '1000', '', '财务部', 1),
(2, '2', '1001', '', '人事部', 1),
(3, '3', '1002', '', '行政部', 1);

-- --------------------------------------------------------

--
-- 表的结构 `hk_excel_data`
--

CREATE TABLE IF NOT EXISTS `hk_excel_data` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `hk_excel_title`
--

CREATE TABLE IF NOT EXISTS `hk_excel_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `mon_time` varchar(20) DEFAULT NULL COMMENT '月份',
  `content` text COMMENT '中文内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `hk_sqlbk`
--

CREATE TABLE IF NOT EXISTS `hk_sqlbk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '名字',
  `time` datetime NOT NULL COMMENT '时间',
  `data` varchar(32) NOT NULL COMMENT '大小',
  `user` varchar(32) NOT NULL COMMENT '操作员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `hk_sudo`
--

CREATE TABLE IF NOT EXISTS `hk_sudo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT '管理组ID',
  `name` varchar(32) NOT NULL COMMENT '管理组名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `hk_sudo`
--

INSERT INTO `hk_sudo` (`id`, `sid`, `name`) VALUES
(1, 1000, '人事管理'),
(2, 2000, '部门管理'),
(3, 3000, '财务管理'),
(4, 4000, '资产管理'),
(5, 5000, '后台管理');

-- --------------------------------------------------------

--
-- 表的结构 `hk_users`
--

CREATE TABLE IF NOT EXISTS `hk_users` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `hk_users`
--

INSERT INTO `hk_users` (`id`, `uid`, `name`, `password`, `sex`, `depa`, `phone`, `wechat`, `qq`, `state`) VALUES
(1, 1000, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '男', '1000', '13800138000', '13800138000', '1172007555', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
