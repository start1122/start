create database if not exists start2 default character set 'UTF8';

create table emp(
id int unsigned auto_increment key,
username varchar(20) not null unique comment '编号',
age tinyint unsigned not null default 18 comment '年龄',
sex enum('男','女','保密')not null default '保密' comment '性别',
addr varchar(20) not null default '北京',
depid tinyint unsigned not null comment '部门对应的编号'
)engine=innodb charset=utf8;


insert emp(username,age,depid) values  -- 插入用户数据
('start',23,1),
('das',25,2),
('enrait',21,3),
('kasara',22,4),
('muli',25,1),
('sara',26,2);

insert emp(username,age,depid) values('test',39,6);


create table dep(
id tinyint unsigned auto_increment key,
depname varchar(50) not null unique,
depdesc varchar(100) not null default''
)engine=innodb charset=utf8;

insert dep(depname,depdesc) values('PHP教学部','研发php课件'),
('JAVA教学部','研发java课件'),
('web前端教学部','研发web前端课件'),
('ios教学部','研发ios课件');

-- 多表联查



-- 查询员工表的id  username  age  部门名称  笛卡尔积
select emp.id,emp.username,emp.age,dep.depname from emp,dep;

-- 表和表之间的关系  关系型数据库的特点
-- 内连接指的是把表连接时表与表之间匹配的数据行查询出来，就是两张表之间数据行匹配时，要同时满足ON语句后面的条件才行。
-- SELECT  XXX FROM XXX INNER JOIN XXX ON XXX;
-- 左外和右外是分别以左侧或右侧作为主连接表进行对标的 表与表的匹配模式
-- 内连接会查询出符合两个表之间的交集部分
-- 测试内连接

select e.id,e.username,e.age,d.depname
from emp as e
inner join dep as d
on e.depid=d.id;

--   内连接   select 字段名称 from  表1 
--           inner  join  表2
--           on  连接条件

-- 左外连接左表为主  右外连接右表为主
-- 先显示左表中的全部记录，再去右表中查询符合条件的记录，不符合的以NULL代替
-- 先显示右表中的全部记录，再去左表中查询符合条件的记录，不符合的以NULL代替

--  测试左外连接

select e.id,e.username,e.age,d.depname,d.depdesc
from emp as e
left outer join dep as d
on e.depid=d.id;

--  测试右外连接

select e.id,e.username,e.age,d.depname,d.depdesc
from emp as e
right join dep as d
on e.depid=d.id;


--   内连接   select 字段名称 from  表1 
--           inner  join  表2
--           on  连接条件

--本题主要是考查内连接和外连接定义，内连接查询表中符合连接条件的记录，左外连接查询时根据主表条件将副表中的记录查出。