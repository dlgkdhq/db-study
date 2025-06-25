--1. 
--아래 조건에 테이블 생성
--* item_name 은 null 불가
--* create_date 는 기본값 현재
--* PK 는 no

create table T_ITEM_LIST
(
    no NUMBER(6) primary key,
    item_name VARCHAR2(24) not null,
    price NUMBER(6),
    create_date DATE default SYSDATE
);

--2. 
--다음 조건에 맞는 시퀀스를 생성하시오.
--시퀀스명 : T_ITEM_LIST_PK_SEQ
--
--*상세조건
--1부터 시작하며 1씩 증가한다.
--값의 범위는 1~999999
--순환하지 않도록 한다.

create sequence T_ITEM_LIST_PK_SEQ
increment by 1
start with 1
minvalue 1
maxvalue 999999
nocycle
;

--3. 생성한 시퀀스의 값을 불러서 사용하는 방법을 작성하시오.
select T_ITEM_LIST_PK_SEQ.nextval from dual;

--4. 해당 시퀀스를 활용하여, 테이블에 INSERT 처리 하는 쿼리문을 작성하시오.
insert into T_ITEM_LIST values (T_ITEM_LIST_PK_SEQ.nextval, 'item1', 1000, sysdate);
insert into T_ITEM_LIST values (T_ITEM_LIST_PK_SEQ.nextval, 'item2', 2000, sysdate);
insert into T_ITEM_LIST values (T_ITEM_LIST_PK_SEQ.nextval, 'item3', 3000, sysdate);

select * from T_ITEM_LIST;






