/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50605
Source Host           : localhost:3306
Source Database       : codegen

Target Server Type    : MYSQL
Target Server Version : 50605
File Encoding         : 65001

Date: 2019-11-20 11:32:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `export_excel` char(1) DEFAULT '0' COMMENT '导出Excel（0：否；1：是）',
  `default_sort_field` varchar(50) DEFAULT NULL COMMENT '默认排序字段',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `reference_table` varchar(200) DEFAULT NULL COMMENT '关联的表名',
  `reference_entity` varchar(200) DEFAULT NULL COMMENT '关联的实体名',
  `reference_field` varchar(200) DEFAULT NULL COMMENT '关联字段|显示字段',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0542b4ebefc44adfa91a6c14a16dd261', '7', '木门', 'product_type', '木门', '7', '0', '1', '2018-02-02 13:31:36', '1', '2018-02-02 14:45:11', '', '0');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18eee7ee26ba4f3e9a832db22bbd290d', '1', '公司产品', 'data_type', '公司产品', '10', '0', '1', '2018-01-16 11:47:32', '1', '2018-02-02 13:19:37', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('1afc5b26dc5f4172ba98f065a6a762ae', '3', '萤石', 'brand', 'brand', '10', '0', '1', '2017-12-19 11:34:43', '1', '2017-12-19 11:34:43', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('200', '0', '女', 'sys_user_sex', '性别', '1', '0', '1', '2017-05-01 00:00:00', '1', '2017-05-01 00:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('201', '1', '男', 'sys_user_sex', '性别', '2', '0', '1', '2017-05-01 00:00:00', '1', '2017-05-01 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('20afa52583b2481eade56e315fcbf6b5', '1', '文章链接', 'link_type', '文章链接', '10', '0', '1', '2018-01-10 20:46:05', '1', '2018-01-10 20:46:05', '', '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2c6350dd3ad6467e878e738d1c2be6dc', '3', '行业动态', 'titile_type', '行业动态', '10', '0', '1', '2018-01-10 16:43:26', '1', '2018-01-10 16:43:26', '', '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('300', '0', '否', 'index_recommend', '是否首页推荐', '10', '0', '1', '2015-12-01 00:00:00', '1', '2018-01-01 00:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('301', '1', '是', 'index_recommend', '是否首页推荐', '100', '0', '1', '2011-11-11 00:00:00', '1', '2011-11-12 00:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('344eeba423474b8dbf60ed04829c656c', '3', '加盟', 'guestbook_type', '加密', '10', '0', '1', '2018-01-17 18:36:07', '1', '2018-01-17 18:54:14', '', '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3dca48b2e1fe4a71baae40771a131b7f', '1', '留言', 'guestbook_type', '留言', '10', '0', '1', '2018-01-17 18:34:24', '1', '2018-01-17 18:34:24', '', '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('426cd7f8e9d9482e802e0bddcb44d81b', '2', '技术资讯', 'titile_type', '技术资讯', '10', '0', '1', '2018-01-10 16:42:58', '1', '2018-01-10 16:42:58', '', '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('4c0d582798744c83b8c1b38af59ed614', '4', '中安消', 'brand', 'brand', '10', '0', '1', '2017-12-19 11:35:11', '1', '2017-12-19 11:35:11', '', '0');
INSERT INTO `sys_dict` VALUES ('4f56e5dcb0c2421db6f906cb6944133a', '2', '乐橙', 'brand', 'brand', '10', '0', '1', '2017-12-19 11:33:55', '1', '2017-12-19 11:33:55', '', '0');
INSERT INTO `sys_dict` VALUES ('4fe0be475176466eb825f218032f811d', '6', '产品选材', 'titile_type', '产品选材', '10', '0', '1', '2018-01-28 22:53:47', '1', '2018-01-28 22:53:47', '', '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('500', 'com.thinkgem.jeesite.modules.column2.entity.WbColumn', 'WbColumn', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('50a33aa541b54ee2b98bbecc76109329', '1', '系统变量', 'home_config', '系统变量', '10', '0', '1', '2018-02-03 19:26:25', '1', '2018-02-03 19:26:25', '系统变量', '1');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('611401d0177d4c80bbd347555e0076f0', '5', '定制攻略', 'titile_type', '定制攻略', '10', '0', '1', '2018-01-28 22:53:21', '1', '2018-01-28 22:53:21', '', '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('662b6c636b174547880822fda3804d24', '3', '顾客案列', 'data_type', '顾客案列', '10', '0', '1', '2018-01-16 11:48:50', '1', '2018-02-02 13:20:28', '', '1');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7027a0c3e389441b97722c206cd1fb9d', '9', '公司介绍', 'titile_type', '公司介绍', '10', '0', '1', '2018-02-01 22:23:16', '1', '2018-02-01 22:23:16', '', '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('816de7641e17412781bd907eabc80faf', '6', '原木宅配', 'product_type', '原木宅配', '6', '0', '1', '2018-02-02 13:31:14', '1', '2018-02-02 14:44:57', '', '0');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9415c6bf9873435cb6f3a6fa756cc687', '1', '公司新闻', 'titile_type', '公司新闻', '10', '0', '1', '2018-01-10 16:41:55', '1', '2018-01-10 16:41:55', '', '0');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('98079312299640bd95b2d013dac3aa25', '10', '家居知识', 'titile_type', '家居知识', '10', '0', '1', '2018-02-05 17:11:53', '1', '2018-02-05 17:11:53', '', '0');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9da7b19f4052477985ff333c0d976099', '5', '鞋柜浴室柜', 'product_type', '鞋柜浴室柜', '5', '0', '1', '2018-02-02 13:30:30', '1', '2018-02-02 14:44:45', '', '0');
INSERT INTO `sys_dict` VALUES ('9e99060761244840a15648931c22d21a', '0', '全部', 'sex', '性别', '10', '0', '1', '2018-03-27 10:18:25', '1', '2018-03-27 10:18:25', '', '0');
INSERT INTO `sys_dict` VALUES ('9fb2e54a7b984a6db26fb45e550fe301', '2', '公司案列', 'data_type', '公司案列', '10', '0', '1', '2018-01-16 11:47:53', '1', '2018-02-02 13:20:07', '', '0');
INSERT INTO `sys_dict` VALUES ('a6021a807f3f4ff99ae9e0822eca9919', '8', '新闻动态', 'titile_type', '新闻动态', '10', '0', '1', '2018-02-01 21:36:03', '1', '2018-02-01 21:36:19', '', '0');
INSERT INTO `sys_dict` VALUES ('b6d2afb3d4b44cd99a8772318846f6fb', '2', '预约', 'guestbook_type', '预约', '10', '0', '1', '2018-01-17 18:35:44', '1', '2018-01-17 18:35:44', '', '0');
INSERT INTO `sys_dict` VALUES ('bd179ce2db0246a6a1235676157ba7b1', '1', '系统变量', 'home_config', '系统变量', '10', '0', '1', '2018-02-03 19:26:25', '1', '2018-02-03 19:26:25', '系统变量', '0');
INSERT INTO `sys_dict` VALUES ('c05ee8d17b254e92ba691e6e0e2404df', '2', '整体橱柜', 'product_type', '整体橱柜', '2', '0', '1', '2018-02-02 13:21:34', '1', '2018-02-02 14:44:07', '', '0');
INSERT INTO `sys_dict` VALUES ('c2072578698d44b982a86afe142bbad7', '3', '智能门锁', 'deviceType', 'deviceType', '10', '0', '1', '2017-12-19 11:56:33', '1', '2017-12-19 11:56:33', '', '0');
INSERT INTO `sys_dict` VALUES ('c260fff8c0564d8c9b2cf247e743a70f', '1', '看护监控', 'deviceType', 'deviceType', '10', '0', '1', '2017-12-19 11:54:41', '1', '2017-12-19 11:54:41', '', '0');
INSERT INTO `sys_dict` VALUES ('c8883d01c4b841c4a4eadf9b4450fecd', '3', '衣柜移门', 'product_type', '衣柜移门', '3', '0', '1', '2018-02-02 13:24:50', '1', '2018-02-02 14:44:20', '', '0');
INSERT INTO `sys_dict` VALUES ('cbf7b86d516d415d9a7cfc92b22ecacd', '4', '报名', 'guestbook_type', '报名', '10', '0', '1', '2018-01-17 18:36:31', '1', '2018-01-17 18:36:31', '', '0');
INSERT INTO `sys_dict` VALUES ('ce135b2a94704f9fbe498feed3c9be41', '2', '站点配置', 'home_config', '站点配置', '20', '0', '1', '2018-02-03 19:27:15', '1', '2018-02-03 19:27:15', '站点配置', '0');
INSERT INTO `sys_dict` VALUES ('d5dac464f54d4d77a547feb1e5204596', '1', '是', 'whether', '是否', '10', '0', '1', '2017-10-10 15:10:08', '1', '2017-10-10 15:10:08', '', '0');
INSERT INTO `sys_dict` VALUES ('d7df5d31cc2b4852919a47a5d5617c4a', '1', '整体衣柜', 'product_type', '整体衣柜', '1', '0', '1', '2018-02-02 13:14:59', '1', '2018-02-02 14:43:51', '', '0');
INSERT INTO `sys_dict` VALUES ('d94c1d56fc8d4f50bee7b12777d35d72', '2', '友情链接', 'link_type', '友情链接', '10', '0', '1', '2018-01-10 20:46:37', '1', '2018-01-10 20:46:37', '', '0');
INSERT INTO `sys_dict` VALUES ('d9faa03d42004b5cb92d7be9c001f876', '3', '服务范围', 'data_type', '服务范围', '10', '0', '1', '2018-01-16 11:49:11', '1', '2018-02-05 00:13:24', '', '0');
INSERT INTO `sys_dict` VALUES ('dc877efc82c74822865c555846fc94f8', '1', '沃塔', 'brand', 'brand', '10', '0', '1', '2017-12-19 11:32:13', '1', '2017-12-19 11:32:13', '', '0');
INSERT INTO `sys_dict` VALUES ('dff26d88fc5c4167aec2b132c2357688', '4', '酒馆书柜', 'product_type', '酒馆书柜', '4', '0', '1', '2018-02-02 13:27:28', '1', '2018-02-02 14:44:33', '', '0');
INSERT INTO `sys_dict` VALUES ('e6aa4621f79a4db88974042c1808fc1e', '0', '否', 'whether', '是否', '10', '0', '1', '2017-10-10 15:10:31', '1', '2017-10-10 15:10:31', '', '0');
INSERT INTO `sys_dict` VALUES ('ebd68845c9d44453943aaeb7fc82123b', '4', '公司活动', 'titile_type', '公司活动', '10', '0', '1', '2018-01-10 16:43:50', '1', '2018-01-10 16:43:50', '', '0');
INSERT INTO `sys_dict` VALUES ('f192d85f9d464bef9ed861bea34c70f2', '2', '安全报警', 'deviceType', 'deviceType', '10', '0', '1', '2017-12-19 11:55:14', '1', '2017-12-19 11:55:14', '', '0');
INSERT INTO `sys_dict` VALUES ('f36c8af9c08f4037bf49cf7e99b602a4', '7', '行业风水', 'titile_type', '行业风水', '10', '0', '1', '2018-01-28 22:54:10', '1', '2018-01-28 22:54:10', '', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('015b995d13b44dbe98eccb7d2af2f532', '1', '代码生成-代码生成-业务表配置', '1', '2019-11-20 11:29:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('0fc7826f18544379944da7fba3e6f474', '1', '我的面板-个人信息-个人信息', '1', '2019-11-20 11:31:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('1a98abe1ab7f48a2b1deaca7b18a7a86', '1', '我的面板-个人信息-个人信息', '1', '2019-11-20 11:29:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('3069495e0e984fc89f642f6f80b40214', '1', '我的面板-个人信息-个人信息', '1', '2019-11-20 11:30:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('5092ce95ccc74ef4b62b6ac58952ae9c', '1', '代码生成-代码生成-生成方案配置', '1', '2019-11-20 11:31:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('5ee98f10c5a342d0b4c044ce6248391f', '1', '代码生成-代码生成-生成方案配置', '1', '2019-11-20 11:30:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('7d1cbbee01a643f3b4b42d80e470cbc1', '1', '代码生成-代码生成-业务表配置', '1', '2019-11-20 11:31:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('8edd54f8b1464b8f940f7a111535ba1f', '1', '代码生成-代码生成-业务表配置', '1', '2019-11-20 11:30:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('9525abf2b05a44b4ad16886c27bdc95b', '1', '我的面板-个人信息-修改密码', '1', '2019-11-20 11:30:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('b9714dd4ec85432998c028d673eb3674', '1', '我的面板-个人信息-修改密码', '1', '2019-11-20 11:29:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_1', '');

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('008463262e3d40eca77a386e4a996e85', 'fd2f49cf9b944b4f8e0183e8f9e450f9', '0,1,40c0aeff28ef44ea86f5c9947de57737,c443efbd16a14b3d82723d39c027693f,fd2f49cf9b944b4f8e0183e8f9e450f9,', '编辑', '60', '', '', '', '0', 'column2:wbColumn:edit', '1', '2018-01-08 21:01:59', '1', '2018-01-08 21:08:12', '', '1');
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '0', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0cc1b02824cc48b5969e1b60611e2b0a', '9d45e45c753e492b9f35152101d36377', '0,1,40c0aeff28ef44ea86f5c9947de57737,df26e801cc1446b1aaffe558f1b8394f,9d45e45c753e492b9f35152101d36377,', '编辑', '60', '', '', '', '0', 'wb:wbConfig:edit', '1', '2018-01-10 00:35:48', '1', '2018-01-10 00:41:22', '', '1');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15f002dcfc9a415aae219ecddce85d4b', '36521e7375854c7d8123108332192c9d', '0,1,40c0aeff28ef44ea86f5c9947de57737,275150f7c18542ec9d51f1328ce9ab4c,36521e7375854c7d8123108332192c9d,', '查看', '30', '', '', '', '0', 'fuwenben:wbProductCopy:view', '1', '2018-01-30 18:00:40', '1', '2018-01-30 18:00:40', '', '1');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('1721bdc41aff4aca963261876249b8a9', 'fd2f49cf9b944b4f8e0183e8f9e450f9', '0,1,40c0aeff28ef44ea86f5c9947de57737,c443efbd16a14b3d82723d39c027693f,fd2f49cf9b944b4f8e0183e8f9e450f9,', '查看', '30', '', '', '', '0', 'column2:wbColumn:view', '1', '2018-01-08 20:44:08', '1', '2018-01-08 21:07:44', '', '1');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('1914c71de6ae4425ae98c74798df709b', 'ea551c8a81ce418aa15449c8f06febd1', '0,1,40c0aeff28ef44ea86f5c9947de57737,c443efbd16a14b3d82723d39c027693f,ea551c8a81ce418aa15449c8f06febd1,', '编辑', '60', '', '', '', '0', 'wb:wbColumn:edit', '1', '2018-01-09 11:48:41', '1', '2018-01-09 17:48:11', '', '1');
INSERT INTO `sys_menu` VALUES ('19763da9094d479b9db36e949de52e8c', 'ea551c8a81ce418aa15449c8f06febd1', '0,1,40c0aeff28ef44ea86f5c9947de57737,c443efbd16a14b3d82723d39c027693f,ea551c8a81ce418aa15449c8f06febd1,', '查看', '30', '', '', '', '0', 'wb:wbColumn:view', '1', '2018-01-09 11:47:24', '1', '2018-01-09 17:47:52', '', '1');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('216e9d552071458baab95a449db253c0', '275150f7c18542ec9d51f1328ce9ab4c', '0,1,40c0aeff28ef44ea86f5c9947de57737,275150f7c18542ec9d51f1328ce9ab4c,', '产品案列列表', '30', '/wb/wbProduct/list', '', 'th-list', '1', 'wb:wbProduct:view', '1', '2018-01-16 11:29:33', '1', '2018-01-16 11:29:33', '', '1');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('275150f7c18542ec9d51f1328ce9ab4c', '40c0aeff28ef44ea86f5c9947de57737', '0,1,40c0aeff28ef44ea86f5c9947de57737,', '产品案列管理', '210', '', '', '', '1', '', '1', '2018-01-16 11:28:45', '1', '2018-01-16 11:28:45', '', '1');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('298d4f6865c14523814d0fb3a610f737', '40c0aeff28ef44ea86f5c9947de57737', '0,1,40c0aeff28ef44ea86f5c9947de57737,', '链接管理', '180', '', '', '', '1', '', '1', '2018-01-10 20:50:49', '1', '2018-01-10 20:50:49', '', '1');
INSERT INTO `sys_menu` VALUES ('2a18e1c7cda845288a6906f20ce2a2b5', 'fa34191f15b74f4aa56cdad5893e9ae8', '0,1,40c0aeff28ef44ea86f5c9947de57737,298d4f6865c14523814d0fb3a610f737,fa34191f15b74f4aa56cdad5893e9ae8,', '查看', '30', '', '', '', '0', 'wb:wbLink:view', '1', '2018-01-10 20:51:54', '1', '2018-01-10 20:51:54', '', '1');
INSERT INTO `sys_menu` VALUES ('2a9205a2effa4901a766fff7bd32dbc0', '216e9d552071458baab95a449db253c0', '0,1,40c0aeff28ef44ea86f5c9947de57737,275150f7c18542ec9d51f1328ce9ab4c,216e9d552071458baab95a449db253c0,', '编辑', '60', '', '', '', '0', 'wb:wbProduct:edit', '1', '2018-01-16 11:30:48', '1', '2018-01-16 11:30:48', '', '1');
INSERT INTO `sys_menu` VALUES ('2fb9d99c85274a6283456b394bf7f358', 'bf04adc2516640d08844017325b8a748', '0,1,40c0aeff28ef44ea86f5c9947de57737,bf04adc2516640d08844017325b8a748,', '幻灯片数据管理', '60', '/wb/wbSlideData/list', '', '', '1', 'wb:wbSlideData:view', '1', '2018-01-10 00:03:00', '1', '2018-01-10 00:03:00', '', '1');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', '', '', '', '0', '', '1', '2013-05-27 08:00:00', '1', '2017-01-17 11:24:04', '', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('354d42d42ae3406d83b18a5d8d911beb', 'bf04adc2516640d08844017325b8a748', '0,1,40c0aeff28ef44ea86f5c9947de57737,bf04adc2516640d08844017325b8a748,', '幻灯片类型', '30', '/wb/wbSlide/list', '', '', '1', 'wb:wbSlide:view', '1', '2018-01-08 00:35:30', '1', '2018-01-08 23:36:54', '', '1');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36521e7375854c7d8123108332192c9d', '275150f7c18542ec9d51f1328ce9ab4c', '0,1,40c0aeff28ef44ea86f5c9947de57737,275150f7c18542ec9d51f1328ce9ab4c,', '富文本测试', '60', '/fuwenben/wbProductCopy/list', '', '', '1', 'fuwenben:wbProductCopy:view', '1', '2018-01-30 17:53:16', '1', '2018-01-30 17:53:16', '', '1');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '0', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40c0aeff28ef44ea86f5c9947de57737', '1', '0,1,', '官网配置', '5030', '', '', '', '1', '', '1', '2017-09-25 20:51:36', '1', '2018-01-10 00:33:52', '', '1');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5474fad107e14d4994128d41303ce4d0', '9eef1909280740d682db48ad79352406', '0,1,40c0aeff28ef44ea86f5c9947de57737,9eef1909280740d682db48ad79352406,', '站点留言记录', '30', '/wb/wbGuestbook/list', '', '', '1', 'wb:wbGuestbook:view', '1', '2018-01-10 00:42:42', '1', '2018-01-10 00:47:57', '', '1');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', '', '', '', '0', '', '1', '2013-05-27 08:00:00', '1', '2017-01-17 11:23:54', '', '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', null, 'leaf', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', null, null, null, '0', 'oa:leave:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', null, null, null, '0', 'oa:leave:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6e1d50330c724f45977c09704de3128d', '40c0aeff28ef44ea86f5c9947de57737', '0,1,40c0aeff28ef44ea86f5c9947de57737,', '文章管理', '150', '', '', '', '1', '', '1', '2018-01-10 15:25:50', '1', '2018-01-10 15:25:50', '', '1');
INSERT INTO `sys_menu` VALUES ('6f814b5e0067420ab3f7c2bccb70afc5', '216e9d552071458baab95a449db253c0', '0,1,40c0aeff28ef44ea86f5c9947de57737,275150f7c18542ec9d51f1328ce9ab4c,216e9d552071458baab95a449db253c0,', '查看', '30', '', '', '', '0', 'wb:wbProduct:view', '1', '2018-01-16 11:30:20', '1', '2018-01-16 11:30:20', '', '1');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', null, 'road', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', null, 'road', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2013-09-20 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', null, 'tasks', '1', null, '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', '', '', '', '1', '', '1', '2013-10-16 08:00:00', '1', '2017-12-26 17:57:58', '', '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('98353affcafa4ee9b5c5323c73e92c44', '36521e7375854c7d8123108332192c9d', '0,1,40c0aeff28ef44ea86f5c9947de57737,275150f7c18542ec9d51f1328ce9ab4c,36521e7375854c7d8123108332192c9d,', '编辑', '60', '', '', '', '0', 'fuwenben:wbProductCopy:edit', '1', '2018-01-30 18:01:06', '1', '2018-01-30 18:01:06', '', '1');
INSERT INTO `sys_menu` VALUES ('9d45e45c753e492b9f35152101d36377', 'df26e801cc1446b1aaffe558f1b8394f', '0,1,40c0aeff28ef44ea86f5c9947de57737,df26e801cc1446b1aaffe558f1b8394f,', '站点配置', '30', '/wb/wbConfig/list', '', '', '1', 'wb:wbConfig:view', '1', '2018-01-10 00:35:03', '1', '2018-01-10 00:35:03', '', '1');
INSERT INTO `sys_menu` VALUES ('9eef1909280740d682db48ad79352406', '40c0aeff28ef44ea86f5c9947de57737', '0,1,40c0aeff28ef44ea86f5c9947de57737,', '留言管理', '120', '', '', '', '1', '', '1', '2018-01-10 00:41:56', '1', '2018-01-10 00:41:56', '', '1');
INSERT INTO `sys_menu` VALUES ('aadd32883f6d498595b9ea635f7bb5f5', 'c88934a678e44aa0a65b442b7918a4f1', '0,1,40c0aeff28ef44ea86f5c9947de57737,6e1d50330c724f45977c09704de3128d,c88934a678e44aa0a65b442b7918a4f1,', '查看', '30', '', '', '', '0', 'wb:wbArticle:view', '1', '2018-01-10 15:27:15', '1', '2018-01-10 15:27:15', '', '1');
INSERT INTO `sys_menu` VALUES ('ad08aea76278408392791662f4d6741f', 'c88934a678e44aa0a65b442b7918a4f1', '0,1,40c0aeff28ef44ea86f5c9947de57737,6e1d50330c724f45977c09704de3128d,c88934a678e44aa0a65b442b7918a4f1,', '编辑', '60', '', '', '', '0', 'wb:wbArticle:edit', '1', '2018-01-10 15:27:35', '1', '2018-01-10 15:27:35', '', '1');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '0', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b7c6a65eff12437ca8b7379d99ed8035', '5474fad107e14d4994128d41303ce4d0', '0,1,40c0aeff28ef44ea86f5c9947de57737,9eef1909280740d682db48ad79352406,5474fad107e14d4994128d41303ce4d0,', '编辑', '60', '', '', '', '0', 'wb:wbGuestbook:edit', '1', '2018-01-10 00:44:38', '1', '2018-01-10 00:48:30', '', '1');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('bdf3d91dee9c49f6b26edc842acf696a', '9d45e45c753e492b9f35152101d36377', '0,1,40c0aeff28ef44ea86f5c9947de57737,df26e801cc1446b1aaffe558f1b8394f,9d45e45c753e492b9f35152101d36377,', '查看', '30', '', '', '', '0', 'wb:wbConfig:view', '1', '2018-01-10 00:35:27', '1', '2018-01-10 00:35:27', '', '1');
INSERT INTO `sys_menu` VALUES ('bf04adc2516640d08844017325b8a748', '40c0aeff28ef44ea86f5c9947de57737', '0,1,40c0aeff28ef44ea86f5c9947de57737,', '幻灯片管理', '60', '', '', '', '1', '', '1', '2018-01-08 23:06:48', '1', '2018-01-08 23:06:48', '', '1');
INSERT INTO `sys_menu` VALUES ('c2abb39fdc004ff9b31a332801773555', '5474fad107e14d4994128d41303ce4d0', '0,1,40c0aeff28ef44ea86f5c9947de57737,9eef1909280740d682db48ad79352406,5474fad107e14d4994128d41303ce4d0,', '查看', '30', '', '', '', '0', 'wb:wbGuestbook:view', '1', '2018-01-10 00:43:38', '1', '2018-01-10 00:48:15', '', '1');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c443efbd16a14b3d82723d39c027693f', '40c0aeff28ef44ea86f5c9947de57737', '0,1,40c0aeff28ef44ea86f5c9947de57737,', '栏目管理', '60', '', '', '', '1', '', '1', '2018-01-08 18:07:31', '1', '2018-01-08 21:06:29', '', '1');
INSERT INTO `sys_menu` VALUES ('c88934a678e44aa0a65b442b7918a4f1', '6e1d50330c724f45977c09704de3128d', '0,1,40c0aeff28ef44ea86f5c9947de57737,6e1d50330c724f45977c09704de3128d,', '文章列表', '30', '/wb/wbArticle/list', '', 'th-list', '1', 'wb:wbArticle:view', '1', '2018-01-10 15:26:43', '1', '2018-01-10 15:26:43', '', '1');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('dae6362e44cd47e88bdcda523dd9c561', '2fb9d99c85274a6283456b394bf7f358', '0,1,40c0aeff28ef44ea86f5c9947de57737,bf04adc2516640d08844017325b8a748,2fb9d99c85274a6283456b394bf7f358,', '编辑', '60', '', '', '', '0', 'wb:wbSlideData:edit', '1', '2018-01-10 00:04:55', '1', '2018-01-10 00:08:27', '', '1');
INSERT INTO `sys_menu` VALUES ('df26e801cc1446b1aaffe558f1b8394f', '40c0aeff28ef44ea86f5c9947de57737', '0,1,40c0aeff28ef44ea86f5c9947de57737,', '站点管理', '90', '', '', '', '1', '', '1', '2018-01-10 00:34:12', '1', '2018-01-10 00:34:12', '', '1');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ea551c8a81ce418aa15449c8f06febd1', 'c443efbd16a14b3d82723d39c027693f', '0,1,40c0aeff28ef44ea86f5c9947de57737,c443efbd16a14b3d82723d39c027693f,', '栏目列表', '120', '/wb/wbColumn/list', '', '', '1', 'wb:wbColumn:view', '1', '2018-01-09 11:22:36', '1', '2018-01-09 17:47:27', '', '1');
INSERT INTO `sys_menu` VALUES ('ecdc0f5e7e964ef5914b69d3fa4021c7', '354d42d42ae3406d83b18a5d8d911beb', '0,1,40c0aeff28ef44ea86f5c9947de57737,bf04adc2516640d08844017325b8a748,354d42d42ae3406d83b18a5d8d911beb,', '查看', '30', '', '', '', '0', 'wb:wbSlide:view', '1', '2018-01-08 22:58:03', '1', '2018-01-08 22:58:03', '', '1');
INSERT INTO `sys_menu` VALUES ('f47596e71955477fab8eac957ef25885', '354d42d42ae3406d83b18a5d8d911beb', '0,1,40c0aeff28ef44ea86f5c9947de57737,bf04adc2516640d08844017325b8a748,354d42d42ae3406d83b18a5d8d911beb,', '编辑', '60', '', '', '', '0', 'wb:wbSlide:edit', '1', '2018-01-08 22:59:33', '1', '2018-01-08 22:59:33', '', '1');
INSERT INTO `sys_menu` VALUES ('f4a1406af7874212a8c90c3afeef7ba6', '2fb9d99c85274a6283456b394bf7f358', '0,1,40c0aeff28ef44ea86f5c9947de57737,bf04adc2516640d08844017325b8a748,2fb9d99c85274a6283456b394bf7f358,', '查看', '30', '', '', '', '0', 'wb:wbSlideData:view', '1', '2018-01-10 00:03:51', '1', '2018-01-10 00:07:16', '', '1');
INSERT INTO `sys_menu` VALUES ('f90d391d4243460eb301b06af7d5bdc6', 'fa34191f15b74f4aa56cdad5893e9ae8', '0,1,40c0aeff28ef44ea86f5c9947de57737,298d4f6865c14523814d0fb3a610f737,fa34191f15b74f4aa56cdad5893e9ae8,', '编辑', '60', '', '', '', '0', 'wb:wbLink:edit', '1', '2018-01-10 20:52:17', '1', '2018-01-10 20:52:17', '', '1');
INSERT INTO `sys_menu` VALUES ('fa34191f15b74f4aa56cdad5893e9ae8', '298d4f6865c14523814d0fb3a610f737', '0,1,40c0aeff28ef44ea86f5c9947de57737,298d4f6865c14523814d0fb3a610f737,', '链接列表', '30', '/wb/wbLink/list', '', '', '1', 'wb:wbLink:view', '1', '2018-01-10 20:51:30', '1', '2018-01-10 20:51:30', '', '1');
INSERT INTO `sys_menu` VALUES ('fd2f49cf9b944b4f8e0183e8f9e450f9', 'c443efbd16a14b3d82723d39c027693f', '0,1,40c0aeff28ef44ea86f5c9947de57737,c443efbd16a14b3d82723d39c027693f,', '栏目列表', '90', '/column2/wbColumn/list', '', 'th-list', '1', 'column2:wbColumn:view', '1', '2018-01-08 21:07:17', '1', '2018-01-08 21:07:17', '', '1');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', 'XXX网络科技有限公司', '10', '1', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2019-11-20 10:45:39', '', '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2b41dd73b35345b1a2eba7a01c566875', '4', '0,1,4,', '代理商', '30', '1', '100006', '2', '2', '', '', '', '', '', '', '1', '4', '4', '7acdfd7c7d7845089d284648305fe3db', '2017-10-13 17:15:19', '7acdfd7c7d7845089d284648305fe3db', '2017-10-13 17:16:12', '', '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '5', '系统管理员', 'dept', 'assignment', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-02-05 11:54:26', '', '0');
INSERT INTO `sys_role` VALUES ('2', '5', '公司管理员', 'hr', 'assignment', '2', '1', '1', '1', '2013-05-27 08:00:00', '1', '2017-01-17 11:20:37', '', '0');
INSERT INTO `sys_role` VALUES ('3', '5', '本公司管理员', 'a', 'assignment', '3', '0', '1', '1', '2013-05-27 08:00:00', '1', '2018-02-02 19:39:20', '', '0');
INSERT INTO `sys_role` VALUES ('4', '5', '部门管理员', 'b', 'assignment', '4', '1', '1', '1', '2013-05-27 08:00:00', '1', '2017-01-17 11:20:02', '', '0');
INSERT INTO `sys_role` VALUES ('5', '5', '本部门管理员', 'c', 'assignment', '5', '1', '1', '1', '2013-05-27 08:00:00', '1', '2017-01-17 11:19:33', '', '0');
INSERT INTO `sys_role` VALUES ('6', '5', '普通用户', 'd', 'assignment', '8', '0', '1', '1', '2013-05-27 08:00:00', '1', '2017-10-18 10:53:11', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '0cc1b02824cc48b5969e1b60611e2b0a');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '1914c71de6ae4425ae98c74798df709b');
INSERT INTO `sys_role_menu` VALUES ('1', '19763da9094d479b9db36e949de52e8c');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '216e9d552071458baab95a449db253c0');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '275150f7c18542ec9d51f1328ce9ab4c');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '298d4f6865c14523814d0fb3a610f737');
INSERT INTO `sys_role_menu` VALUES ('1', '2a18e1c7cda845288a6906f20ce2a2b5');
INSERT INTO `sys_role_menu` VALUES ('1', '2a9205a2effa4901a766fff7bd32dbc0');
INSERT INTO `sys_role_menu` VALUES ('1', '2fb9d99c85274a6283456b394bf7f358');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '354d42d42ae3406d83b18a5d8d911beb');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40c0aeff28ef44ea86f5c9947de57737');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '5474fad107e14d4994128d41303ce4d0');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '6e1d50330c724f45977c09704de3128d');
INSERT INTO `sys_role_menu` VALUES ('1', '6f814b5e0067420ab3f7c2bccb70afc5');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '9d45e45c753e492b9f35152101d36377');
INSERT INTO `sys_role_menu` VALUES ('1', '9eef1909280740d682db48ad79352406');
INSERT INTO `sys_role_menu` VALUES ('1', 'aadd32883f6d498595b9ea635f7bb5f5');
INSERT INTO `sys_role_menu` VALUES ('1', 'ad08aea76278408392791662f4d6741f');
INSERT INTO `sys_role_menu` VALUES ('1', 'b7c6a65eff12437ca8b7379d99ed8035');
INSERT INTO `sys_role_menu` VALUES ('1', 'bdf3d91dee9c49f6b26edc842acf696a');
INSERT INTO `sys_role_menu` VALUES ('1', 'bf04adc2516640d08844017325b8a748');
INSERT INTO `sys_role_menu` VALUES ('1', 'c2abb39fdc004ff9b31a332801773555');
INSERT INTO `sys_role_menu` VALUES ('1', 'c443efbd16a14b3d82723d39c027693f');
INSERT INTO `sys_role_menu` VALUES ('1', 'c88934a678e44aa0a65b442b7918a4f1');
INSERT INTO `sys_role_menu` VALUES ('1', 'dae6362e44cd47e88bdcda523dd9c561');
INSERT INTO `sys_role_menu` VALUES ('1', 'df26e801cc1446b1aaffe558f1b8394f');
INSERT INTO `sys_role_menu` VALUES ('1', 'ea551c8a81ce418aa15449c8f06febd1');
INSERT INTO `sys_role_menu` VALUES ('1', 'ecdc0f5e7e964ef5914b69d3fa4021c7');
INSERT INTO `sys_role_menu` VALUES ('1', 'f47596e71955477fab8eac957ef25885');
INSERT INTO `sys_role_menu` VALUES ('1', 'f4a1406af7874212a8c90c3afeef7ba6');
INSERT INTO `sys_role_menu` VALUES ('1', 'f90d391d4243460eb301b06af7d5bdc6');
INSERT INTO `sys_role_menu` VALUES ('1', 'fa34191f15b74f4aa56cdad5893e9ae8');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '85');
INSERT INTO `sys_role_menu` VALUES ('3', '0cc1b02824cc48b5969e1b60611e2b0a');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '15f002dcfc9a415aae219ecddce85d4b');
INSERT INTO `sys_role_menu` VALUES ('3', '1914c71de6ae4425ae98c74798df709b');
INSERT INTO `sys_role_menu` VALUES ('3', '19763da9094d479b9db36e949de52e8c');
INSERT INTO `sys_role_menu` VALUES ('3', '216e9d552071458baab95a449db253c0');
INSERT INTO `sys_role_menu` VALUES ('3', '275150f7c18542ec9d51f1328ce9ab4c');
INSERT INTO `sys_role_menu` VALUES ('3', '298d4f6865c14523814d0fb3a610f737');
INSERT INTO `sys_role_menu` VALUES ('3', '2a18e1c7cda845288a6906f20ce2a2b5');
INSERT INTO `sys_role_menu` VALUES ('3', '2a9205a2effa4901a766fff7bd32dbc0');
INSERT INTO `sys_role_menu` VALUES ('3', '2fb9d99c85274a6283456b394bf7f358');
INSERT INTO `sys_role_menu` VALUES ('3', '354d42d42ae3406d83b18a5d8d911beb');
INSERT INTO `sys_role_menu` VALUES ('3', '36521e7375854c7d8123108332192c9d');
INSERT INTO `sys_role_menu` VALUES ('3', '40c0aeff28ef44ea86f5c9947de57737');
INSERT INTO `sys_role_menu` VALUES ('3', '5474fad107e14d4994128d41303ce4d0');
INSERT INTO `sys_role_menu` VALUES ('3', '6e1d50330c724f45977c09704de3128d');
INSERT INTO `sys_role_menu` VALUES ('3', '6f814b5e0067420ab3f7c2bccb70afc5');
INSERT INTO `sys_role_menu` VALUES ('3', '98353affcafa4ee9b5c5323c73e92c44');
INSERT INTO `sys_role_menu` VALUES ('3', '9d45e45c753e492b9f35152101d36377');
INSERT INTO `sys_role_menu` VALUES ('3', '9eef1909280740d682db48ad79352406');
INSERT INTO `sys_role_menu` VALUES ('3', 'aadd32883f6d498595b9ea635f7bb5f5');
INSERT INTO `sys_role_menu` VALUES ('3', 'ad08aea76278408392791662f4d6741f');
INSERT INTO `sys_role_menu` VALUES ('3', 'b7c6a65eff12437ca8b7379d99ed8035');
INSERT INTO `sys_role_menu` VALUES ('3', 'bdf3d91dee9c49f6b26edc842acf696a');
INSERT INTO `sys_role_menu` VALUES ('3', 'bf04adc2516640d08844017325b8a748');
INSERT INTO `sys_role_menu` VALUES ('3', 'c2abb39fdc004ff9b31a332801773555');
INSERT INTO `sys_role_menu` VALUES ('3', 'c443efbd16a14b3d82723d39c027693f');
INSERT INTO `sys_role_menu` VALUES ('3', 'c88934a678e44aa0a65b442b7918a4f1');
INSERT INTO `sys_role_menu` VALUES ('3', 'dae6362e44cd47e88bdcda523dd9c561');
INSERT INTO `sys_role_menu` VALUES ('3', 'df26e801cc1446b1aaffe558f1b8394f');
INSERT INTO `sys_role_menu` VALUES ('3', 'ea551c8a81ce418aa15449c8f06febd1');
INSERT INTO `sys_role_menu` VALUES ('3', 'ecdc0f5e7e964ef5914b69d3fa4021c7');
INSERT INTO `sys_role_menu` VALUES ('3', 'f47596e71955477fab8eac957ef25885');
INSERT INTO `sys_role_menu` VALUES ('3', 'f4a1406af7874212a8c90c3afeef7ba6');
INSERT INTO `sys_role_menu` VALUES ('3', 'f90d391d4243460eb301b06af7d5bdc6');
INSERT INTO `sys_role_menu` VALUES ('3', 'fa34191f15b74f4aa56cdad5893e9ae8');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '27');
INSERT INTO `sys_role_menu` VALUES ('4', '28');
INSERT INTO `sys_role_menu` VALUES ('4', '29');
INSERT INTO `sys_role_menu` VALUES ('4', '30');
INSERT INTO `sys_role_menu` VALUES ('4', '56');
INSERT INTO `sys_role_menu` VALUES ('4', '57');
INSERT INTO `sys_role_menu` VALUES ('4', '58');
INSERT INTO `sys_role_menu` VALUES ('4', '59');
INSERT INTO `sys_role_menu` VALUES ('4', '71');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '27');
INSERT INTO `sys_role_menu` VALUES ('5', '28');
INSERT INTO `sys_role_menu` VALUES ('5', '29');
INSERT INTO `sys_role_menu` VALUES ('5', '30');
INSERT INTO `sys_role_menu` VALUES ('5', '56');
INSERT INTO `sys_role_menu` VALUES ('5', '57');
INSERT INTO `sys_role_menu` VALUES ('5', '58');
INSERT INTO `sys_role_menu` VALUES ('5', '59');
INSERT INTO `sys_role_menu` VALUES ('5', '71');
INSERT INTO `sys_role_menu` VALUES ('6', '088dd610d7044206a327da308bf708c8');
INSERT INTO `sys_role_menu` VALUES ('6', '0fe40f87ef0c42b688e08ad6371d54e5');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '19617d48303a491fbea0a745d4d461a4');
INSERT INTO `sys_role_menu` VALUES ('6', '27');
INSERT INTO `sys_role_menu` VALUES ('6', '28');
INSERT INTO `sys_role_menu` VALUES ('6', '29');
INSERT INTO `sys_role_menu` VALUES ('6', '30');
INSERT INTO `sys_role_menu` VALUES ('6', '38d7013c57a7451c97dd6e4861533b6e');
INSERT INTO `sys_role_menu` VALUES ('6', '40c0aeff28ef44ea86f5c9947de57737');
INSERT INTO `sys_role_menu` VALUES ('6', '56');
INSERT INTO `sys_role_menu` VALUES ('6', '57');
INSERT INTO `sys_role_menu` VALUES ('6', '58');
INSERT INTO `sys_role_menu` VALUES ('6', '59');
INSERT INTO `sys_role_menu` VALUES ('6', '6c955812eddd4bca9e6ea819ac62ceb6');
INSERT INTO `sys_role_menu` VALUES ('6', '71');
INSERT INTO `sys_role_menu` VALUES ('6', '7894c97ab1b44ff9a992d93d1a173cd5');
INSERT INTO `sys_role_menu` VALUES ('6', '8f8ac29134d849acb91ef32fa0b6f065');
INSERT INTO `sys_role_menu` VALUES ('6', 'cc859f2dfc6f4ca78c83dd6a0d06b111');
INSERT INTO `sys_role_menu` VALUES ('6', 'd6c221547b13440e9ee19206dfc7fc91');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型：1系统管理  2部门经理  3普通用户',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '5', 'admin', 'd680c8dd0422d8c0edb2be0c6e002a89fb5d8ffd61e6ec9792aa8121', '0001', '系统管理员', '', '', '', '1', '', '127.0.0.1', '2019-11-20 11:28:48', '1', '1', '2013-05-27 08:00:00', '1', '2018-01-08 16:23:29', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('3e6c52dacd564461a6d97fea8fd9a23c', '1', '2b41dd73b35345b1a2eba7a01c566875', 'agent2', '671c09253a52ab0a269e8e6d14cbf6f9a4d6152705ffa507290fceb0', '453545', '上海代理商', '', '', '', '3', '', '127.0.0.1', '2017-11-29 16:45:19', '1', '1', '2017-10-18 11:45:35', '1', '2017-10-18 11:53:30', '', '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('4f941e7c269542b9b11386db05d58197', '1', '2b41dd73b35345b1a2eba7a01c566875', 'agent1', 'd4b9d27bcd0ee631628879da428922e4c1570dece0498255c46e0426', '534534', '广州代理商', '', '', '', '3', '/userfiles/7acdfd7c7d7845089d284648305fe3db/images/photo/2017/10/%E8%B7%91%E6%AD%A5%E6%9C%8D%E8%A3%855.jpg', '127.0.0.1', '2017-12-08 21:45:28', '1', '7acdfd7c7d7845089d284648305fe3db', '2017-10-13 17:13:15', '1', '2017-10-13 17:28:10', '', '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('7acdfd7c7d7845089d284648305fe3db', '1', '2', 'runda', '43d453721f5304be822d7a8f741fab979d36bdfba7f1553d3b613ecb', '23423', '系统管理员', '', '', '', '1', '/userfiles/7acdfd7c7d7845089d284648305fe3db/images/photo/2017/10/QQ%E5%9B%BE%E7%89%8720171013170305.png', '119.129.230.245', '2018-02-02 22:59:09', '1', '1', '2017-10-13 16:53:16', '1', '2018-02-02 19:36:49', '', '0');
INSERT INTO `sys_user` VALUES ('8dca1453a64d4ef893db722f5fd3dd22', '1', '5', 'hrh', '8d1625d377df986729c2e11bea697dd70fe3a856c3b60fb0278607bb', '00101', 'hrh', '1111@qq.com', '', '15800155429', '1', '', null, null, '1', '1', '2017-11-07 17:00:10', '1', '2017-11-07 17:00:10', '', '0');
INSERT INTO `sys_user` VALUES ('afd018bc5c4040efb718d37801273a52', '1', '5', 'zhansan', '14dac654bdf5d237def4aad6b56888e81cb478ebbdbdebc93786331f', 'xxcar001', '张三', '', '', '', '3', '', '0:0:0:0:0:0:0:1', '2017-01-17 11:25:55', '1', '1', '2017-01-17 11:09:29', '1', '2017-01-17 11:09:29', '', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('3e6c52dacd564461a6d97fea8fd9a23c', '6');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('4f941e7c269542b9b11386db05d58197', '6');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('7acdfd7c7d7845089d284648305fe3db', '3');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('8dca1453a64d4ef893db722f5fd3dd22', '1');
INSERT INTO `sys_user_role` VALUES ('9', '1');
INSERT INTO `sys_user_role` VALUES ('afd018bc5c4040efb718d37801273a52', '6');
