-- 测试添加和删除字段

CREATE TABLE IF NOT EXISTS user1(
	id INT UNSIGNED AUTO_INCREMENT KEY
);

-- 添加用户名字字段 username VARCHAR(20)
ALTER Table user1
add username varchar(20);

-- 添加密码字段 password CHAR(32) NOT null
ALTER table user1
ADD password CHAR(32) NOT Null;

-- 添加邮箱字段 email varchar(50)not null unique 加到username 

ALTER table user1
add email varchar(50) not null unique after username;

-- 添加测试字段 test tinyint(1) not null default 0; 加到首位

alter table user1
add test tinyint(1) not null default 0 first;

-- 删除 test字段

alter table user1
drop test;

-- 添加 age\addr字段，删除email字段
alter table user1 
add age tinyint UNSIGNED not null defautl 18,
add addr varchar(100) not null default '北京',
drop email;

-- 测试添加删除默认值操作
create table user2(
id int UNSIGNED AUTO_INCREMENT key,
username varchar(20) not null,
age tinyint UNSIGNED not null default 18,
email varchar(50) not null);

-- 给email 字段添加默认值  imooc@qq.com
alter table user2
alter email set default 'imooc'@qq.com;

-- 删除age字段的默认值
alter table user2
alter age drop default;

-- 修改字段类型、字段属性
-- 修改字段名称、字段类型、字段属性
-- 删除商品数量的默认值

-- 测试修改字段类型和字段属性、字段名称
create table user3(
ind int unsigned AUTO_INCREMENT key,
username varchar(5)not null unique,
password char(32)not null,
email varchar(10)not null
);

-- 将用户名字段的类型改为20
alter table user3
modify username varchar(20) not null;

-- 将密码的长度改为40
alter table user3
modify password char(40) not null;

-- 将email字段改为varchar(50) not null first

alter table user3
modify email varchar(50) not null first;

-- 将username 名称改为user
alter table user3
change username user varchar(20) not null;

-- 将 password 名称改为password
alter table user3
change password pwd char(40) not null;

-- 将email 改为userEmail 类型改为 varchar (100) 

alter table user3
change email useremail varchar(100) default 'imooc@qq.com';

-- MODIFY只能修改字段的类型和字段属性，CHANGE可修改字段类型，字段属性和字段的名称。所以B选项是正确的。

-- 测试添加和删除唯一

create table user6(
id int unsigned auto_increment key,
username varchar(20) not null unique,
password char(32) not null,
email varchar(50) not null unique
);

-- 删除唯一索引 username 和email 
alter table user6 
drop index unsername;
 
alter table user6
drop index email;

-- 添加唯一索引
alter table user6
add unique key(username);

alter table user6
add unique index uni_email(email);

-- 修改数据表名称  user6 改为user666

alter table user666
rename to user666;

alter table user user666
rename as user6;