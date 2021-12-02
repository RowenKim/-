CREATE TABLE board(
	uid int PRIMARY KEY AUTO_INCREMENT,
	userId varchar(10) NOT NULL,
	title varchar(50) NOT NULL,
	summary varchar(200)
)

SELECT * FROM board;

