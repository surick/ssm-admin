/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50517
Source Host           : 192.168.126.242:3306
Source Database       : sop

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2018-03-05 10:34:38
*/
DROP PROCEDURE IF EXISTS  `init_ssm_demo`;
DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `init_ssm_demo`()
BEGIN	

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `sop_file`
-- ----------------------------
DROP TABLE IF EXISTS `sop_file`;
CREATE TABLE `sop_file` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) DEFAULT NULL,
  `fnum` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `fver` varchar(255) DEFAULT NULL,
  `fuser` varchar(255) DEFAULT NULL,
  `fpath` varchar(255) DEFAULT NULL,
  `file` longblob,
  `ftime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sop_file
-- ----------------------------
INSERT INTO sop_file VALUES ('15', '1', 'redirect', 'redirect', 'redirect', 'admin', 'sqlnet.log', 0x0D0A0D0A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A0D0A466174616C204E4920636F6E6E656374206572726F722031323137302E0D0A0D0A202056455253494F4E20494E464F524D4154494F4E3A0D0A09544E5320666F722033322D6269742057696E646F77733A2056657273696F6E2031302E322E302E312E30202D2050726F64756374696F6E0D0A0957696E646F7773204E54205443502F4950204E542050726F746F636F6C204164617074657220666F722033322D6269742057696E646F77733A2056657273696F6E2031302E322E302E312E30202D2050726F64756374696F6E0D0A202054696D653A2030312D36A4EB202D323031362031333A33383A34310D0A202054726163696E67206E6F74207475726E6564206F6E2E0D0A2020546E73206572726F72207374727563743A0D0A202020206E73206D61696E2065727220636F64653A2031323533350D0A20202020544E532D31323533353A20544E533AA740B77EB94FAEC90D0A202020206E73207365636F6E646172792065727220636F64653A2031323536300D0A202020206E74206D61696E2065727220636F64653A203530350D0A20202020544E532D30303530353A20A740B77EB94FAEC90D0A202020206E74207365636F6E646172792065727220636F64653A2036300D0A202020206E74204F532065727220636F64653A20300D0A2020436C69656E7420616464726573733A203C756E6B6E6F776E3E0D0A0D0A0D0A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A0D0A466174616C204E4920636F6E6E656374206572726F722031323536302C20636F6E6E656374696E6720746F3A0D0A20284445534352495054494F4E3D28414444524553533D2850524F544F434F4C3D424551292850524F4752414D3D6F7261636C65292841524756303D6F7261636C654F52434C2928415247533D27284445534352495054494F4E3D284C4F43414C3D5945532928414444524553533D2850524F544F434F4C3D62657129292927292928434F4E4E4543545F444154413D285349443D4F52434C29284349443D2850524F4752414D3D433A5C50726F6772616D2046696C65735C4D6963726F736F6674204F66666963655C4F666669636531345C455843454C2E4558452928484F53543D57373031302D31343835312D3038412928555345523D773130363333292929290D0A0D0A202056455253494F4E20494E464F524D4154494F4E3A0D0A09544E5320666F722033322D6269742057696E646F77733A2056657273696F6E2031302E322E302E312E30202D2050726F64756374696F6E0D0A094F7261636C65204265717565617468204E542050726F746F636F6C204164617074657220666F722033322D6269742057696E646F77733A2056657273696F6E2031302E322E302E312E30202D2050726F64756374696F6E0D0A202054696D653A2030312D36A4EB202D323031362031333A33383A34320D0A202054726163696E67206E6F74207475726E6564206F6E2E0D0A2020546E73206572726F72207374727563743A0D0A202020206E73206D61696E2065727220636F64653A2031323536300D0A20202020544E532D31323536303A20544E533AA8F3A977A4B6ADB1B57BA6A1BFF9BB7E0D0A202020206E73207365636F6E646172792065727220636F64653A20300D0A202020206E74206D61696E2065727220636F64653A203533300D0A20202020544E532D30303533303A20A8F3A977C2E0B1B5BEB9BFF9BB7E0D0A202020206E74207365636F6E646172792065727220636F64653A203132360D0A202020206E74204F532065727220636F64653A20300D0A, '2018-02-28 13:48:43');

-- ----------------------------
-- Table structure for `sop_group`
-- ----------------------------
DROP TABLE IF EXISTS `sop_group`;
CREATE TABLE `sop_group` (
  `gid` bigint(20) NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sop_group
-- ----------------------------
INSERT INTO sop_group VALUES ('1', 'test');
INSERT INTO sop_group VALUES ('2', 'test2');
INSERT INTO sop_group VALUES ('3', 'test3');
INSERT INTO sop_group VALUES ('6', 'test4');

-- ----------------------------
-- Table structure for `sop_model`
-- ----------------------------
DROP TABLE IF EXISTS `sop_model`;
CREATE TABLE `sop_model` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT,
  `mname` varchar(255) NOT NULL,
  `gid` bigint(20) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sop_model
-- ----------------------------
INSERT INTO sop_model VALUES ('1', 'test', '1');
INSERT INTO sop_model VALUES ('16', 'testm', '1');
INSERT INTO sop_model VALUES ('15', 'test3', '3');
INSERT INTO sop_model VALUES ('14', 'test2', '2');
INSERT INTO sop_model VALUES ('17', 'ttest', '2');
INSERT INTO sop_model VALUES ('18', 'test5', '3');
INSERT INTO sop_model VALUES ('21', 'test6', '6');
INSERT INTO sop_model VALUES ('24', 'model1', '6');

-- ----------------------------
-- Table structure for `u_permission`
-- ----------------------------
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_permission
-- ----------------------------
INSERT INTO u_permission VALUES ('4', '/permission/index.shtml', '权限列表');
INSERT INTO u_permission VALUES ('6', '/permission/addPermission.shtml', '权限添加');
INSERT INTO u_permission VALUES ('7', '/permission/deletePermissionById.shtml', '权限删除');
INSERT INTO u_permission VALUES ('8', '/member/list.shtml', '用户列表');
INSERT INTO u_permission VALUES ('9', '/member/online.shtml', '在线用户');
INSERT INTO u_permission VALUES ('10', '/member/changeSessionStatus.shtml', '用户Session踢出');
INSERT INTO u_permission VALUES ('11', '/member/forbidUserById.shtml', '用户激活&禁止');
INSERT INTO u_permission VALUES ('12', '/member/deleteUserById.shtml', '用户删除');
INSERT INTO u_permission VALUES ('13', '/permission/addPermission2Role.shtml', '权限分配');
INSERT INTO u_permission VALUES ('14', '/role/clearRoleByUserIds.shtml', '用户角色分配清空');
INSERT INTO u_permission VALUES ('15', '/role/addRole2User.shtml', '角色分配保存');
INSERT INTO u_permission VALUES ('16', '/role/deleteRoleById.shtml', '角色列表删除');
INSERT INTO u_permission VALUES ('17', '/role/addRole.shtml', '角色列表添加');
INSERT INTO u_permission VALUES ('18', '/role/index.shtml', '角色列表');
INSERT INTO u_permission VALUES ('19', '/permission/allocation.shtml', '权限分配');
INSERT INTO u_permission VALUES ('20', '/role/allocation.shtml', '角色分配');
INSERT INTO u_permission VALUES ('39', '/sop/model/index.shtml', 'sop管理-model');

-- ----------------------------
-- Table structure for `u_role`
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO u_role VALUES ('1', '系统管理员', '888888');
INSERT INTO u_role VALUES ('3', '权限角色', '100003');
INSERT INTO u_role VALUES ('4', '用户中心', '100002');
INSERT INTO u_role VALUES ('5', 'SOP管理', '666666');
INSERT INTO u_role VALUES ('6', '设备监控', '777777');

-- ----------------------------
-- Table structure for `u_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_permission
-- ----------------------------
INSERT INTO u_role_permission VALUES ('4', '8');
INSERT INTO u_role_permission VALUES ('4', '9');
INSERT INTO u_role_permission VALUES ('4', '10');
INSERT INTO u_role_permission VALUES ('4', '11');
INSERT INTO u_role_permission VALUES ('4', '12');
INSERT INTO u_role_permission VALUES ('3', '4');
INSERT INTO u_role_permission VALUES ('3', '6');
INSERT INTO u_role_permission VALUES ('3', '7');
INSERT INTO u_role_permission VALUES ('3', '13');
INSERT INTO u_role_permission VALUES ('3', '14');
INSERT INTO u_role_permission VALUES ('3', '15');
INSERT INTO u_role_permission VALUES ('3', '16');
INSERT INTO u_role_permission VALUES ('3', '17');
INSERT INTO u_role_permission VALUES ('3', '18');
INSERT INTO u_role_permission VALUES ('3', '19');
INSERT INTO u_role_permission VALUES ('3', '20');
INSERT INTO u_role_permission VALUES ('1', '4');
INSERT INTO u_role_permission VALUES ('1', '6');
INSERT INTO u_role_permission VALUES ('1', '7');
INSERT INTO u_role_permission VALUES ('1', '8');
INSERT INTO u_role_permission VALUES ('1', '9');
INSERT INTO u_role_permission VALUES ('1', '10');
INSERT INTO u_role_permission VALUES ('1', '11');
INSERT INTO u_role_permission VALUES ('1', '12');
INSERT INTO u_role_permission VALUES ('1', '13');
INSERT INTO u_role_permission VALUES ('1', '14');
INSERT INTO u_role_permission VALUES ('1', '15');
INSERT INTO u_role_permission VALUES ('1', '16');
INSERT INTO u_role_permission VALUES ('1', '17');
INSERT INTO u_role_permission VALUES ('1', '18');
INSERT INTO u_role_permission VALUES ('1', '19');
INSERT INTO u_role_permission VALUES ('1', '20');
INSERT INTO u_role_permission VALUES ('1', '21');
INSERT INTO u_role_permission VALUES ('1', '22');
INSERT INTO u_role_permission VALUES ('1', '23');
INSERT INTO u_role_permission VALUES ('1', '24');
INSERT INTO u_role_permission VALUES ('1', '25');
INSERT INTO u_role_permission VALUES ('1', '26');
INSERT INTO u_role_permission VALUES ('1', '27');
INSERT INTO u_role_permission VALUES ('1', '28');
INSERT INTO u_role_permission VALUES ('1', '29');
INSERT INTO u_role_permission VALUES ('1', '30');
INSERT INTO u_role_permission VALUES ('1', '31');
INSERT INTO u_role_permission VALUES ('1', '32');
INSERT INTO u_role_permission VALUES ('1', '33');
INSERT INTO u_role_permission VALUES ('1', '34');
INSERT INTO u_role_permission VALUES ('1', '35');
INSERT INTO u_role_permission VALUES ('1', '36');
INSERT INTO u_role_permission VALUES ('1', '37');
INSERT INTO u_role_permission VALUES ('1', '38');
INSERT INTO u_role_permission VALUES ('1', '39');
INSERT INTO u_role_permission VALUES ('5', '39');

-- ----------------------------
-- Table structure for `u_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO u_user VALUES ('1', '管理员', 'admin', '33ced57b744f11e522199c9cb105e3b3', '2018-02-06 11:15:33', '2018-03-02 08:52:42', '1');
INSERT INTO u_user VALUES ('15', 'root', 'jk103@qq.com', '152e3670dfe6a3613f37dbdce3d2976c', '2018-02-08 12:55:37', '2018-03-01 12:37:17', '1');
INSERT INTO u_user VALUES ('16', 'test', 'test@qq.com', '45a5c0306abd7b0dd4c21be25a4ba0fa', '2018-02-08 13:42:10', '2018-02-09 15:16:38', '1');
INSERT INTO u_user VALUES ('17', 'normal', 'normal', '6e36aa0b3d46891722f6e6c9ea8cff9b', '2018-02-09 15:04:10', '2018-02-09 15:24:00', '1');
INSERT INTO u_user VALUES ('18', 'people1', 'people1@ssm.admin', '97f41e351e0088e6639c1a86100064ff', '2018-03-01 12:40:20', '2018-03-01 12:40:20', '1');

-- ----------------------------
-- Table structure for `u_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_role
-- ----------------------------
INSERT INTO u_user_role VALUES ('12', '4');
INSERT INTO u_user_role VALUES ('11', '3');
INSERT INTO u_user_role VALUES ('11', '4');
INSERT INTO u_user_role VALUES ('1', '1');
INSERT INTO u_user_role VALUES ('15', '3');
INSERT INTO u_user_role VALUES ('16', '5');
INSERT INTO u_user_role VALUES ('17', '6');

END $$
DELIMITER ;