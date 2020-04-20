-- 条件筛选运算符 where   如果不加where，加上会进行条件筛选
-- 测试where 条件的比较运算符   查询id,username,age, id=5的用户
select id,username,age from user2
where id=5;

select id,username,age from user2
where id=50;

-- 添加desc字段  varchar(100)
alter table user2
add userDesc varchar(100);

-- 更新id<=9的用户 userDesc='this is a test'

update user2 set userDesc='this is a test'
WHERE id<=9;

-- 查询用户userDesc 为NULL的用户

select id,username,age,userDesc from user2
where userDesc=Null;

select id,username,age,userDesc from user2
where userDesc<=>NULL;

-- is null 检测null值
select id,username,age,userDesc FROM user2
where userDesc is Null;

-- 测试范围between and 
-- 查询年龄在18-30之间的用户
select id,username,age,sex from user2
where age between 18 and 30;

-- 查询阵列  指定集合   in   \    and     \     or     \    like

-- 查询编号为1，3，5，7，9
select id,username,age from user2
where id in(1,3,5,7,9,29,45,78);

select id,username,age from user2
where username in('张','昆仑');

-- 测试逻辑运算符
-- 查询性别为男 并且年龄>=20的用户
select id,username,age,sex from user2
where sex='男' and age>=20;

-- 查询薪水范围在60000-100000并且性别为男  addr='北京'
select id,username,age,sex,salary,addr from user2
where salary between 60000 and 100000 and sex='男' and addr='北京';

-- 查询id=1 或者 用户名为uniqueidentifier
select id,user,age from user2
where id=1 or username='queen';

-- 测试模糊查询 
select id,username,age from user2
where username='king';

select id,username,age FROM user2
where username LIKE 'king';

-- 要求用户名中包含三
select id,username,age,sex from user2
where username like '%三%';

select id,username,age,sex from user2
where username like '%in%';

select id,username,age,sex from user2
where username like '张%';

select id,username,age,sex from user2
where username like '%风';

-- 用户名长度为三位的用户 

select id,username,age,sex from user2
where username like '___';   --两位、三位

select id,username,age,sex from user2
where username like '张_';

select id,username,age,sex from user2
where username like '张_%';

select id,username,age,sex from user2
where username like '%K%';

--本题主要是考查sql语句的更新，分析语句UPDATE test SET name='Mary' WHERE id=2; 可知道是将id为2的那行记录的name值由原来的Join改为Mary，
--本题主要是考查数据库查询语句，记录查找的语句格式为：SELECT expr,.. FROM tbl_name [WHERE where_condition] 