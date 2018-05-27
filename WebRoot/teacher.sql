CREATE DATABASE mytest;
USE mytest;
DROP TABLE tbl_teacher IF EXISTS tbl_teacher;
CREATE TABLE `tbl_teacher` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userCode` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户编码',
  `userName` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `userPassword` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `gender` VARCHAR(10) DEFAULT NULL COMMENT '性别（1:女、 2:男）',
  `birthday` DATE DEFAULT NULL COMMENT '出生日期',
  `job` VARCHAR(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职称', 
  `institution` VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '事业单位',
  `phone` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `address` VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `userRole` BIGINT(20) DEFAULT NULL COMMENT '用户角色',
  `userState` BIGINT(20) DEFAULT NULL COMMENT '用户状态（1:正常、 0:禁用）',
  `teachingFeature` VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '授课特点',
  `summery` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资历简介',
  `createdBy` BIGINT(20) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` DATETIME DEFAULT NULL COMMENT '创建时间',
  `modifyBy` BIGINT(20) DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` DATETIME DEFAULT NULL COMMENT '更新时间',
  `idPicPath` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传个人证件照存储路径',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

USE mytest;
DROP TABLE tbl_role IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `roleCode` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `roleName` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `createdBy` BIGINT(20) DEFAULT NULL COMMENT '创建者',
  `creationDate` DATETIME DEFAULT NULL COMMENT '创建时间',
  `modifyBy` BIGINT(20) DEFAULT NULL COMMENT '修改者',
  `modifyDate` DATETIME DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO tbl_teacher(userCode,userName,userPassword,gender,job,institution,phone,email,userRole,userState)
 VALUES
 ('admin','admin','1234567','男','高级教师','一小','13500001111',NULL,1,1),
 ('tangzm','唐子美','123456','男','高级教师','一小','13500001111',NULL,1,1),
 ('tangzm2','花花','123456','女','中级教师','二小','13500001112',NULL,2,1),
 ('tangzm3','妞妞','123456','男','高级教师','三小','13500001113',NULL,2,1),
 ('tangzm4','杰克','123456','女','特等教师','一小','13500001114',NULL,3,1),
 ('tangzm5','那那','123456','男','高级教师','二小','13500001115',NULL,3,1);

INSERT INTO tbl_teacher(userCode,userName,userPassword,gender,job,institution,phone,email,userRole,userState)
 VALUES
 ('tangzm6','唐子美2','123456','男','高级教师','一小','13500001116',NULL,1,1),
 ('tangzm7','花花2','123456','女','中级教师','二小','13500001117',NULL,2,1),
 ('tangzm8','妞妞2','123456','男','高级教师','三小','13500001118',NULL,2,1),
 ('tangzm9','杰克2','123456','女','特等教师','一小','13500001119',NULL,3,1),
 ('huahua','那那2','123456','男','高级教师','二小','13500001110',NULL,3,1);
 
INSERT INTO tbl_role(roleCode,roleName) VALUES('admin','管理员');
INSERT INTO tbl_role(roleCode,roleName) VALUES('advance','特等教师');
INSERT INTO tbl_role(roleCode,roleName) VALUES('common','普通员工');
COMMIT;

UPDATE tbl_teacher SET userState=1 WHERE userstate=0;