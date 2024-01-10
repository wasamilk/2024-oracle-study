-- RANK, DENSE_RANK
SELECT ename
        ,job
        ,sal
        ,RANK() over (ORDER BY sal DESC) 순위
        ,DENSE_RANK() over (ORDER BY sal DESC) 정밀순위
  FROM emp
 WHERE job in ('ANALYST', 'MANAGER')
;

SELECT ename
        ,job
        ,sal,
        RANK() over (PARTITION BY job ORDER BY sal DESC) 순위
  FROM emp
;

SELECT DENSE_RANK(2975) within group (ORDER BY sal DESC) 순위
  FROM emp
;
SELECT DENSE_RANK('81/11/17') within group (ORDER BY hiredate ASC) 순위
  FROM emp
;


-- NTILE
SELECT ename
        ,job
        ,sal,
        NTILE(4) over (order by sal desc nulls last) 등급
  FROM emp
 WHERE job in ('ANALYST', 'MANAGER', 'CLERK')
;


-- CUME_DIST
SELECT ename
        ,job
        ,sal
        ,RANK() over (ORDER BY sal DESC) 순위
        ,DENSE_RANK() over (ORDER BY sal DESC) 정밀순위
        ,CUME_DIST() over (ORDER BY sal DESC) 순위비율
  FROM emp
;
SELECT ename
        ,job
        ,sal
        ,RANK() over (PARTITION BY job ORDER BY sal DESC) 순위
        ,CUME_DIST() over (PARTITION BY job ORDER BY sal DESC) 순위비율
  FROM emp
;


-- LISTAGG
SELECT deptno
        ,LISTAGG(ename, ',') within group (order by ename) as EMPLOYEE
  FROM emp
 GROUP BY deptno
;
SELECT job
        ,LISTAGG(ename, ',') within group (order by ename) as EMPLOYEE
  FROM emp
 GROUP BY job
;
SELECT job
        ,LISTAGG(ename||'('||sal||')', ',') within group (order by ename) as EMPLOYEE
  FROM emp
 GROUP BY job
;