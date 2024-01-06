-- ROUND, TRUNK, FLOOR
SELECT ROUND(243.453,1)
       , ROUND(243.453,-1)
       , ROUND(243.453,0)
       , ROUND(243.453)
  FROM dual
;
SELECT TRUNC(243.453,1)
       , TRUNC(243.453,-1)
       , TRUNC(243.453,0)
       , TRUNC(243.453)
  FROM dual
;
SELECT FLOOR(10/3)
  FROM dual
;


-- MOD(%)
SELECT MOD(10,3)
  FROM dual
;
SELECT ename, empno
  FROM emp
  WHERE MOD(empno,2) = 1
;


-- MONTHS_BETWEEN
SELECT ename
       , hiredate
       , MONTHS_BETWEEN(sysdate, hiredate)
  FROM emp
;

-- ADD_MONTHS
SELECT ADD_MONTHS(TO_DATE('2024-01-01', 'RRRR-MM-DD'), 10)
  FROM dual
;