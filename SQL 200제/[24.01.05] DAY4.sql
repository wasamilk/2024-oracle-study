-- UPPER, LOWER, INITCAP
SELECT 
    ename
    , UPPER(ename)
    , LOWER(ename)
    , INITCAP(ename)
  FROM emp
;

SELECT
    ename
    , sal
  FROM emp
 WHERE LOWER(ename) = 'scott'
;

SELECT
    SUBSTR(ename, 1,3)
  FROM emp
 WHERE ename = UPPER('scott')
;



-- SUBSTR, LENGTH, INSTR, RTRIM
SELECT 
    ename
    , LENGTH(ename)
  FROM emp
;


SELECT INSTR('vin5004@naver.com', '@')
FROM dual;

SELECT SUBSTR('vin5004@naver.com', INSTR('vin5004@naver.com', '@')+1)
FROM dual;

SELECT RTRIM(SUBSTR('vin5004@naver.com', INSTR('vin5004@naver.com', '@')+1), '.com')
FROM dual;


-- REPLACE, REGEXP_REPLACE
SELECT ename
        , REPLACE(sal, '0', '*')
  FROM emp
;
SELECT ename
        , REGEXP_REPLACE(sal, '[0-3]', '*') as sal
  FROM emp
;
SELECT ename
        , REPLACE(ename, SUBSTR(ename,2,1), '**')
  FROM emp
;


-- LPAD, RPAD
SELECT ename
        , sal as salO
        , LPAD(sal, 3, '*') as sal_test
        , LPAD(sal, 10, '*') as sal_lpad
        , RPAD(sal, 10, '*') as sal_rpad
        , RPAD('@', sal/1000, '@') as sal_chart
  FROM emp
;

-- TRIM, LTRIM, RTRIM
SELECT 'smiths'
        , TRIM('s' from 'smiths') as trim
        , TRIM('m' from 'smiths') as trim2
        , LTRIM('smiths', 's') as ltrim
        , RTRIM('smiths', 's') as rtrim
  FROM dual
;

SELECT ename
FROM emp
WHERE ename='JACK'
;


