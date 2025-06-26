CREATE TABLE TABLE_DATA_1
(
    no number(10),
    create_date DATE
);

CREATE TABLE TABLE_DATA_2
(
    no number(10),
    create_date DATE
);

CREATE TABLE TABLE_COLC
(
    std_date DATE,
    CHECK_DATA1 VARCHAR2(6),
    CHECK_DATA2 VARCHAR2(6)
);

INSERT INTO TABLE_DATA_1 VALUES (1, '2023-04-01');
INSERT INTO TABLE_DATA_1 VALUES (2, '2023-04-02');
INSERT INTO TABLE_DATA_1 VALUES (3, '2023-04-03');
INSERT INTO TABLE_DATA_1 VALUES (4, '2023-04-04');
select * from TABLE_DATA_1;

INSERT INTO TABLE_DATA_2 VALUES (1, '2023-04-02');
INSERT INTO TABLE_DATA_2 VALUES (2, '2023-04-03');
INSERT INTO TABLE_DATA_2 VALUES (3, '2023-04-04');
INSERT INTO TABLE_DATA_2 VALUES (4, '2023-04-05');
select * from TABLE_DATA_2;

merge into TABLE_COLC TC
using TABLE_DATA_1 TD1
on (TC.std_date = TD1.create_date)
when matched then
    update set TC.CHECK_DATA1 = 'Y'
when not matched then
    insert values (TD1.create_date, 'Y', 'N');
    
select * from TABLE_COLC
order by std_date;

merge into TABLE_COLC TC
using TABLE_DATA_2 TD2
on (TC.std_date = TD2.create_date)
when matched then
    update set TC.CHECK_DATA2 = 'Y'
when not matched then
    insert values (TD2.create_date, 'N', 'Y');

delete from TABLE_COLC;