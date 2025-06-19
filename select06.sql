/*********************************************/
기타 복수행 함수

-- 부서와 직업별 평균 급여 및 사원 수
select deptno, job, avg(sal) 평균급여, COUNT(*) 사원수
from emp
group by deptno, job;

-- 부서별 평균 급여와 사원 수
select deptno, avg(sal) 평균급여, COUNT(*) 사원수
from emp
group by deptno;

-- 전체 사원의 평균 급여와 사원 수
select avg(sal) 평균급여, COUNT(*) 사원수
from emp;


select deptno, job, avg(sal) 평균급여, COUNT(*) 사원수
from emp
group by deptno, job
UNION ALL
select deptno, null, avg(sal) 평균급여, COUNT(*) 사원수
from emp
group by deptno
UNION ALL
select null, null, avg(sal) 평균급여, COUNT(*) 사원수
from emp
order by deptno, 2;


select deptno, job, avg(sal) 평균급여, COUNT(*) 사원수
from emp
--group by ROLLUP(deptno, job);
--group by ROLLUP(job, deptno);
group by ROLLUP( (deptno, job) );

group by ROLLUP(deptno, job);
1) deptno, job 순으로 그룹화 데이터를 만듦
2) deptno 그룹화 데이터
3) () 전체 상태 그룹화 데이터


group by ROLLUP(empno, deptno, job);
1) empno, deptno, job
2) empno, deptno
3) empno
4) ()

group by ROLLUP(empno, (deptno, job));
1) empno, deptno, job
2) empno
3) ()


select deptno, job, avg(sal) 평균급여, COUNT(*) 사원수
from emp
group by CUBE(deptno, job);



순위 RANK() OVER (order by 정렬기준대상)
그룹단위 순위 RANK() OVER (partition by 기준 order by 정렬기준대상)
DENSE_RANK()
                        -- group by

select
    ename,
    sal,
    RANK() OVER (order by sal desc) 급여순위,
    DENSE_RANK() OVER (order by sal desc) 급여순위 --공동 순위가 있는 경우 그 다음 숫자로 나옴
from emp;
--order by sal;

select
    name,
    height,
    RANK() OVER (order by height desc) 키순위,
    DENSE_RANK() OVER (order by height desc) 키순위,
    grade,
    RANK() OVER (partition by grade order by height desc) 키순위,  --학년별 키순
    DENSE_RANK() OVER (partition by grade order by height desc) 키순위
from student
order by grade; 







