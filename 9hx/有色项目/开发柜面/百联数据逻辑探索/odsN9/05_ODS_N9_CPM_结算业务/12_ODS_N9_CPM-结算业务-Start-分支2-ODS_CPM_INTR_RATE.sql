-- 表输入
SELECT RATE_ID,
       AIT_ID,
       RATE_VALUE,
       EFT_DATE,
       SETTING_DATE,
       CURRENT_FLAG,
       REMARK,
       PEG_RATE_CODE
FROM CPM_INTR_RATE;

-- ddl ddl 无表，字段注释

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_INTR_RATE
-- auto-generated definition
create table CPM_INTR_RATE
(
    RATE_ID       NUMBER not null
        constraint PK_CPM_INTR_RATE
            primary key,
    AIT_ID        NUMBER
        constraint FK_CPM_INTR_REL_SBU_R_CPM_ACC_
            references CPM_ACC_INTR,
    RATE_VALUE    NUMBER(10, 6),
    EFT_DATE      DATE,
    SETTING_DATE  DATE,
    CURRENT_FLAG  NUMBER default 0,
    REMARK        VARCHAR2(255),
    PEG_RATE_CODE VARCHAR2(32)
)
/

create unique index CPM_INTR_RATE_UK
    on CPM_INTR_RATE (AIT_ID, EFT_DATE)
/

create index REL_SBU_RATE_SBU_FK
    on CPM_INTR_RATE (AIT_ID)
/
 Show table preview */


/*
CPM_INTR_RATE 账户利率表
字段	含义	备注
RATE_ID	利率记录ID	　
AIT_ID	AIT_ID	账户计息设置ID
RATE_VALUE	利率值	　
EFT_DATE	生效日期	　
SETTING_DATE	设置日期	　
CURRENT_FLAG	当前值标记	默认0
REMARK	备注	　
PEG_RATE_CODE	基准利率代码	基准利率种类
*/

-- list 1