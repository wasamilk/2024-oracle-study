/* LAG, LEAD */
SELECT empno
       ,ename
       ,sal
       ,LAG(sal,1) over (order by sal asc) "전 행"
       ,LEAD(sal,1) over (order by sal asc) "다음 행"
       ,LEAD(sal,2) over (order by sal asc) "다다음 행"
  FROM emp
 WHERE job in ('ANALYST', 'MANAGER')
;

SELECT empno
       ,ename
       ,hiredate
       ,LAG(hiredate,1) over (order by hiredate asc) "전 행"
       ,LEAD(hiredate,1) over (order by hiredate asc) "다음 행"
  FROM emp
 WHERE job in ('ANALYST', 'MANAGER')
;

SELECT deptno
       ,empno
       ,ename
       ,hiredate
       ,LAG(hiredate,1) over (partition by deptno order by hiredate asc) "전 행"
       ,LEAD(hiredate,1) over (partition by deptno order by hiredate asc) "다음 행"
  FROM emp
;



/* SUM+DECODE  == PIVOT (행을 컬럼으로)*/
SELECT DECODE(deptno, 10, sal)
  FROM emp
;
SELECT SUM(DECODE(deptno, 10, sal)) as "10"
       , SUM(DECODE(deptno, 20, sal)) as "20"
       , SUM(DECODE(deptno, 30, sal)) as "30"
  FROM emp
;
SELECT job, SUM(DECODE(deptno, 10, sal)) as "10"
       , SUM(DECODE(deptno, 20, sal)) as "20"
       , SUM(DECODE(deptno, 30, sal)) as "30"
  FROM emp
 GROUP BY job
;

SELECT *
  FROM (SELECT deptno
               , sal
          FROM emp)
;
SELECT *
  FROM (SELECT deptno
               , sal
          FROM emp)
 PIVOT (sum(sal) for deptno in (10,20,30)) -- 테이블 회전
;

SELECT *
  FROM (SELECT job
               , sal
          FROM emp)
 PIVOT (sum(sal) for job in ('MANAGER', 'ANALYST' as ANALYST)) 
;



/* UNPIVOT (열row을 행으로) */
SELECT *
  FROM order2
UNPIVOT (건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK))
;
-- NULL test
UPDATE ORDER2 SET NOTEBOOK=NULL WHERE ENAME='SMITH';

SELECT *
  FROM order2
--UNPIVOT (건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK))
UNPIVOT INCLUDE NULLS (건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK))
;


/* SUM OVER(누적 데이터 출력) */
SELECT empno
       , ename
       , sal
       , SUM(sal) OVER (ORDER BY empno ROWS
                        BETWEEN UNBOUNDED PRECEDING
                        AND CURRENT ROW) 누적치
       , SUM(sal) OVER (ORDER BY empno ROWS
                        BETWEEN CURRENT ROW
                        AND UNBOUNDED FOLLOWING) 감소치
  FROM emp
 WHERE job in ('ANALYST', 'MANAGER')
;



/*
  RATIO_TO_REPORT (합을 기준으로 각 로우의 상대적 비율을 구함)
   == sal/SUM(sal) 
*/
SELECT empno
       , ename
       , sal
       , RATIO_TO_REPORT(sal) OVER () as 비율
       , sal/SUM(sal) OVER () as 비교비율
  FROM emp
 WHERE deptno = 20
;



/* ROLLUP */
SELECT job
       ,sum(sal)
  FROM emp
 GROUP BY ROLLUP(job)
;

SELECT deptno
       ,job
       ,sum(sal)
  FROM emp
 GROUP BY ROLLUP(deptno, job)
;
  
  

/* CUBE */
SELECT job, sum(sal)
  FROM emp
 GROUP BY CUBE(job)
;

SELECT deptno, job, sum(sal)
  FROM emp
 GROUP BY CUBE(deptno, job)
;


/* GROUPING SETS */
SELECT deptno, job, sum(sal)
  FROM emp
 GROUP BY GROUPING SETS((deptno), (job), ())
;


/* ROW_NUMBER */
SELECT empno, ename, sal, RANK() OVER (ORDER BY sal DESC) RANK,
                                     DENSE_RANK() OVER (ORDER BY sal DESC) DENSE_RANK,
                                     ROW_NUMBER() OVER (ORDER BY sal DESC) 번호
  FROM emp
 WHERE deptno = 20
;

SELECT deptno, ename, sal, ROW_NUMBER() OVER( PARTITION BY deptno ORDER BY sal DESC) 번호
  FROM emp
 WHERE deptno in (10,20)
;

