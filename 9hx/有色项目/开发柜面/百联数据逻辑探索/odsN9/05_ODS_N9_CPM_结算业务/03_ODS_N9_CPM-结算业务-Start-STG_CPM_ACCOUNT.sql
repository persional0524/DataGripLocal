-- 执行SQL脚本
delete
from STG_CPM_ACCOUNT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_ACCOUNT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ACCOUNT_ID,
       CUST_ID,
       BALANCE_DIR,
       OVER_MODE,
       OVER_LIMITATION,
       OFF_BALANCE_FLAG,
       FLOOR_AMOUNT,
       MC_BIND_FLAG,
       MC_TYPE_BINDING,
       MCODE_BINDING,
       INTER_BRANCH_FLAG,
       SOURCE_MARK,
       THIRD_CUSTOM_ID,
       SOURCE_ACC_DATE,
       SOURCE_ACC_NO,
       FINGER_PRINT,
       ACC_CLASS,
       TYPE_ID,
       VALIDATE_MODE,
       IS_BILLING,
       BIZ_FILL_MODE,
       IS_OFF_SHORE,
       MC_CODE,
       MC_ID,
       IS_OVERDRAFT,
       CREATE_WAY,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_ACCOUNT;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_ACCOUNT
-- auto-generated definition
create table CPM_ACCOUNT
(
    ACCOUNT_ID        NUMBER not null
        constraint FK_CPM_ACCO_INHERITAN_CPM_BOOK
            references CPM_BOOK_UNIT,
    CUST_ID           NUMBER not null
        constraint FK_CPM_ACCO_REL_ACC_C_CPM_CUST
            references CPM_CUSTOMER,
    BALANCE_DIR       NUMBER not null,
    OVER_MODE         NUMBER,
    OVER_LIMITATION   NUMBER(16, 2),
    OFF_BALANCE_FLAG  NUMBER,
    FLOOR_AMOUNT      NUMBER(16, 2),
    MC_BIND_FLAG      NUMBER,
    MC_TYPE_BINDING   VARCHAR2(4),
    MCODE_BINDING     VARCHAR2(32),
    INTER_BRANCH_FLAG NUMBER,
    SOURCE_MARK       VARCHAR2(32),
    THIRD_CUSTOM_ID   NUMBER,
    SOURCE_ACC_DATE   DATE,
    SOURCE_ACC_NO     VARCHAR2(32),
    FINGER_PRINT      VARCHAR2(64),
    ACC_CLASS         VARCHAR2(50),
    TYPE_ID           NUMBER not null
        constraint FK_CPM_ACC_REF_ACC_TYPE
            references CPM_ACCOUNT_TYPE,
    VALIDATE_MODE     NUMBER,
    IS_BILLING        NUMBER,
    BIZ_FILL_MODE     NUMBER,
    IS_OFF_SHORE      NUMBER,
    MC_CODE           VARCHAR2(32),
    MC_ID             NUMBER,
    IS_OVERDRAFT      NUMBER,
    CREATE_WAY        NUMBER
)
/

create index REL_ACC_CUST_FK
    on CPM_ACCOUNT (CUST_ID)
/

create index CPM_ACCOUNT_CLS_IDX
    on CPM_ACCOUNT (ACC_CLASS)
/

create index REL_ACC_ACCTYPE_FK
    on CPM_ACCOUNT (TYPE_ID)
/

create index CPM_ACCOUNT_IDX
    on CPM_ACCOUNT (ACCOUNT_ID, TYPE_ID, CUST_ID)
/

create unique index PK_CPM_ACCOUNT
    on CPM_ACCOUNT (ACCOUNT_ID)
/

alter table CPM_ACCOUNT
    add constraint PK_CPM_ACCOUNT
        primary key (ACCOUNT_ID, TYPE_ID, CUST_ID)
/
 Show table preview */



/*
CPM_ACCOUNT 结算账户表
字段	含义	备注
ACCOUNT_ID	账户ID	　
CUST_ID	客户ID	　
BALANCE_DIR	增减方向	1为借，2为贷
OVER_MODE	限额方式	1为不限额，2为限余额，3为限借方发生额，4为限贷方发生额
OVER_LIMITATION	账户限额	　
OFF_BALANCE_FLAG	表外标记	　
FLOOR_AMOUNT	起存或协议额度	定期存款起存额度，协定存款的协议额度
MC_BIND_FLAG	多维码绑定标记	　
MC_TYPE_BINDING	绑定多维分类	　
MCODE_BINDING	绑定多维编码	　
INTER_BRANCH_FLAG	通存通兑标记	1为禁止，
2为允许通存，
3为允许通兑，
4为通存通兑
SOURCE_MARK	原始数据标识	指定原始数据来源
THIRD_CUSTOM_ID	第三方客户ID	　
SOURCE_ACC_DATE	原开户日	　
SOURCE_ACC_NO	原开户账号	　
FINGER_PRINT	校验码	　
ACC_CLASS	类标识	　
TYPE_ID	账户分类	　
VALIDATE_MODE	印密方式	1为印签，2为密码
IS_BILLING	是否计费	1为计费，0为不计费
BIZ_FILL_MODE	业务标识填写方式	1为无台帐核算，
2为多台帐核算，
3为单一台帐核算
IS_OFF_SHORE	离岸标识	　
MC_CODE	多维编码	　
MC_ID	多维码ID	　
IS_OVERDRAFT	是否透支（透支检查是否超出可用余额）	0否，透支检查是否超过余额
1是，透支检查是否超过可用余额*/

-- 表清单存在，无表注释，字段详情
