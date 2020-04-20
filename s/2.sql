CREATE TABLE IF NOT EXISTS user1(
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