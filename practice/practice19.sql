--1.
--emp2 테이블 활용
--직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.
select * from emp2;

select
    name, position, pay
from emp2
where pay > (select min(pay) from emp2 where position = 'Section head')
order by pay desc;

--2.
--Student 테이블.
--전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적게 나가는 학생보다 몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력
select * from student;

select 
    name, grade, weight
from student
where weight < (select min(weight) 
                from student 
                where grade = 2
                );
                
--3.
--emp2, dept2 활용
--각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의 부서명, 직원명, 연봉 출력            
select * from emp2;
select * from dept2;

select 
    d.dname, e1.name, e1.pay
from emp2 e1, dept2 d
where e1.pay < (select min(avg(e2.pay)) --이중으로 바로 쓰는건 다른 쿼리에서 안먹힐 수 있어서 되도록 사용x
                from emp2 e2
                group by e2.deptno)
    and e1.deptno = d.dcode
order by e1.pay desc;

select d.dname, e.name, e.pay
from emp2 e, dept2 d
where e.pay < (select MIN(avg_pay)
             from (select avg(pay) avg_pay
                    from emp2
                    group by deptno))
and e.deptno = d.dcode;

select d.dname, e.name, e.pay
from emp2 e, dept2 d
where e.pay < ALL (select avg(pay) avg_pay
                   from emp2
                   group by deptno)
and e.deptno = d.dcode;