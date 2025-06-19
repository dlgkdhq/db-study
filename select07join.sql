/*********************************************/
Join

select * from emp;

select * from dept;

-- Join 기준 deptno가 같은

--select empno, ename, dname, loc, e.deptno -- 이렇게 써도 값이 나오긴 하지만
select e.empno, e.ename, d.dname, d.loc, e.deptno -- 이렇게 어느 테이블에서 가져온 값인지 명시해주는게 정석
from emp e, dept d
where e.deptno = d.deptno;

select e.empno, e.ename, d.dname, d.loc, e.deptno
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;

select *
from emp e, dept d; -- join 조건 누락으로 카티션 곱이 진행됨 (모든 경우의 수로 결합됨)
--where e.deptno = d.deptno;


select * from student;
select * from professor;
-- student <- join(profno) -> professor

--select *
select
    s.name, p.name, s.studno, p.profno, p.email
from student s, professor p
where s.profno = p.profno;

--select *
select
    s.name, p.name, s.studno, p.profno, p.email
from student s INNER JOIN professor p
ON s.profno = p.profno;


INNER JOIN , OUTER JOIN

select COUNT(*) from student;
select * from student;

select *
from student s, professor p
--where s.profno = p.profno(+);   --outer join 조인이 안된 애들까지
--where p.profno = s.profno(+);   --(+) 붙는 쪽이 합쳐지는 기준
where p.profno(+) = s.profno;


select *
from student s LEFT OUTER JOIN professor p  --왼쪽(student) 기준으로 join
--from student s RIGHT OUTER JOIN professor p
--from professor p LEFT OUTER JOIN student s      --professor 기준으로 left outer join
--from professor p RIGHT OUTER JOIN student s --오른쪽(student) 기준으로 join 
ON s.profno = p.profno;

--professor 테이블 기준

select COUNT(*) from professor; --16명

select
    s.name, p.name, s.studno, p.profno, p.email
from professor p, student s
where p.profno = s.profno;

select
    s.name, p.name, s.studno, p.profno, p.email
from professor p, student s
where p.profno = s.profno(+);   --outer join 22명


select
    s.name 학생이름, s.profno 교수번호, p.name 교수이름
from student s, professor p
where s.profno = p.profno;

select * from department;

select
    s.name STU_NAME, d.dname DEPT_NAME, p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno and d.deptno = s.deptno1;

select
    s.name STU_NAME, d.dname DEPT_NAME, p.name PROF_NAME
from 
    student s 
    INNER JOIN professor p
    ON s.profno = p.profno
    INNER JOIN department d
    ON d.deptno = s.deptno1;
    
select s.name, p.profno, p.name
from student s, professor p
where s.deptno1 = 101 and s.profno = p.profno;

--1) 학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호
select 
    s.name, s.deptno1, d.dname, p.name, p.deptno
from student s, professor p, department d
where s.profno = p.profno and d.deptno = s.deptno1;

--2) 학생명, 학생학과번호, 교수의 학과명, 교수명, 교수학과번호
select 
    s.name, s.deptno1, d.dname, p.name, p.deptno
from student s, professor p, department d
where s.profno = p.profno and d.deptno = p.deptno;
--and s.deptno1 <> p.deptno;

--2) 학생명, 학생학과번호, 학생의 학과명, 교수의 학과명, 교수명, 교수학과번호, 교수의 학과명
select --* 
    s.name, s.deptno1, ds.dname, p.name, p.deptno, dp.dname
from student s, professor p, department dp, department ds
where s.profno = p.profno 
and ds.deptno = s.deptno1 --학과<->학생
and dp.deptno = p.deptno; --학과<->교수


/*********************************************/
비등가 Join

select * from customer;
select * from gift;

select *
from customer c, gift g
where c.point between g.g_start and g.g_end;

select * from hakjum;

Self Join

select * from emp;

select *
from emp e1, emp e2
where e1.mgr = e2.empno;

select * from emp2;

select A.empno 내사번, A.name 내이름, A.pempno 상사사번, B.name 상사이름
from emp2 A, emp2 B
where A.pempno = B.empno;
