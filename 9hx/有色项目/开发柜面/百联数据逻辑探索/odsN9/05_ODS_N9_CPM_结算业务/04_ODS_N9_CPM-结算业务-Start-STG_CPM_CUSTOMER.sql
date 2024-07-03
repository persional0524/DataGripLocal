-- 执行SQL脚本
delete
from STG_CPM_CUSTOMER
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_CUSTOMER', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT CUST_ID,
       CUST_NO,
       CUST_NAME,
       CUST_SHORT_NAME,
       CUST_TREE_NO,
       REG_ADDRESS,
       BIZ_ADDRESS,
       POST_ADDRESS,
       ZIPCODE,
       REG_CAPITAL,
       BIZ_LICENSE_NO,
       ORG_CODE,
       TAX_REG_CODE,
       LEGAL_PERSON,
       FINA_PRINCIPAL,
       PRIMARY_ACC_NO,
       CONTACT_PERSON,
       TELEPHONE,
       MOBILE_PHONE,
       EMAIL,
       REMARK,
       DISABLE_FLAG,
       CUST_TYPE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_CUSTOMER;

-- ddl 无表，字段级注释
/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_CUSTOMER
-- auto-generated definition
create table CPM_CUSTOMER
(
    CUST_ID         NUMBER        not null
        constraint PK_CPM_CUSTOMER
            primary key,
    CUST_NO         VARCHAR2(32)  not null,
    CUST_NAME       VARCHAR2(160) not null,
    CUST_SHORT_NAME VARCHAR2(100),
    CUST_TREE_NO    VARCHAR2(32),
    REG_ADDRESS     VARCHAR2(240),
    BIZ_ADDRESS     VARCHAR2(255),
    POST_ADDRESS    VARCHAR2(240),
    ZIPCODE         VARCHAR2(6),
    REG_CAPITAL     NUMBER(16, 2),
    BIZ_LICENSE_NO  VARCHAR2(50),
    ORG_CODE        VARCHAR2(32),
    TAX_REG_CODE    VARCHAR2(50),
    LEGAL_PERSON    VARCHAR2(50),
    FINA_PRINCIPAL  VARCHAR2(30),
    PRIMARY_ACC_NO  VARCHAR2(32),
    CONTACT_PERSON  VARCHAR2(80),
    TELEPHONE       VARCHAR2(60),
    MOBILE_PHONE    VARCHAR2(32),
    EMAIL           VARCHAR2(240),
    REMARK          VARCHAR2(256),
    DISABLE_FLAG    NUMBER,
    CUST_TYPE       NUMBER,
    PUBLIC_FLAG     NUMBER default 0
)
/

create index CPM_CUSTOMER_IDX
    on CPM_CUSTOMER (CUST_NAME, CUST_TYPE, CUST_TREE_NO)
/
 Show table preview */



/*
CPM_CUSTOMER 客户表
字段	含义	备注
CUST_ID	客户ID	　
CUST_NO	客户编号	　
CUST_NAME	客户名称	　
CUST_SHORT_NAME	客户简称	　
CUST_TREE_NO	客户分级码	　
REG_ADDRESS	注册地址	　
BIZ_ADDRESS	营业地址	　
POST_ADDRESS	通讯地址	　
ZIPCODE	邮政编码	　
REG_CAPITAL	注册资金	　
BIZ_LICENSE_NO	营业执照编号	　
ORG_CODE	组织机构代码	　
TAX_REG_CODE	税务登记号码	　
LEGAL_PERSON	法人代表	　
FINA_PRINCIPAL	财务负责人	　
PRIMARY_ACC_NO	基本账号	　
CONTACT_PERSON	联系人	　
TELEPHONE	联系电话	　
MOBILE_PHONE	移动电话	　
EMAIL	电子邮箱	　
REMARK	备注	　
DISABLE_FLAG	失效标记	1为失效，0为未失效
CUST_TYPE	性质	1为集团公司，
2为财务公司，
3为结算中心，
4为其他资金管理机构，
5为成员单位，
6为其他单位，
7为其他
*/

-- 表清单中存在
