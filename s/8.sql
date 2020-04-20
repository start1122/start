-- 测试主键

create table test_primary_key
(
id INT UNSIGNED PRIMARY KEY,
username varchar(20)
);

insert test_primary_key(id,username) values(1,'king');
insert test_primary_key(id,username) values(1,'king123');

--复合主键

CREATE TABLE test_primary_key3(
	id INT UNSIGNED,
	courseId varchar(20),
	username varchar(20),
	email varchar(50),
	PRIMARY KEY(id,courseId)
);

insert test_primary_key3(id,courseId,username,email)
values(1,'a','king','99121274@163.com');

--测试 自动增长

create table test_auto_increment(
id INT UNSIGNED KEY AUTO_INCREMENT,
username VARCHAR(20)

);