create table user2(
id int unsigned auto_increment key,
username varchar(20) not null unique comment '编号',
age tinyint unsigned not null default 18 comment '年龄',
sex enum('男','女','保密')not null default '保密' comment '性别',
addr varchar(20) not null default '北京',
married tinyint(1) not null default 0 comment '0代表未婚，1代表已婚',
salary float(8,2) not null default 0 comment '薪水'
)engine=innodb charset=utf8;

insert user2 values(1,'king',23,'男','北京',1,50000);
insert user2(username,age,sex,addr,married,salary) values('queen',27,'女','上海',0,25000);
insert user2 set username='imooc',age=31,sex='女',addr='北京',salary=40000;
insert user2 values(null,'张三',38,'男','上海',0,15000),
(null,'张三风',38,'男','上海',0,15000),
(null,'紫衣',38,'女','北京',1,55000),
(null,'御峰',35,'男','深圳',1,74000),
(null,'昆仑',26,'女','上海',0,83000),
(null,'玄霄',16,'男','苏州',0,27000),
(null,'无量',51,'男','上海',1,38000),
(null,'天柱',52,'男','上海',0,61000);


