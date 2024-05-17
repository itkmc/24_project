DROP DATABASE IF EXISTS `History_Timeline`;
CREATE DATABASE `History_Timeline`;
USE `History_Timeline`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);


# 회원 테이블 생성
CREATE TABLE MEMBER (
    id INT AUTO_INCREMENT PRIMARY KEY,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId VARCHAR(50) NOT NULL,
    loginPw VARCHAR(100) NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    grade ENUM('초보자', '중수', '고수', '관리자') DEFAULT '초보자' NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);

# 질문 테이블 생성
CREATE TABLE question (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(200) NOT NULL,
    answer VARCHAR(100) NOT NULL
);

# 회원 데이터 삽입
INSERT INTO MEMBER (regDate, updateDate, loginId, loginPw, NAME, nickname, grade)
VALUES 
    (NOW(), NOW(), 'test1', 'test1', '회원1', '암것도몰라요', '초보자'),
    (NOW(), NOW(), 'test2', 'test2', '회원2', '쫌자신있지', '중수'),
    (NOW(), NOW(), 'test3', 'test3', '회원3', '마스터했다구', '고수');

# 관리자 데이터 삽입
INSERT INTO MEMBER (regDate, updateDate, loginId, loginPw, NAME, nickname, grade)
VALUES (NOW(), NOW(), 'admin', 'admin', '관리자', '관리자', '관리자');

#select * from question

			#SELECT answer
			#FROM question
			#where id = 1

# 질문 데이터 삽입
INSERT INTO question (content, answer)
VALUES 
    ('널리 인간을 이롭게 한다는 고조선의 건국 이념은?', '홍익인간'),
    ('세계에서 가장 오래된 목판 인쇄물은?', '무구정광대다라니경'),
    ('을지문덕 장군이 수나라의 30만 대군을 몰살시켜 크게 승리한 이 전투의 이름은?', '살수대첩'),
    ('국권 회복을 위해 1907년 안창호, 양기탁 등이 주축이 되어 결성한 비밀결사 단체는?', '신민회'),
    ('우리나라 최초의 한글소설인 이 소설은?', '홍길동전'),
    ('삼국이 통일 된 후 대조영이 세운 나라는?', '발해'),
    ('불교 수용, 태학을 설립, 율령 반포를 한 고구려의 왕은?', '소수림왕'),
    ('독립운동가, 시인, 승려로 님의 침묵을 쓴 사람은?', '한용운'),
    ('을사조약이 일본의 강압으로 이루어진것임을 세계에 알리고 무효로 만들기 위해 파견된 사절단의 이름은?', '헤이그특사'),
    ('김대중 정부 당시 북한에 협력과 지원을 함으로써 평화적인 통일을 목적으로 하는 대북 화해 협력정책인 이 정책의 이름은?', '햇볕정책');
    
# CSV 테이블(유적지) 생성
CREATE TABLE csv1 (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    ruinsName CHAR(100) NOT NULL,
    latitude CHAR(100) NOT NULL,
    longitude CHAR(100) NOT NULL,
    imageLink TEXT NOT NULL,
    `description` CHAR(200) NOT NULL
);

# CSV 테이블(박물관) 생성
CREATE TABLE csv2 (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    museumName CHAR(100) NOT NULL,
    latitude CHAR(100) NOT NULL,
    longitude CHAR(100) NOT NULL,
    viewingHours TEXT NOT NULL,
    closedDays LONG NOT NULL,
    admissionFee LONG NOT NULL,
    exhibitionInformation TEXT NOT NULL
);

# reply 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL
);

# article TD 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

UPDATE article
SET memberId = 1
WHERE id IN (1,2);


UPDATE article
SET memberId = 3
WHERE id IN (3,4);

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relId = 1,
`body` = '댓글 1';

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relId = 1,
`body` = '댓글 2';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relId = 1,
`body` = '댓글 3';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relId = 2,
`body` = '댓글 4';

ALTER TABLE MEMBER
ADD COLUMN 문제점수 INT UNSIGNED NOT NULL DEFAULT 0;

UPDATE MEMBER
SET grade = CASE
    WHEN 문제점수 <= 3 THEN '초보자'
    WHEN 문제점수 <= 6 THEN '중급자'
    WHEN 문제점수 <= 10 THEN '고급자'
    ELSE '관리자'
END;   

##########################################################

SELECT * FROM question;

SELECT * FROM `member`;

SELECT * FROM csv1;

SELECT * FROM csv2;

SELECT * FROM reply;
   
DROP TABLE csv2;
    
###############################################
