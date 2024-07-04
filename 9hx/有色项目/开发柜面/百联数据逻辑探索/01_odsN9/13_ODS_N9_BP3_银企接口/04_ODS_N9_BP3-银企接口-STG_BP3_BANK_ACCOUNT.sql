-- 执行SQL脚本
delete
from STG_BP3_BANK_ACCOUNT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_BP3_BANK_ACCOUNT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT account_id
     , bank_code
     , app_no
     , account_index
     , account_no
     , account_name
     , sys_account_id
     , node_number
     , currency_code
     , institution_no
     , account_type
     , cms_type
     , account_state
     , stand_region_code
     , stand_region_name
     , bank_region_code
     , bank_region_name
     , open_bank_name
     , open_bank_cnaps_code
     , open_bank_swift_code
     , clear_bank_name
     , clear_bank_cnaps_code
     , contract_no
     , country_code
     , country_name
     , swift_code
     , channel_type
     , create_time
     , channel_no
     , not_normal_acct_appno
     , reserved1
     , reserved2
     , reserved3
     , reserved4
     , reserved5
     , balance_update_time
     , record_update_time
     , cltno
     , treeno
     , master_acc_num
     , financial_account_type
     , '${edate}' as sjrq
     , '2'        as MAKEUP_STATUS
FROM BP3_BANK_ACCOUNT;

/*
-- 字段缺失
     , attributes_json
*/

--ddl

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: BP3_BANK_ACCOUNT  -- 银行账户
-- auto-generated definition
create table BP3_BANK_ACCOUNT
(
    ACCOUNT_ID             NUMBER        not null
        constraint PK_BP3_BANK_ACCOUNT
            primary key,
    BANK_CODE              VARCHAR2(6)   not null
        constraint FK_BP3_BANK_ACCOUNT_REF_BANK
            references BP3_BANK,
    APP_NO                 VARCHAR2(256),
    ACCOUNT_INDEX          VARCHAR2(128) not null,
    ACCOUNT_NO             VARCHAR2(100) not null,
    ACCOUNT_NAME           VARCHAR2(255),
    SYS_ACCOUNT_ID         VARCHAR2(32),
    NODE_NUMBER            VARCHAR2(60),
    CURRENCY_CODE          VARCHAR2(10),
    INSTITUTION_NO         VARCHAR2(60),
    ACCOUNT_TYPE           VARCHAR2(20),
    CMS_TYPE               NUMBER,
    ACCOUNT_STATE          NUMBER,
    STAND_REGION_CODE      VARCHAR2(32),
    STAND_REGION_NAME      VARCHAR2(128),
    BANK_REGION_CODE       VARCHAR2(32),
    BANK_REGION_NAME       VARCHAR2(128),
    OPEN_BANK_NAME         VARCHAR2(200),
    OPEN_BANK_CNAPS_CODE   VARCHAR2(20),
    OPEN_BANK_SWIFT_CODE   VARCHAR2(30),
    CLEAR_BANK_NAME        VARCHAR2(200),
    CLEAR_BANK_CNAPS_CODE  VARCHAR2(20),
    CONTRACT_NO            VARCHAR2(60),
    COUNTRY_CODE           VARCHAR2(20),
    COUNTRY_NAME           VARCHAR2(80),
    SWIFT_CODE             VARCHAR2(30),
    CHANNEL_TYPE           NUMBER default 1,
    CREATE_TIME            DATE   default SYSDATE,
    CHANNEL_NO             VARCHAR2(100),
    NOT_NORMAL_ACCT_APPNO  VARCHAR2(256),
    RESERVED1              VARCHAR2(300),
    RESERVED2              VARCHAR2(300),
    RESERVED3              VARCHAR2(300),
    RESERVED4              VARCHAR2(300),
    RESERVED5              VARCHAR2(3000),
    BALANCE_UPDATE_TIME    DATE,
    RECORD_UPDATE_TIME     DATE,
    CLTNO                  VARCHAR2(18),
    TREENO                 VARCHAR2(24),
    MASTER_ACC_NUM         VARCHAR2(100),
    FINANCIAL_ACCOUNT_TYPE VARCHAR2(20)
)
/

comment on table BP3_BANK_ACCOUNT is '银行账户'
/

comment on column BP3_BANK_ACCOUNT.ACCOUNT_ID is '账户ID'
/

comment on column BP3_BANK_ACCOUNT.BANK_CODE is '银行编号'
/

comment on column BP3_BANK_ACCOUNT.APP_NO is '系统来源标识号'
/

comment on column BP3_BANK_ACCOUNT.ACCOUNT_INDEX is '账户索引'
/

comment on column BP3_BANK_ACCOUNT.ACCOUNT_NO is '账号'
/

comment on column BP3_BANK_ACCOUNT.ACCOUNT_NAME is '户名'
/

comment on column BP3_BANK_ACCOUNT.SYS_ACCOUNT_ID is '原系统账户ID'
/

comment on column BP3_BANK_ACCOUNT.NODE_NUMBER is '前置节点编号'
/

comment on column BP3_BANK_ACCOUNT.CURRENCY_CODE is '币种编码(CNY：人民币；USD：美元)'
/

comment on column BP3_BANK_ACCOUNT.INSTITUTION_NO is '机构编号'
/

comment on column BP3_BANK_ACCOUNT.ACCOUNT_TYPE is '101:基本存款账户
102:一般存款账户
103:专用存款账户
104:临时存款账户
201:外币结算账户
202:外币待核查账户
203:外币资本金账户
204:外币贷款专用户'
/

comment on column BP3_BANK_ACCOUNT.CMS_TYPE is '现金管理类型'
/

comment on column BP3_BANK_ACCOUNT.ACCOUNT_STATE is '1-正常；0-失效；2-冻结'
/

comment on column BP3_BANK_ACCOUNT.STAND_REGION_CODE is '标准地区代码'
/

comment on column BP3_BANK_ACCOUNT.STAND_REGION_NAME is '标准地区名称'
/

comment on column BP3_BANK_ACCOUNT.BANK_REGION_CODE is '银行地区代码'
/

comment on column BP3_BANK_ACCOUNT.BANK_REGION_NAME is '银行地区名称'
/

comment on column BP3_BANK_ACCOUNT.OPEN_BANK_NAME is '开户行名称'
/

comment on column BP3_BANK_ACCOUNT.OPEN_BANK_CNAPS_CODE is '开户行联行号'
/

comment on column BP3_BANK_ACCOUNT.OPEN_BANK_SWIFT_CODE is '开户行swift号'
/

comment on column BP3_BANK_ACCOUNT.CLEAR_BANK_NAME is '清算行名称'
/

comment on column BP3_BANK_ACCOUNT.CLEAR_BANK_CNAPS_CODE is '清算行行号'
/

comment on column BP3_BANK_ACCOUNT.CONTRACT_NO is '合同（协议）号'
/

comment on column BP3_BANK_ACCOUNT.COUNTRY_CODE is '国家（地区）代码'
/

comment on column BP3_BANK_ACCOUNT.COUNTRY_NAME is '国家（地区）名称'
/

comment on column BP3_BANK_ACCOUNT.SWIFT_CODE is '机构swift号'
/

comment on column BP3_BANK_ACCOUNT.CHANNEL_TYPE is '渠道类型（1：银企直联；0：swift；）'
/

comment on column BP3_BANK_ACCOUNT.CREATE_TIME is '创建时间'
/

comment on column BP3_BANK_ACCOUNT.CHANNEL_NO is '渠道编号'
/

comment on column BP3_BANK_ACCOUNT.NOT_NORMAL_ACCT_APPNO is '注册的账户,状态是不正常的模块,以逗号分隔存储'
/

comment on column BP3_BANK_ACCOUNT.RESERVED1 is '备用字段1'
/

comment on column BP3_BANK_ACCOUNT.RESERVED2 is '备用字段2'
/

comment on column BP3_BANK_ACCOUNT.RESERVED3 is '备用字段3'
/

comment on column BP3_BANK_ACCOUNT.RESERVED4 is '备用字段4'
/

comment on column BP3_BANK_ACCOUNT.RESERVED5 is '备用字段5'
/

comment on column BP3_BANK_ACCOUNT.BALANCE_UPDATE_TIME is '主动触发向银行查询余额的时间'
/

comment on column BP3_BANK_ACCOUNT.RECORD_UPDATE_TIME is '主动触发向银行查询明细的时间'
/

comment on column BP3_BANK_ACCOUNT.CLTNO is '单位编号'
/

comment on column BP3_BANK_ACCOUNT.TREENO is '单位级编号'
/

comment on column BP3_BANK_ACCOUNT.MASTER_ACC_NUM is '主账户号'
/

create index IDX_BP3_BANK_ACCOUNT_BANK
    on BP3_BANK_ACCOUNT (BANK_CODE)
/

create index IDX_BP3_BANK_ACCOUNT_ACNT
    on BP3_BANK_ACCOUNT (ACCOUNT_NO)
/
 Show table preview