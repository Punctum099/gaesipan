
#CREATE DATABASE map;

#USE map;

#DROP TABLE map_marker;

/*
CREATE TABLE marker
(
    `seq`           INT                          NOT NULL    AUTO_INCREMENT COMMENT '마커 번호', 
    `x_coordinate`  DOUBLE                       NOT NULL    COMMENT 'x 좌표', 
    `y_coordinate`  DOUBLE                       NOT NULL    COMMENT 'y 좌표', 
    `category`      ENUM('음식','카페','오락','기타')    NOT NULL    COMMENT '카테고리', 
    `title`         VARCHAR(50)                  NOT NULL    COMMENT '제목', 
    `contents`      TEXT                  NOT NULL    COMMENT '내용', 
    `tel`           VARCHAR(26)                  NOT NULL    COMMENT '전화번호', 
    `use_yn`        ENUM('Y','N')                NOT NULL    COMMENT '삭제 여부', 
    PRIMARY KEY (seq, x_coordinate, y_coordinate)
);

ALTER TABLE marker COMMENT '지도에 찍히는 마크에 관한 테이블';
*/

/*
#홍대 클럽거리
INSERT INTO marker (x_coordinate, y_coordinate, category, title, contents, tel, use_yn) VALUES (37.55081, 126.92558, '기타', '홍대 클럽거리', '미성년자는 안 됩니다.', '000-0000-0000', 'Y');
#홍대 조폭 떡볶이
INSERT INTO marker (x_coordinate, y_coordinate, category, title, contents, tel, use_yn) VALUES (37.55052, 126.92109, '음식', '홍대 조폭 떡볶이', '진짜 조폭이 만드는 떡볶이 (의외로 잘 함)', '000-0000-0000', 'Y');
#짱 오락실
INSERT INTO marker (x_coordinate, y_coordinate, category, title, contents, tel, use_yn) VALUES (37.55127, 126.92128, '오락', '짱 오락실', '짱구 아닙니다.', '000-0000-0000', 'Y');
*/

/*
SELECT * FROM marker WHERE use_yn='Y';
*/
















