-- 执行SQL脚本
delete
from STG_CPM_TICKET
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- 表输入
SELECT TICKET_ID,
       TKT_CODE,
       CUST_ID,
       ACCOUNT_ID,
       BRANCH_NO,
       TICKET_CODE,
       TICKET_STATE,
       TICKET_PSWD,
       AMOUNT,
       BOOK_DATE,
       BEGIN_DATE,
       END_DATE,
       RATE_VALUE,
       REMARK,
       BANK_CODE,
       BANK_NAME,
       RELEASE_STATE,
       PURCHASE_DATE,
       REL_TX_ID,
       TICKET_TAKER,
       TAKE_DATE,
       VERSION_COLUMN
FROM CPM_TICKET

WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_TICKET
-- auto-generated definition
create table CPM_TICKET
(
    TICKET_ID      NUMBER           not null
        constraint PK_CPM_TICKET
            primary key,
    TKT_CODE       VARCHAR2(4)
        constraint FK_TICK_RELATIONS_CPM_TICK1
            references CPM_TICKET_TYPE,
    CUST_ID        NUMBER
        constraint FK_CPM_TICK_RELATIONS_CPM_CUST
            references CPM_CUSTOMER,
    ACCOUNT_ID     NUMBER
        constraint FK_CPM_TICK_RELATIONS_CPM_BOOK
            references CPM_BOOK_UNIT,
    BRANCH_NO      VARCHAR2(8)
        constraint FK_CPM_TICK_REF_CPM_BRANCH
            references CPM_BRANCH,
    TICKET_CODE    VARCHAR2(32),
    TICKET_STATE   NUMBER,
    TICKET_PSWD    VARCHAR2(32),
    AMOUNT         NUMBER(16, 2),
    BOOK_DATE      DATE,
    BEGIN_DATE     DATE,
    END_DATE       DATE,
    RATE_VALUE     NUMBER(10, 6),
    REMARK         VARCHAR2(255),
    BANK_CODE      VARCHAR2(4),
    BANK_NAME      VARCHAR2(80),
    RELEASE_STATE  NUMBER,
    PURCHASE_DATE  DATE,
    REL_TX_ID      NUMBER,
    TICKET_TAKER   VARCHAR2(20),
    TAKE_DATE      DATE,
    VERSION_COLUMN NUMBER default 0 not null
)
/

create index CPM_TICKET_IDX
    on CPM_TICKET (TKT_CODE, ACCOUNT_ID, BRANCH_NO, TICKET_STATE)
/

create index CPM_TICKET_STATE_IDX
    on CPM_TICKET (TICKET_STATE)
/

create index RELATIONSHIP_89_FK
    on CPM_TICKET (ACCOUNT_ID)
/

create index RELATIONSHIP_86_FK
    on CPM_TICKET (CUST_ID)
/

create index RELATIONSHIP_82_FK
    on CPM_TICKET (TKT_CODE)
/
 Show table preview */




/*
CPM_TICKET 重空凭证表
字段	含义	备注
TICKET_ID	单据ID	　
TKT_CODE	票证种类编号	　
CUST_ID	客户ID	　
ACCOUNT_ID	账户ID	　
BRANCH_NO	营业机构号	　
TICKET_CODE	票证号码	　
TICKET_STATE	票证状态	1为已购入,
2为已售出,
3为已使用,
4为已挂失,
6为已退回,
7为已作废,
8为已领出
TICKET_PSWD	凭证密码	　
AMOUNT	主交易金额	　
BOOK_DATE	签发日期	　
BEGIN_DATE	开始日期	　
END_DATE	业务结束日期	　
RATE_VALUE	利率值	　
REMARK	备注	　
BANK_CODE	银行代号	　
BANK_NAME	银行名称	　
RELEASE_STATE	解付状态	1为未解付，2为已解付
PURCHASE_DATE	购入日期	　
REL_TX_ID	相关交易流水号	　
TICKET_TAKER	领用人	　
TAKE_DATE	领用日期	　
VERSION_COLUMN	版本号	　
*/
