-- 执行SQL脚本
delete
from ODS_CPM_VTX
WHERE INTR_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- 表输入
SELECT TX_ID,
       CUST_NO,
       ACC_NO,
       BIZ_ACC_NO,
       OP_CUST_NO,
       OP_ACC_NO,
       OP_BIZ_ACC_NO,
       THRD_CUST_NO,
       THRD_ACC_NO,
       THRD_BIZ_ACC_NO,
       EBK_NO,
       EBK_NAME,
       EBK_BRANCH_NAME,
       EBK_BRANCH_NO,
       EBK_RIGION,
       EBK_CITY,
       EBK_ACC_NO,
       EBK_ACCOUNT_NAME,
       EBK_CNAPS_CODE,
       BC_CHANNEL,
       BC_NAME,
       BC_ACC_INDEX,
       BC_TICKET_TYPE,
       BC_TICKET_NO,
       BC_TICKET_PSWD,
       CR_DB,
       AMOUNT,
       AMOUNT2,
       INTR_AMOUNT,
       CHARGE_AMOUNT,
       START_DATE,
       END_DATE,
       INTR_RATE,
       INTR_RATE2,
       ARTICLE,
       PRICE,
       QUANTITY,
       QUANTITY_UNIT,
       DUE_INTR_RATE,
       INTR_RULE,
       DAY_UP_DOWN,
       CHARGE_RATE,
       BIZ_NUMBER,
       RECONCILE_MARK,
       X_CASE_TYPE,
       X_CASE_ID,
       X_AMOUNT,
       X_START_DATE,
       X_END_DATE,
       INTR_DATE,
       TICKET_TYPE,
       TICKET_NO,
       TICKET_NOE,
       TICKET_PSWD,
       OWNED_BRANCH_NO,
       TICKET_TAKER,
       BC_ACC,
       LBK_NO,
       LBK_NAME,
       LBK_BRANCH_NO,
       LBK_BRANCH_NAME,
       LBK_REGION,
       LBK_CITY,
       LBK_ACC_NO,
       LBK_ACC_NAME,
       IMG_LOC,
       BUSNISS_TYPE,
       TREAT_WAY,
       INTEREST_BEAR_WAY,
       TX_BIZNUMBER,
       SB_UNIT_NO,
       VCH_REF_NO,
       FLOATING_MODE,
       FLOATING_AMOUNT,
       URGENT_LEVEL,
       RESERVE_ID,
       DB_CASH_FLOW,
       CR_CASH_FLOW,
       STD_BOOK_TYPE,
       BRANCH_SORT,
       ISCA_PAY_INTR_ACC_NO,
       ISCA_REC_INTR_ACC_NO,
       PRO_PAY_INTR_ACC_NO,
       PRO_REC_INTR_ACC_NO,
       SMART_BTY_ID,
       OP_ACCOUNT_NAME,
       ACCOUNT_NAME
FROM CPM_VTX
WHERE INTR_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_VTX
-- auto-generated definition
create table CPM_VTX
(
    TX_ID                NUMBER not null
        constraint PK_CPM_VTX
            primary key
        constraint FK_CPM_VTX_INHERITAN_CPM_TX
            references CPM_TX,
    CUST_NO              VARCHAR2(32),
    ACC_NO               VARCHAR2(32),
    BIZ_ACC_NO           VARCHAR2(32),
    OP_CUST_NO           VARCHAR2(32),
    OP_ACC_NO            VARCHAR2(32),
    OP_BIZ_ACC_NO        VARCHAR2(32),
    THRD_CUST_NO         VARCHAR2(32),
    THRD_ACC_NO          VARCHAR2(32),
    THRD_BIZ_ACC_NO      VARCHAR2(32),
    EBK_NO               VARCHAR2(4),
    EBK_NAME             VARCHAR2(80),
    EBK_BRANCH_NAME      VARCHAR2(80),
    EBK_BRANCH_NO        VARCHAR2(32),
    EBK_RIGION           VARCHAR2(80),
    EBK_CITY             VARCHAR2(80),
    EBK_ACC_NO           VARCHAR2(32),
    EBK_ACCOUNT_NAME     VARCHAR2(200),
    EBK_CNAPS_CODE       VARCHAR2(16),
    BC_CHANNEL           VARCHAR2(4),
    BC_NAME              VARCHAR2(80),
    BC_ACC_INDEX         VARCHAR2(32),
    BC_TICKET_TYPE       VARCHAR2(32),
    BC_TICKET_NO         VARCHAR2(32),
    BC_TICKET_PSWD       VARCHAR2(32),
    CR_DB                VARCHAR2(1),
    AMOUNT               NUMBER(16, 2),
    AMOUNT2              NUMBER(16, 2),
    INTR_AMOUNT          NUMBER(16, 2),
    CHARGE_AMOUNT        NUMBER(16, 2),
    START_DATE           DATE,
    END_DATE             DATE,
    INTR_RATE            NUMBER(12, 6),
    INTR_RATE2           NUMBER(12, 6),
    ARTICLE              VARCHAR2(80),
    PRICE                NUMBER(12, 6),
    QUANTITY             NUMBER(16, 2),
    QUANTITY_UNIT        VARCHAR2(30),
    DUE_INTR_RATE        NUMBER(12, 6),
    INTR_RULE            VARCHAR2(32),
    DAY_UP_DOWN          NUMBER,
    CHARGE_RATE          NUMBER(12, 6),
    BIZ_NUMBER           VARCHAR2(32),
    RECONCILE_MARK       VARCHAR2(64),
    X_CASE_TYPE          VARCHAR2(32),
    X_CASE_ID            VARCHAR2(64),
    X_AMOUNT             NUMBER(16, 2),
    X_START_DATE         DATE,
    X_END_DATE           DATE,
    INTR_DATE            DATE,
    TICKET_TYPE          VARCHAR2(32),
    TICKET_NO            VARCHAR2(32),
    TICKET_NOE           VARCHAR2(32),
    TICKET_PSWD          VARCHAR2(32),
    OWNED_BRANCH_NO      VARCHAR2(6),
    TICKET_TAKER         VARCHAR2(20),
    BC_ACC               VARCHAR2(32),
    LBK_NO               VARCHAR2(4),
    LBK_NAME             VARCHAR2(80),
    LBK_BRANCH_NO        VARCHAR2(32),
    LBK_BRANCH_NAME      VARCHAR2(80),
    LBK_REGION           VARCHAR2(80),
    LBK_CITY             VARCHAR2(80),
    LBK_ACC_NO           VARCHAR2(32),
    LBK_ACC_NAME         VARCHAR2(80),
    IMG_LOC              VARCHAR2(256),
    BUSNISS_TYPE         NUMBER,
    TREAT_WAY            NUMBER,
    INTEREST_BEAR_WAY    VARCHAR2(32),
    TX_BIZNUMBER         VARCHAR2(100),
    SB_UNIT_NO           VARCHAR2(32),
    VCH_REF_NO           VARCHAR2(32),
    FLOATING_MODE        NUMBER,
    FLOATING_AMOUNT      NUMBER(12, 6),
    URGENT_LEVEL         NUMBER,
    RESERVE_ID           NUMBER,
    DB_CASH_FLOW         VARCHAR2(32),
    CR_CASH_FLOW         VARCHAR2(32),
    STD_BOOK_TYPE        NUMBER,
    BRANCH_SORT          NUMBER,
    ISCA_PAY_INTR_ACC_NO VARCHAR2(32),
    ISCA_REC_INTR_ACC_NO VARCHAR2(32),
    PRO_PAY_INTR_ACC_NO  VARCHAR2(32),
    PRO_REC_INTR_ACC_NO  VARCHAR2(32),
    SMART_BTY_ID         NUMBER,
    OP_ACCOUNT_NAME      VARCHAR2(200),
    ACCOUNT_NAME         VARCHAR2(200),
    USE_OF_FUNDS         VARCHAR2(5)
)
/

comment on column CPM_VTX.USE_OF_FUNDS is '国资委资金用途'
/

create index CPM_VTX_CUST_IDX
    on CPM_VTX (CUST_NO, OP_CUST_NO)
/

create index IDX_CPM_VTX_EBK_ACC
    on CPM_VTX (EBK_ACC_NO)
/

create index CPM_VTX_ACC_IDX
    on CPM_VTX (ACC_NO, BIZ_ACC_NO, OP_ACC_NO, OP_BIZ_ACC_NO)
/
 Show table preview */

/*
CPM_VTX 记账交易表
字段	含义	备注
TX_ID	交易ID	　
CUST_NO	客户编号	　
ACC_NO	本方结算账号	　
BIZ_ACC_NO	本方业务账号	　
OP_CUST_NO	对方单位	　
OP_ACC_NO	对方结算账号	　
OP_BIZ_ACC_NO	对方业务账号	　
THRD_CUST_NO	第三方单位	　
THRD_ACC_NO	第三方账号	　
THRD_BIZ_ACC_NO	第三方业务账号	　
EBK_NO	他行银行代号	　
EBK_NAME	他行行名	　
EBK_BRANCH_NAME	他行开户行名	　
EBK_BRANCH_NO	他行开户行号	　
EBK_RIGION	他行地址（省）	　
EBK_CITY	他行地址（市）	　
EBK_ACC_NO	他行账号	　
EBK_ACCOUNT_NAME	他行户名	　
EBK_CNAPS_CODE	现代化支付行号	　
BC_CHANNEL	清算渠道	　
BC_NAME	清算银行	　
BC_ACC_INDEX	清算账号标识	　
BC_TICKET_TYPE	清算单据类型	　
BC_TICKET_NO	清算单据编号	　
BC_TICKET_PSWD	清算单据密码	　
CR_DB	业务方向	　
AMOUNT	主交易金额	　
AMOUNT2	附属交易金额	　
INTR_AMOUNT	利息金额	　
CHARGE_AMOUNT	费用金额	　
START_DATE	业务开始日期	　
END_DATE	业务结束日期	　
INTR_RATE	业务利率	　
INTR_RATE2	备用利率字段	　
ARTICLE	品名	　
PRICE	单价	　
QUANTITY	数量	　
QUANTITY_UNIT	计量单位	　
DUE_INTR_RATE	到期后利率	　
INTR_RULE	利率规则标识	　
DAY_UP_DOWN	计息调整天数	　
CHARGE_RATE	费率规则标识	　
BIZ_NUMBER	业务标识号	　
RECONCILE_MARK	客户对账标识	　
X_CASE_TYPE	外部实体分类	　
X_CASE_ID	外部实体ID	　
X_AMOUNT	外部实体金额	　
X_START_DATE	外部实体开始日	　
X_END_DATE	外部实体到期日	　
INTR_DATE	交易起息日期	　
TICKET_TYPE	凭证种类	　
TICKET_NO	凭证号码	　
TICKET_NOE	凭证号码	　
TICKET_PSWD	凭证密码	　
OWNED_BRANCH_NO	凭证领入机构	　
TICKET_TAKER	凭证领用人	　
BC_ACC	清算银行账号	　
LBK_NO	本方银行代号	　
LBK_NAME	本方银行名称	　
LBK_BRANCH_NO	本方开户行号	　
LBK_BRANCH_NAME	本方开户行名	　
LBK_REGION	本方银行地址1	　
LBK_CITY	本方银行地址2	　
LBK_ACC_NO	本方银行账号	　
LBK_ACC_NAME	本方银行户名	　
IMG_LOC	对应影像位置	　
BUSNISS_TYPE	业务品种	　
TREAT_WAY	到期处理方式	1为不转存,
3为自动本息转存,
4为自动本金转存
INTEREST_BEAR_WAY	计息方式	　
TX_BIZNUMBER	业务标识	　
SB_UNIT_NO	业务台帐号	　
VCH_REF_NO	凭证参考号	　
FLOATING_MODE	浮动方式	1为不浮动，
2为上浮固定值，
3为下浮固定值，
4为上浮百分比，
5为下浮百分比
FLOATING_AMOUNT	浮动量	　
URGENT_LEVEL	指令加急级别	0,"普通"，
1,"加急"
RESERVE_ID	交易涉及的预约记录ID	　
DB_CASH_FLOW	借方现金流向	　
CR_CASH_FLOW	贷方现金流向	　
BRANCH_SORT	机构标记	　
ACCOUNT_NAME	本方账户名	　
OP_ACCOUNT_NAME	对方账户名	　
*/

-- list 1