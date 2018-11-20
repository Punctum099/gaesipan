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
    `class`  INT            NOT NULL    COMMENT '반', 
    `name`   VARCHAR(45)    NOT NULL    COMMENT '이름', 
    PRIMARY KEY (seq)
);

ALTER TABLE student COMMENT '학생';
*/

/*
CREATE TABLE score
(
    `seq`             INT            NOT NULL    AUTO_INCREMENT COMMENT '번호', 
    `subject`         VARCHAR(24)    NOT NULL    COMMENT '과목', 
    `grade`           INT            NOT NULL    COMMENT '점수', 
    `fk_student_seq`  INT            NOT NULL    COMMENT '학생 정보', 
    PRIMARY KEY (seq)
);

ALTER TABLE score COMMENT '점수';

ALTER TABLE score ADD CONSTRAINT FK_score_fk_student_seq_student_seq FOREIGN KEY (fk_student_seq)
 REFERENCES student (seq)  ON DELETE RESTRICT ON UPDATE RESTRICT;
*/

/*
INSERT INTO student (class, name) VALUES (1, '전성익');
INSERT INTO student (class, name) VALUES (1, '장선호');
INSERT INTO student (class, name) VALUES (1, '차민주');
INSERT INTO student (class, name) VALUES (2, '백아연');
INSERT INTO student (class, name) VALUES (2, '마미손');
INSERT INTO student (class, name) VALUES (2, '조장혁');

INSERT INTO score (subject, grade, fk_student_seq) VALUES ('국어', 100, 1);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('국어', 98, 2);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('국어', 52, 3);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('국어', 78, 4);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('국어', 99, 5);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('국어', 24, 6);

INSERT INTO score (subject, grade, fk_student_seq) VALUES ('영어', 27, 1);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('영어', 56, 2);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('영어', 68, 3);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('영어', 95, 4);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('영어', 64, 5);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('영어', 81, 6);

INSERT INTO score (subject, grade, fk_student_seq) VALUES ('수학', 97, 1);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('수학', 75, 2);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('수학', 100, 3);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('수학', 82, 4);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('수학', 81, 5);
INSERT INTO score (subject, grade, fk_student_seq) VALUES ('수학', 100, 6);
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

















