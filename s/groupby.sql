-- 测试分组
-- 按照性别分组sex

select id,username,age,sex from user2   -- 选择  id\username\age\sex  从user2表
group by sex;    -- 分组依据  sex

-- 按照addr分组
select id,username,age,sex,addr from user2  --选择 id username age sex addr 从 user2表
group by addr;   -- 分组依据  addr

-- 按照性别分组，查询组中的用户名有哪些

select group_concat(username),age,sex,addr from user2  -- 选择合并多个数组 针对username , 选择age sex addr 从user2
group by sex;  -- 分组依据  sex

select group_concat(username),age,group_concat(sex),group_concat(addr) from user2  -- 选择合并多个数组 针对username age 选择合并多个数组针对sex
-- 选择合并多个数组针对addr
group by sex;  -- 分组依据  sex


-- 配合聚合函数使用  count()统计记录总数   sum()求和   max()求最大值    min()求最小值   avg()求平均值

-- 测试count()              group_concat  围绕多个函数进行合并统计
select count(*) from user2;   -- 选择 以* 计数  从 user2中

select count(id) from user2; -- 选择 以id 计数  从user2 中

select count(userDesc) from user2; -- 选择 以userdesc计数  从user2中

-- 按照sex分组 ，得到用户名详情， 并且分别统计组中的总人数 

select sex,Group_concat(username) as usersdetail,count(*) as totalusers from user2 -- 选择 sex 合并多个数组 为username 标注为 userdetail
group by sex; -- 以*计数 叫totalusers 针对user2

-- 上述内容为 选择 性别、【定义围绕username产生的统计名称为userdetail】【定义围绕count产生的名称为totalusers】
-- 围绕sex进行展示

select addr,   
group_concat(username) as usersDetail,  
count(*) as totalUsers,
sum(age) as sum_age,
max(age) as max_age,
min(age) as min_age,
avg(age) as avg_age
from user2
group by addr;

select sex,
group_concat(username) as usersdetail,
count(*) as totalusers,
sum(salary) as sum_salary,
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary
from user2
group by sex;

select group_concat(username) as usersDetail,
count(*) as totalusers
from user2
group by sex
with rollup;

-- 按照字段的位置来分组
select sex,
group_concat(username) as usersdetail,
count(*) as totalusers,
sum(salary) as sum_salary,
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary
from user2
group by 1;

-- 查询age>=30的用户并且按照sex分组
select sex,group_concat(username) as usersdetail,
count(*) as totalusers
from user2
where age>=30
group by sex;

-- 按照addr分组，统计总人数
select addr,
group_concat(username) as usersdetail,
count(*) as totalusers
from user2
group by addr;



-- having子句对应分组结果进行二次筛选，条件是组中人数>=3

select addr,     						--筛选addr列
group_concat(username) as usersdetail,	--执行将username集中展示并命名为userdetail
count(*) as totalusers					--执行统计总数 并命名为totalusers
from user2								--从user2表统计
group by addr							--分组依据围绕addr
having count(*)>=3;						--筛选大于等于3的序列

select addr,
group_concat(username) as usersdetail,
count(*) as totalusers
from user2
group by addr
having totalusers>=3;					--筛选大于等于3的totolusers列

-- 按照addr分组，得到用户名的详情、总人数、薪水的总和、以及薪水的最大值、最小值、平均值

select addr,
group_concat(username) as usersdetail,
count(*) as totalusers,
sum(salary) as sum_salary, --总和
max(salary) as max_salary, --最大值
min(salary) as min_salary, --最小值
avg(salary) as avg_salary  --平均值
from user1
group by addr;

select addr,
group_concat(username) as usersdetail,
count(*) as totalusers,
sum(salary) as sum_salary,
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary
from user2
group by addr
having avg_salary>=40000;

--本题主要是考查数据库中分组sql 的编写，想要显示的结果是sdept列，且按照sdept进行分组，
--查找的字段中需要包含sdept，则查找语句为SELECT sdept FROM student GROUP BY sdept
--用HAVING进行分组条件的指定时，一定要保证分组条件要么为聚合函数，要么条件中的字段必须出现在当前的SELECT语句中。
--第一个选项中HAVING条件字段中的id并没有出现在SELECT查找的列中。
--having 和where是结合条件表达式的操作，order by 为排序操作，group by为分组操作



--  orderby 排序
--  按照id降序排列

select id,username,age  --选择这三个列
from user2   -- 从user2表单执行
order by id desc;  --围绕id进行排序   asc升序 desc降序

-- 按照age升序
select id,username,age
from user2
order by age asc;


-- 按照多个字段排序

select id,username,age
from user2
order by age asc,id asc;

select id,username,age
from user2
where age>=30;  --添加分组条件

select id,username,age
from user2
where age>=30
order by age desc;


-- 实现随机记录
select rand();

select id,username,age
from user2
order by rand();  --实现随机排序

--本题主要是对排序涉及到的命令的考查，ORDER BY语句用于对查询结果进行排序，group by 是分组表达式，where和having为条件表达式。
--本题主要是考查数据库中的排序功能，ASC是升序排列，DESC是降序排列。且只希望查看id和name列，所以是SELECT id,name FROM test ORDER BY id DES

--SELECT * FROM test ORDER BY name DESC,id;
--SELECT * FROM test ORDER BY name DESC,id ASC;

-- 测试 limit（界限） 语句
-- 显示结果集的前5条记录
-- offset 从0开始
select id,username,age,sex
from user2
limit 5;

select id,username,age,sex
from user2
limit 0,5;

select id,username,age,sex
from user2
limit 0,3;		--第0条后的3条

select id,username,age,sex
from user2
limit 3,3;		--第3条后的3条

update user2 set age=age+5 limit 3;   --更新前三条数据  年龄+5
update user2 set age=age-10 order by id desc limit 3;  -- 将表降序排列后的头三条-10   实际结果为后三条年龄减10
delete from user2 limit 3;  --删除user2表的前三条数据
delete from user2 order by id desc limit 3;  -- 降序排列后  删除user2表的头三条数据，  实际结果为删除后三条数据

--测试完整select 语句的形式

select addr,
group_concat(username) as usersdetail,
count(*) as totalusers,
sum(age) as sum_age,
max(age) as max_age,
min(age) as min_age,
avg(age) as avg_age
from user2
where id>=2
group by addr

having totalusers>=2
order by totalusers asc
limit 0,2;

-- 本题主要是考查数据库中限制查询条数语句命令条数，WHERE为条件表达式，GROUP BY为分组表达式，having一般跟在group by之后，相当于条件表达式
-- LIMIT语句后第一个数字代表记录的偏移值，即从第几条记录开始；第二个数字代表查询结果返回的数量。且在系统中，记录是从0开始编号的。 
-- 所以根据题意，正确语句为SELECT * FROM user LIMIT 2,3
-- INSERT course(username) SELECT stuname FROM student LIMIT 5;
-- 本题主要是考查数据库的联合查询操作以limit用法，INSERT…SELECT可以将查询结果插入到指定数据表。
-- LIMIT 5 表示显示从第一条开始的5条查询记录数量。set是设置操作