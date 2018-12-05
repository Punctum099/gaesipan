
#CREATE DATABASE map;

#USE map;

#DROP TABLE marker;
#DROP TABLE category;

/*
CREATE TABLE marker
(
    `seq`           INT              NOT NULL    AUTO_INCREMENT COMMENT '마커 번호', 
    `x_coordinate`  VARCHAR(30)      NOT NULL    COMMENT 'x 좌표', 
    `y_coordinate`  VARCHAR(30)      NOT NULL    COMMENT 'y 좌표', 
    `road_address`  VARCHAR(50)      NULL        COMMENT '도로명 주소', 
    `address`       VARCHAR(50)      NOT NULL    COMMENT '주소', 
    `category_seq`  INT              NOT NULL    COMMENT '카테고리', 
    `title`         VARCHAR(50)      NOT NULL    COMMENT '제목', 
    `contents`      TEXT             NOT NULL    COMMENT '내용', 
    `tel`           VARCHAR(26)      NULL        COMMENT '전화번호', 
    `use_yn`        ENUM('Y','N')    NOT NULL    COMMENT '삭제 여부', 
    PRIMARY KEY (seq, x_coordinate, y_coordinate, address)
);

ALTER TABLE marker COMMENT '지도에 찍히는 마크에 관한 테이블';
*//*
ALTER TABLE marker ADD CONSTRAINT FK_marker_category_seq_category_seq FOREIGN KEY (category_seq)
 REFERENCES category (seq)  ON DELETE RESTRICT ON UPDATE RESTRICT;
 */
 /*
CREATE TABLE category
(
    `seq`   INT                     NOT NULL    AUTO_INCREMENT COMMENT '카테고리 번호', 
    `name`  VARCHAR(45)             NOT NULL    COMMENT '카테고리 이름', 
    `kind`  ENUM("admin","user")    NOT NULL    COMMENT '카테고리 종류', 
    PRIMARY KEY (seq, name)
);

ALTER TABLE category COMMENT '사용자가 직접 추가하는 카테고리에 관한 테이블';
*/

/*
#홍대 클럽거리
INSERT INTO marker (x_coordinate, y_coordinate, address, category_seq, title, contents, use_yn) VALUES ('37.550578', '126.923064', '서울 마포구 서교동 406', 1, '홍대 클럽거리', '미성년자는 안 됩니다.', 'Y');
#돈까스 대왕전
INSERT INTO marker (x_coordinate, y_coordinate, road_address, address, category_seq, title, contents, tel, use_yn) VALUES ('37.550282', '126.920965', '서울특별시 마포구 어울마당로 57', '서울 마포구 서교동 405-14', 2, '돈까스 대왕전', '돈까스가 진짜 맛있음', '000-0000-0000', 'Y');
#짱 오락실
INSERT INTO marker (x_coordinate, y_coordinate, road_address, address, category_seq, title, contents, tel, use_yn) VALUES ('37.551275', '126.921119', '서울특별시 마포구 어울마당로 69', '서울 마포구 서교동 367-38', 3, '짱 오락실', '짱구 아닙니다.', '000-0000-0000', 'Y');
*/


#SELECT * FROM marker WHERE use_yn='Y';


/*
INSERT INTO category (name, kind) VALUES ('기타', 'admin');
INSERT INTO category (name, kind) VALUES ('음식', 'admin');
INSERT INTO category (name, kind) VALUES ('오락', 'admin');
INSERT INTO category (name, kind) VALUES ('카페', 'admin');
INSERT INTO category (name, kind) VALUES ('술집', 'admin');
*/


#SELECT * FROM marker WHERE use_yn='Y';


#SELECT * FROM category;

/*
SELECT 
	category.seq, 
	x_coordinate, 
	y_coordinate, 
	road_address, 
	address, 
	name, 
	category_seq, 
	title, 
	contents, 
	tel, 
	use_yn 
FROM 
	marker 
INNER JOIN 
	category 
ON 
	category.seq = marker.category_seq 
WHERE 
	use_yn='Y';
*/











