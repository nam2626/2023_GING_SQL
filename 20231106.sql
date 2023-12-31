--테이블에 컬럼 추가
--회원 테이블에 생년월일 컬럼을 추가
ALTER TABLE MEMBER ADD M_BIRTH DATE;
--회원 테이블에 생년월일 컬럼을 삭제
ALTER TABLE MEMBER DROP COLUMN M_BIRTH;
--회원 테이블에 있는 생년월일 컬럼명을 변경
ALTER TABLE MEMBER RENAME COLUMN M_BIRTH TO BIRTH;
--학생 테이블에 성별 컬럼을 추가
ALTER TABLE STUDENT ADD GENDER CHAR(1);
--기본값 지정
ALTER TABLE STUDENT ADD GENDER CHAR(1) DEFAULT 'M';
ALTER TABLE STUDENT ADD GENDER NUMBER(1);
--학생 테이블에 성별 컬럼을 삭제
ALTER TABLE STUDENT DROP COLUMN GENDER;

--제약조건 추가
ALTER TABLE MEMBER ADD CONSTRAINT CHECK_AGE CHECK(M_AGE > 0);
--제약조건 제거
ALTER TABLE MEMBER DROP CONSTRAINT CHECK_AGE;

--부서 테이블에 제약 조건 추가
--부서번호는 1~9까지만 데이터가 들어가게끔 제약 조건을 추가 AND, OR
ALTER TABLE DEPARTMENT 
ADD CONSTRAINT CHECK_DEPT_NO CHECK(DEPT_NO > 0 AND DEPT_NO < 10);
--BETWEEN X AND Y 
ALTER TABLE DEPARTMENT 
ADD CONSTRAINT CHECK_DEPT_NO CHECK(DEPT_NO BETWEEN 1 AND 10);
--직급 테이블에 제약조건 추가
--직급 번호는 1~9까지 제약조건 추가
ALTER TABLE POSITION ADD
CONSTRAINT CHECK_POS_NO CHECK(POS_NO BETWEEN 1 AND 10);
--사원 테이블에 사원명에는 공백(띄워쓰기)가 없을때만 저장이 되게끔 제약조건을 추가
--INSTR()
SELECT INSTR('안녕하세요',' ') FROM DUAL;
ALTER TABLE EMPLOYEE ADD
CONSTRAINT CHECK_EMP_NAME CHECK(INSTR(EMP_NAME, ' ') = 0);

--회원등급
--등급번호, 등급명
CREATE TABLE GRADE(
	GRADE_NO NUMBER(1) PRIMARY KEY,
	GRADE_NAME VARCHAR2(30)
);
--회원 테이블에 등급번호 추가
ALTER TABLE MEMBER ADD GRADE_NO NUMBER(1);

--과목 테이블
CREATE TABLE SUBJECT(
	SUBJECT_NO NUMBER(4),
	SUBJECT_NAME VARCHAR2(30),
	CONSTRAINT SUBJECT_NO_CHECK CHECK(SUBJECT_NO > 0)
);
DROP TABLE SUBJECT;
--기본키를 나중에 추가 할때
ALTER TABLE SUBJECT ADD CONSTRAINT SUBJECT_PK PRIMARY KEY(SUBJECT_NO);

--외래키 지정
--회원 테이블의 회원등급 번호는 등급 테이블에 있는 회원등급 번호로 외래키 지정
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_FK_GRADE_NO 
FOREIGN KEY(GRADE_NO) REFERENCES GRADE(GRADE_NO);

--RESTRICT : 삭제시 연결된 CHILD RECORD가 있으면 작업을 멈춤 - 기본값
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_FK_GRADE_NO 
FOREIGN KEY(GRADE_NO) REFERENCES GRADE(GRADE_NO) ON DELETE RESTRICT;
--CASCADE : 삭제시 연결된 CHILD RECORD가 있으면 같이 전부 삭제
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_FK_GRADE_NO 
FOREIGN KEY(GRADE_NO) REFERENCES GRADE(GRADE_NO) ON DELETE CASCADE;

ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_FK_GRADE_NO;

--EMPLOYEE에 외래키 추가, 직급, 부서 테이블과 외래키 적용
ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_FK_DEPT_NO
FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);

ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_FK_POS_NO
FOREIGN KEY(POS_NO) REFERENCES POSITION(POS_NO);












