/*********************************************/
타입 변환

select 2 + '2' from dual;   -- 자동 형변환 (묵시적 형변환)
select 2 || '2' from dual;
select 2 + TO_NUMBER('2') from dual;    --명시적 형변환

TO_CHAR -- 숫자 -> 문자
TO_NUMBER
TO_DATE

select 
    TO_CHAR(12321),
    TO_CHAR(131.1232),
    SYSDATE,
    TO_CHAR(SYSDATE),
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
from dual;

-- jumin 문자 SUBSTR
-- birthday 날짜 TO_CHAR // birthday 날짜 SUBSTR로 뽑지 않는게 좋음
select
    TO_CHAR(birthday, 'YY'),
    TO_CHAR(birthday, 'MM'),
    TO_CHAR(birthday, 'DD')
from student;

select
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    SYSTIMESTAMP,
    TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
from dual;

select
    TO_NUMBER('123')
from dual;

select
    TO_CHAR(1234, '999999'), -- 6자리를 차지함
    TO_CHAR(1234, '0999999'),    -- 빈자리를 0으로 채워줌
    TO_CHAR(1234, '$999999'),
    '$' || 1234,
    TO_CHAR(1234, '9999.99'),    -- 소수점 둘째자리까지 나타내겠다
    TO_CHAR(1234123, '9,999,999')   -- 해당 자리수마다 콤마가 찍힘
from dual;

select
    TO_DATE('2025-01-05') + 3,
    TO_DATE('2025/01/05') + 3,
    TO_DATE('25/01/05') + 3,
    TO_DATE('20250105') + 3,
    LAST_DAY('2025-02-05'),
    LAST_DAY( TO_DATE('2025-02-05') ),
    TO_DATE('2025-06-15', 'YYYY-MM-DD'),
    TO_DATE('25/06/15', 'YY/MM/DD'),
    TO_DATE('2025,04,20', 'YYYY,MM,DD')
from dual;












