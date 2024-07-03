-- 执行SQL脚本 2
delete from ODS_PRMS_CREDIT_USE_LOG WHERE  ACT_DATE>=to_date('${sdate}','yyyy-MM-dd');

--表输入 2
SELECT USE_LOG_ID,
       LINE_ID,
       DETAIL_ID,
       SOURCE_ID,
       ACT_DATE,
       AMOUNT,
       DIR_FLAG,
       CREATOR,
       CREATER_TIME
FROM PRMS_CREDIT_USE_LOG
WHERE ACT_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- ddl
/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: PRMS_CREDIT_USE_LOG  -- 授信使用记录表
-- auto-generated definition
create table PRMS_CREDIT_USE_LOG
(
    USE_LOG_ID   NUMBER        not null
        constraint PK_PRMS_CREDIT_USE_LOG
            primary key,
    LINE_ID      NUMBER        not null
        constraint FK_PRMS_USE_REFERENCE_PRMS_CRE
            references PRMS_CREDIT_LINE,
    DETAIL_ID    NUMBER
        constraint FK_PRMS_USE_REFERENCE_PRMS_DET
            references PRMS_CREDIT_LINE_DETAIL,
    SOURCE_ID    VARCHAR2(128) not null,
    ACT_DATE     DATE          not null,
    AMOUNT       NUMBER(17, 2) not null,
    DIR_FLAG     NUMBER        not null,
    CREATOR      VARCHAR2(64)  not null,
    CREATER_TIME DATE          not null
)
/

comment on table PRMS_CREDIT_USE_LOG is '授信使用记录表'
/

comment on column PRMS_CREDIT_USE_LOG.USE_LOG_ID is '使用流水号'
/

comment on column PRMS_CREDIT_USE_LOG.LINE_ID is '授信流水号'
/

comment on column PRMS_CREDIT_USE_LOG.DETAIL_ID is '明细流水号'
/

comment on column PRMS_CREDIT_USE_LOG.SOURCE_ID is '使用源标识'
/

comment on column PRMS_CREDIT_USE_LOG.ACT_DATE is '交易日期'
/

comment on column PRMS_CREDIT_USE_LOG.AMOUNT is '交易金额'
/

comment on column PRMS_CREDIT_USE_LOG.DIR_FLAG is '使用方向（1：占用；2：释放；3：撤销；4：结转转入；5：结转转出）'
/

comment on column PRMS_CREDIT_USE_LOG.CREATOR is '创建人'
/

comment on column PRMS_CREDIT_USE_LOG.CREATER_TIME is '创建时间'
/
 Show table preview */
