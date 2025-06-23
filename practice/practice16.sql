/*
참조 테이블 : panmae, product, gift
출력 데이터 : 상품명, 상품가, 구매수량, 총금액,
적립포인트, 새해2배적립포인트, 사은품명, 포인트 범위

- panmae 테이블을 기준으로 포인트를 보여준다.
- 포인트는 구매한 금액 1원당 100의 포인트를 부여한다.
(단, 01월 01인 경우는 새해 이벤트로 인해 1원당 200의 포인트를 부여한다.)
- 적립포인트와 새해2배적립포인트를 모두 보여준다.
(이 경우, 이벤트 날인 01월 01일을 제외하고는 포인트가 동일 할 것이다.)
- 새해2배적립포인트를 기준으로 해당 포인트 기준으로 받을수 있는 사은품을 보여준다.
- 사은품 명 옆에 해당 사은품을 받을 수 있는 포인트의 범위를 함께 보여준다.

* 출력 양식과 컬럼 헤더에 표기되는 이름 확인!
*/

select * from panmae;
select * from product;
select * from gift;

select 
--    substr (p_date, 1, 4) || '-' || substr(p_date, 5, 2) || '-' || substr(p_date, 7, 2) 
    to_char(to_date(A.p_date), 'YYYY-MM-DD') 판매일자,  --p_date가 문자형태라서 날짜형태로 바꾼 후에 바꿔줌
    a.p_code 상품코드,
    B.p_name 상품명,
    to_char(B.p_price, '9,999') 상품가,
    A.p_qty 구매수량,
    to_char(A.p_total, '999,999') 총금액,
    to_char(A.p_total * 100, '999,999') 적립포인트,
--    CASE to_char(to_date(A.p_date,'YYYYMMDD'), 'YYYY-MM-DD')
--        WHEN '2011-01-01' then to_char(A.p_total * 200, '999,999')
--    CASE substr(A.p_date, 5, 4)  
--        WHEN '0101' then to_char(A.p_total * 200, '999,999') 
--        ELSE to_char(A.p_total * 100, '999,999')
--    END 새해2배적립포인트, 
    to_char( DECODE(substr(A.p_date, 5, 4), '0101', A.p_total * 200, A.p_total*100) , '999,999') 새해2배적립포인트,
    C.gname 사은품명,
    to_char(C.g_start, '999,999') 포인트START,
    to_char(C.g_end, '999,999') 포인트END
from panmae A, product B, gift C
where A.p_code = B.p_code
and DECODE(substr(A.p_date, 5, 4), '0101', A.p_total * 200, A.p_total*100) between C.g_start and C.g_end
order by A.p_date;