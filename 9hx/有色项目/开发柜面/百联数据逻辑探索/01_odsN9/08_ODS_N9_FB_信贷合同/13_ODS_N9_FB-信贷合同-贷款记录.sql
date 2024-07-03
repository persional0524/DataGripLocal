-- 执行SQL脚本
delete
from STG_FB_INTREST_RATES
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_INTREST_RATES', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT LENDING_ID,
       BID,
       LENDING_INDEX,
       AMOUNT,
       START_DATE,
       MATURITY,
       STATE,
       APPLY_ID,
       FIVE_LEVEL,
       SHEET_NO,
       CREATOR,
       CREATE_TIME,
       REJECT_REASON,

       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_LENDINGS;


/*
字段缺失
       IOUNUMBER,
       PAYTYPE,
       ISFIRSTLOAN,*/


-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_LENDINGS  -- 贷款记录
-- auto-generated definition
create table FB_LENDINGS
(
    LENDING_ID         NUMBER        not null
        constraint PK_FB_LENDINGS
            primary key,
    BID                NUMBER        not null
        constraint FK_FB_LENDI_RELATIONS_FB_CONTR
            references FB_CONTRACTS,
    LENDING_INDEX      NUMBER        not null,
    AMOUNT             NUMBER(15, 2) not null,
    START_DATE         DATE          not null,
    MATURITY           DATE          not null,
    STATE              NUMBER        not null,
    APPLY_ID           NUMBER,
    FIVE_LEVEL         NUMBER,
    SHEET_NO           VARCHAR2(70),
    CREATOR            VARCHAR2(100),
    CREATE_TIME        DATE,
    REJECT_REASON      VARCHAR2(256),
    PAY_METHOD         NUMBER(38),
    OPP_BANK_NUMBER    VARCHAR2(256),
    OPP_ACCOUNT_NUMBER VARCHAR2(80),
    OPP_ACCOUNT_NAME   VARCHAR2(256),
    INITIA_MATURITY    DATE
)
/

comment on table FB_LENDINGS is '贷款记录'
/

comment on column FB_LENDINGS.LENDING_ID is '贷款ID'
/

comment on column FB_LENDINGS.BID is '合同ID'
/

comment on column FB_LENDINGS.LENDING_INDEX is '本金序号'
/

comment on column FB_LENDINGS.AMOUNT is '金额'
/

comment on column FB_LENDINGS.START_DATE is '开始日期'
/

comment on column FB_LENDINGS.MATURITY is '到期日期'
/

comment on column FB_LENDINGS.STATE is '状态'
/

comment on column FB_LENDINGS.APPLY_ID is '提款申请ID'
/

comment on column FB_LENDINGS.FIVE_LEVEL is '五级分类'
/

comment on column FB_LENDINGS.SHEET_NO is '借据编号'
/

comment on column FB_LENDINGS.CREATOR is '创建人'
/

comment on column FB_LENDINGS.CREATE_TIME is '创建时间'
/

comment on column FB_LENDINGS.REJECT_REASON is '驳回原因'
/

comment on column FB_LENDINGS.PAY_METHOD is '支付方式0：自主支付；1：受托支付；2：混合支付'
/

comment on column FB_LENDINGS.OPP_BANK_NUMBER is '对方行名'
/

comment on column FB_LENDINGS.OPP_ACCOUNT_NUMBER is '对方账号'
/

comment on column FB_LENDINGS.OPP_ACCOUNT_NAME is '对方户名'
/

comment on column FB_LENDINGS.INITIA_MATURITY is '初始到期日期'
/

create index RELATIONSHIP_25_X_FK
    on FB_LENDINGS (BID)
/
 Show table preview */


-- list 1