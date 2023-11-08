--PERSON 테이블
CREATE TABLE PERSON(
	NAME VARCHAR2(30),
	AGE NUMBER(3)
);

--INSERT
--PERSON 테이블에 데이터 추가
INSERT INTO PERSON(NAME,AGE) VALUES('홍길동', 20);
INSERT INTO PERSON(NAME,AGE) VALUES('홍길동', 20);

INSERT INTO PERSON(NAME) VALUES('이영희');

--학생 테이블에 데이터 추가 - 5건
INSERT INTO STUDENT(STD_NO,STD_NAME,STD_MAJOR,STD_SCORE,GENDER)
VALUES('20201111','김씨1','경영학과',3.2,'M');
INSERT INTO STUDENT(STD_NO,STD_NAME,STD_MAJOR,STD_SCORE,GENDER)
VALUES('20202222','김씨2','경영학과',3.2,'F');
INSERT INTO STUDENT(STD_NO,STD_NAME,STD_MAJOR,STD_SCORE,GENDER)
VALUES('20203333','김씨3','경영학과',3.2,'F');
INSERT INTO STUDENT(STD_NO,STD_NAME,STD_MAJOR,STD_SCORE,GENDER)
VALUES('20204444','김씨4','경영학과',3.2,'M');
INSERT INTO STUDENT(STD_NO,STD_NAME,STD_MAJOR,STD_SCORE,GENDER)
VALUES('20205555','김씨5','경영학과',3.2,'M');
--INSERT, UPDATE, DELETE 후에 데이터를 조작한 결과가 바로 적용 되지 않음
--반드시 저장, 적용을 해줘야 DB에 작업 내용이 반영 ---> COMMIT 커밋
COMMIT; 
--마지막 커밋 시점으로 되돌아감
ROLLBACK;

--사원정보 데이터 추가
--날짜도 문자열로 표현해서 저장
--직급번호와 부서번호는 POSITION, DEPARTMENT 테이블에 있는 내용만 저장해야됨
INSERT INTO EMPLOYEE 
VALUES('AB3333','홍길동',3,4,3000,'2023-11-13');
--없는 부서번호 넣었을때 생기는 에러
INSERT INTO EMPLOYEE 
VALUES('AB4444','홍길동',9,4,3000,'2023-11-13');

--SELECT 조회
--PERSON 테이블 내용 조회
SELECT * FROM PERSON;
SELECT NAME FROM PERSON;
--EMPLOYEE 테이블 모든 컬럼 조회
SELECT * FROM EMPLOYEE;
--EMPLOYEE 테이블 사원명, 직급, 부서 컬럼만 조회
SELECT EMP_NAME AS 사원명, POS_NO, DEPT_NO FROM EMPLOYEE;
--STUDENT 테이블 모든 컬럼 조회
SELECT * FROM STUDENT;
--STUDENT 테이블 이름, 학과, 평점 컬럼 조회
SELECT STD_NAME, STD_MAJOR, STD_SCORE FROM STUDENT;
--비교연산자 : > < >= <= = <>
--나이가 30세 이상인 사람만 조회
SELECT * FROM PERSON WHERE AGE >= 30;
--나이가 30세가 아닌 사람만 조회 <> !=
SELECT * FROM PERSON WHERE AGE <> 30;
--나이가 40대인 사람만 조회
SELECT * FROM PERSON WHERE AGE BETWEEN 40 AND 49;
--이름이 홍길동인 사람을 조회
SELECT * FROM PERSON WHERE NAME = '홍길동';
SELECT * FROM PERSON WHERE NAME LIKE '홍길동';
--이름이 김씨인 사람을 조회
SELECT * FROM PERSON WHERE NAME LIKE '김%';
--이름이 희로 끝나는 사람을 조회
SELECT * FROM PERSON WHERE NAME LIKE '%희';
--이름에 영을 포함하는 사람을 조회
SELECT * FROM PERSON WHERE NAME LIKE '%영%';
--이름이 황씨 이거나 나이가 50대인 사람을 조회
--조건이 두개 이상이면 AND, OR
SELECT * FROM PERSON WHERE NAME LIKE '황%' OR AGE BETWEEN 50 AND 59;
SELECT * FROM PERSON WHERE NAME LIKE '황__';

--다중 INSERT문
INSERT ALL
	INTO STUDENT VALUES('20241111','박철수','경제학과',3.4,'M')
	INTO STUDENT VALUES('20242222','이수영','경영학과',1.4,'F')
	INTO STUDENT VALUES('20243333','박서영','생활체육학과',3.4,'F')
	INTO STUDENT VALUES('20244444','이인수','컴퓨터공학과',4.4,'M')
SELECT * FROM DUAL;

--학점이 2.5이상 3.5이하인 학생 목록을 조회
SELECT * FROM STUDENT WHERE STD_SCORE BETWEEN 2.5 AND 3.5;
--학과명이 경제학과인 학생만 조회
SELECT * FROM STUDENT WHERE STD_MAJOR = '경제학과';
--학생 이름이 수로 끝나는 학생만 조회
SELECT * FROM STUDENT WHERE STD_NAME LIKE '%수';
--학과명에 경이 들어가는 학생만 조회
SELECT * FROM STUDENT WHERE STD_MAJOR LIKE '%경%';

--UPDATE
--학생 데이터 중 점수 1.5 미만이면 이름 제적으로 수정하겠다.
UPDATE STUDENT SET STD_NAME = '제적' WHERE STD_SCORE  < 1.5;
--PERSON 테이블에서 모든 사람의 나이를 5씩 증가
UPDATE PERSON SET AGE = AGE + 5;

--DELETE
--PERSON 테이블에서 20세 미만은 전부 삭제
DELETE FROM PERSON WHERE AGE < 20;
--학생 데이터 중 점수 1.5 미만이면 데이터 삭제
DELETE FROM STUDENT WHERE STD_SCORE < 1.5;

--CAR 
CREATE TABLE CAR(
	CAR_ID VARCHAR2(10),
	CAR_NAME VARCHAR2(30),
	CAR_MAKER VARCHAR2(30),
	CAR_MAKE_YEAR NUMBER(4),
	CAR_PRICE NUMBER(5)
);

--자동차 테이블에서 제조사가 BMW인 자동차를 조회
SELECT * FROM CAR WHERE CAR_MAKER LIKE 'BMW';
--자동차 테이블에서 제조사가 BMW이거나 제조사가 Mercedes인 자동차를 조회
SELECT * FROM CAR 
WHERE CAR_MAKER LIKE 'BMW' OR CAR_MAKER LIKE 'Mercedes%';
SELECT * FROM CAR 
WHERE CAR_MAKER IN('BMW','Mercedes-Benz');
--자동차 테이블에서 제조사가 BMW이거나 Mercedes, Audi인 자동차를 조회
SELECT * FROM CAR 
WHERE CAR_MAKER IN('BMW','Mercedes-Benz','Audi');
--자동차 테이블에서 자동차금액이 7000이상 9000이하인 자동차를 조회
SELECT * FROM CAR WHERE CAR_PRICE BETWEEN 7000 AND 9000;
--자동차 테이블에서 제조사가 Kia이면서 자동차금액이 7000이상 9000이하인 자동차를 조회
SELECT * FROM CAR 
WHERE CAR_PRICE BETWEEN 7000 AND 9000 AND CAR_MAKER LIKE 'Kia';
--자동차 테이블에서 자동차번호가 3번째 자리가 8, 4번째 자리가 9인 자동차를 조회
SELECT * FROM CAR WHERE CAR_ID LIKE '__89%';
--자동차 테이블에서 금액이 10000넘는 자동차의 금액을 3000씩 금액을 낮추세요
UPDATE CAR SET CAR_PRICE = CAR_PRICE - 3000
WHERE CAR_PRICE > 10000;
--자동차 테이블에서 제조사가 Jeep인 데이터를 삭제하세요
SELECT * FROM CAR WHERE CAR_MAKER LIKE 'Jeep';
DELETE FROM CAR WHERE CAR_MAKER LIKE 'Jeep';











