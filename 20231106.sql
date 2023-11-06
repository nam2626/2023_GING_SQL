--테이블에 컬럼 추가
--회원 테이블에 생년월일 컬럼을 추가
ALTER TABLE MEMBER ADD M_BIRTH DATE;
--회원 테이블에 생년월일 컬럼을 삭제
ALTER TABLE MEMBER DROP COLUMN M_BIRTH;
--회원 테이블에 있는 생년월일 컬럼명을 변경
ALTER TABLE MEMBER RENAME COLUMN M_BIRTH TO BIRTH;