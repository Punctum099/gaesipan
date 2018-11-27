
#CREATE DATABASE map;

#USE map;

#DROP TABLE map_marker;

/*
CREATE TABLE map_marker
(
    `seq`           INT                              NOT NULL    AUTO_INCREMENT COMMENT '마커 번호', 
    `x_coordinate`  DOUBLE                           NOT NULL    COMMENT 'x 좌표', 
    `y_coordinate`  DOUBLE                           NOT NULL    COMMENT 'y 좌표', 
    `category`      ENUM('음식','카페','오락','기타')    NOT NULL    COMMENT '카테고리', 
    `use_yn`          ENUM('Y','N')                   NOT NULL    COMMENT '삭제 여부', 
    PRIMARY KEY (seq)
);

ALTER TABLE map_marker COMMENT '지도에 찍히는 마크에 관한 테이블';
*/

/*
#홍대 클럽거리
INSERT INTO map_marker (x_coordinate, y_coordinate, category, use_yn) VALUES (37.55081, 126.92558, '기타', 'Y');
#홍대 조폭 떡볶이
INSERT INTO map_marker (x_coordinate, y_coordinate, category, use_yn) VALUES (37.55052, 126.92109, '음식', 'Y');
#짱 오락실
INSERT INTO map_marker (x_coordinate, y_coordinate, category, use_yn) VALUES (37.55127, 126.92128, '오락', 'Y');
*/

/*
SELECT * FROM map_marker WHERE use_yn='Y';
*/
















