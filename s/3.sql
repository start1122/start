CREATE TABLE IF NOT EXISTS user(
id INT,
username VARCHAR(20),
password CHAR(32),
email VARCHAR(50),
age TINYINT,
card CHAR(18),
tel CHAR(11),
salary FLOAT(8,2),
married TINYINT(1),
addr VARCHAR(100),
sex ENUM('男','女','保密')

)ENGINE=INNODB CHARSET =UTF8;

-- 向表中插入一条记录

insert user(id,username,password,email,age,card,tel,salary,married,addr,sex)
values(1,'start','start','start1122@126.com','24','230604198901274736','18610022223','60000','0','北京','男');

-- 查询表中所有记录 SELECT * from tbl_name

select * from user;