/*
CREATE DATABASE gaesipan;
*/

/*
USE gaesipan;
*/

/*
DROP TABLE Board_TB;
*/

/*
CREATE TABLE Board_TB
(
    `seq`       INT                        NOT NULL    AUTO_INCREMENT COMMENT '게시물 번호', 
    `title`     VARCHAR(255)               NOT NULL    COMMENT '글 제목', 
    `contents`  TEXT                       NOT NULL    COMMENT '본문 내용', 
    `author`    CHAR(18)                   NOT NULL    COMMENT '작성자', 
    `hit`       INT                        NOT NULL    COMMENT '조회수', 
    `time`      DATETIME                   NOT NULL    COMMENT '게시한 시간', 
    `UPtime`    DATETIME                   NOT NULL    COMMENT '변경 된 시간', 
    `see`       ENUM('Y','N','D')          NOT NULL    COMMENT '일반 사용자에게 보여질지의 여부', 
    `listType`  ENUM('Notice','Normal')    NOT NULL    DEFAULT('Normal') COMMENT '글 종류', 
    `MTtime`    DATE                        NULL        COMMENT '유지일', 
    PRIMARY KEY (seq)
);

ALTER TABLE Board_TB COMMENT '게시된 글에 대한 테이블';
*/

/*
CREATE TABLE Member_TB
(
    `seq`       INT                     NOT NULL    AUTO_INCREMENT COMMENT '회원 번호', 
    `id`        VARCHAR(45)             NOT NULL    COMMENT '아이디', 
    `password`  VARCHAR(45)             NOT NULL    COMMENT '비밀번호', 
    `email`     VARCHAR(45)             NOT NULL    COMMENT '이메일', 
    `nickname`  VARCHAR(45)             NOT NULL    COMMENT '별명', 
    `name`      VARCHAR(20)             NOT NULL    COMMENT '회원이름', 
    `sex`       ENUM('남','여')         NOT NULL    COMMENT '성별', 
    `birthday`  DATE                    NOT NULL    COMMENT '생년월일', 
    `tel`       CHAR(13)                NOT NULL    COMMENT '휴대전화 번호', 
    `grade`     ENUM('admin','user')    NOT NULL    COMMENT '회원등급', 
    `goust`     ENUM('Y','N')           NOT NULL    COMMENT '회원탈퇴여부', 
    PRIMARY KEY (seq, id, password, email, nickname, tel)
);

ALTER TABLE Member_TB COMMENT '회원 정보 관리 테이블';
*/

/*
SELECT * FROM Board_TB;
*/

/*
SELECT * FROM Board_TB WHERE see = 'Y' AND listType = 'Notice' AND MTtime > NOW() 
UNION ALL 
SELECT * FROM Board_TB WHERE see = 'Y' AND listType = 'Normal' ORDER BY listType DESC, seq DESC LIMIT 0, 10;
*/

/*
SELECT * FROM Board_TB WHERE see = 'Y' AND listType = 'Notice' ORDER BY seq DESC LIMIT 0, 10;
*/

/*
SELECT * FROM Board_TB WHERE listType = 'Notice' ORDER BY seq DESC LIMIT 0, 10;
*/

















