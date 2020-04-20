create table test_str(
a char(5),
b varchar(5)
);

insert test_str(a,b) values('','');
insert test_str(a,b) values('a','a');
insert test_str(a,b) values('ab','ab');
insert test_str(a,b) values('abc','abc');
insert test_str(a,b) values('abcd','abcd');
insert test_str(a,b) values('abcde','abcde');


--测试text不能有默认值

create table test_str1(
	content text default 'this is a test'
);

--测试enum

create table test_enum(
sex enum('男','女','保密')
);
insert test_enum(sex) values('男');
insert test_enum(sex) values('男1');

-- desc test_enum;

