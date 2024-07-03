-- 执行SQL脚本
delete
from STG_CPM_BOOK_UNIT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_BOOK_UNIT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ACCOUNT_ID,
       CUR_CODE,
       SUBJECT_ID,
       BRANCH_NO,
       ACCOUNT_NO,
       ACCOUNT_NAME,
       BIZ_CODE,
       ACCOUNT_STATE,
       SETTLE_UP,
       OPEN_DATE,
       END_DATE,
       CLEAR_DATE,
       INIT_DATE,
       INIT_BALANCE,
       REMARK,
       ACC_CLASS,
       BTY_ID,
       SMART_BTY_ID,
       IS_OVERDUE,
       IS_POSTPONE,
       POSTPONE_DATE,
       TX_OP_CODE,
       CONTRACT_NO,
       FREEZE_SDATE,
       FREEZE_EDATE,
       ACCOUNT_TX_DATE,
       SLEEP_STATE,
       SLEEP_SDATE,
       SLEEP_EDATE,
       VERSION_COLUMN,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_BOOK_UNIT;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_BOOK_UNIT
-- auto-generated definition
create table CPM_BOOK_UNIT
(
    ACCOUNT_ID           NUMBER           not null
        constraint PK_CPM_BOOK_UNIT
            primary key,
    CUR_CODE             VARCHAR2(8)      not null,
    SUBJECT_ID           NUMBER           not null,
    BRANCH_NO            VARCHAR2(6)
        constraint FK_BOOK_REL_ACC_B_CPM_BRAN8
            references CPM_BRANCH,
    ACCOUNT_NO           VARCHAR2(32)     not null
        constraint UNQ_CPM_BOOK_UNIT_ACCOUNT_NO
            unique,
    ACCOUNT_NAME         VARCHAR2(128)    not null,
    BIZ_CODE             VARCHAR2(70),
    ACCOUNT_STATE        NUMBER,
    SETTLE_UP            NUMBER default 0,
    OPEN_DATE            DATE             not null,
    END_DATE             DATE,
    CLEAR_DATE           DATE,
    INIT_DATE            DATE,
    INIT_BALANCE         NUMBER(16, 2),
    REMARK               VARCHAR2(256),
    ACC_CLASS            VARCHAR2(100),
    BTY_ID               NUMBER
        constraint FK_CPM_BOOK_RELATIONS_CPM_BIZ_
            references CPM_BIZ_TYPE,
    SMART_BTY_ID         NUMBER
        constraint FK_CPM_BOOK_CPM_SMARTBIZ
            references CPM_SMART_BIZ_TYPE,
    IS_OVERDUE           NUMBER,
    IS_POSTPONE          NUMBER,
    POSTPONE_DATE        DATE,
    TX_OP_CODE           VARCHAR2(32),
    CONTRACT_NO          VARCHAR2(100),
    FREEZE_SDATE         DATE,
    FREEZE_EDATE         DATE,
    ACCOUNT_TX_DATE      DATE,
    SLEEP_STATE          NUMBER,
    SLEEP_SDATE          DATE,
    SLEEP_EDATE          DATE,
    VERSION_COLUMN       NUMBER default 0 not null,
    FOREIGN_ACCOUNT_TYPE NUMBER,
    LIMIT_TYPE           VARCHAR2(50),
    FOREIGN_ACCOUNT_MOLD VARCHAR2(50),
    ACCOUNT_LIMIT        VARCHAR2(50),
    BUSINESS_NUMBER      VARCHAR2(50)
)
/

comment on column CPM_BOOK_UNIT.FOREIGN_ACCOUNT_TYPE is '限额类型'
/

comment on column CPM_BOOK_UNIT.FOREIGN_ACCOUNT_MOLD is '账户类型'
/

comment on column CPM_BOOK_UNIT.ACCOUNT_LIMIT is '账户限额'
/

comment on column CPM_BOOK_UNIT.BUSINESS_NUMBER is '外汇局批件号/ 备案表号/ 业务编号'
/

create index REL_ACC_BRAN_FK
    on CPM_BOOK_UNIT (BRANCH_NO)
/

create index REL_ACC_SUBJ_FK
    on CPM_BOOK_UNIT (SUBJECT_ID)
/

create index IND_CPM_BOOK_UNIT_CUR_BRANCH
    on CPM_BOOK_UNIT (CUR_CODE, BRANCH_NO)
/

create index REL_ACC_CURR_FK
    on CPM_BOOK_UNIT (CUR_CODE)
/

create index RELATIONSHIP_175_FK2
    on CPM_BOOK_UNIT (BTY_ID)
/
 Show table preview*/

-- 无表注释，表清单存在，CPM_BOOK_UNIT 记账单元表，字段注释不全


/*
CPM_BOOK_UNIT 记账单元表
字段	含义	备注
ACCOUNT_ID	账户ID	　
CUR_CODE	币种代号	　
SUBJECT_ID	科目ID	　
BRANCH_NO	营业机构号	　
ACCOUNT_NO	账号	　
ACCOUNT_NAME	户名	　
BIZ_CODE	业务标识	合同号/借据号/存单号等
ACCOUNT_STATE	账户状态	1为正常，2为冻结，3为封存，4为销户
OPEN_DATE	开户日	　
END_DATE	业务结束日期	　
CLEAR_DATE	清户日	　
INIT_DATE	初始日期	　
INIT_BALANCE	初始余额	　
REMARK	备注	　
ACC_CLASS	类标识	　
BTY_ID	业务品种ID	　
IS_OVERDUE	逾期标识	1为逾期，0为未逾期
IS_POSTPONE	展期标志	1为展期，0为未展期
POSTPONE_DATE	展期日期	　
TX_OP_CODE	交易对手编码	　
CONTRACT_NO	对应合同号	　
FREEZE_SDATE	冻结日期	　
FREEZE_EDATE	解冻日期	　
ACCOUNT_TX_DATE	最近一次交易时间	　
SLEEP_STATE	睡眠标识	0为正常，1为睡眠
SLEEP_SDATE	睡眠开始时间	　
SLEEP_EDATE	睡眠结束时间	　
VERSION_COLUMN	版本号	　
*/
