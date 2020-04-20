-- 测试更新语句
-- 修改第一个用户的信息 id=1
UPDATE user SET age=age+1 WHERE id <=5;

UPDATE user SET username='start1',age=15,email='start@126.com' where id=3;

update user SET age=age-10 where id <=3;

-- 所有用户年龄+log10
update user set age=age+10;

-- 将id<=5的用户年龄改为-20，将邮箱改为默认值
update user set age=age-20,email=default where id<=5;

-- 测试删除语句
delete from user where username='a';  --删除从 表单'user' 当 'username为'a''

-- 删除年龄为24的用户

delete from user where age=24;

--删除表中所有记录，delete不会清空编号，只是记录没有了

delete from user;

--清空记录与编号

alter table user auto_increment=1;

truncate user;

--本题主要是对更新语句操作，根据题意，是将num为奇数值的记录进行修改，则更新条件为num对2取余为1。

--本题主要是对数据库中关键字操作含义的考查，ALTER修改数据表名或者修改数据表字段时使用，CHANGE 对列进行重命名或更改列的类型，
--需给定旧的列名称和新的列名称、当前的类型。
--UPDATE为更新操作时使用，RENAME数据表更名操作