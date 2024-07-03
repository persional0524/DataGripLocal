-- 执行SQL脚本
TRUNCATE TABLE ODS_FB_PLAN_EXEC_LOG;

-- 表输入
SELECT PLAN_ID,
       LEDGER_ID,
       PRINCIPAL,
       INTREST
FROM FB_PLAN_EXEC_LOG;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_PLAN_EXEC_LOG  -- 还款计划执行记录
-- auto-generated definition
create table FB_PLAN_EXEC_LOG
(
    PLAN_ID   NUMBER        not null
        constraint FK_FB_PLAN__RELATIONS_FB_PLANS
            references FB_PLANS,
    LEDGER_ID NUMBER        not null
        constraint FK_FB_PLAN__RELATIONS_FB_LEDGE
            references FB_LEDGERS,
    PRINCIPAL NUMBER(15, 2) not null,
    INTREST   NUMBER(15, 2) not null,
    constraint PK_FB_PLAN_EXEC_LOG
        primary key (PLAN_ID, LEDGER_ID)
)
/

comment on table FB_PLAN_EXEC_LOG is '还款计划执行记录'
/

comment on column FB_PLAN_EXEC_LOG.PLAN_ID is '计划记录ID'
/

comment on column FB_PLAN_EXEC_LOG.LEDGER_ID is '台账记录ID'
/

comment on column FB_PLAN_EXEC_LOG.PRINCIPAL is '本金'
/

comment on column FB_PLAN_EXEC_LOG.INTREST is '利息'
/

create index RELATIONSHIP_38_FK
    on FB_PLAN_EXEC_LOG (PLAN_ID)
/

create index RELATIONSHIP_40_FK
    on FB_PLAN_EXEC_LOG (LEDGER_ID)
/
 Show table preview*/

-- list 1

