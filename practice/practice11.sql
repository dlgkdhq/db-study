select * from emp;

--emp 전체 sal 급여 평균
select AVG(sal)
from emp;

--emp 30번부서사람들 평균급여
select avg(sal)
from emp
where deptno = 30;

--emp 각부서별 평균 급여
select deptno, avg(sal)
from emp
group by deptno
order by deptno;

--emp 각부서별 인원과 평균 급여
select 
    deptno,
    count(*) 인원수,
    ROUND(avg(sal), 2) 평균급여,
    TRUNC(avg(sal), 2) 평균급여
from emp
group by deptno
order by deptno;

--emp 각 직업별 평균 급여
select job, avg(sal)
from emp
group by job;

--emp 각 직업별 가장 높은 급여 얼마?
select job, max(sal)
from emp
group by job;
--order by max(sal) desc;

--emp 각 부서별 가장 높은 급여 얼마?
select deptno, max(sal)
from emp
group by deptno;
--order by max(sal) desc;



