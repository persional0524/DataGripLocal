-- 执行SQL脚本
truncate table ODS_FB_DISCOUNT_PLAN;

-- 表输入
SELECT PLAN_ID,
       DISCOUNT_ID,
       TYPE,
       PLAN_DATE,
       TERM_NUM,
       AMOUNT,
       DAY_NUM,
       START_DATE,
       END_DATE,
       RATE,
       TYPES_OF_RATE,
       AMASS,
       INTEREST,
       OVERDUE,
       EXECFLAG,
       CREATE_TIME,
       STATE,
       TAX_RATE,
       TAX_AMOUNT,
       EXCLUDE_TAX_AMOUNT
FROM FB_DISCOUNT_PLAN;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_DISCOUNT_PLAN  -- 贴现利息收取计划
-- auto-generated definition
create table FB_DISCOUNT_PLAN
(
    PLAN_ID            NUMBER not null
        constraint PK_DISCOUNT_PALN
            primary key,
    DISCOUNT_ID        NUMBER not null,
    TYPE               VARCHAR2(10),
    PLAN_DATE          DATE,
    TERM_NUM           NUMBER,
    AMOUNT             NUMBER(15, 2),
    DAY_NUM            NUMBER,
    START_DATE         DATE,
    END_DATE           DATE,
    RATE               NUMBER(10, 6),
    TYPES_OF_RATE      VARCHAR2(12),
    AMASS              NUMBER(16, 2),
    INTEREST           NUMBER(15, 2),
    OVERDUE            NUMBER,
    EXECFLAG           NUMBER,
    CREATE_TIME        DATE,
    STATE              NUMBER,
    TAX_RATE           NUMBER(15, 2),
    TAX_AMOUNT         NUMBER(15, 2),
    EXCLUDE_TAX_AMOUNT NUMBER(15, 2)
)
/

comment on table FB_DISCOUNT_PLAN is '贴现利息收取计划'
/

comment on column FB_DISCOUNT_PLAN.PLAN_ID is '计划主键'
/

comment on column FB_DISCOUNT_PLAN.DISCOUNT_ID is '票据主键'
/

comment on column FB_DISCOUNT_PLAN.TYPE is '类型: 00 贴现 01 转贴现 02再贴现'
/

comment on column FB_DISCOUNT_PLAN.PLAN_DATE is '收取日期'
/

comment on column FB_DISCOUNT_PLAN.TERM_NUM is '期数'
/

comment on column FB_DISCOUNT_PLAN.AMOUNT is '票面金额'
/

comment on column FB_DISCOUNT_PLAN.DAY_NUM is '天数'
/

comment on column FB_DISCOUNT_PLAN.START_DATE is '起始日期'
/

comment on column FB_DISCOUNT_PLAN.END_DATE is '结束日期'
/

comment on column FB_DISCOUNT_PLAN.RATE is '利率'
/

comment on column FB_DISCOUNT_PLAN.TYPES_OF_RATE is '利率类型（月利率2 年利率1）'
/

comment on column FB_DISCOUNT_PLAN.AMASS is '基数'
/

comment on column FB_DISCOUNT_PLAN.INTEREST is '利息金额'
/

comment on column FB_DISCOUNT_PLAN.OVERDUE is '逾期标志(保留)'
/

comment on column FB_DISCOUNT_PLAN.EXECFLAG is '执行标志'
/

comment on column FB_DISCOUNT_PLAN.CREATE_TIME is '创建时间'
/

comment on column FB_DISCOUNT_PLAN.STATE is '状态 未执行 0 已执行 1 审批中 2'
/

comment on column FB_DISCOUNT_PLAN.TAX_RATE is '税率'
/

comment on column FB_DISCOUNT_PLAN.TAX_AMOUNT is '税额'
/

comment on column FB_DISCOUNT_PLAN.EXCLUDE_TAX_AMOUNT is '不含税金额'
/
 Show table preview */

-- list 1