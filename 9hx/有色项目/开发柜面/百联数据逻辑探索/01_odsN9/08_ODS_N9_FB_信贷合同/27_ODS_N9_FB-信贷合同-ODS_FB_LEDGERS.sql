-- 执行SQL脚本
delete
from ODS_FB_LEDGERS;
-- 表输入

SELECT LEDGER_ID,
       BID,
       LENDING_ID,
       LEDGER_TYPE,
       ACT_DATE,
       INTR_DATE,
       DIR_FLAG,
       AMOUNT,
       REPAY_ID,
       TALLY_FLAG,
       TALLY_ID,
       ERROR_MSG,
       CREATE_TIME,
       LAST_UPDATE_TIME,
       FREE,
       SHEET_DATE,
       SOURCE_ID
FROM FB_LEDGERS;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_LEDGERS  -- 合同台帐
-- auto-generated definition
create table FB_LEDGERS
(
    LEDGER_ID        NUMBER             not null
        constraint PK_FB_LEDGERS
            primary key,
    BID              NUMBER             not null
        constraint FK_FB_LEDGE_REFERENCE_FB_CONTR
            references FB_CONTRACTS,
    LENDING_ID       NUMBER
        constraint FK_FB_LEDGERS_01
            references FB_LENDINGS,
    LEDGER_TYPE      VARCHAR2(4)        not null,
    ACT_DATE         DATE               not null,
    INTR_DATE        DATE               not null,
    DIR_FLAG         CHAR   default '+' not null
        constraint CKC_DIR_FLAG_FB_LEDGE
            check (Dir_Flag in ('+', '-')),
    AMOUNT           NUMBER(15, 2)      not null,
    REPAY_ID         NUMBER
        constraint FK_FB_LEDGE_RELATIONS_FB_REPAY
            references FB_REPAYMENTS,
    TALLY_FLAG       NUMBER default 0   not null,
    TALLY_ID         NUMBER,
    ERROR_MSG        VARCHAR2(1024),
    CREATE_TIME      DATE               not null,
    LAST_UPDATE_TIME DATE,
    FREE             NUMBER,
    SHEET_DATE       DATE,
    SOURCE_ID        NUMBER
)
/

comment on table FB_LEDGERS is '合同台帐'
/

comment on column FB_LEDGERS.LEDGER_ID is '台账记录ID'
/

comment on column FB_LEDGERS.BID is '合同ID'
/

comment on column FB_LEDGERS.LENDING_ID is '放款ID'
/

comment on column FB_LEDGERS.LEDGER_TYPE is '台账分户性质'
/

comment on column FB_LEDGERS.ACT_DATE is '记帐日期'
/

comment on column FB_LEDGERS.INTR_DATE is '起息日期'
/

comment on column FB_LEDGERS.DIR_FLAG is '方向'
/

comment on column FB_LEDGERS.AMOUNT is '金额'
/

comment on column FB_LEDGERS.REPAY_ID is '还款登记ID'
/

comment on column FB_LEDGERS.TALLY_FLAG is '记帐标记'
/

comment on column FB_LEDGERS.TALLY_ID is '核算数据Id'
/

comment on column FB_LEDGERS.ERROR_MSG is '记帐失败原因'
/

comment on column FB_LEDGERS.CREATE_TIME is '记录创建时间'
/

comment on column FB_LEDGERS.LAST_UPDATE_TIME is '末次修改时间'
/

comment on column FB_LEDGERS.SHEET_DATE is '单据做账日期'
/

comment on column FB_LEDGERS.SOURCE_ID is '源ID'
/

create index FB_LEDGERS_FK
    on FB_LEDGERS (REPAY_ID)
/

create index IDX_FB_LEDGERS_LEDGER_TYPE
    on FB_LEDGERS (LEDGER_TYPE)
/

create index IDX_FB_LEDGERS_BID
    on FB_LEDGERS (BID)
/
 Show table preview*/

-- list 1