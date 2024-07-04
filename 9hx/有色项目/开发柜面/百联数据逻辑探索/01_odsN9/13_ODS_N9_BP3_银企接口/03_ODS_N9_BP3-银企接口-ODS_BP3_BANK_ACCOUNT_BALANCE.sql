-- 执行SQL脚本
delete
from ODS_BP3_BANK_ACCOUNT_BALANCE
where balance_date >= to_date('${edate}', 'yyyy-mm-dd');

-- 表输入
select *
from BP3_BANK_ACCOUNT_BALANCE
where balance_date >= to_date('${edate}', 'yyyy-mm-dd');

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: BP3_BANK_ACCOUNT_BALANCE  -- 银行账户余额
-- auto-generated definition
create table BP3_BANK_ACCOUNT_BALANCE
(
    BALANCE_ID        NUMBER        not null
        constraint PK_BP3_BANK_ACCOUNT_BALANCE
            primary key,
    ACCOUNT_ID        NUMBER,
    BANK_CODE         VARCHAR2(6)   not null
        constraint FK_BP3_ACCOUNT_BAL_REF_BANK
            references BP3_BANK,
    ACCOUNT_NO        VARCHAR2(100) not null,
    BALANCE_DATE      DATE          not null,
    CURRENCY_CODE     VARCHAR2(10),
    ACCOUNT_BALANCE   NUMBER(15, 2),
    AVAILABLE_BALANCE NUMBER(15, 2),
    YESTERDAY_BALANCE NUMBER(15, 2),
    AVAILABLE_TUOTA   NUMBER(15, 2),
    CREATE_TIME       DATE default SYSDATE,
    UPDATE_TIME       DATE default SYSDATE,
    RESERVED1         VARCHAR2(300),
    RESERVED2         VARCHAR2(300),
    RESERVED3         VARCHAR2(300),
    RESERVED4         VARCHAR2(300),
    RESERVED5         VARCHAR2(3000),
    constraint UK_BP3_BANK_ACCOUNT_BALANCE
        unique (BANK_CODE, ACCOUNT_NO, BALANCE_DATE, CURRENCY_CODE)
)
/

comment on table BP3_BANK_ACCOUNT_BALANCE is '银行账户余额'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.BALANCE_ID is '账户余额ID'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.ACCOUNT_ID is '银行账户ID'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.BANK_CODE is '银行编号'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.ACCOUNT_NO is '账号'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.BALANCE_DATE is '余额日期'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.CURRENCY_CODE is '币种编码(CNY：人民币；USD：美元)'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.ACCOUNT_BALANCE is '当前余额'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.AVAILABLE_BALANCE is '可用余额'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.YESTERDAY_BALANCE is '昨日余额'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.AVAILABLE_TUOTA is '可用额度'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.CREATE_TIME is '创建时间'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.UPDATE_TIME is '更新时间'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.RESERVED1 is '备用字段1'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.RESERVED2 is '备用字段2'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.RESERVED3 is '备用字段3'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.RESERVED4 is '备用字段4'
/

comment on column BP3_BANK_ACCOUNT_BALANCE.RESERVED5 is '备用字段5'
/
 Show table preview */

-- list  不存在

