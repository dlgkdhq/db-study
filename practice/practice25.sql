create table T_MENU_12
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(32) NOT NULL,
    price NUMBER(10),
    variety VARCHAR2(16),
    made_date DATE
);

insert all
into T_MENU_12 values (1, '싸이버거', 6000, '완전식품', SYSDATE)
into T_MENU_12 values (2, '콩나물비빔밥', 7000, '탄수화물 ', SYSDATE)
into T_MENU_12 values (3, '닭가슴살', 3000, '단백질 ', SYSDATE)
into T_MENU_12 values (4, '베트남쌀국수', 8000, '탄수화물 ', SYSDATE)
into T_MENU_12 values (5, '라면', 2000, '밀가루 ', SYSDATE)
select * from dual;

select * from T_MENU_12;

update T_MENU_12
set price = 8500
--where name = '베트남쌀국수';
where id = 4; -- pk값으로 하는게 좋음 

delete from T_MENU_12
--where name = '라면';
where id = 5;