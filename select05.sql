/*********************************************/
복수행 함수

COUNT(대상) 갯수세기

select COUNT(*)
from emp;

-- 식별자 / 기본키(Primary key) PK, 유일한 한개, null인건 제외하고 카운팅함
select 
    COUNT(empno),
    COUNT(mgr),
    COUNT(comm),
    null
from emp;

select COUNT(*)
from emp
where comm is not null;

select COUNT(*)
from student
where grade = 4;

select COUNT(empno), SUM(sal)
from emp;

-- 10, 20 부서에 총 몇명? 총 급여 얼마씩?
select COUNT(empno), SUM(sal)
from emp
where deptno IN (10, 20);

select
    SUM(height),        --총합
    AVG(height),        --평균
    MAX(height),        --최대값
    MIN(height),        --최소값
    STDDEV(height),     --표준편차
    VARIANCE(height)    --분산
from student;

/*********************************************/
GROUP BY 그룹화

그룹화 결과에 대해 조건 -> HAVING

SELECT
FROM
WHERE
GROUP BY 컬럼대상 대상을 기준으로 그룹 지어서 계산
         GROUP BY 에 명시한 컬럼은 SELECT 조회에 사용 가능
HAVING
ORDER BY

--각 학년별 평균 키
select '1학년' 학년, AVG(height) 평균키
from student
where grade = 1
UNION ALL
select '2학년', AVG(height)
from student
where grade = 2
UNION ALL
select '3학년', AVG(height)
from student
where grade = 3
UNION ALL
select '4학년', AVG(height)
from student
where grade = 4;


select grade, AVG(height)
from student
group by grade
order by grade desc;

select studno, AVG(height)
from student
group by studno;    --학번으로는 그룹을 지을 수 없음.. 쓸 수는 있지만 그룹화되지 않음 한개씩 유일하기 때문에.

select grade, AVG(height) avgh
from student
where grade in (1, 2, 3)
group by grade
--order by grade desc;
--order by avg(height) desc;
--order by 1; -- 컬럼 위치로 조정 가능, 1 - grade, 2 - avg(height)
order by avgh;  -- 컬럼 별칭으로도 정렬 가능


select deptno, AVG(sal)
from emp
group by deptno
having AVG(sal) >= 2000;

1) 급여가 1600 이상인 직원들 대상, 부서별 평균 급여
select deptno, avg(sal)
from emp
where sal >= 1600
group by deptno;

2) 부서별 평균 급여가 1600 이상인 경우, 부서별 평균 급여
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 1600;

--
학생 각 학년별 평균 몸무게
평균 몸무게 65키로 이상
select grade, avg(weight)
from student
GROUP BY grade
HAVING avg(weight) >= 65;

--
학생 4학년을 제외하고 각 학년별 평균 몸무게
평균 몸무게 65키로 이상
select grade, avg(weight)
from student
where grade != 4
GROUP BY grade
HAVING avg(weight) >= 65;


select deptno, job, avg(sal), COUNT(*)
from emp
group by deptno, job;







