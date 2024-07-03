-- 表输入
SELECT BOOK_ID,
       TX_ID,
       DRAFT_ID,
       ACCOUNT_ID,
       BOOK_DIR,
       AMOUNT,
       BEGIN_DATE,
       END_DATE,
       REMARK,
       BOOK_DATE,
       BIZ_CODE,
       IS_INTERESTED,
       BOOK_TYPE
FROM CPM_STD_BOOK;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_STD_BOOK
-- auto-generated definition
create table CPM_STD_BOOK
(
    BOOK_ID       NUMBER        not null
        constraint PK_CPM_STD_BOOK
            primary key,
    TX_ID         NUMBER
        constraint FK_CPM_STD__RELATIONS_CPM_TX
            references CPM_TX,
    DRAFT_ID      NUMBER
        constraint FK_CPM_STD__REL_STD_S_CPM_SB_D
            references CPM_SB_DRAFT,
    ACCOUNT_ID    NUMBER        not null
        constraint FK_CPM_STD__REL_STD_S_CPM_SB_U
            references CPM_SB_UNIT,
    BOOK_DIR      CHAR          not null,
    AMOUNT        NUMBER(16, 2) not null,
    BEGIN_DATE    DATE,
    END_DATE      DATE,
    REMARK        VARCHAR2(255),
    BOOK_DATE     DATE,
    BIZ_CODE      VARCHAR2(70),
    IS_INTERESTED NUMBER,
    BOOK_TYPE     NUMBER
)
/

create index REL_STD_SBD_FK
    on CPM_STD_BOOK (DRAFT_ID)
/

create index CPM_STD_BOOK_IDX
    on CPM_STD_BOOK (TX_ID, ACCOUNT_ID, BOOK_DIR)
/

create index REL_STD_SBU_FK
    on CPM_STD_BOOK (ACCOUNT_ID)
/

create index RELATIONSHIP_148_FK2
    on CPM_STD_BOOK (TX_ID)
/

create index INX_CPM_STD_BOOK_1
    on CPM_STD_BOOK (ACCOUNT_ID asc, BOOK_DATE desc)
/
 Show table preview*/


/*
CPM_STD_BOOK 业务台账表
字段	含义	备注
BOOK_ID	台账记录ID	　
TX_ID	交易ID	　
DRAFT_ID	指令底稿ID	　
ACCOUNT_ID	账户ID	　
BOOK_DIR	台账方向	台账方向。'+' 增加；'-' 减少；
AMOUNT	主交易金额	　
BEGIN_DATE	开始日期	　
END_DATE	业务结束日期	　
REMARK	备注	　
BOOK_DATE	签发日期	　
BIZ_CODE	业务标识	合同号/借据号/存单号等
IS_INTERESTED	是否已结息	1为已结息，0为未结息
BOOK_TYPE	台账类型	1为放款,
2为本息还款,
3为本金还款,
4为冲账,
5为账户资金冻结,
6为被冲账,
7为资产转让*/

-- list 1