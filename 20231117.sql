-- �Լ�
CREATE OR REPLACE FUNCTION GET_MAJAOR_NAME(IN_MAJOR_NO IN NUMBER)
RETURN VARCHAR2
IS
    --����� ���� ����
    NAME VARCHAR2(50);
BEGIN
    --��ȸ�� ����� ���� NAME�� ����
    SELECT MAJOR_NAME INTO NAME FROM MAJOR WHERE MAJOR_NO = IN_MAJOR_NO;
    RETURN NAME;
END;
SELECT GET_MAJAOR_NAME(2) FROM DUAL;

CREATE OR REPLACE FUNCTION GET_ODD_EVEN(N IN NUMBER)
RETURN VARCHAR2
IS
    MSG VARCHAR2(100);
BEGIN
    IF N = 0 THEN
        MSG := '0���̴ϴ�.';
    ELSIF MOD(N,2) = 1 THEN
        MSG := 'Ȧ�� �Դϴ�.';
    ELSE
        MSG := '¦���Դϴ�.';
    END IF;
    RETURN MSG;
END;

SELECT get_odd_even(3) FROM DUAL;

CREATE OR REPLACE FUNCTION GET_SCORE_GRADE(SCORE IN NUMBER)
RETURN VARCHAR2
AS 
	GRADE VARCHAR2(30) := 'F';
BEGIN
	--���� ���, A+,A,B+,B,C+,C,D+,D,F
    IF SCORE = 4.5 THEN
        GRADE := 'A+';
    ELSIF SCORE >= 4.0 THEN
        GRADE := 'A';
    ELSIF SCORE >= 3.5 THEN
        GRADE := 'B+';
    ELSIF SCORE >= 3.0 THEN
        GRADE := 'B';
    ELSIF SCORE >= 2.5 THEN
        GRADE := 'C+';
    ELSIF SCORE >= 2.0 THEN
        GRADE := 'C';
    ELSIF SCORE >= 1.5 THEN
        GRADE := 'D+';
    ELSIF SCORE >= 1.0 THEN
        GRADE := 'D';
    ELSE
        GRADE := 'F';
    END IF;    
    
	RETURN GRADE;
END GET_SCORE_GRADE;

SELECT GET_SCORE_GRADE(3.6) FROM DUAL;

--�л� ���� ��½�
--�й�, �̸�, �а���, ����, ����, ���, ����
SELECT S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE, GET_SCORE_GRADE(S.STD_SCORE) AS STD_GRADE, S.GENDER
FROM STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO;

CREATE OR REPLACE FUNCTION TOTAL_NUM(NUM IN NUMBER)
RETURN NUMBER
AS 
	TOTAL NUMBER := 0;
	I NUMBER := 1;
BEGIN
    LOOP 
        TOTAL := TOTAL + I;
        I := I + 1;
        EXIT WHEN I > NUM;
    END LOOP;
    
    TOTAL := 0;
     I := 0;
     
     WHILE(I<=NUM)
        LOOP
            TOTAL := TOTAL + I;
            I := I + 1;
        END LOOP;
        
        TOTAL := 0;
        FOR I IN 1 .. NUM
        LOOP
            
            TOTAL := TOTAL + I;
        END LOOP;
        
 RETURN TOTAL;
END TOTAL_NUM;

SELECT TOTAL_NUM(100) FROM DUAL;





