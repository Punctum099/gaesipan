
#CREATE DATABASE map;

#USE map;

#DROP TABLE marker;

/*
CREATE TABLE marker
(
    `seq`           INT                          NOT NULL    AUTO_INCREMENT COMMENT '마커 번호', 
    `x_coordinate`  VARCHAR(30)                  NOT NULL    COMMENT 'x 좌표', 
    `y_coordinate`  VARCHAR(30)                  NOT NULL    COMMENT 'y 좌표', 
    `road_address`  VARCHAR(50)                  NULL        COMMENT '도로명 주소', 
    `address`       VARCHAR(50)                  NOT NULL    COMMENT '주소', 
    `category`      ENUM('음식','카페','오락','기타')    NOT NULL    COMMENT '카테고리', 
    `title`         VARCHAR(50)                  NOT NULL    COMMENT '제목', 
    `contents`      TEXT                         NOT NULL    COMMENT '내용', 
    `tel`           VARCHAR(26)                  NULL        COMMENT '전화번호', 
    `use_yn`        ENUM('Y','N')                NOT NULL    COMMENT '삭제 여부', 
    PRIMARY KEY (seq, x_coordinate, y_coordinate, address)
);

ALTER TABLE marker COMMENT '지도에 찍히는 마크에 관한 테이블';
*/

/*
#홍대 클럽거리
INSERT INTO marker (x_coordinate, y_coordinate, address, category, title, contents, use_yn) VALUES ('37.550578', '126.923064', '서울 마포구 서교동 406', '기타', '홍대 클럽거리', '미성년자는 안 됩니다.', 'Y');
#돈까스 대왕전
INSERT INTO marker (x_coordinate, y_coordinate, road_address, address, category, title, contents, tel, use_yn) VALUES ('37.550282', '126.920965', '서울특별시 마포구 어울마당로 57', '서울 마포구 서교동 405-14', '음식', '돈까스 대왕전', '돈까스가 진짜 맛있음', '000-0000-0000', 'Y');
#짱 오락실
INSERT INTO marker (x_coordinate, y_coordinate, road_address, address, category, title, contents, tel, use_yn) VALUES ('37.551275', '126.921119', '서울특별시 마포구 어울마당로 69', '서울 마포구 서교동 367-38', '오락', '짱 오락실', '짱구 아닙니다.', '000-0000-0000', 'Y');
*/


#SELECT * FROM marker WHERE use_yn='Y';

















