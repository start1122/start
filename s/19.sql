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


create table user3(
id tinyint unsigned not null auto_increment key comment '编号',
username varchar(20) not null unique comment'用户名',
email varchar(20) not null default'start1122@126.com' comment'邮箱',
proName varchar(10) not null default'BeiJing' comment'用户所在省份'
)engine=innodb charset=utf8;

insert user3(username,proname) values
('a','北京'),
('b','哈尔滨'),
('c','上海'),
('d','深圳'),
('e','广州'),
('f','重庆');

create table user2(
id tinyint unsigned not null auto_increment key comment '编号',
username varchar(20) not null unique comment'用户名',
email varchar(50) not null default'start1122@126.com' comment'邮箱',
proid tinyint unsigned not null
)engine=innodb charset=utf8;

insert user2(username,proid) values('a',1);
insert user2(username,proid) values('b',1);
insert user2(username,proid) values('c',1);
insert user2(username,proid) values('d',2);
insert user2(username,proid) values('e',3);
insert user2(username,proid) values('f',1);
insert user2(username,proid) values('g',1);

-- 查询user id, username ,provinces,proname
select u.id,u.username,p.proname         -- 选择 代号u的id 代号u的username 代号p的proname
from user2 as u							 -- 选择 表user2 代称为u
join user3 as p							 -- 加入 表user3 代称为p
on u.proid=p.id;						 -- 在   u的proid中对等 p的id




--   省份表
create table user4(
id tinyint unsigned not null auto_increment key comment '编号',
proName varchar(10) not null unique comment '省份名称'
)engine=innodb charset=utf8;

insert user4(proname) values('北京');
insert user4(proname) values('上海');
insert user4(proname) values('深圳');


--   管理员表
create table admin1(
id tinyint unsigned not null auto_increment key comment '编号',
username varchar(20) not null unique comment '用户名',
email varchar(50) not null default 'start12@126.com' comment '邮箱',
proid tinyint unsigned not null 
)engine=innodb charset=utf8;

insert admin1(username,proid) values('king',1);
insert admin1(username,proid) values('queen',2);


--    商品分类表
create table shop1(
id tinyint unsigned not null auto_increment key comment '编号',
catename varchar(50) not null unique comment '商品分类名称',
catedesc varchar(100) not null default '请填写' comment '商品分类描述'
)engine=innodb charset=utf8;

insert shop1(catename) values('母婴');
insert shop1(catename) values('服装');
insert shop1(catename) values('电子');


---   商品表
create table commodity1(
id int unsigned not null auto_increment key comment '编号',
productname varchar(50) not null unique comment '商品名称',
price float(8,2) not null default '10' comment '价格',
cateid tinyint unsigned not null comment '商品所在的分类编号', 
adminid tinyint unsigned not null comment '管理员编号'
)engine=innodb charset=utf8;

insert commodity1(productname,price,cateid,adminid) values('iphone9','9888','3','1');
insert commodity1(productname,price,cateid,adminid) values('adidas','388','2','2');
insert commodity1(productname,price,cateid,adminid) values('nike','888','2','2');
insert commodity1(productname,price,cateid,adminid) values('奶瓶','288','1','1');

--   查询products id productname price --- cate catename
select p.id,p.productname,p.price,c.catename
from commodity1 as p
join shop1 as c
on p.cateid=c.id;


----   上述目的，用编号进行快速分类，且不影响建表，用大表的编号id直接对应 
----			【类目表】的类目id,便于添加类目与商品快速归类


--		查询管理员   id username email -- provinces proname

select a.id,a.username,a.email,p.proname
from admin1 as a
join shengfen1 as p
on a.proid=p.id;

--   查询 products id productname price 
--   cate  catename
--   admin username email

select p.id,p.productname,p.price,c.catename,a.username,a.email
from commodity1 as p
join admin1 as a
on p.adminid=a.id
join shop1 as c
on p.cateid=c.id
where p.price<1000
order by p.price desc
limit 0,2;

-- products id productname price
--  cate  cate name
-- admin  username  email
-- provinces proname

-- 我们需要将表product中的p_type和type表中的t_name相关联
-- 且将p_type值更新为type表中与t_name相对应的t_id 的值
-- 进行多表更新时我们需要将两个表进行连接，连接条件为p_type=t_name，更新值是使p_type=t_id。

--  外键约束  主表  从表
--  只有innoDB存储类型支持外键


create table news_cate(
id tinyint unsigned not null auto_increment key comment '编号',
catename varchar(50) not null unique comment '分类名称',
cateDesc varchar(100) not null default '新闻分类' comment '分类描述'
)engine=innoDB charset=utf8;

insert news_cate(catename) values('国内新闻'),('国际新闻'),('娱乐新闻'),('体育新闻');


create table news(
id int unsigned not null auto_increment key comment '编号',
title varchar(100) not null unique comment '新闻标题',
content varchar(1000) not null comment '新闻内容',
cateid tinyint not null comment '新闻所属分类编号'
)engine=innoDB charset=utf8;

insert news(title,content,cateid) values
('a1','aaaa1','1'),
('a2','aaaa2','1'),
('a3','aaaa3','4'),
('a4','aaaa4','2'),
('a5','aaaa5','3');

--  查询news id title content
--  news_cate catename
select n.id,n.title,n.content,c.catename   -- 选择 n的id n的title , n的内容 c的catename
from news as n							   -- 从  【news表定义的n】
join news_cate as c						   -- 加入【news_cate表定义的c】
on n.cateid=c.id;						   -- 连接 n的cateid到c的id

delete from news_cate where id=2;

insert news(title,content,cateid) values('a6','aaaa6',45);


--  添加外键

--  新闻分类表  news_cate
create table news_cate(
id tinyint unsigned not null auto_increment key comment '编号',
catename varchar(50) not null unique comment '分类名称',
cateDesc varchar(100) not null default '新闻分类' comment '分类描述'
)engine=innoDB charset=utf8;

insert news_cate(catename) values('国内新闻'),('国际新闻'),('娱乐新闻'),('体育新闻');

--  新闻表   news
create table news(
id int unsigned not null auto_increment key comment '编号',
title varchar(100) not null unique comment '新闻标题',
content varchar(1000) not null comment '新闻内容',
cateid tinyint unsigned not null comment '新闻所属分类编号',
constraint cateid_fk_newsCate foreign key(cateid) references news_cate(id)
)engine=innoDB charset=utf8;

--  创建表时指定外键   

--  desc news 查看表结构      show create table news;    会自动起1个外键名称
--  主键是自己的核心定位列与行标识   外键是和其他表挂钩与关联的共同识别列
--  外键【数据类型要一致】 【无符号等要一致】  命名可不同，结构要一致，才可对应与挂钩及被识别 【字符型 类型要一致，长度可以不同】
--  创建外键后 如果外键字段没有创建索引，mysql 会自动添加索引
--  子表的外键，关联的必须是父表的主键
--  有外键的表无法添加 结构不清晰的子表数据
--  有外键约束情况下，不能删除父表（被关联的上级表）的数据
--  insert news_cate(cateName) values('教育新闻');  可为父表添加有效记录
--  将教育新闻改成教育    ,可添加类目，可更改编号，  新闻下面有内容的，就无法改动主表的接口和id等，如主表id2国际新闻下有内容，则无法删除主表
--  如主表id2国际新闻下有内容，则无法改动主表id2的id,若没内容 可随时改动，子记录=新闻  可被删除，子记录无新闻\内容\无记录，主表记录可删除
update news_cate set catename='教育' where id=5;
update news_cate set id=50 where catename='教育';
--  删除需先删子表，再删父表

--  添加外键名称  constraint cateid_fk_newsCate 

--  子表的外键必须关联父表的主键字段，子表的外键和主表的主键字段类型要相似


--   删除外键

alter table news   --  更改 表格  [名称]
drop foreign key cateid_fk_newsCate;  --删除  外键  [名称]

--   添加外键之前，表中的记录一定是符合规范的记录，没有脏值，否则无法添加成功
--   添加外键

alter table news
add foreign key(cateid) references news_cate(id);

--   删除外键
alter table news
drop foreign key news_ibfk_1;

--   添加外键名称
alter table news
add constraint cateId_fk_newsCate foreign key(cateid) references news_cate(id);
--    定义 要更改的表格名称
--    定义 约束条件为 外键名    外键为cateid  参考【某】表的id值

--    有脏数据的情况下，是无法添加成功的

--    外键约束的参照操作  cascade  【从父表删除或更新，子表也跟着删除或更新】
--    set null					【从父表删除或更新，并且设置子表的外键列为Null才可以】   
--    noaction \ restrict       【拒绝对父表做更新或者删除操作】

--   指定级别联动操作  cascade[联动的意思]
alter table news 
add foreign key(cateid) references news_cate(id)
on delete cascade on update cascade;

--  更改表格 news
--  添加 外键 cateid 参照 news_cate表的id
--  指令: 删除联动   指令：更新联动
--  一致性、完整性

--  特殊形式的查询  子查询  
--  内层语句查询的结果可以作为外层语句查询的条件
--  in 引发的子查询
select id from dep;
select * from emp where depid in (1,2,3,4);
--  选择  *  从emp表中  【当  depid在1\2\3\4】

select * from emp
where depid in (select id from dep); --depid需要在部门表中 才能得到体现


---  子查询示例  ---

create table stu(
id tinyint unsigned not null auto_increment key comment'3',
username varchar(20) not null unique comment'学员名称',
score tinyint unsigned not null comment'学员考试分数'
)engine=innoDB charset=utf8;


---  创建stu表  ---

insert stu(username,score) values
('king',95),
('queen',75),
('zhangsan',69),
('lisi',78),
('wangwu',87),
('zhaoliu',88),
('tianqi',98),
('ceshi',99),
('tiancai',50);

---  创建level表  ---

create table level(
id tinyint unsigned not null auto_increment key comment'编号',
score tinyint unsigned not null comment'分数'
);

---  注入level.score内容  ----

insert level(score) values
(90),(80),(70);

select score from level where id=1;

---  选择id username score 从stu  ---
---  当score 大于等于 （选择score  从表level中当id=1时)
---  结果为  选择score  大于 90

select id,username,score from stu
where score>=(select score from level where id=1);

---  查询出没有得到评级的学员   ---  结果为<=70

select id,username,score from stu
where score<=(select score from level where id=1);

---  由exists 引发的子查询   ---   
select * from emp where exists --选择* 从表emp   当存在下列条件时
(select depname from dep where  id= 10);  -- 子查询的内容在总查询中被包含的情况下

select * from emp where exists
(select depname from dep where  id= 1);

---   any  some  all 关键字的子查询
select * from stu
where score>= any(select score from level);  -- 大于等于最小值

select * from stu
where score>= some(select score from level); -- 

select * from stu
where score>= all(select score from level);  -- all代表内层查询里面的最大值，大于最大值90分以上的

select * from stu
where score < all(select score from level);

select * from stu
where score = all(select score from level);

select * from stu
where score != all(select score from level);

---  > >=  any 最小值   some  最小值  all 最大值
---  < <=  any 最大值   some  最大值  all 最小值
---  =  	   任意值         任意值
---  <> !=      						任意值

---- insert  select  
---- create  一个user1表 id username
create table user1(
id int unsigned auto_increment key,
username varchar(20)
)select id,username from emp;
---- 将emp表中的id username 数据 写入到了user1表中

---- 将user2表中的用户名写入到user1表中
insert user1(username) select username from user2;
---- 导入到user1表的username中，  选择username从user2; 

create table user1 like user2;

----  将stu表中的tiancai用户名添加到user2表中
insert user1 set username=(select username from stu where id=9);

select distinct(username) from user1;

-----  联合查询  -----
---将user2 和 user3 的数据合并到一起

select * from user2
union
select * from user3;

---  重复部分被屏蔽掉了

select * from user2
union all
select * from user3;

------ union 会去重   union all 会全部合并
---本题主要是考查数据库语句的联合使用
---LIMIT语句用来限制查询数量。ORDER BY 是排序操作，GROUP BY是分组操作，WHERE是条件语句，


