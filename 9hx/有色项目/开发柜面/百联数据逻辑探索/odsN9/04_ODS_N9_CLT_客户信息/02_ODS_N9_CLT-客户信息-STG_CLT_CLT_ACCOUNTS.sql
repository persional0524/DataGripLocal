-- 执行SQL脚本

delete from STG_CLT_CLT_ACCOUNTS WHERE  ( SJRQ='${edate}'   or
    SJRQ<=to_char(to_date('${edate}','yyyy-MM-dd') -
        (select  get_STG_etl_del_para('STG_CLT_CLT_ACCOUNTS',1) as del from dual),'yyyy-mm-dd')
        );

-- 表输入 zip 逻辑
SELECT ID,
       CLT_CLTINFO_ID,
       ACCOUNT_TYPE,
       ACCOUNT_NAME,
       ACCOUNT_NO,
       ACCOUNT_BANK,
       COMBINED_NO,
       PROVINCE,
       CURRENCY,
       STATE,
       REMARK,
       CITY,
       TEMPID,
       OWNERBANK,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_CLT_ACCOUNTS;

-- ddl
/*

Data Source: N9测试环境1
（开发环境
）-柜面 Schema: YSKY_SMS Table: CLT_CLT_ACCOUNTS  -- 该表用来保存客户是金融机构时的账户信息
-- auto-generated definition
create table CLT_CLT_ACCOUNTS
(
    ID             NUMBER not null
        constraint PK_CLT_CLT_ACCOUNTS
            primary key,
    CLT_CLTINFO_ID NUMBER,
    ACCOUNT_TYPE   VARCHAR2(50),
    ACCOUNT_NAME   VARCHAR2(200),
    ACCOUNT_NO     VARCHAR2(200),
    ACCOUNT_BANK   VARCHAR2(200),
    COMBINED_NO    VARCHAR2(200),
    PROVINCE       VARCHAR2(10),
    CURRENCY       VARCHAR2(10),
    STATE          NUMBER,
    REMARK         VARCHAR2(200),
    CITY           VARCHAR2(10),
    TEMPID         NUMBER,
    OWNERBANK      VARCHAR2(10)
)
/

comment on table CLT_CLT_ACCOUNTS is '该表用来保存客户是金融机构时的账户信息'
/

comment on column CLT_CLT_ACCOUNTS.ID is 'ID'
/

comment on column CLT_CLT_ACCOUNTS.CLT_CLTINFO_ID is '客户资料ID'
/

comment on column CLT_CLT_ACCOUNTS.ACCOUNT_TYPE is '业务种类'
/

comment on column CLT_CLT_ACCOUNTS.ACCOUNT_NAME is '户名'
/

comment on column CLT_CLT_ACCOUNTS.ACCOUNT_NO is '帐号'
/

comment on column CLT_CLT_ACCOUNTS.ACCOUNT_BANK is '开户行'
/

comment on column CLT_CLT_ACCOUNTS.COMBINED_NO is '大额联行号'
/

comment on column CLT_CLT_ACCOUNTS.PROVINCE is '行政区域'
/

comment on column CLT_CLT_ACCOUNTS.CURRENCY is '币种'
/

comment on column CLT_CLT_ACCOUNTS.STATE is '状态'
/

comment on column CLT_CLT_ACCOUNTS.REMARK is '备注'
/

comment on column CLT_CLT_ACCOUNTS.CITY is '地市'
/

comment on column CLT_CLT_ACCOUNTS.OWNERBANK is '所属银行'
/
Show table preview */

-- 表清单存在