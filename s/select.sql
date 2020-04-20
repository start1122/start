--查询表中所有记录
select * from tbl_name;  --查询所有字段

select 字段名称,... from tbl_name  --指定字段名称

-- 只查询 username,addr,usage
select username,addr,age from user2;

-- 查询king数据库下user2表中的所有记录   库名.表名的形式
select * from start5_eastemper.user2;

-- 查询user2表中的id 编号  username 用户名 sex 性别    给字段  起别名
select id as '编号' , username as '用户名', sex as '性别'
from user2;

select id age,age id,username from user2;


-- 给数据表起别名  
select id username FROM user2 as u;


-- 测试表名.字段名

-- 查询表达式中可以使用[AS] alias_name 为指定列赋予别名

--SELECT age,name FROM test3;  查询表达式中的顺序可以和原数据表中字段的顺序不一致且SELECT中查询表达式的顺序将影响着结果的顺序。

