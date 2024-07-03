-- 执行SQL脚本
delete
from ODS_CPM_BALANCE
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd')

-- 表输入
SELECT BR_ID,
       ACCOUNT_ID,
       BOOK_DATE,
       BOOK_BALANCE,
       AVAILABLE_BALANCE,
       LAST_NIGHT_BALANCE,
       ACM_BALANCE,
       FREEZED,
       BALANCE_VERSION
FROM CPM_BALANCE
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd')
;

-- ddl 无表，字段注释
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_BALANCE
-- auto-generated definition
create table CPM_BALANCE
(
    BR_ID              NUMBER           not null
        constraint PK_CPM_BALANCE
            primary key,
    ACCOUNT_ID         NUMBER           not null
        constraint FK_CPM_BALA_REL_BALAN_CPM_BOOK
            references CPM_BOOK_UNIT,
    BOOK_DATE          DATE             not null,
    BOOK_BALANCE       NUMBER(16, 2)    not null,
    AVAILABLE_BALANCE  NUMBER(16, 2),
    LAST_NIGHT_BALANCE NUMBER(16, 2),
    ACM_BALANCE        NUMBER(16, 2),
    FREEZED            NUMBER(16, 2),
    BALANCE_VERSION    NUMBER default 0 not null
)
/

create unique index CPM_BALANCE_UK
    on CPM_BALANCE (ACCOUNT_ID, BOOK_DATE)
/

create index INX_CPM_BALANCE_1
    on CPM_BALANCE (BOOK_DATE)
/

create index REL_BALAN_ACC_FK
    on CPM_BALANCE (ACCOUNT_ID)
/
 Show table preview*/



/*
CPM_BALANCE 账户历史余额表
字段	含义	备注
BR_ID	历史余额记录ID	　
ACCOUNT_ID	账户ID	　
BOOK_DATE	签发日期	　
BOOK_BALANCE	账面余额	　
AVAILABLE_BALANCE	可用余额	　
LAST_NIGHT_BALANCE	昨日余额	　
ACM_BALANCE	起息日余额	　
BALANCE_VERSION	版本	　
*/

