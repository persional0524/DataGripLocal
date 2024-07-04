select * from A_CAST_BANK_ACNT;

-- 61
select count(1) from A_CAST_BANK_ACNT;


select * from CPM_ACC_CHARGE;

-- CPM_ACC_GRP_MAP
select * from CPM_ACC_GRP_MAP;

select * from CPM_ACC_INTR;
select * from RMS_RATE;
select count(1) from CPM_ACC_INTR;

-- 视图
select * from CPM_SUBJECT;

select * from CLT_CLT_INFO;


select * from STL_APPLY;
select * from FBCM_CEDIT_APP;
select * from BCS_TX_ITEMS;
/*

TATE           NUMBER,
    RATIFYNO        NUMBER,
    NOTICENO        VARCHAR2(32),
    RECDATE         TIMESTAMP(6),
    RECREASON       VARCHAR2(255),
    APPLYDATE       TIMESTAMP(6) default (SYSDATE),
    CLTNO           VARCHAR2(18),
    USERID          NUMBER,
    AR_ID           NUMBER,
    INTERBANKFLAG   VARCHAR2(8),
    CCA_ID          NUMBER,
    TEMP_CREDIT_ID  NUMBER,
    APPROVAL_REMARK VARCHAR2(255),
    TRANSFER_REASON VARCHAR2(255),
    TRANSFER_MEMO   VARCHAR2(255),
    MESSAGE         VARCHAR2(256),
    FINGER_PRINT    VARCHAR2(100),
    REVOKTOR        NUMBER,
    REVOKTORNAME    VARCHAR2(32),
    REVOKMEMO       VARCHAR2(256),
    NEED_CREDIT     NUMBER       default (0),
    CREATE_DATE     TIMESTAMP(6),
    BUSI_AMOUNT     NUMBER(15, 2),
    CURRENCY        VARCHAR2(128)
)*/
