/* TO_CHAR */
SELECT ename
        , TO_CHAR(hiredate, 'YYYY') as 입사년도
        , TO_CHAR(hiredate, 'MM') as 입사월
        , TO_CHAR(hiredate, 'DD') as 입사일
        , TO_CHAR(hiredate, 'DAY') as 입사요일
        , TO_CHAR(sal, '999,999') as 월급
        , TO_CHAR(sal, 'L999,999') as "월급 원단위"
  FROM emp
;
SELECT ename, hiredate
  FROM emp
 WHERE TO_CHAR(hiredate, 'YYYY')='1981'
;


/* EXTRACT */
SELECT ename
        , hiredate as 입사일
        , EXTRACT(year from hiredate) as 년도
        , EXTRACT(month from hiredate) as 월
        , EXTRACT(day from hiredate) as 일
  FROM emp
;


/* TO_DATE */
--RR/MM/DD
SELECT *
  FROM NLS_SESSION_PARAMETERS
 WHERE parameter = 'NLS_DATE_FORMAT'
;
--ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/RR';
--ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';
SELECT ename
       , hiredate
  FROM emp
-- WHERE hiredate='81/11/17'
 WHERE hiredate=TO_DATE('81/11/17', 'RR/MM/DD') -- 날짜형식 상관없이 검색하고싶으면 TO_DATE로 조건변경
;


/* NVL */
SELECT ename, NVL(comm, 0)
  FROM emp
;
SELECT ename
       , sal
       , NVL(comm,0)
       , sal + NVL(comm,0)
       , NVL2(comm, sal+comm, sal)
  FROM emp
;



-- ==============================================================================
/* DECODE */
SELECT ename
        , deptno
        , DECODE(deptno, 10, 300, 20, 400, 0) as 보너스
  FROM emp
-- ORDER BY deptno
;
SELECT empno
        , MOD(empno,2)
        , DECODE(MOD(empno,2),0,'짝수',1,'홀수') as 홀짝
  FROM emp
;
SELECT ename
        , job
        , DECODE(job, 'SALESMAN', 5000, 2000) as 보너스
  FROM emp
;
        

/* CASE */
SELECT ename, job, sal,
        CASE WHEN sal >= 3000 THEN 500
             WHEN sal >= 2000 THEN 300
             WHEN sal >= 1000 THEN 200
             ELSE 0 END AS BONUS
  FROM emp
;
SELECT ename, job, sal,
        CASE WHEN comm is null THEN 500
             ELSE 0 END AS BONUS
  FROM emp
;

SELECT ename, job, sal,
        CASE WHEN job in ('SALESMAN', 'ANALYST') THEN 500
             ELSE 0 END AS BONUS
  FROM emp
;

/*  */
/*  */



