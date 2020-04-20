create table test_int(
a tinyint,
b smallint,
c mediumint,
d int,
e bigint
);

insert test_int(a) values(-128);
insert test_int(a) values(-129);