-- 执行脚本
delete
from ODS_FBCM_INTR_RATE;

-- 表输入
SELECT RATE_ID,
       LENDING_ID,
       RATE_TYPE,
       EFT_DATE,
       PUNISH_PERCENT,
       BASE_RATE,
       FLOAT_METHOD,
       FLOAT_VALUE,
       LAST_RATE,
       CREATOR,
       CREATE_TIME
FROM FBCM_INTR_RATE;

-- ddl 缺失表注释
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FBCM_INTR_RATE
-- auto-generated definition
create table FBCM_INTR_RATE
(
    RATE_ID        NUMBER        not null
        constraint PK_FBCM_INTR_RATE
            primary key,
    LENDING_ID     NUMBER        not null
        constraint FK_FBCM_INTR_RATE_001
            references FB_LENDINGS,
    RATE_TYPE      VARCHAR2(2)   not null,
    EFT_DATE       DATE          not null,
    PUNISH_PERCENT NUMBER(10, 6),
    BASE_RATE      NUMBER(10, 6),
    FLOAT_METHOD   NUMBER,
    FLOAT_VALUE    NUMBER(10, 6),
    LAST_RATE      NUMBER(10, 6) not null,
    CREATOR        VARCHAR2(100) not null,
    CREATE_TIME    DATE          not null
)
/

comment on column FBCM_INTR_RATE.RATE_ID is '利率流水号'
/

comment on column FBCM_INTR_RATE.LENDING_ID is '通知单流水号'
/

comment on column FBCM_INTR_RATE.RATE_TYPE is '利率分类（00：正常本金利率；01：逾期本金利率；05：挪用本金利率；11：复利利率）'
/

comment on column FBCM_INTR_RATE.EFT_DATE is '生效日期'
/

comment on column FBCM_INTR_RATE.PUNISH_PERCENT is '罚息比例'
/

comment on column FBCM_INTR_RATE.BASE_RATE is '基准利率'
/

comment on column FBCM_INTR_RATE.FLOAT_METHOD is '浮动方式'
/

comment on column FBCM_INTR_RATE.FLOAT_VALUE is '浮动值'
/

comment on column FBCM_INTR_RATE.LAST_RATE is '本金利率'
/

comment on column FBCM_INTR_RATE.CREATOR is '创建人'
/

comment on column FBCM_INTR_RATE.CREATE_TIME is '创建时间'
/
 Show table preview */

-- 财务管理内部利率

-- list 不存在