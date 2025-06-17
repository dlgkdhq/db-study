select deptno "부서번호", dname "부서이름", loc "위치" from dept;

select name || '(' || id || ')' AS "교수정보", position, hiredate AS "입사일자", email AS "이메일" from professor;