
-- [관리자계정에서 실행함!! ]
-- 계정 생성
CREATE USER c##ospreyai IDENTIFIED BY "123456";
GRANT CONNECT, RESOURCE TO c##ospreyai;

-- c##ospreyai 사용자에게 USERS 테이블스페이스에 대한 무제한 할당 권한 부여
ALTER USER c##ospreyai QUOTA UNLIMITED ON USERS;
-- - - - - - - - - - - - - - - - - - - --  - - - - - - - - -

-- 회원관리 테이블 제거
DROP TABLE c##ospreyai.USERS CASCADE CONSTRAINTS;



-- 테이블 생성
-- [유저관리 테이블]
CREATE TABLE c##ospreyai.USERS (
    USER_ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    EMAIL VARCHAR2(100) NOT NULL UNIQUE,
    PASSWORD VARCHAR2(100) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    PHONE_NUMBER VARCHAR2(20),
    JOIN_DATE DATE DEFAULT SYSDATE,
    IS_ADMIN NUMBER(1) DEFAULT 0  -- 0: 일반 사용자, 1: 관리자
);

-- [자세교정피드백 테이블]
CREATE TABLE c##ospreyai.SQUATFEEDBACK (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    DURATION NUMBER NOT NULL,
    CORRECT_POSTURE_DURATION NUMBER NOT NULL
);

-- [회원관리 테이블 더미데이터]
INSERT INTO c##ospreyai.USERS (EMAIL, PASSWORD, NAME, PHONE_NUMBER, JOIN_DATE, IS_ADMIN) VALUES ('user1@example.com', 'password123', 'User One', '010-1234-5678', SYSDATE, 0);
INSERT INTO c##ospreyai.USERS (EMAIL, PASSWORD, NAME, PHONE_NUMBER, JOIN_DATE, IS_ADMIN) VALUES ('admin@example.com', 'adminpass', 'Admin User', '010-9999-0000', SYSDATE - 15, 1);
INSERT INTO c##ospreyai.USERS (EMAIL, PASSWORD, NAME, PHONE_NUMBER, JOIN_DATE, IS_ADMIN) VALUES ('user2@example.com', 'password456', 'User Two', '010-2345-6789', SYSDATE - 30, 0);
INSERT INTO c##ospreyai.USERS (EMAIL, PASSWORD, NAME, PHONE_NUMBER, JOIN_DATE, IS_ADMIN) VALUES ('user3@example.com', 'password789', 'User Three', '010-3456-7890', SYSDATE - 60, 0);
INSERT INTO c##ospreyai.USERS (EMAIL, PASSWORD, NAME, PHONE_NUMBER, JOIN_DATE, IS_ADMIN) VALUES ('user4@example.com', 'password012', 'User Four', '010-4567-8901', SYSDATE - 90, 0);
INSERT INTO c##ospreyai.USERS (EMAIL, PASSWORD, NAME, PHONE_NUMBER, JOIN_DATE, IS_ADMIN) VALUES ('user5@example.com', 'password345', 'User Five', '010-5678-9012', SYSDATE - 120, 0);



-- [자세교정 테이블 더미데이터]
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user1', 120, 90);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user2', 150, 100);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user3', 200, 160);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user4', 180, 120);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user5', 300, 250);
-- ++++
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user1', 100, 80);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user2', 110, 85);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user3', 130, 100);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user4', 140, 110);
INSERT INTO c##ospreyai.SQUATFEEDBACK (USER_ID, DURATION, CORRECT_POSTURE_DURATION) VALUES ('user5', 200, 180);






