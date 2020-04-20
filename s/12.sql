-- 测试数据库添加记录*****

create database IF NOT EXISTS start DEFAULT CHARACTER SET 'UTF8';-- 创建数据库   如果没有存在   'start'  默认支持字样为utf8
use start;       --使用start数据库

create table if not exists user (   -- 创建表单  如果没有存在  'user'
id int unsigned auto_increment key comment '编号',  --  id 定义为整形   无符号   自增   主键   注释为编号
username varchar(20) not null unique comment '用户名', -- username  字符长度为20   不能为空   唯一   注释为用户名
age tinyint unsigned default 18 comment '年龄',     --  age   短字符   无符号   默认值为18   注释为年龄
email varchar(50) not null default 'imooc@qq.com' comment '邮箱'  --email  定义为字符长度50  不能为空   默认为imooc@qq.com   注释为邮箱
)engine=innodb charset=utf8;   -- 引擎为innodb  字符代表为utf8

-- 不指定字段名称

insert user value (1,'start',24,'start1122@126.com');  -- 插入   表单'user'   值    1、start、24、start1122@126.com
insert user values (null,'queen',25,'queen@qq.com');   -- 插入   表单'user'   值    空 queen  25 queen@qq.com 
insert user values (default,'lily',26,'lily@qq.com');  -- 插入   表单'user'   值    默认 lily 26 lily@qq.com

-- 列出指定字段的形式来插入数据

insert user(username,email) values('rose','rose@qq.com');              
insert user(age,email,id,username) values(22,'imooc@qq.com',5,'imooc');

-- 一次添加多条记录
insert user values
(null,'a',default,default),
(null,'b',56,'b@qq.com'),
(null,'c',14,'c@qq.com');

--  insert set添加模式
insert user set username='d',age=23,email='d@qq.com';

-- insert select 
insert user(username) select a from test;

-- 本题主要是考查数据库中的插入操作，如果为自动编号的字段赋值的话，
-- 我们可以采用NULL或DEFAULT让其按照默认的递增的形式来实现。
-- 给有默认值的字段赋值时，我们可以用DEFAULT让其采用默认值。
-- INSERT test VALUES(1 ,'小明', 保密);
-- INSERT test VALUES(DEFAULT,'小明',DEFAULT);
-- 用“INSERT …SET”插入记录时可以使用子查询，但一次只能插入一条记录