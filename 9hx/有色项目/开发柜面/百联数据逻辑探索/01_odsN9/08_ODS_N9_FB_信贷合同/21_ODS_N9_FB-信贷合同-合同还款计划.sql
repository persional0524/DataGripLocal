-- 执行SQL脚本
TRUNCATE TABLE ODS_FB_PLANS;

--表输入
SELECT PLAN_ID,
       BID,
       PLAN_DATE,
       TERM_NUM,
       PRINCIPAL,
       INTREST,
       DAY_NUM,
       INTR_DATE,
       END_DATE,
       RATE,
       AMASS,
       OVERDUE_FLAG,
       REMARK,
       LENDING_ID,
       CREATE_TIME,
       LAST_UPDATE_TIME,
       EXEC_FLAG,
       AMOUNT,
       ADVPAY,
       INTRESTBAK,
       ADV_FLAG
FROM FB_PLANS;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_PLANS  -- 合同还款计划
-- auto-generated definition
create table FB_PLANS
(
    PLAN_ID          NUMBER           not null
        constraint PK_FB_PLANS
            primary key,
    BID              NUMBER           not null
        constraint FK_FB_PLANS_REFERENCE_FB_CONTR
            references FB_CONTRACTS,
    PLAN_DATE        DATE             not null,
    TERM_NUM         NUMBER,
    PRINCIPAL        NUMBER(15, 2)    not null,
    INTREST          NUMBER(15, 2),
    DAY_NUM          NUMBER           not null,
    INTR_DATE        DATE             not null,
    END_DATE         DATE             not null,
    RATE             NUMBER(10, 6)    not null,
    AMASS            NUMBER(16, 2)    not null,
    OVERDUE_FLAG     NUMBER default 0 not null,
    REMARK           VARCHAR2(1024),
    LENDING_ID       NUMBER
        constraint FK_FB_PLANS_REFERENCE_FB_LENDI
            references FB_LENDINGS,
    CREATE_TIME      DATE             not null,
    LAST_UPDATE_TIME DATE,
    EXEC_FLAG        NUMBER default 0 not null,
    AMOUNT           NUMBER(15, 2),
    ADVPAY           NUMBER,
    INTRESTBAK       NUMBER(15, 2),
    ADV_FLAG         NUMBER
)
/

comment on table FB_PLANS is '合同还款计划'
/

comment on column FB_PLANS.PLAN_ID is '计划记录ID'
/

comment on column FB_PLANS.BID is '合同ID'
/

comment on column FB_PLANS.PLAN_DATE is '日期'
/

comment on column FB_PLANS.TERM_NUM is '期数'
/

comment on column FB_PLANS.PRINCIPAL is '本金'
/

comment on column FB_PLANS.DAY_NUM is '计息天数'
/

comment on column FB_PLANS.INTR_DATE is '起息日期'
/

comment on column FB_PLANS.END_DATE is '计算截止日'
/

comment on column FB_PLANS.RATE is '利率值'
/

comment on column FB_PLANS.AMASS is '计息积数'
/

comment on column FB_PLANS.OVERDUE_FLAG is '逾期标记'
/

comment on column FB_PLANS.REMARK is '备注'
/

comment on column FB_PLANS.LENDING_ID is '贷款ID'
/

comment on column FB_PLANS.CREATE_TIME is '记录创建时间'
/

comment on column FB_PLANS.LAST_UPDATE_TIME is '末次修改时间'
/

comment on column FB_PLANS.EXEC_FLAG is '执行情况'
/

comment on column FB_PLANS.ADVPAY is '利随本清结息？1是：0、null 不是INBYAMOUNT'
/

comment on column FB_PLANS.ADV_FLAG is '提前还款标志'
/
 Show table preview*/

-- list 1