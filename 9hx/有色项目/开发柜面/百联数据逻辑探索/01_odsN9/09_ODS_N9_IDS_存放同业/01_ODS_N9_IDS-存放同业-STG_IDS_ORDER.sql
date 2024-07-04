-- 执行SQL脚本
delete
from ${Internal.Transformation.Name}
where (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('${Internal.Transformation.Name}', 1) as del from dual),
                       'yyyy-mm-dd'));

-- 表输入 2 研发环境无数据
SELECT ORDER_ID,
       ORDER_CODE,
       ORDER_BIZ_CODE,
       CUR_CODE,
       BANK_ACCOUNT_NO,
       OP_BANK_ACCOUNT_NO,
       BANK_CODE,
       AMOUNT,
       AMOUNT2,
       PLAN_START_DATE,
       PLAN_END_DATE,
       START_DATE,
       END_DATE,
       ENDORSEMENT_DATE,
       ENDORSEMENT_STATE,
       PLAN_DRAW_DATE,
       DRAW_DATE,
       INTR_RATE,
       INTR_RATE2,
       INTR_OVERDUE_RATE,
       BIZ_ID,
       INTR_MONTH_ID,
       INTR_BASE_DAYS,
       INTR_DAYS,
       INTR_DAYS2,
       INTR_OVERDUE_DAYS,
       INTR_OVERDUE_DAYS2,
       INTR_AMOUNT,
       INTR_AMOUNT2,
       INTR_AMOUNT3,
       CREDIT_ID,
       CREDIT_VALUE,
       TEMP_CREDIT_ID,
       TEMP_CREDIT_VALUE,
       STRING1,
       STRING2,
       REMARK,
       BRANCH_NO,
       STATE,
       EXCTIME,
       CUST_NO,
       INPUTER,
       CHECKER,
       RATIFIER,
       CONFIRMOR,
       INPUT_TIME,
       AFFIRM_DATE,
       CHECK_TIME,
       CONFIRM_TIME,
       RATIFY_TIME,
       MERGE_FLAG,
       APPOINTMENT_FLAG,
       APPOINTMENT_DATE,

       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM IDS_ORDER;

/*
-- 字段缺失
       INTR_FLOAT_RATE_MIN,
       INTR_FLOAT_RATE_MAX,
       PRINCIPAL,
       INTEREST,
       APPENDIX,
       DEPOSITCODE,
       DEPOSIT_NAME,*/

-- ddl 无表，字段注释
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: IDS_ORDER
-- auto-generated definition
create table IDS_ORDER
(
    ORDER_ID           NUMBER not null
        constraint PK_IDS_ORDER
            primary key,
    ORDER_CODE         VARCHAR2(3),
    ORDER_BIZ_CODE     VARCHAR2(50),
    CUR_CODE           VARCHAR2(8),
    BANK_ACCOUNT_NO    VARCHAR2(50),
    OP_BANK_ACCOUNT_NO VARCHAR2(50),
    BANK_CODE          VARCHAR2(12),
    AMOUNT             NUMBER(16, 2),
    AMOUNT2            NUMBER(16, 2),
    PLAN_START_DATE    DATE,
    PLAN_END_DATE      DATE,
    START_DATE         DATE,
    END_DATE           DATE,
    ENDORSEMENT_DATE   DATE,
    ENDORSEMENT_STATE  NUMBER,
    PLAN_DRAW_DATE     DATE,
    DRAW_DATE          DATE,
    INTR_RATE          NUMBER(12, 6),
    INTR_RATE2         NUMBER(12, 6),
    INTR_OVERDUE_RATE  NUMBER(12, 6),
    BIZ_ID             NUMBER,
    INTR_MONTH_ID      NUMBER,
    INTR_BASE_DAYS     NUMBER,
    INTR_DAYS          NUMBER,
    INTR_DAYS2         NUMBER,
    INTR_OVERDUE_DAYS  NUMBER,
    INTR_OVERDUE_DAYS2 NUMBER,
    INTR_AMOUNT        NUMBER(16, 2),
    INTR_AMOUNT2       NUMBER(16, 2),
    INTR_AMOUNT3       NUMBER(16, 2),
    CREDIT_ID          NUMBER,
    CREDIT_VALUE       NUMBER(16, 2),
    TEMP_CREDIT_ID     NUMBER,
    TEMP_CREDIT_VALUE  NUMBER(16, 2),
    STRING1            VARCHAR2(128),
    STRING2            VARCHAR2(128),
    REMARK             VARCHAR2(250),
    BRANCH_NO          VARCHAR2(6),
    STATE              NUMBER,
    EXCTIME            DATE,
    CUST_NO            VARCHAR2(50),
    INPUTER            VARCHAR2(20),
    CHECKER            VARCHAR2(20),
    RATIFIER           VARCHAR2(20),
    CONFIRMOR          VARCHAR2(20),
    INPUT_TIME         DATE,
    AFFIRM_DATE        DATE,
    CHECK_TIME         DATE,
    CONFIRM_TIME       DATE,
    RATIFY_TIME        DATE,
    MERGE_FLAG         NUMBER,
    APPOINTMENT_FLAG   NUMBER,
    APPOINTMENT_DATE   DATE
)
/
 Show table preview*/


/*
IDS_ORDER 业务命令表
字段	含义
ORDER_ID	指令ID
ORDER_CODE	指令类型编号
ORDER_BIZ_CODE	指令业务编号
CUR_CODE	币种
BANK_ACCOUNT_NO	本方银行帐号
OP_BANK_ACCOUNT_NO	对方银行帐号
BANK_CODE	银行编号
AMOUNT	指令金额
AMOUNT2	可用余额
PLAN_START_DATE	拟存入日期
PLAN_END_DATE	拟到期日期
START_DATE	实际存入日期
END_DATE	实际到期日期
PLAN_DRAW_DATE	拟支取日期
DRAW_DATE	实际支取日期
INTR_RATE	利率
INTR_RATE2	变更利率
INTR_OVERDUE_RATE	逾期利率
BIZ_ID	业务品种ID
INTR_MONTH_ID	计息月天数ID
INTR_BASE_DAYS	计息基数天数
INTR_DAYS	计息天数
INTR_DAYS2	变更的计息天数
INTR_OVERDUE_DAYS	逾期天数
INTR_OVERDUE_DAYS2	变更的逾期天数
INTR_AMOUNT	系统计算的利息
INTR_AMOUNT2	确认的利息金额
INTR_AMOUNT3	修改的利息金额
STRING1
STRING2
REMARK	备注
BRANCH_NO	机构号
STATE	状态
EXCTIME	执行时间
CUST_NO	发起单位
INPUTER	录入人
CHECKER	复核人
RATIFIER	审批人
CONFIRMOR	确认人
INPUT_TIME	录入时间
AFFIRM_DATE	提交时间
CHECK_TIME	复核时间
CONFIRM_TIME	确认时间
RATIFY_TIME	审批时间
MERGE_FLAG
APPOINTMENT_FLAG
APPOINTMENT_DATE
*/

-- list 1