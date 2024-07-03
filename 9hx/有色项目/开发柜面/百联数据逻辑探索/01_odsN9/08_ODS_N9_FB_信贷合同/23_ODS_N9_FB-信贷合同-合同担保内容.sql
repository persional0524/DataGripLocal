-- 执行SQL脚本
delete
from STG_FB_SURETIES
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_SURETIES', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT SURETY_ID,
       BID,
       SURE_MODE,
       SURE_AMOUNT,
       PROPORTION,
       WARRANTOR_ID,
       REMARK,
       SURETY_CODE,
       STATE,
       START_DATE,
       END_DATE,
       GUARATEEOBJ,
       GUARATEEOBJTYPES,
       GUARATEECONTRACTNO,
       RISK_MITIGATION_TYPE,
       MNGCONTRACTNO,
       MNGCONTRACTID,
       SURETY_CREDIT_FACTOR,

       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_SURETIES;

/*
字段缺失
       LOANGUARANTEETYPES,
       COLLATERALCATEGORY,
       FIRSTLINE,
       EVALUATIONWAY,
       EVALUATIONMETHODS,
       EVALUATIONPERIOD,
       CARDNUMBER,
       COLLATERALCODING,
       ASSESSEDVALUE,
       COLLATERALPARVALUE,
       SEEKPREFERREDPAYMENTS,
       APPRAISALBASEDATE,
       COLLATERAL_NAME,
       GUARANTEE_MODE,*/

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_SURETIES  -- 合同担保内容
-- auto-generated definition
create table FB_SURETIES
(
    SURETY_ID            NUMBER        not null
        constraint PK_FB_SURETIES
            primary key,
    BID                  NUMBER        not null
        constraint FK_FB_SURET_RELATIONS_FB_CONTR
            references FB_CONTRACTS,
    SURE_MODE            NUMBER,
    SURE_AMOUNT          NUMBER(15, 2) not null,
    PROPORTION           NUMBER(15, 6),
    WARRANTOR_ID         NUMBER,
    REMARK               VARCHAR2(1024),
    SURETY_CODE          VARCHAR2(32),
    STATE                NUMBER,
    START_DATE           DATE,
    END_DATE             DATE,
    GUARATEEOBJ          VARCHAR2(200),
    GUARATEEOBJTYPES     VARCHAR2(256),
    GUARATEECONTRACTNO   VARCHAR2(200),
    RISK_MITIGATION_TYPE VARCHAR2(3),
    MNGCONTRACTNO        VARCHAR2(200),
    MNGCONTRACTID        VARCHAR2(50),
    SURETY_CREDIT_FACTOR NUMBER(15, 6),
    MARGIN_ACCOUNT       VARCHAR2(80)
)
/

comment on table FB_SURETIES is '合同担保内容'
/

comment on column FB_SURETIES.SURETY_ID is '担保项ID'
/

comment on column FB_SURETIES.BID is '合同ID'
/

comment on column FB_SURETIES.SURE_MODE is '担保类型'
/

comment on column FB_SURETIES.SURE_AMOUNT is '担保金额'
/

comment on column FB_SURETIES.PROPORTION is '风险比例(%)'
/

comment on column FB_SURETIES.WARRANTOR_ID is '担保人'
/

comment on column FB_SURETIES.REMARK is '备注'
/

comment on column FB_SURETIES.SURETY_CODE is '担保方式多维码，包括系统级担保方式及自定义的扩展担保方式。
系统级担保方式：
·01－信用；
·02－担保；
·03－抵押；
·04－质押；
·05－保证金；
扩展担保方式：
对应CODES表中CODETYPENO字段为''SURT''的记录。'
/

comment on column FB_SURETIES.STATE is '状态'
/

comment on column FB_SURETIES.START_DATE is '担保起始日期'
/

comment on column FB_SURETIES.END_DATE is '担保终止日期'
/

comment on column FB_SURETIES.GUARATEEOBJ is '担保物名称'
/

comment on column FB_SURETIES.GUARATEEOBJTYPES is '担保物分类'
/

comment on column FB_SURETIES.GUARATEECONTRACTNO is '担保合同名称'
/

comment on column FB_SURETIES.MNGCONTRACTNO is '管理合同号'
/

comment on column FB_SURETIES.MNGCONTRACTID is '管理合同id'
/

comment on column FB_SURETIES.SURETY_CREDIT_FACTOR is '担保授信系数'
/

comment on column FB_SURETIES.MARGIN_ACCOUNT is '保证金账户'
/

create index FB_SURETIES_FK
    on FB_SURETIES (BID)
/
 Show table preview*/

-- list 不存在