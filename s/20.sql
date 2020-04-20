create table cate(
id smallint unsigned not null auto_increment key comment'编号', 
catename varchar(100) not null unique comment'分类名称',
pID smallint unsigned not null default '0' comment'父id'
)engine=innodb charset=utf8;

insert cate(cateName,Pid) values('服装',0);
insert cate(cateName,Pid) values('数码',0);
insert cate(cateName,Pid) values('玩具',0);

insert cate(catename,pid) values('男装',1);
insert cate(catename,pid) values('女装',1);
insert cate(catename,pid) values('内衣',1);

insert cate(catename,pid) values('电视',2);
insert cate(catename,pid) values('冰箱',2);
insert cate(catename,pid) values('洗衣机',2);

insert cate(catename,pid) values('爱马仕',3);
insert cate(catename,pid) values('LV',3);
insert cate(catename,pid) values('GUCCI',3);

insert cate(catename,pid) values('夹克',4);
insert cate(catename,pid) values('衬衫',4);
insert cate(catename,pid) values('裤子',4);

insert cate(catename,pid) values('液晶电视',9);
insert cate(catename,pid) values('等离子电视',9);
insert cate(catename,pid) values('背投电视',9);

-- 查询所有的分类信息，并且得到其父分类

select s.id,s.catename as scatename,p.catename as pcatename
--  选择  s的id s的catename 定义为scatename |||  p的catename 定义为 pcatename
from cate as s
--  从cate定义s
left join cate as p
--  左表 加入cate定义的p
on s.pid=p.id;
--  连接s的pid = p的id  |


-- 查询所有的分类及其子分类
select p.id,p.catename as pcatename,s.catename as scatename
from cate as s
right join cate as p
on s.pid=p.id;

--  展示效果比较明显，会把所有的分类全部展开，从大类包含的中类，到中类包含的小类

--  查询所有的分类并且得到子分类的数目  --  父分类下面有几个子分类

select p.id,p.catename as pcatename,COUNT(s.catename) as count
-- 选择p的id p的catename 定义为pcatename , 统计p的catename做为count
from cate as s
-- 从cate表作为s
right join cate as p
-- 从右侧表加入 cate 作为p
on s.pid=p.id
-- 链接s的pid与p的id
group by p.catename
-- 用p的catename作为分组依据
order by id asc;
-- 用id做为顺序排列

-- INSERT...SELECT可以将查询结果插入到指定数据表中,SET 是设置命令，非查询操作


--------mysql常用函数——————————

ceil() --进一取整
abs()	--取绝对值
floor()  --舍掉小数部分
power()  --幂运算
round()  --四舍五入
PI()	 --圆周率
truncate() --截取小数点后几位
rand()或者RAND(X) --0-1之间随机数
mod()   --取余数
sign(X)  --得到数字符号
exp()   --计算e的x次方

---CEIL(X)该函数返回的最小整数值，但不能小于X，所以CEIL(3561.95)结果为3562，ROUND函数为四舍五入所以ROUND (3561.95,0)为3562，
---第二个选项中用FLOOR（）对数字进行向下取整后可得到3561；第四个选项用TRUNCATE（）截取数字的整数位也可得到3561
---CEIL()用来进一取整，由于12.00001中小数位为1，所以向上取整13
---本题主要考查数据库中数学函数的使用% 和MOD 都可以用于取余数   SELECT 10 % 3;   SELECT 10 MOD 3;



-------mysql字符串函数————————
---char_length();得到字符串的字符数

select char_length('abc');
select char_length('你好啊');   ---也是3个字符

---length 返回字符串的长度
select char_length('你好啊'),length('你好啊'); 

--- concat(s1,s2,....):将字符串合并成一个字符串
select concat('a','b','c');
select concat('a','b','c',null);-- 带null则合并结果为null