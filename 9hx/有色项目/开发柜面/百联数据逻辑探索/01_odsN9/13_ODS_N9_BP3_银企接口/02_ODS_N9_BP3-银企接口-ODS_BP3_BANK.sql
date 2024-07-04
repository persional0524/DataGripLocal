-- 表输入
SELECT BANK_CODE,
       BANK_NAME,
       BANK_KEY,
       BANK_SHORT_NAME,
       BANK_ROUTING_STRATEGY,
       CONNECT_FLAG
FROM BP3_BANK;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: BP3_BANK  -- 银行
-- auto-generated definition
create table BP3_BANK
(
    BANK_CODE             VARCHAR2(6)                    not null
        constraint PK_BP3_BANK
            primary key,
    BANK_NAME             VARCHAR2(80)                   not null,
    BANK_KEY              VARCHAR2(10)                   not null
        constraint UK_BP3_BANK_KEY
            unique,
    BANK_SHORT_NAME       VARCHAR2(80)                   not null,
    BANK_ROUTING_STRATEGY VARCHAR2(20) default 'ACCOUNT' not null
        constraint CKC_BANK_ROUTING_STRA_BP3_BANK
            check (bank_routing_strategy in ('ACCOUNT', 'BTX', 'FIXED')),
    CONNECT_FLAG          NUMBER       default 0         not null
)
/

comment on table BP3_BANK is '银行'
/

comment on column BP3_BANK.BANK_CODE is '银行编号'
/

comment on column BP3_BANK.BANK_NAME is '银行名称'
/

comment on column BP3_BANK.BANK_KEY is '英文缩写代码'
/

comment on column BP3_BANK.BANK_SHORT_NAME is '银行简称'
/

comment on column BP3_BANK.BANK_ROUTING_STRATEGY is '路由策略(ACCOUNT：账户路由规则;BTX：交易路由规则;FIXED：固定路由规则;;默认为ACCOUNT)'
/

comment on column BP3_BANK.CONNECT_FLAG is '是否直连银行（1：是，2：否）'
/
 Show table preview */

-- list 不存在