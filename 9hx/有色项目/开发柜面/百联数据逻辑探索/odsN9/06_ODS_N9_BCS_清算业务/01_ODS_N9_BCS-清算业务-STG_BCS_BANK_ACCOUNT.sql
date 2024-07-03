-- 执行SQL脚本
delete
from STG_BCS_BANK_ACCOUNT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_BCS_BANK_ACCOUNT', 1) as del from dual), 'yyyy-mm-dd')
          );

--表输入
SELECT BANK_ACCOUNT_ID,
       CLEAR_BANK_ID,
       BANK_CODE,
       BANK_BRANCH_ID,
       ACCOUNT_INDEX,
       ACCOUNT_SHORT_NAME,
       ACCOUNT_NO,
       ACCOUNT_NAME,
       BANK_TERMI_ID,
       REGION_CODE,
       BDEX_INSTANCE,
       CUST_NO,
       CUST_NAME,
       BRANCH_NO,
       BRANCH_NAME,
       ACCOUNT_TYPE,
       CMS_TYPE,
       CURRENCY_NO,
       CURRENCY_NAME,
       PROP_CODE,
       STAT_CODE,
       CONNECT_FLAG,
       ACCOUNT_STATE,
       REMARK,
       BELONGTO_FLAG,
       CHECK_ACC_NO,
       CR_ACC_NO,
       DR_ACC_NO,
       CLEAR_ACC_FLAG,
       BANK_BRANCH_NAME,
       BANK_REGION_NAME,
       STAND_REGION_CODE,
       BANK_REGION_CODE,
       BANK_CNAPS_NO,
       BANK_BRANCH_NO,
       RESERVE_FLAG,
       FREE_TRANSFER_FLAG,
       OVERSEAS_FLAG,
       OPEN_ADDRESS,
       AREA,
       OPEN_DATE,
       ACCOUNT_VALIDATE_START,
       ACCOUNT_VALIDATE_END,
       FOR_EXCHANGE_TYPE,
       ACCOUNT_USE,
       COM_ADDRESS,
       CHECK_ACC_NAME,
       N6_ACNTTYPE,

       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM BCS_BANK_ACCOUNT
;

/*
字段缺失
       SUPPLIERACCOUNTTYPE,
       NON_SYSTEM_ACCOUNT_TYPE,*/


-- ddl
/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: BCS_BANK_ACCOUNT
-- auto-generated definition
create table BCS_BANK_ACCOUNT
(
    BANK_ACCOUNT_ID        NUMBER not null
        constraint PK_BCS_BANK_ACCOUNT
            primary key,
    CLEAR_BANK_ID          NUMBER,
    BANK_CODE              VARCHAR2(4)
        constraint FK_BCS_BANK_REL_PUB_BANK1
            references PUB_BANK,
    BANK_BRANCH_ID         NUMBER
        constraint FK_BCS_BANK_REL_PUB_BANK2
            references PUB_BANK_BRANCH,
    ACCOUNT_INDEX          VARCHAR2(32)
        constraint UK_BCS_BANK_ACCOUNT_IDX
            unique,
    ACCOUNT_SHORT_NAME     VARCHAR2(255),
    ACCOUNT_NO             VARCHAR2(32),
    ACCOUNT_NAME           VARCHAR2(255),
    BANK_TERMI_ID          VARCHAR2(64),
    REGION_CODE            VARCHAR2(30),
    BDEX_INSTANCE          VARCHAR2(32),
    CUST_NO                VARCHAR2(32),
    CUST_NAME              VARCHAR2(80),
    BRANCH_NO              VARCHAR2(6),
    BRANCH_NAME            VARCHAR2(80),
    ACCOUNT_TYPE           NUMBER,
    CMS_TYPE               NUMBER,
    CURRENCY_NO            VARCHAR2(32),
    CURRENCY_NAME          VARCHAR2(32),
    PROP_CODE              VARCHAR2(16),
    STAT_CODE              VARCHAR2(16),
    CONNECT_FLAG           NUMBER,
    ACCOUNT_STATE          NUMBER,
    REMARK                 VARCHAR2(255),
    BELONGTO_FLAG          NUMBER,
    CHECK_ACC_NO           VARCHAR2(32),
    CR_ACC_NO              VARCHAR2(32),
    DR_ACC_NO              VARCHAR2(32),
    CLEAR_ACC_FLAG         NUMBER,
    BANK_BRANCH_NAME       VARCHAR2(80),
    BANK_REGION_NAME       VARCHAR2(128),
    STAND_REGION_CODE      VARCHAR2(32),
    BANK_REGION_CODE       VARCHAR2(32),
    BANK_CNAPS_NO          VARCHAR2(16),
    BANK_BRANCH_NO         VARCHAR2(16),
    RESERVE_FLAG           NUMBER,
    FREE_TRANSFER_FLAG     NUMBER,
    OVERSEAS_FLAG          NUMBER,
    OPEN_ADDRESS           VARCHAR2(255),
    AREA                   VARCHAR2(255),
    OPEN_DATE              DATE,
    ACCOUNT_VALIDATE_START DATE,
    ACCOUNT_VALIDATE_END   DATE,
    FOR_EXCHANGE_TYPE      VARCHAR2(4),
    ACCOUNT_USE            VARCHAR2(255),
    COM_ADDRESS            VARCHAR2(255),
    CHECK_ACC_NAME         VARCHAR2(80),
    N6_ACNTTYPE            VARCHAR2(100)
)
/

create index IDX_ACC_NO
    on BCS_BANK_ACCOUNT (ACCOUNT_NO)
/

create index RELATIONSHIP_27_FK
    on BCS_BANK_ACCOUNT (CLEAR_BANK_ID)
/

create index RELATIONSHIP_115_FK
    on BCS_BANK_ACCOUNT (BANK_CODE)
/

create index IDX_ACC_NAME
    on BCS_BANK_ACCOUNT (ACCOUNT_NAME)
/
 Show table preview */


/*
BCS_BANK_ACCOUNT 外部银行账户表
字段	含义	备注
BANK_ACCOUNT_ID	银行账户ID	　
CLEAR_BANK_ID	清算银行ID	　
BANK_CODE	银行代号	　
BANK_BRANCH_ID	银行网点ID	　
ACCOUNT_INDEX	账户索引号	　
ACCOUNT_SHORT_NAME	账户助记名	　
ACCOUNT_NO	账号	　
ACCOUNT_NAME	户名	　
BANK_TERMI_ID	银行端ID	　
REGION_CODE	开户地址代码	　
BDEX_INSTANCE	指定的接口实例	　
CUST_NO	所属单位编号	　
CUST_NAME	所属单位名称	　
BRANCH_NO	营业机构号	该清算账户归属财务哪个营业机构使用
BRANCH_NAME	营业机构名称	　
ACCOUNT_TYPE	银行账户性质	账户性质
CMS_TYPE	现金管理类型	现金管理类型，包括：头寸户、二级户、三级户、普通户
CURRENCY_NO	币种代号	　
CURRENCY_NAME	币种名称	　
PROP_CODE	属性码	　
STAT_CODE	统计码	　
CONNECT_FLAG	是否联网	0-不联网；1-联网
ACCOUNT_STATE	账户状态	0-停用；1-使用中
REMARK	备注	　
BELONGTO_FLAG	归属标记	1-财务公司；2-成员单位
CHECK_ACC_NO	核算账号	　
CR_ACC_NO	借挂账号	　
DR_ACC_NO	贷挂账号	　
CLEAR_ACC_FLAG	是否清算户	0-否；1-是
BANK_BRANCH_NAME	银行网点名称	　
BANK_REGION_NAME	开户地银行地名	　
STAND_REGION_CODE	标准地名代码	　
BANK_REGION_CODE	银行地名代码	　
BANK_CNAPS_NO	CNAPS网点编号	　
BANK_BRANCH_NO	行内网点编号	　
RESERVE_FLAG	是否预约扣款账户	0-否；1-是
*/
