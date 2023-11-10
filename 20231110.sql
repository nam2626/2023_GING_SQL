--조인
CREATE TABLE A(
	CODE CHAR(1),
	VAL NUMBER(1)
);
CREATE TABLE B(
	CODE CHAR(1),
	UNIT CHAR(1)
);

INSERT INTO A VALUES('A',1);
INSERT INTO A VALUES('B',2);
INSERT INTO A VALUES('C',3);
INSERT INTO A VALUES('D',4);

INSERT INTO B VALUES('A','+');
INSERT INTO B VALUES('B','-');
INSERT INTO B VALUES('C','*');
INSERT INTO B VALUES('F','/');

--동일 조인
SELECT A.CODE, A.VAL, B.CODE, B.UNIT 
FROM A, B
WHERE A.CODE = B.CODE;

SELECT A.CODE, A.VAL, B.CODE, B.UNIT 
FROM A INNER JOIN B
ON A.CODE = B.CODE;

--자연 조인
SELECT * FROM A NATURAL JOIN B;

--교차 조인
SELECT * FROM A CROSS JOIN B;

--행번호
SELECT ROWNUM, CODE, VAL FROM A;

--학과 목록
SELECT DISTINCT STD_MAJOR FROM STUDENT;

--테이블 생성
CREATE TABLE TEST
AS
SELECT ROWNUM AS RN, CODE, VAL FROM A;

--1. 학과 테이블을 학생 테이블로 부터 뽑아서 저장, 학과번호는 행번호로 지정
CREATE TABLE MAJOR
AS
SELECT ROWNUM AS MAJOR_NO, MAJOR_NAME
FROM
(SELECT DISTINCT STD_MAJOR AS MAJOR_NAME  FROM STUDENT);
-- 기본키 추가 - MAJOR_NO
ALTER TABLE MAJOR ADD CONSTRAINT MAJOR_PK PRIMARY KEY(MAJOR_NO);

--2. 학생 테이블에 학과 번호 컬럼 추가
ALTER TABLE STUDENT ADD MAJOR_NO NUMBER;

--3. 학생 테이블에 학과번호 업데이트 후 학과명을 삭제  
UPDATE STUDENT 
SET MAJOR_NO = (SELECT MAJOR_NO FROM MAJOR WHERE MAJOR_NAME = STD_MAJOR);

ALTER TABLE STUDENT DROP COLUMN STD_MAJOR;

--학번 이름 학과명 평점 조회
SELECT S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE 
FROM STUDENT S, MAJOR M
WHERE S.MAJOR_NO = M.MAJOR_NO;

--학번 이름 학과명 평점 학과번호 조회 - 자연 조인
SELECT * FROM STUDENT NATURAL JOIN MAJOR;

--장학금 테이블
CREATE TABLE STUDENT_SCHOLARSHIP(
    SCHOLARSHIP_NO NUMBER,
    STD_NO CHAR(8),
    MONEY NUMBER);

--장학금 받는 학생의 학번, 이름, 장학금 금액 조회
SELECT s.STD_NO, s.STD_NAME, ss.MONEY 
FROM STUDENT s, STUDENT_SCHOLARSHIP ss
WHERE s.STD_NO = ss.STD_NO;

--장학금 받는 학생의 학번, 이름, 학과명, 장학금 금액 조회
SELECT s.STD_NO, s.STD_NAME, m.MAJOR_NAME, ss.MONEY 
FROM STUDENT s, STUDENT_SCHOLARSHIP ss, MAJOR m
WHERE s.STD_NO = ss.STD_NO AND s.MAJOR_NO = m.MAJOR_NO ;  
   
--외부조인   
--LEFT JOIN
SELECT A.*, B.*
FROM A, B
WHERE A.CODE = B.CODE(+);

SELECT A.*, B.*
FROM A LEFT OUTER JOIN B
ON A.CODE = B.CODE; 

SELECT A.*, B.*
FROM A LEFT OUTER JOIN B
ON A.CODE = B.CODE
WHERE B.CODE IS NULL;
--WHERE B.CODE IS NOT NULL;

--RIGHT JOIN
SELECT A.*, B.*
FROM A, B
WHERE A.CODE(+) = B.CODE;

SELECT A.*, B.*
FROM A RIGHT OUTER JOIN B
ON A.CODE = B.CODE; 

--학생과 학과 테이블을 외부 조인, 학과 테이블의 내용은 전부 나와야 됨
SELECT S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE 
FROM STUDENT S, MAJOR M
WHERE S.MAJOR_NO(+) = M.MAJOR_NO;

--학생테이블에 등록되지 않는 학과 목록을 조회
SELECT M.MAJOR_NAME FROM STUDENT S, MAJOR M
WHERE S.MAJOR_NO(+) = M.MAJOR_NO AND S.STD_NO IS NULL;

--장학금 받지 못하는 학생의 학번, 이름, 학과명, 평점 조회
SELECT s.STD_NO, s.STD_NAME, m.MAJOR_NAME, s.STD_SCORE  
FROM STUDENT s 
LEFT OUTER JOIN STUDENT_SCHOLARSHIP ss
	ON s.STD_NO = ss.STD_NO
INNER JOIN MAJOR m
	ON s.MAJOR_NO = m.MAJOR_NO
WHERE ss.STD_NO IS NULL; 

SELECT s.STD_NO, s.STD_NAME, m.MAJOR_NAME, s.STD_SCORE  
FROM STUDENT s, STUDENT_SCHOLARSHIP ss, MAJOR m
WHERE s.STD_NO = ss.STD_NO(+)
	  AND s.MAJOR_NO = m.MAJOR_NO
	  AND ss.STD_NO IS NULL; 
	 
--사원 정보 조회 : 사원번호 사원명 직급명 부서명 급여
SELECT e.EMP_NO, e.EMP_NAME, p.POS_NAME, d.DEPT_NAME, e.EMP_SALARY
FROM EMPLOYEE e
JOIN DEPARTMENT d 
ON e.DEPT_NO = d.DEPT_NO
JOIN POSITION p
ON e.POS_NO = p.POS_NO;

--car 테이블에 있는 제조사를 별도의 테이블로 분리 작업
--   제조사 코드 : AA-0-000

SELECT TRUNC(dbms_random.value(1,20),0), chr(65)  FROM dual;

CREATE TABLE CAR_MAKER
AS
SELECT UPPER(dbms_random.string('A',2)) || '-' || 
	TRUNC(dbms_random.value(0,10),0)|| '-' || 
	TRUNC(dbms_random.value(100,1000),0) AS CAR_MAKER_CODE, 
	CAR_MAKER AS CAR_MAKER_NAME
FROM 
(SELECT DISTINCT CAR_MAKER FROM CAR);

ALTER TABLE CAR_MAKER ADD CONSTRAINT CAR_MAKER_PK
PRIMARY KEY(CAR_MAKER_CODE);
	 
	 
	 
	 
	 
	 
	 
