/* ROWNUM */
SELECT ROWNUM
        ,empno
        ,ename
        ,job
        ,sal
  FROM emp
 WHERE ROWNUM <= 5
;
        

/* Simple TOP-n Queries  (출력 데이터 건수 제한) ex57 */
--SELECT empno
--        ,ename
--        ,job
--        ,sal
--  FROM emp
-- ORDER BY sal DESC 
-- FETCH FIRST ROWS ONLY
--;



/* EQUI JOIN */
SELECT e.ename
       , d.loc
       , e.deptno
  FROM emp e
       ,dept d
 WHERE e.deptno = d.deptno
   AND e.job = 'ANALYST'
;

/* NON EQUI JOIN */
SELECT e.ename
       ,e.sal
       ,s.grade
  FROM emp e
       ,salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal
;

/* OUTER JOIN (결과가 덜 나오는 쪽에 + ) */
SELECT e.ename
       ,d.loc
  FROM emp e
       ,dept d
 WHERE e.deptno(+) = d.deptno
;

/* SELF JOIN */
SELECT e.ename
       ,e.job
       ,m.ename as 관리자
       ,m.job as 관리자직업
  FROM emp e
       ,emp m
 WHERE e.mgr = m.empno
   AND e.job='SALESMAN'
;

/* ANSI JOIN - ON */
SELECT e.ename
       ,e.job
       ,e.sal
       ,d.loc
  FROM emp e JOIN dept d
    ON (e.deptno = d.deptno)
 WHERE e.job = 'SALESMAN'
;
SELECT e.ename
       ,d.loc
       ,s.grade
  FROM emp e 
  JOIN dept d ON (e.deptno = d.deptno)
  JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
 WHERE e.job = 'SALESMAN'
;
            