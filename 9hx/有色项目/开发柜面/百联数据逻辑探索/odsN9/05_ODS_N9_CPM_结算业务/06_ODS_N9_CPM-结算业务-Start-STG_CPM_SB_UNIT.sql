-- 执行SQL脚本
delete
from STG_CPM_SB_UNIT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_SB_UNIT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ACCOUNT_ID,
       CPM_ACCOUNT_ID,
       PRIOR_UNIT_ID,
       ACC_CLASS,
       SB_UNIT_TYPE,
       OVER_DATE,
       BIZ_COMMON,
       TREAT_WAY,
       ATTEND_ACCOUNT_ID,
       EXTEND_FLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_SB_UNIT;

-- ddl 无表，字段注释

/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_SB_UNIT
-- auto-generated definition
create table CPM_SB_UNIT
(
    ACCOUNT_ID        NUMBER not null
        constraint PK_CPM_SB_UNIT
            primary key
        constraint FK_CPM_SB_U_INHERITAN_CPM_BOOK
            references CPM_BOOK_UNIT,
    CPM_ACCOUNT_ID    NUMBER not null
        constraint FK_CPM_SB_U_REL_SBU_A_CPM_ACCO
            references CPM_ACCOUNT,
    PRIOR_UNIT_ID     NUMBER
        constraint FK_CPM_SB_U_REFERENCE_CPM_SB_U
            references CPM_SB_UNIT,
    ACC_CLASS         VARCHAR2(50),
    SB_UNIT_TYPE      VARCHAR2(4),
    OVER_DATE         DATE,
    BIZ_COMMON        VARCHAR2(100),
    TREAT_WAY         NUMBER,
    ATTEND_ACCOUNT_ID NUMBER,
    EXTEND_FLAG       NUMBER
)
/

create index CPM_SB_UNIT_CLS_IDX
    on CPM_SB_UNIT (ACC_CLASS)
/

create index INX_CPM_SB_UNIT_1
    on CPM_SB_UNIT (SB_UNIT_TYPE)
/

create index REL_SBU_ACC_FK
    on CPM_SB_UNIT (CPM_ACCOUNT_ID)
/

create index CPM_SB_UNIT_PRI_FK
    on CPM_SB_UNIT (PRIOR_UNIT_ID)
/
 Show table preview*/

/*
CPM_SB_UNIT 业务台账户表
字段	含义	备注
ACCOUNT_ID	台账户ID	　
CPM_ACCOUNT_ID	账户ID	　
PRIOR_UNIT_ID	前置业务台账户	　
ACC_CLASS	类标识	　
SB_UNIT_TYPE	台账户类型	　
BIZ_COMMON	业务备注	　
TREAT_WAY	到期处理方式	1为不转存,
3为自动本息转存,
4为自动本金转存
ATTEND_ACCOUNT_ID	银团贷款参与行账户ID	　
*/

-- list 存在