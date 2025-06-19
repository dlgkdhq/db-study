--1.
--student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
--각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인하고 싶습니다.
--학번 이름 점수 학점 순으로 조회하세요.
select * from student;
select * from score;
select * from hakjum;

select A.studno 학번, A.name 이름, B.total 점수, C.grade 학점
from student A, score B, hakjum C
where A.studno = B.studno
    and B.total between min_point and max_point
order by C.grade;

--2.
--student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
--각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인하고 싶습니다.
--학번 이름 점수 학점 순으로 조회하세요.
--위 내역에서 101, 102 학과에 속한 학생들의 정보만 보여주세요.
select A.studno 학번, A.name 이름, B.total 점수, C.grade 학점
from student A, score B, hakjum C
where A.studno = B.studno
    and B.total between min_point and max_point
    and A.deptno1 in (101, 102)
order by B.total desc;

--3.
--학생 테이블(student)과 학과 테이블(department) , 교수 테이블(professor) 을 Join하여
--301학과 속한 교수를 제외한 교수를 지도교수로 두고 있는
--학생의 이름과 학생의 학년, 학생의 지도교수 이름, 지도교수의 학과 번호, 지도교수가 속한 학과이름을 출력하세요.
select * from student;
select * from department;
select * from professor;

select s.name, s.grade, p.name, p.deptno, d.dname 
from student s, department d, professor p
where p.deptno not in 301
    and p.profno = s.profno
    and p.deptno = d.deptno;