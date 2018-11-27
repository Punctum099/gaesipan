/*
CREATE DATABASE test;
*/

/*
USE test;
*/

/*
CREATE TABLE student
(
    `seq`    INT            NOT NULL    AUTO_INCREMENT COMMENT '번호', 
    `class`  VARCHAR(18)    NOT NULL    COMMENT '반', 
    `name`   VARCHAR(45)    NOT NULL    COMMENT '이름', 
    PRIMARY KEY (seq)
);

ALTER TABLE student COMMENT '학생';
*/

/*
CREATE TABLE score
(
    `seq`      INT            NOT NULL    AUTO_INCREMENT COMMENT '번호', 
    `subject`  VARCHAR(24)    NOT NULL    COMMENT '과목', 
    `grade`    INT            NOT NULL    COMMENT '점수', 
    `fk_name`  VARCHAR(45)    NOT NULL    COMMENT '이름', 
    PRIMARY KEY (seq)
);

ALTER TABLE score COMMENT '점수';

/*
ALTER TABLE score ADD CONSTRAINT FK_score_fk_name_student_name FOREIGN KEY (fk_name)
 REFERENCES student (name)  ON DELETE RESTRICT ON UPDATE RESTRICT;
*/

/*
CREATE TABLE score_
(
    `seq`             INT            NOT NULL    AUTO_INCREMENT COMMENT '번호', 
    `subject`         VARCHAR(24)    NOT NULL    COMMENT '과목', 
    `grade`           INT            NOT NULL    COMMENT '점수', 
    `fk_student_seq`  INT            NOT NULL    COMMENT '이름', 
    PRIMARY KEY (seq)
);

ALTER TABLE score_ COMMENT '점수';

ALTER TABLE score_ ADD CONSTRAINT FK_score__fk_student_seq_student_seq FOREIGN KEY (fk_student_seq)
 REFERENCES student (seq)  ON DELETE RESTRICT ON UPDATE RESTRICT;
*/

/*
INSERT INTO student (class, name) VALUES ('A', '레드벨벳');
INSERT INTO student (class, name) VALUES ('A', '아이유');
INSERT INTO student (class, name) VALUES ('A', 'BTS');
INSERT INTO student (class, name) VALUES ('A', '선미');
INSERT INTO student (class, name) VALUES ('A', '우주소녀');
INSERT INTO student (class, name) VALUES ('B', '김태리');
INSERT INTO student (class, name) VALUES ('B', '이민정');
INSERT INTO student (class, name) VALUES ('B', '김태희');
INSERT INTO student (class, name) VALUES ('B', '서현진');
INSERT INTO student (class, name) VALUES ('B', '이병헌');

INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 65, '레드벨벳');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 50, '아이유');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 45, 'BTS');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 75, '선미');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 35, '우주소녀');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 65, '김태리');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 80, '이민정');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 90, '김태희');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 70, '서현진');
INSERT INTO score (subject, grade, fk_name) VALUES ('국어', 100, '이병헌');

INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 100, '레드벨벳');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 75, '아이유');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 90, 'BTS');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 70, '선미');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 50, '우주소녀');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 35, '김태리');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 85, '이민정');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 100, '김태희');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 100, '서현진');
INSERT INTO score (subject, grade, fk_name) VALUES ('수학', 80, '이병헌');

INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 70, '레드벨벳');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 80, '아이유');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 85, 'BTS');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 65, '선미');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 85, '우주소녀');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 45, '김태리');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 70, '이민정');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 75, '김태희');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 45, '서현진');
INSERT INTO score (subject, grade, fk_name) VALUES ('영어', 50, '이병헌');


INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 65, 1);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 50, 2);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 45, 3);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 75, 4);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 35, 5);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 65, 6);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 80, 7);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 90, 8);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 70, 9);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('국어', 100, 10);

INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 100, 1);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 75, 2);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 90, 3);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 70, 4);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 50, 5);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 35, 6);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 85, 7);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 100, 8);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 100, 9);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('수학', 80, 10);

INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 70, 1);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 80, 2);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 85, 3);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 65, 4);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 85, 5);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 45, 6);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 70, 7);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 75, 8);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 45, 9);
INSERT INTO score_ (subject, grade, fk_student_seq) VALUES ('영어', 50, 10);
*/

/*
SELECT 
	student.name AS "이름", 
    score.subject AS "점수", 
    score.grade AS "과목" 
FROM 
	student 
JOIN 
	score 
ON 
	student.seq = score.fk_student_seq;
*/

/*
SELECT 
	student.name AS "이름", 
    ROUND(AVG(score.grade)) AS "평균 점수"
FROM 
	student 
JOIN 
	score 
ON 
	student.seq = score.fk_student_seq 
GROUP BY
	student.name;
*/

/*
SELECT 
	student.name AS '이름', 
    score.grade AS '점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.name = '레드벨벳' AND 
	score.subject = '수학';
*/

/*
SELECT 
	student.name AS '이름', 
    score.grade AS '점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.name = '아이유' AND 
	score.subject = '영어';
*/

/*
SELECT 
	student.name AS '이름', 
    ROUND(AVG(score.grade)) AS '평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.name = '이민정';
*/

/*
SELECT 
	student.name AS '이름', 
	SUM(IF(score.subject != '국어', score.grade, null)) AS '수학 + 영어 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.name = '서현진';
*/

/*
SELECT 
	student.name AS '이름', 
    score.grade AS '점수',
    row_number() over(order by grade desc) as rn 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.class = 'A' AND 
	score.subject = '국어' 
order by
	score.grade DESC;
*/

/*
SELECT 
	student.name AS '이름', 
    score.grade AS '점수',
    row_number() over(order by grade desc) as rn 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.class = 'B' AND 
	score.subject = '영어' 
order by
	score.grade DESC;
*/
/*
select fk_name, grade ,
		row_number() over(order by grade desc) as rn 
from score 
where subject = '국어';
*/

/*
SELECT 
ABS(
(SELECT 
    ROUND(AVG(score.grade)) AS 'BTS 평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.name = 'BTS') - 
(SELECT 
    ROUND(AVG(score.grade)) AS '김태리 평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.name = '김태리')
) AS '평균점수의 차';
*/

/*
SELECT 
    ROUND(AVG(score.grade)) AS 'A반의 수학 평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	score.subject = '수학' AND 
	student.class = 'A';
*/

/*
SELECT 
    ROUND(AVG(score.grade)) AS 'B반의 국어, 영어 평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	(score.subject = '국어' OR 
	score.subject = '영어') AND 
	student.class = 'B';
*/

/*
SELECT 
    ROUND(AVG(score.grade)) AS 'A반의 전체 평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.class = 'A';
*/

/*
SELECT 
ABS(
(SELECT 
    ROUND(AVG(score.grade)) AS 'A반의 전체 평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.class = 'A') - 
(SELECT 
    ROUND(AVG(score.grade)) AS 'B반의 전체 평균 점수' 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name AND 
	student.class = 'B')
) AS '평균점수의 차';
*/

/*
SELECT 
	student.name AS '이름', 
    ROUND(AVG(score.grade)) AS '점수',
    row_number() over(order by grade desc) as rn 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name 
GROUP BY 
	student.name 
order by
	score.grade DESC;
*/


SELECT 
	student.name AS '이름', 
    ROUND(AVG(score.grade)) AS '점수',
    row_number() over(order by grade desc) as rn  
FROM 
(SELECT 
	* 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name 
order by
	score.grade
) AS a JOIN student JOIN score 
GROUP BY
	student.name;
    
    
    

SELECT row_number() over(order by grade desc) as rn FROM score, (
SELECT student.name, 
	   ROUND(AVG(score.grade)) AS 'avg', 
       row_number() over(order by grade desc) as rn  
FROM score, student 
WHERE student.name = score.fk_name 
group by student.name 
order by avg DESC) AS a;




    
SELECT 
	student.name AS '이름', 
    score.grade AS '점수',
    row_number() over(order by grade desc) as rn 
FROM 
	score JOIN student 
WHERE 
	student.name = score.fk_name 
GROUP BY
	student.name 
ORDER BY 
	score.grade DESC, rn;
    
    
    
    
    
    
    
    
    

/*
SELECT 
    MAX(score.grade) AS '최고 점수',
    MIN(score.grade) AS '최저 점수' 
FROM 
	score JOIN student 
WHERE 
	score.subject = '수학' AND 
	student.name = score.fk_name 
order by 
	score.grade DESC;
*/

















