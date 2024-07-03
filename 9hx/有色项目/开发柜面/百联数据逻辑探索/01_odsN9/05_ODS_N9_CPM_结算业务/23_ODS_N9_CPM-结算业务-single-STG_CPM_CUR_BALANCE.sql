-- 执行SQL脚本
delete from STG_CPM_CUR_BALANCE WHERE  BOOK_DATE >= to_date('${sdate}','yyyy-MM-dd');

--表输入

SELECT ACCOUNT_ID,
       BOOK_DATE,
       BOOK_BALANCE,
       AVAILABLE_BALANCE,
       LAST_NIGHT_BALANCE,
       ACM_BALANCE,
       FREEZED,
       to_char(BOOK_DATE, 'yyyy-MM-dd') as sjrq,
       '2'                              AS MAKEUP_STATUS
FROM CPM_CUR_BALANCE
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_CUR_BALANCE
-- auto-generated definition
create table CPM_CUR_BALANCE
(
    ACCOUNT_ID         NUMBER        not null
        constraint FK_CPM_CUR__REL_CUR_B_CPM_BOOK
            references CPM_BOOK_UNIT,
    BOOK_DATE          DATE          not null,
    BOOK_BALANCE       NUMBER(16, 2) not null,
    AVAILABLE_BALANCE  NUMBER(16, 2),
    LAST_NIGHT_BALANCE NUMBER(16, 2),
    ACM_BALANCE        NUMBER(16, 2),
    FREEZED            NUMBER(16, 2),
    constraint PK_CPM_CUR_BALANCE
        primary key (ACCOUNT_ID, BOOK_DATE)
)
/

create index REL_CUR_BALAN_ACC_FK
    on CPM_CUR_BALANCE (ACCOUNT_ID)
/

create unique index CPM_CUR_BALANCE_UK
    on CPM_CUR_BALANCE (ACCOUNT_ID desc, BOOK_DATE desc)
/
 Show table preview */


/*
CPM_CUR_BALANCE 账户当日余额表
字段	含义	备注
ACCOUNT_ID	账户ID	　
BOOK_DATE	签发日期	　
BOOK_BALANCE	账面余额	　
AVAILABLE_BALANCE	可用余额	　
LAST_NIGHT_BALANCE	昨日余额	　
ACM_BALANCE	起息日余额	　
*/
-- list 1