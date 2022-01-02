DROP TABLE IF EXISTS board;

CREATE TABLE board(
	uid int PRIMARY KEY AUTO_INCREMENT,
	userId varchar(10) NOT NULL,
	title varchar(50) NOT NULL,
	summary varchar(200),
	b_date DateTime DEFAULT now()
)

SELECT * FROM board ORDER BY uid DESC;
SELECT * FROM board WHERE uid = 3;

INSERT INTO board (userid, title, summary)
VALUES ("개똥이", "제목1", "내용1");


SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM board ORDER BY uid DESC) A) WHERE RN BETWEEN 1 AND 10;

SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM board ORDER BY uid DESC) A)WHERE RN BETWEEN 1 AND 10;

SELECT * FROM board ORDER BY uid DESC;

SELECT A.* FROM (SELECT * FROM board ORDER BY uid DESC) A LIMIT 10 OFFSET 0;

SELECT count(*) FROM board ORDER BY uid DESC;
