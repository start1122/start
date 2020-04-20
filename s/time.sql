create table test_time(
a TIME
);

insert test_time(a) values('12:23:45');
insert test_time(a) values(NOW());
insert test_time(a) values(CURRENT_TIME);

--测试date类型   yyyy-mm-dd yyyymmdd

create table test_date(
a date
);

insert test_date(a)  values('2019-12-06');
insert test_date(a)  values('20191201');
insert test_date(a)  values('NOW()');
insert test_date(a)  values('CURRENT_DATE');

create table test_datetime(a datetime);

insert test_datetime(a) values(now());
insert test_datetime(a) values(datetime);


