-- 执行SQL脚本
delete
from ODS_CPM_ACM
WHERE book_date >= to_date('${sdate}', 'yyyy-MM-dd');

-- 表输入
SELECT ACM_ID,
       AIT_ID,
       BOOK_DATE,
       ACM_VALUE,
       BOOK_ACM_VALUE,
       REVERSE_ACM_VALUE,
       OFFSET_ACM_VALUE,
       CONSUME_ACM_VALUE,
       IS_AGREE_UNIT_REVERSED,
       LASTNIGHT_ACM_VALUE
FROM CPM_ACM
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- ddl 无表，字段注释
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_ACM
-- auto-generated definition
create table CPM_ACM
(
    ACM_ID                 NUMBER not null
        constraint PK_CPM_ACM
            primary key,
    AIT_ID                 NUMBER not null
        constraint FK_CPM_ACM_REL_SBU_A_CPM_ACC_
            references CPM_ACC_INTR,
    BOOK_DATE              DATE   not null,
    ACM_VALUE              NUMBER(20, 2),
    BOOK_ACM_VALUE         NUMBER(20, 2),
    REVERSE_ACM_VALUE      NUMBER(20, 2),
    OFFSET_ACM_VALUE       NUMBER(20, 2),
    CONSUME_ACM_VALUE      NUMBER(20, 2),
    IS_AGREE_UNIT_REVERSED NUMBER default 0,
    LASTNIGHT_ACM_VALUE    NUMBER(20, 2)
)
/

create unique index CPM_ACM_UK
    on CPM_ACM (AIT_ID, BOOK_DATE)
/

create index INX_CPM_ACM_1
    on CPM_ACM (BOOK_DATE)
/

create index REL_SBU_ACM_SBU_FK
    on CPM_ACM (AIT_ID)
/
 Show table preview*/

/*
CPM_ACM 计息积数表
字段	含义	备注
ACM_ID	积数ID	　
AIT_ID	AIT_ID	账户计息设置ID
BOOK_DATE	签发日期	　
ACM_VALUE	积数值	　
BOOK_ACM_VALUE	记账积数值	　
REVERSE_ACM_VALUE	预约积数值	　
OFFSET_ACM_VALUE	偏差积数值	　
CONSUME_ACM_VALUE	指定积数值	　
IS_AGREE_UNIT_REVERSED	记账单元预约标记	　
LASTNIGHT_ACM_VALUE	昨日积数值	　
*/

-- list 存在