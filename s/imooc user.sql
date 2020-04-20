--用户表 imooc_user 

CREATE TABLE if not exists `user1`
(
`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '用户编号',  --id定义为int整数，unsigned从0开始，自动递增，主键
`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',--定义为字符串，长度为20，不能为空，唯一
`password` CHAR(32) NOT NULL COMMENT '密码',		  --定义为字符串，长度为32，不能为空
`email` VARCHAR(50) NOT NULL UNIQUE COMMENT '邮箱',   --定义为字符串，长度为50，不能为空，唯一
`age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',--定义为短整数，从0开始，不能为空，默认值为18
`sex` ENUM('男','女','保密')NOT NULL DEFAULT '保密' COMMENT '性别',--选项在（a,b,c)之间，不能为空，默认值为保密
`tel` CHAR(11)NOT NULL UNIQUE COMMENT '电话',-- 定义为字符串，长度为11，不能为空，唯一，
`addr` VARCHAR(50)NOT NULL DEFAULT '北京' COMMENT '地址',--定义为字符串，长度50，不能为空，
`card` CHAR(18) NOT NULL UNIQUE COMMENT '身份证号', --定义为字符串，长度18，不能为空，唯一
`married` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0代表未婚，1代表已婚',--定义为短整数，不能为空，默认为0
`salary` FLOAT(8,2)NOT NULL DEFAULT 0 COMMENT '薪水'--定义为浮点型，不能为空
)ENGINE=INNODB DEFAULT CHARSET=UTF8;



CREATE TABLE if not exists `user1`
(
`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '用户编号', 
`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
`password` CHAR(32) NOT NULL COMMENT '密码',
`email` VARCHAR(50) NOT NULL UNIQUE COMMENT '邮箱',
`age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
`sex` ENUM('男','女','保密')NOT NULL DEFAULT '保密' COMMENT '性别',
`tel` CHAR(11)NOT NULL UNIQUE COMMENT '电话',
`addr` VARCHAR(50)NOT NULL DEFAULT '北京' COMMENT '地址',
`card` CHAR(18) NOT NULL UNIQUE COMMENT '身份证号',
`married` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0代表未婚，1代表已婚',
`salary` FLOAT(8,2)NOT NULL DEFAULT 0 COMMENT '薪水'
)ENGINE=INNODB DEFAULT CHARSET=UTF8;