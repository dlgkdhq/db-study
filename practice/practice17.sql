--1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.
select * from student;
select * from department;

select
    s.name STU_NAME, 
    s.deptno1 DEPTNO1, 
    d.dname DEPT_NAME
from student s, department d
where s.deptno1 = d.deptno;


--2. emp2 테이블과 p_grade 테이블을 조회하여
--현재 직급이 있는 사원의 이름과 직급, 현재 연봉, 해당 직급의 연봉의 하한금액과 상한 금액을 아래 결과 화면과 같이 출력하세요.
select * from emp2;
select * from p_grade;

select
    e.name, 
    e.position,
    to_char(e.pay, '999,999,999') PAY, 
    to_char(p.s_pay, '999,999,999') "LOW PAY", 
    to_char(p.e_pay, '999,999,999') "HIGH PAY"
from emp2 e, p_grade p
where e.position is not null
and e.position = p.position(+);
-- INNER JOIN 조인 조건에 맞는게 없으면 사라짐 ('Boss' 포지션 없음)
-- OUTER JOIN


--3. Emp2 테이블과 p_grade 테이블을 조회하여 사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
--예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
--나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.
select * from emp2;
select * from p_grade;

select
    e.name, 
    2010 - to_char(birthday, 'YYYY') + 1 한국나이,
    e.position 지금포지션,
    p.position 그나이에맞는포지션
from emp2 e, p_grade p
where 2010 - to_char(birthday, 'YYYY') + 1 between p.s_age and p.e_age
order by 2;


--4 . customer 테이블과 gift 테이블을 Join하여 고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때 
--Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.
select * from customer;
select * from gift;

select
    gname, point, 'Notebook' GNAME_1
from customer
where point >= (select g_start
                from gift
                where gname = 'Notebook');

select c.gname, c.point, 'Notebook' GNAME_1
from customer c, gift g
where c.point between g.g_start and g.g_end
and g.gno >= 7;

select c.gname, c.point, g.gname
from customer c, gift g
where c.point >= g.g_start
--and g.gno = 7;
and g.gname = 'Notebook';
--order by c.gno, g.gno;


--5. professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요.
--단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
select * from professor;

--서브쿼리 버전
select
    profno, 
    name, 
    hiredate,
    (select COUNT(*)
        from professor p2
        where p2.hiredate < p1.hiredate) COUNT
from professor p1
order by COUNT;

--
select COUNT(*)
from professor
where hiredate <'81/10/23';

-- RANK 이용
select
    profno, 
    name, 
    hiredate,
    RANK() OVER (order by hiredate) - 1 COUNT
from professor;

--join + 집계
select *
from professor;

select p1.profno,p1.name, p1.hiredate, count(p2.profno) COUNT
from professor p1, professor p2
where p1.hiredate > p2.hiredate(+)
group by p1.profno, p1.name, p1.hiredate
order by 2;
----- 선생님 git 참고

--6. emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요. 
--단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
select * from emp;

select
    empno, 
    ename, 
    hiredate,
    (select COUNT(*)
        from emp e2
        where e2.hiredate < e1.hiredate) COUNT
from emp e1
order by COUNT;

SELECT e1.empno, e1.ename, e1.hiredate, COUNT(e2.empno)
FROM emp e1, emp e2
WHERE e1.hiredate > e2.hiredate(+)
GROUP BY e1.empno, e1.ename, e1.hiredate
ORDER BY hiredate;