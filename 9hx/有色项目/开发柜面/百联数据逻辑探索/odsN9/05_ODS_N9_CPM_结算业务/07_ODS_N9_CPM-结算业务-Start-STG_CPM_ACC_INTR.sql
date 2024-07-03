-- 执行SQL脚本
delete
from STG_CPM_ACC_INTR
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_ACC_INTR', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT AIT_ID,
       PEG_RATE_CODE,
       INTR_BEAR_MODE,
       RATE_SET_MODE,
       OPEN_RATE,
       END_RATE,
       DEBIT_INTR_RATE,
       FLOATING_AMOUNT,
       ISCA_PAY_INTR_ACC_ID,
       ISCA_OVERDUE_PAY_INTR_ACC_ID,
       ISCA_REC_INTR_ACC_ID,
       ISCA_CF_CODE,
       IS_MERGE_INTR,
       PRO_REC_INTR_ACC_ID,
       PRO_PAY_INTR_ACC_ID,
       FLOATING_MODE,
       IS_INTR_BEAR,
       ACCOUNT_ID,
       INTR_CLASS,
       INTR_CODE,
       TRS_ACCOUNT,
       INTR_PERIOD,
       INTR_MOTH,
       INTR_DAY,
       UNREC_INTR_SBUINT,
       NOACC_INTR_SBUINT,
       VERSION_COLUMN,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_ACC_INTR;

-- ddl 无表，字段注释

/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_ACC_INTR
-- auto-generated definition
create table CPM_ACC_INTR
(
    AIT_ID                       NUMBER           not null
        constraint PK_CPM_ACC_INTR
            primary key,
    PEG_RATE_CODE                VARCHAR2(32)
        constraint FK_CPM_ACC__RELATIONS_CPM_PEG_
            references CPM_PEG_RATE_TYPE,
    INTR_BEAR_MODE               NUMBER,
    RATE_SET_MODE                NUMBER,
    OPEN_RATE                    NUMBER(12, 6),
    END_RATE                     NUMBER(12, 6),
    DEBIT_INTR_RATE              NUMBER(12, 6),
    FLOATING_AMOUNT              NUMBER(12, 6),
    ISCA_PAY_INTR_ACC_ID         NUMBER,
    ISCA_OVERDUE_PAY_INTR_ACC_ID NUMBER,
    ISCA_REC_INTR_ACC_ID         NUMBER,
    ISCA_CF_CODE                 VARCHAR2(8),
    IS_MERGE_INTR                NUMBER,
    PRO_REC_INTR_ACC_ID          NUMBER,
    PRO_PAY_INTR_ACC_ID          NUMBER,
    FLOATING_MODE                NUMBER,
    IS_INTR_BEAR                 NUMBER,
    ACCOUNT_ID                   NUMBER,
    INTR_CLASS                   VARCHAR2(100),
    INTR_CODE                    VARCHAR2(32)
        constraint FK_CPM_ACC__REL_ACC_I_CPM_INTR
            references CPM_INTR_TYPE,
    TRS_ACCOUNT                  VARCHAR2(32),
    INTR_PERIOD                  NUMBER,
    INTR_MOTH                    NUMBER,
    INTR_DAY                     NUMBER,
    UNREC_INTR_SBUINT            NUMBER,
    NOACC_INTR_SBUINT            NUMBER,
    VERSION_COLUMN               NUMBER default 0 not null
)
/

create index REL_ACC_INTR_TYPE_FK
    on CPM_ACC_INTR (INTR_CODE)
/

create index RELATIONSHIP_165_FK
    on CPM_ACC_INTR (PEG_RATE_CODE)
/

create index CPM_ACC_INTR_ACC_FK
    on CPM_ACC_INTR (ACCOUNT_ID)
/

create index CPM_ACC_INTR_CLS_IDX
    on CPM_ACC_INTR (INTR_CLASS)
/

create index IND_CPM_ACC_INTR_CLASS_BEAR
    on CPM_ACC_INTR (INTR_CLASS, IS_INTR_BEAR)
/
 Show table preview */



/*
CPM_ACC_INTR 账户利息设置表
字段	含义	备注
AIT_ID	AIT_ID	账户计息设置ID
PEG_RATE_CODE	基准利率代码	基准利率种类
INTR_BEAR_MODE	计息方式	首选利息种类标识:
1为手工计息，
2为按周期计息，
3为利随本清
RATE_SET_MODE	利率设置方式	1为独立设置，
2为按基准利率浮动，
3为按业务台账户计息
OPEN_RATE	开户利率	利率浮动值
END_RATE	到期利率	　
DEBIT_INTR_RATE	利息罚息利率	　
FLOATING_AMOUNT	浮动量	　
ISCA_PAY_INTR_ACC_ID	付息账号	　
ISCA_OVERDUE_PAY_INTR_ACC_ID	逾期付息账号	　
ISCA_REC_INTR_ACC_ID	收息账号	　
ISCA_CF_CODE	现金流向码	　
IS_MERGE_INTR	利息是否按业务标识合并	1为按业务标识合并，
0为不按业务标识合并
PRO_REC_INTR_ACC_ID	应收/待摊账号	　
PRO_PAY_INTR_ACC_ID	应付/待摊账号	　
FLOATING_MODE	浮动方式	1为不浮动，
2为上浮固定值，
3为下浮固定值，
4为上浮百分比，
5为下浮百分比
IS_INTR_BEAR	是否计息	1为计息，0为不计息
ACCOUNT_ID	账户ID	　
INTR_CLASS	利息种类标识	利息种类标识
INTR_CODE	利息代码	利息代码
TRS_ACCOUNT	应付应收计息账户	　
INTR_PERIOD	结算周期	1为按月，2为按季，3为按半年，4为按年
INTR_MOTH	月	　
INTR_DAY	日	　
UNREC_INTR_SBUINT	应收未收利息台帐户	　
VERSION_COLUMN	版本号	　
*/
