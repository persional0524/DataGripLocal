-- 执行SQL脚本
delete
from STG_CMS_ACCOUNT_NEW
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CMS_ACCOUNT_NEW', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ACCOUNT_ID,
       GROUP_ID,
       ACCOUNT_TYPE,
       ACCOUNT_NO,
       ACCOUNT_NAME,
       CUR_CODE,
       CUST_NO,
       CUST_NAME,
       PAR_ACCOUNT_ID,
       IF_LEAF,
       ACC_LEVEL,
       MAX_AMOUNT,
       MIN_AMOUNT,
       UNIT_AMOUNT,
       MIN_EXC_AMOUNT,
       UP_ORDER,
       FIXD_AMOUNT,
       CHECK_METHOD,
   '${edate}'as sjrq,
   '2' as MAKEUP_STATUS
  FROM CMS_ACCOUNT_NEW;

/*-- 字段缺失
       FIXD_RATE,*/


-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CMS_ACCOUNT_NEW  -- 现金管理账户
-- auto-generated definition
create table CMS_ACCOUNT_NEW
(
    ACCOUNT_ID     NUMBER not null
        constraint FK_CMS_ACCO_REFERENCE_CMS_GROU
            primary key,
    GROUP_ID       NUMBER
        constraint FK_CMS_ACCOUNT_GROUP
            references CMS_GROUP_NEW,
    ACCOUNT_TYPE   NUMBER,
    ACCOUNT_NO     VARCHAR2(50),
    ACCOUNT_NAME   VARCHAR2(80),
    CUR_CODE       VARCHAR2(3),
    CUST_NO        VARCHAR2(50),
    CUST_NAME      VARCHAR2(80),
    PAR_ACCOUNT_ID NUMBER,
    IF_LEAF        NUMBER,
    ACC_LEVEL      NUMBER,
    MAX_AMOUNT     NUMBER(16, 2),
    MIN_AMOUNT     NUMBER(16, 2),
    UNIT_AMOUNT    NUMBER(16, 2),
    MIN_EXC_AMOUNT NUMBER(16, 2),
    UP_ORDER       NUMBER,
    FIXD_AMOUNT    NUMBER(16, 2),
    CHECK_METHOD   NUMBER
)
/

comment on table CMS_ACCOUNT_NEW is '现金管理账户'
/

comment on column CMS_ACCOUNT_NEW.ACCOUNT_ID is '账户ID'
/

comment on column CMS_ACCOUNT_NEW.GROUP_ID is '账户组ID'
/

comment on column CMS_ACCOUNT_NEW.ACCOUNT_TYPE is '账户类型'
/

comment on column CMS_ACCOUNT_NEW.ACCOUNT_NO is '账号'
/

comment on column CMS_ACCOUNT_NEW.ACCOUNT_NAME is '账户名'
/

comment on column CMS_ACCOUNT_NEW.CUR_CODE is '币种'
/

comment on column CMS_ACCOUNT_NEW.CUST_NO is '所属客户编号'
/

comment on column CMS_ACCOUNT_NEW.CUST_NAME is '所属客户名称'
/

comment on column CMS_ACCOUNT_NEW.PAR_ACCOUNT_ID is '上级账户'
/

comment on column CMS_ACCOUNT_NEW.IF_LEAF is '是否叶子节点'
/

comment on column CMS_ACCOUNT_NEW.ACC_LEVEL is '层级'
/

comment on column CMS_ACCOUNT_NEW.MAX_AMOUNT is '留存上限'
/

comment on column CMS_ACCOUNT_NEW.MIN_AMOUNT is '留存下限'
/

comment on column CMS_ACCOUNT_NEW.UNIT_AMOUNT is '取整金额'
/

comment on column CMS_ACCOUNT_NEW.MIN_EXC_AMOUNT is '最小执行金额'
/

comment on column CMS_ACCOUNT_NEW.UP_ORDER is '上收次序'
/

comment on column CMS_ACCOUNT_NEW.FIXD_AMOUNT is '金额设定值'
/

comment on column CMS_ACCOUNT_NEW.CHECK_METHOD is '核算方法'
/

create index IND_CMS_ACCOUNT_NEW_GROUP_ID
    on CMS_ACCOUNT_NEW (GROUP_ID)
/

create index IND_CMS_ACCOUNT_NEW_ACCNO
    on CMS_ACCOUNT_NEW (ACCOUNT_NO)
/
 Show table preview */

-- list 不存在