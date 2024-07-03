-- 执行SQL脚本
TRUNCATE TABLE ODS_PRMS_CREDIT_LINE_DETAIL;

-- 表输入

SELECT DETAIL_ID,
       LINE_ID,
       BIZ_TYPE,
       CURRENCY_NO,
       CREDIT_AMOUNT,
       USED_AMOUNT,
       REMARK,
       GROUP_AMOUNT,
       GROUP_NUM
FROM PRMS_CREDIT_LINE_DETAIL;

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: PRMS_CREDIT_LINE_DETAIL  -- 综合授信明细表
-- auto-generated definition
create table PRMS_CREDIT_LINE_DETAIL
(
    DETAIL_ID     NUMBER        not null
        constraint PK_PRMS_CREDIT_LINE_DETAIL
            primary key,
    LINE_ID       NUMBER
        constraint FK_PRMS_DET_REFERENCE_PRMS_CRE
            references PRMS_CREDIT_LINE,
    BIZ_TYPE      VARCHAR2(4),
    CURRENCY_NO   VARCHAR2(4),
    CREDIT_AMOUNT NUMBER(17, 2),
    USED_AMOUNT   NUMBER(17, 2) not null,
    REMARK        VARCHAR2(200),
    GROUP_AMOUNT  NUMBER(17, 2),
    GROUP_NUM     NUMBER
)
/

comment on table PRMS_CREDIT_LINE_DETAIL is '综合授信明细表'
/

comment on column PRMS_CREDIT_LINE_DETAIL.DETAIL_ID is '明细流水号'
/

comment on column PRMS_CREDIT_LINE_DETAIL.LINE_ID is '综合授信流水号'
/

comment on column PRMS_CREDIT_LINE_DETAIL.BIZ_TYPE is '业务品种编号'
/

comment on column PRMS_CREDIT_LINE_DETAIL.CURRENCY_NO is '币种编号'
/

comment on column PRMS_CREDIT_LINE_DETAIL.CREDIT_AMOUNT is '授信金额'
/

comment on column PRMS_CREDIT_LINE_DETAIL.USED_AMOUNT is '已占用金额'
/

comment on column PRMS_CREDIT_LINE_DETAIL.REMARK is '备注'
/
 Show table preview */


-- list 缺失