-- 执行SQL脚本
delete
from ${Internal.Transformation.Name}
where (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('${Internal.Transformation.Name}', 1) as del from dual),
                       'yyyy-mm-dd'));

-- 表输入 2
SELECT bank_account_id,
       bank_account_no,
       bank_account_name,
       cur_code,
       bank_code,
       bank_branch_name,
       account_type_no,
       account_no,
       account_branch_no,
       state,
       remark,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM IDS_BANK_ACCOUNT;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: IDS_BANK_ACCOUNT  -- 存放同业银行账户
-- auto-generated definition
create table IDS_BANK_ACCOUNT
(
    BANK_ACCOUNT_ID       NUMBER not null
        constraint PK_IDS_BANK_ACCOUNT
            primary key,
    BANK_ACCOUNT_NO       VARCHAR2(50),
    BANK_ACCOUNT_NAME     VARCHAR2(100),
    CUR_CODE              VARCHAR2(8),
    BANK_CODE             VARCHAR2(12),
    BANK_BRANCH_NAME      VARCHAR2(100),
    ACCOUNT_TYPE_NO       VARCHAR2(20),
    ACCOUNT_NO            VARCHAR2(50),
    ACCOUNT_BRANCH_NO     VARCHAR2(6),
    STATE                 NUMBER,
    REMARK                VARCHAR2(255),
    RATE                  NUMBER(12, 6),
    OPEN_DATE             DATE,
    CPM_SUBJECT           VARCHAR2(128),
    FINANCIAL_INSTITUTION VARCHAR2(50)
)
/

comment on table IDS_BANK_ACCOUNT is '存放同业银行账户'
/

comment on column IDS_BANK_ACCOUNT.BANK_ACCOUNT_ID is '银行账户ID'
/

comment on column IDS_BANK_ACCOUNT.BANK_ACCOUNT_NO is '银行账号'
/

comment on column IDS_BANK_ACCOUNT.BANK_ACCOUNT_NAME is '银行账户名称'
/

comment on column IDS_BANK_ACCOUNT.CUR_CODE is '币种'
/

comment on column IDS_BANK_ACCOUNT.BANK_CODE is '所属银行编号'
/

comment on column IDS_BANK_ACCOUNT.BANK_BRANCH_NAME is '开户行'
/

comment on column IDS_BANK_ACCOUNT.ACCOUNT_TYPE_NO is '账户类型'
/

comment on column IDS_BANK_ACCOUNT.ACCOUNT_NO is '内部核算账号'
/

comment on column IDS_BANK_ACCOUNT.ACCOUNT_BRANCH_NO is '内部户机构号'
/

comment on column IDS_BANK_ACCOUNT.STATE is '状态'
/

comment on column IDS_BANK_ACCOUNT.REMARK is '描述'
/
 Show table preview*/

-- list 不存在