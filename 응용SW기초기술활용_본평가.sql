/*
 데이터 형태 및 제약조건
금액은 1000원 이상의 데이터만 받음.
판매여부는 1 or 0 → 1이면 판매가능 0이면 판매 불가능
데이터 형태
메뉴번호 : A0001
메뉴명 : 김밥
원산지 : 햄(국산), 김밥(국산)…..
금액 : 3500
판매여부 : 1
*/
--8-1>ER 다이어그램에 해당하는 테이블 및 제약조건을 생성하는 SQL문을 작성하세요. (15점)
CREATE TABLE menu(
	m_no char(5) PRIMARY KEY,
	m_name varchar2(30),
	m_origin varchar2(300),
	m_price number(6),
	m_sell_flag number(1)
);
ALTER TABLE menu ADD CONSTRAINT check_m_price CHECK(m_price >= 1000);
ALTER TABLE menu ADD CONSTRAINT check_m_sell_flag CHECK(m_sell_flag IN(0,1));
--8-2>작성한 테이블에 데이터 10건을 저장하는 SQL문을 작성하세요.(5점)
INSERT INTO menu values('A0001','김밥','햄(국산), 단무지(일본산)...',3500,1);
INSERT INTO menu values('A0002','떡볶이','쌀떡(국산)...',4500,1);
INSERT INTO menu values('A0003','튀김','김말이(국산)...',1100,0);
INSERT INTO menu values('A0004','순대','돼지고기(국산)...',2600,1);
INSERT INTO menu values('A0005','순대국밥','순대(국산)...',9000,0);
INSERT INTO menu values('A0006','잔치국수','멸치(국산)...',5500,1);
INSERT INTO menu values('A0007','탕수육','돼지고기(국산)...',9500,1);
INSERT INTO menu values('A0008','돈까스','돼지고기(국산)...',7000,0);
INSERT INTO menu values('A0009','제육덮밥','돼지고기 앞다리(국산)...',7500,1);
INSERT INTO menu values('A0010','냉면','육수(국산)...',6000,1);
--8-3>음식이 10000원 이상인 메뉴들을의 전체 컬럼을 조회하는 SQL문을 작성하세요.(5점)
SELECT * FROM menu WHERE m_price >= 10000;
--8-4>음식이 20000원을 이상인 메뉴들을 삭제하는 SQL문을 작성하세요(5점)
DELETE FROM menu WHERE m_price >= 20000;
--8-5>음식이 10000원대의 메뉴들을 2000원 할인해서 수정하는 SQL문을 작성하세요.(5점)
UPDATE menu SET m_price = m_price - 2000 WHERE m_price BETWEEN 10000 AND 19999;






