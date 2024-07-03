
-- 表清单缺失
SELECT BANK_NO,
       BANK_NAME,
       CNAPS_TEMP_TABLE,
       ORDER_FLAG,
       SELECT_FLAG
FROM CNAPS_BANK;


-- ddl
/*
create table CNAPS_BANK
(
    BANK_NO          VARCHAR2(3) not null 银行代号
        constraint CNAPS_BANK_PK
            primary key,
    BANK_NAME        VARCHAR2(100), 相关银行名称
    CNAPS_TEMP_TABLE VARCHAR2(100), 银行主数据临时表
    ORDER_FLAG       VARCHAR2(100), 订单标识
    SELECT_FLAG      NUMBER 查询标识
)
/*/

-- 81
SELECT count(1) as num
  FROM CNAPS_BANK;