CREATE TABLE product_quiz
(
    product_id INTEGER NOT NULL,
    product_code VARCHAR(8) NOT NULL,
    price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

select * from product_quiz;

select 
    CASE
        when price between 0 and 9999 then '0'
        when price between 10000 and 19999 then '10000'
        when price between 20000 and 29999 then '20000'
        when price between 30000 and 39999 then '30000'
    END AS "PRICE_GROUP",
    count(*) AS "PRODUCTS"
from product_quiz
group by
    CASE
        when price between 0 and 9999 then '0'
        when price between 10000 and 19999 then '10000'
        when price between 20000 and 29999 then '20000'
        when price between 30000 and 39999 then '30000'
    END
order by PRICE_GROUP;

select 
    trunc(price/10000)*10000 AS "PRICE_GROUP",
    count(*) AS "PRODUCTS"
from product_quiz
group by trunc(price/10000)
order by PRICE_GROUP;
--
select 
    PRICE_GROUP,
    count(*) AS "PRODUCTS"
from (
    select
        CASE
            when price between 0 and 9999 then '0'
            when price between 10000 and 19999 then '10000'
            when price between 20000 and 29999 then '20000'
            when price between 30000 and 39999 then '30000'
        END AS "PRICE_GROUP"
    from product_quiz
    )
group by PRICE_GROUP
order by PRICE_GROUP;

-- 다른 방법 git 참고~