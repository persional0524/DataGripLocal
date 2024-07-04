-- 执行SQL脚本
delete
from STG_DBMS_SURETY
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_DBMS_SURETY', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT SURETYID,
       BILLID,
       TXID,
       SURETYMODE,
       ACTDATE,
       AMOUNT,
       PERCENT,
       WARRANTORNAME,
       WARRANTORID,
       WARRANTORBANKNO,
       WARRANTORBANKNAME,
       WARRANTORADDRESS,
       WARRANTEENAME,
       WARRANTEEID,
       WARRANTEEBANKNO,
       MEMO,
       ACTIVEFLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM DBMS_SURETY;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: DBMS_SURETY  -- 票据担保信息
-- auto-generated definition
create table DBMS_SURETY
(
    SURETYID          NUMBER not null
        constraint PK_DBMS_SURETY
            primary key,
    BILLID            NUMBER
        constraint FK_BIL_REF_BIL2
            references DBMS_BILL,
    TXID              NUMBER
        constraint FK_DBMS_SUR_REFERENCE_DBMS_TX
            references DBMS_TX,
    SURETYMODE        NUMBER,
    ACTDATE           DATE,
    AMOUNT            NUMBER(15, 2),
    PERCENT           NUMBER(6, 2),
    WARRANTORNAME     VARCHAR2(60),
    WARRANTORID       VARCHAR2(32),
    WARRANTORBANKNO   VARCHAR2(12),
    WARRANTORBANKNAME VARCHAR2(256),
    WARRANTORADDRESS  VARCHAR2(256),
    WARRANTEENAME     VARCHAR2(60),
    WARRANTEEID       VARCHAR2(32),
    WARRANTEEBANKNO   VARCHAR2(12),
    MEMO              VARCHAR2(256),
    ACTIVEFLAG        NUMBER
)
/

comment on table DBMS_SURETY is '票据担保信息'
/

comment on column DBMS_SURETY.SURETYID is '票据担保ID'
/

comment on column DBMS_SURETY.BILLID is '票据ID'
/

comment on column DBMS_SURETY.TXID is '票据交易ID'
/

comment on column DBMS_SURETY.SURETYMODE is '1 开票保证金
2 质押开票
11 开票保证人
21 承兑保证人
31 背书保证人'
/

comment on column DBMS_SURETY.ACTDATE is '担保日期'
/

comment on column DBMS_SURETY.AMOUNT is '金额,保证金方式为保证金金额，质押开票方式为质押票据金额，开票保证人为票据金额,背书保证人为票据金额'
/

comment on column DBMS_SURETY.PERCENT is '保证金方式为保证金比例'
/

comment on column DBMS_SURETY.WARRANTORNAME is '对保证金，此字段固定填写”保证金"
对质押开票，此字段填写"票据"+票据号码
对出票保证人，承兑保证人，此字段填写保证人名称
对背书保证，此字段填写保证人名称'
/

comment on column DBMS_SURETY.WARRANTORID is '对保证金，此字段为空
对质押开票，此字段填写票据号码
对出票保证人，承兑保证人，此字段填写保证人帐号
对背书保证，此字段填写保证人帐号'
/

comment on column DBMS_SURETY.WARRANTORBANKNO is '对保证金，此字段固定为空
对质押开票，此字段固定为空
对出票保证人，承兑保证人，此字段填写保证人开户行行号
对背书保证，此字段填写保证人开户行行号'
/

comment on column DBMS_SURETY.WARRANTORADDRESS is '担保物地址'
/

comment on column DBMS_SURETY.WARRANTEENAME is '对保证金，质押开票，出票保证人，此字段填出票人名称
对背书保证，此字段填写背书人名称'
/

comment on column DBMS_SURETY.WARRANTEEID is '对保证金，质押开票，出票保证人，此字段填出票人帐号
对背书保证，此字段填写背书人帐号'
/

comment on column DBMS_SURETY.WARRANTEEBANKNO is '对保证金，质押开票，出票保证人，此字段填出票人开户行行号
对背书保证，此字段填写背书人开户行行号'
/

comment on column DBMS_SURETY.MEMO is '备注'
/

comment on column DBMS_SURETY.ACTIVEFLAG is '为空标识此担保还不存在
为0标识待确认
为1表示担保人拒绝
为2表示担保人接受'
/

create index IDX_DBMS_SURETY_BILLID
    on DBMS_SURETY (BILLID)
/

create index IDX_DBMS_SURETY_TXID
    on DBMS_SURETY (TXID)
/
 Show table preview*/

-- list 不存在