-- 表输入
SELECT TX_ID,
       TX_CODE,
       CLTNO,
       TX_DATE,
       SOURCE_ID,
       CASE_ID,
       REMARK,
       TX_STATE,
       REJECT_DATE,
       REJECTOR,
       REJECT_REASON,
       CREATOR,
       CREATE_TIME,
       ADJUST_REASON,
       TEMPLET_WORD,
       TEMPLET_EXCEL
FROM PRMS_TX
--WHERE  TX_DATE >=TO_DATE('${sdate}','YYYY-MM-DD')
;

--ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: PRMS_TX  -- 交易表
-- auto-generated definition
create table PRMS_TX
(
    TX_ID         NUMBER        not null
        constraint PK_PRMS_TX
            primary key,
    TX_CODE       VARCHAR2(32)  not null
        constraint FK_PRMS_TX_REFERENCE_PRMS_TX
            references PRMS_TX_TYPE,
    CLTNO         VARCHAR2(30),
    TX_DATE       DATE          not null,
    SOURCE_ID     VARCHAR2(64),
    CASE_ID       NUMBER,
    REMARK        VARCHAR2(256) not null,
    TX_STATE      NUMBER        not null,
    REJECT_DATE   DATE,
    REJECTOR      VARCHAR2(64),
    REJECT_REASON VARCHAR2(256),
    CREATOR       VARCHAR2(64)  not null,
    CREATE_TIME   DATE          not null,
    ADJUST_REASON VARCHAR2(400),
    TEMPLET_WORD  VARCHAR2(64),
    TEMPLET_EXCEL VARCHAR2(64)
)
/

comment on table PRMS_TX is '交易表'
/

comment on column PRMS_TX.TX_ID is '交易流水号'
/

comment on column PRMS_TX.TX_CODE is '交易编码'
/

comment on column PRMS_TX.CLTNO is '客户编码'
/

comment on column PRMS_TX.TX_DATE is '交易日期'
/

comment on column PRMS_TX.SOURCE_ID is '交易源标识'
/

comment on column PRMS_TX.CASE_ID is '审批流ID'
/

comment on column PRMS_TX.REMARK is '交易说明'
/

comment on column PRMS_TX.TX_STATE is '状态（0：未报批；1：已报批；2：通过审批；-1：审批驳回）'
/

comment on column PRMS_TX.REJECT_DATE is '驳回时间'
/

comment on column PRMS_TX.REJECTOR is '驳回人'
/

comment on column PRMS_TX.REJECT_REASON is '驳回理由'
/

comment on column PRMS_TX.CREATOR is '创建人'
/

comment on column PRMS_TX.CREATE_TIME is '创建时间'
/

comment on column PRMS_TX.ADJUST_REASON is '授信调整理由'
/

comment on column PRMS_TX.TEMPLET_WORD is '导出使用的word模板'
/

comment on column PRMS_TX.TEMPLET_EXCEL is '导出使用的excel模板'
/
 Show table preview*/

-- list 缺失