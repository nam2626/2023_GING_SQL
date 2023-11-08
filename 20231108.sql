--함수
--DUAL 임시 테이블, 값을 확인하는 용도
SELECT 'HELLO' FROM DUAL;
SELECT SYSDATE FROM DUAL;
--문자열 함수
--INITCAP : 각 단어별 첫글자만 대문자로 변경
SELECT INITCAP('hello world') FROM DUAL; 
--LOWER : 알파벳 모두 소문자로 변경
--UPPER : 알파벳 모두 대문자로 변경
SELECT LOWER('Hello World'), UPPER('Hello World') FROM dual;
--LENGTH : 글자 개수를 구하는 함수
SELECT LENGTH('HELLO'), LENGTH('안녕하세요') FROM dual;
--LENGTHB : 글자 바이트수 구하는 함수
SELECT LENGTHB('HELLO'), LENGTHB('안녕하세요') FROM dual;
--CONCAT : 두 문자열을 하나로 합치기
SELECT CONCAT('Hello','World') FROM dual;
--전화번호 데이터가 '010' '1111' '1234'를 CONCAT 함수를 이용해서 하나의 문자열로 합치기
SELECT CONCAT('010',CONCAT('1111','1234')) FROM DUAL;
SELECT CONCAT(1234,1234) FROM dual;
-- || : 양쪽의 데이터를 하나의 문자열로 합쳐줌
SELECT '010' || '1111' || '1234' FROM DUAL;
SELECT NAME || '-' || AGE FROM PERSON;

SELECT * FROM USER_TABLES;
--모든 테이블 DROP SQL문 작성
SELECT 'DROP TABLE ' || TABLE_NAME || ';' FROM USER_TABLES;
--문자열 추출
--SUBSTR : 문자열 부분 추출(문자 기준으로 추출)
select substr('1234567890', 5,4) from dual;
select substr('안녕하세요',2,3) from dual;
--주민등록번호 '841113-1246121' --> '841113-1******' 마스킹 처리
SELECT SUBSTR('841113-1246121',1,8) || '******' FROM dual; 
--바이트 단위로 문자열 추출
SELECT SUBSTRB('안녕하세요',2,3) FROM DUAL;
SELECT SUBSTRB('ABCDEFG',2,3) FROM DUAL;

--문자열 검색 INSTR - 검색결과가 있으면 0보다 큰 값, 검색 결과가 없으면 0
select instr('abcdefg','cd') from dual;
select instr('abcdefg','cdf') from dual;
--HELLO WORLD에 공백이 있는지 체크
select instr('HELLO WORLD',' ') from dual;
--테이블 NAME 컬럼에 공백을 넣지 않는 조건
--check(instr(NAME,' ') = 0) -->이런 형태로 테이블의 제약조건에 들어감
--문자열 바꾸기
select replace('AAAAAAABBBBBCCCC','B','F') from dual;
--학생테이블에서 데이터들 중 이름 컬럼에 공백이 있는 학생의 이름을 공백을 '-' 변경하는 업데이트 하시오.
UPDATE STUDENT SET std_name = REPLACE(std_name,' ','-')
WHERE instr(std_name, ' ') != 0;
--LPAD, RPAD --> 원하는 문자열 개수만큼 남은 부분에 지정한 문자열로 채워주는 함수
SELECT RPAD('871211-1',14,'*') FROM DUAL;
SELECT LPAD('871211-1',14,'*') FROM DUAL;
SELECT LPAD('ABC',10,'1234') FROM DUAL;
SELECT RPAD('ABC',10,'1234') FROM DUAL;
--TRIM : 필요없는 좌우 공백을 제거
SELECT TRIM('    A A B     ') FROM DUAL;
SELECT length(TRIM('    A A B     ')) FROM DUAL;
--LTRIM, RTRIM : 좌우에 지정한 문자열을 제거
SELECT LTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
SELECT RTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
------------------------------------------------------------
--ROUND : 원하는 자리수에서 반올림
--  -2 -1    0 1 2 
--1  2  3  . 4 5 6
select round(123.456,-2) from dual;
select round(123.456,-1) from dual;
select round(123.456,0) from dual;
select round(123.456,1) from dual;
select round(123.456,2) from dual;
--올림 : ceil, 내림 : floor
select ceil(123.456), floor(123.456) from dual;
--TRUNC : 원하는 자리수에서 데이터를 자름
select trunc(123.456,-2) from dual;
select trunc(123.456,-1) from dual;
select trunc(123.456,0) from dual;
select trunc(123.456,1) from dual;
select trunc(123.456,2) from dual;
--나머지 나누기 -> 5 % 4
select mod(5, 4) from dual;
--POWER(N,M) : N의 M승
SELECT POWER(2,10) FROM DUAL; --2의 10승
--TO_NUMBER('문자열') : 문자열을 숫자로 바꿔주는 함수
SELECT '123' + 123, TO_NUMBER('123') + 123  FROM DUAL;
----------------------------------------------------------
--날짜시간
SELECT SYSDATE FROM dual;
--오라클에서 지정된 현재 날짜 시간의 출력 포멧을 변경 - 현재 연결된 세션에서만 가능
ALTER SESSION SET nls_date_format = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET nls_date_format = 'YY/MM/DD';
--오늘 날짜부터 지정날짜까지 남은 개월 수
SELECT abs(MONTHS_BETWEEN(sysdate,'2023-12-31')) FROM dual; 
--지정 날짜로부터 몇 개월 후 날짜
select add_months(sysdate,2) from dual;
--주어진 날짜 기준으로 돌아오는 날짜(원하는 요일)
select next_day(sysdate,'금') from dual;
--주어진 날짜 기준으로 날짜가 속한 달의 마지막 날
select last_day(sysdate) from dual;
--내일 날짜 출력
select sysdate + 1 from dual;
--문자열을 날짜로 변경
SELECT TO_DATE('2022-12-31','YYYY-MM-DD') FROM dual; 
--연말까지 D-DAY 출력
select ceil(to_date('2023-12-31','YYYY-MM-DD') - sysdate) from dual;
--TO_CHAR(데이터, '형식') 문자열로 변환
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON MONTH DY DAY') FROM DUAL;













