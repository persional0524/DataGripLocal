-- 执行SQL脚本
delete
from STG_DBMS_BILL
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_DBMS_BILL', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT BILLID,
       BILLNO,
       BILLKIND,
       ACCPTMODE,
       AMOUNT,
       ISSUEDATE,
       ACCEPTDATE,
       DUEDATE,
       BANKNO,
       DRAWERBANKNO,
       DRAWERBANKNAME,
       DRAWERACCOUNT,
       DRAWERNAME,
       DRAWERCREDITRATING,
       DRAWERRATINGAGENCIES,
       DRAWERCREDITDUEDATE,
       PAYEEACCOUNT,
       PAYEENAME,
       PAYEEBANKNAME,
       PAYEEBANKNO,
       ACCEPTORNAME,
       ACCEPTORACCOUNT,
       ACCEPTORBANKNO,
       ACCEPTORBANKNAME,
       ACCEPTORBANKADR,
       ACCEPTORCREDITRATING,
       ACCEPTORRATINGAGENCIES,
       ACCEPTORCREDITDUEDATE,
       CONTRACTNO,
       INVOICENO,
       MEMO,
       STATUS,
       LOCKED,
       ACTIVEFLAG,
       HOLDERBANKNO,
       HOLDERACCOUNT,
       OWNERBANKNO,
       OWNERACCOUNT,
       BANENDORSEMENT,
       CREATETIME,
       LASTUPDATETIME,
       KEEPFLAG,
       TRUSTFLAG,
       BMS_BILL_ID,
       ACCEPTORBANKAREA,
       ACCEPTORBANKCITY,
       CHECKBANKNO,
       CANEXECFLAG,
       WAREHOUSEID,
       ENDFLAG,
       ENDTYPE,
       ENDDATE,
       TRUSTCOLLECTIONFLAG,
       REGISTDATE,
       REGISTAMOUNT,
       LASTTXID,
       LOCKTX,

   '${edate}' as sjrq,
   '2' as MAKEUP_STATUS
  FROM DBMS_BILL;

/*
-- 字段缺失
       TALLYFLAG,
       SETTLE_FLAG,*/

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: DBMS_BILL  -- 票据记录。
-- auto-generated definition
create table DBMS_BILL
(
    BILLID                 NUMBER                 not null
        constraint PK_DBMS_BILL
            primary key,
    BILLNO                 VARCHAR2(32),
    BILLKIND               NUMBER default 0,
    ACCPTMODE              NUMBER default 0,
    AMOUNT                 NUMBER(15, 2)          not null,
    ISSUEDATE              DATE,
    ACCEPTDATE             DATE,
    DUEDATE                DATE,
    BANKNO                 VARCHAR2(2),
    DRAWERBANKNO           VARCHAR2(12),
    DRAWERBANKNAME         VARCHAR2(128),
    DRAWERACCOUNT          VARCHAR2(32),
    DRAWERNAME             VARCHAR2(128),
    DRAWERCREDITRATING     VARCHAR2(24),
    DRAWERRATINGAGENCIES   VARCHAR2(60),
    DRAWERCREDITDUEDATE    DATE,
    PAYEEACCOUNT           VARCHAR2(32),
    PAYEENAME              VARCHAR2(128),
    PAYEEBANKNAME          VARCHAR2(128),
    PAYEEBANKNO            VARCHAR2(12),
    ACCEPTORNAME           VARCHAR2(128),
    ACCEPTORACCOUNT        VARCHAR2(32),
    ACCEPTORBANKNO         CHAR(12),
    ACCEPTORBANKNAME       VARCHAR2(128),
    ACCEPTORBANKADR        VARCHAR2(256),
    ACCEPTORCREDITRATING   VARCHAR2(24),
    ACCEPTORRATINGAGENCIES VARCHAR2(60),
    ACCEPTORCREDITDUEDATE  DATE,
    CONTRACTNO             VARCHAR2(60),
    INVOICENO              VARCHAR2(60),
    MEMO                   VARCHAR2(512),
    STATUS                 VARCHAR2(6),
    LOCKED                 NUMBER default 0       not null,
    ACTIVEFLAG             NUMBER default 1       not null,
    HOLDERBANKNO           VARCHAR2(12),
    HOLDERACCOUNT          VARCHAR2(32),
    OWNERBANKNO            VARCHAR2(12),
    OWNERACCOUNT           VARCHAR2(32),
    BANENDORSEMENT         NUMBER,
    CREATETIME             DATE   default sysdate not null,
    LASTUPDATETIME         DATE,
    KEEPFLAG               NUMBER,
    TRUSTFLAG              NUMBER,
    BMS_BILL_ID            NUMBER,
    ACCEPTORBANKAREA       VARCHAR2(60),
    ACCEPTORBANKCITY       VARCHAR2(60),
    CHECKBANKNO            VARCHAR2(2),
    CANEXECFLAG            NUMBER default 0       not null,
    WAREHOUSEID            NUMBER,
    ENDFLAG                NUMBER default 0,
    ENDTYPE                VARCHAR2(20),
    ENDDATE                DATE,
    TRUSTCOLLECTIONFLAG    NUMBER default 0,
    REGISTDATE             DATE,
    REGISTAMOUNT           NUMBER(15, 2),
    LASTTXID               NUMBER,
    LOCKTX                 VARCHAR2(200)
)
/

comment on table DBMS_BILL is '票据记录。'
/

comment on column DBMS_BILL.BILLID is '票据ID'
/

comment on column DBMS_BILL.BILLNO is '票据编号'
/

comment on column DBMS_BILL.BILLKIND is '0 电票 1 纸票'
/

comment on column DBMS_BILL.ACCPTMODE is '0 银承 1商承'
/

comment on column DBMS_BILL.AMOUNT is '票面金额'
/

comment on column DBMS_BILL.ISSUEDATE is '出票日期'
/

comment on column DBMS_BILL.ACCEPTDATE is '承兑日期'
/

comment on column DBMS_BILL.DUEDATE is '到期日期'
/

comment on column DBMS_BILL.BANKNO is '所属银行代号'
/

comment on column DBMS_BILL.DRAWERBANKNO is '出票人开户行行号'
/

comment on column DBMS_BILL.DRAWERBANKNAME is '出票人开户行'
/

comment on column DBMS_BILL.DRAWERACCOUNT is '出票人账号'
/

comment on column DBMS_BILL.DRAWERNAME is '出票人名称'
/

comment on column DBMS_BILL.DRAWERCREDITRATING is '出票人信用等级'
/

comment on column DBMS_BILL.DRAWERRATINGAGENCIES is '出票人评级机构'
/

comment on column DBMS_BILL.DRAWERCREDITDUEDATE is '出票人评级到期日'
/

comment on column DBMS_BILL.PAYEEACCOUNT is '收款人账号'
/

comment on column DBMS_BILL.PAYEENAME is '收款人名称'
/

comment on column DBMS_BILL.PAYEEBANKNAME is '收款人开户行'
/

comment on column DBMS_BILL.PAYEEBANKNO is '收款人开户行行号'
/

comment on column DBMS_BILL.ACCEPTORNAME is '承兑人名称'
/

comment on column DBMS_BILL.ACCEPTORACCOUNT is '承兑人账号'
/

comment on column DBMS_BILL.ACCEPTORBANKNO is '承兑人开户行行号'
/

comment on column DBMS_BILL.ACCEPTORBANKNAME is '承兑人开户行名称'
/

comment on column DBMS_BILL.ACCEPTORBANKADR is '承兑人开户行地址'
/

comment on column DBMS_BILL.ACCEPTORCREDITRATING is '承兑人信用等级'
/

comment on column DBMS_BILL.ACCEPTORRATINGAGENCIES is '承兑人评级机构'
/

comment on column DBMS_BILL.ACCEPTORCREDITDUEDATE is '承兑人评级到期日'
/

comment on column DBMS_BILL.CONTRACTNO is '交易合同号'
/

comment on column DBMS_BILL.INVOICENO is '发票号码'
/

comment on column DBMS_BILL.MEMO is '备注'
/

comment on column DBMS_BILL.STATUS is '票据状态'
/

comment on column DBMS_BILL.LOCKED is '锁定标记'
/

comment on column DBMS_BILL.ACTIVEFLAG is '生效标记
-1 未生效
-9 已结清
1 已生效'
/

comment on column DBMS_BILL.HOLDERBANKNO is '持有人行号'
/

comment on column DBMS_BILL.HOLDERACCOUNT is '持有人帐号'
/

comment on column DBMS_BILL.OWNERBANKNO is '所有人行号'
/

comment on column DBMS_BILL.OWNERACCOUNT is '所有人帐号'
/

comment on column DBMS_BILL.BANENDORSEMENT is '不得转让标记'
/

comment on column DBMS_BILL.CREATETIME is '记录创建时间'
/

comment on column DBMS_BILL.LASTUPDATETIME is '末次更新时间'
/

comment on column DBMS_BILL.KEEPFLAG is '是否代保管
  0 否
  1 是'
/

comment on column DBMS_BILL.TRUSTFLAG is '是否托管
  0 否
  1 是'
/

comment on column DBMS_BILL.BMS_BILL_ID is 'BMS票据ID'
/

comment on column DBMS_BILL.ACCEPTORBANKAREA is '承兑人开户行的省信息'
/

comment on column DBMS_BILL.ACCEPTORBANKCITY is '承兑人开户行的(地) 市信息'
/

comment on column DBMS_BILL.CHECKBANKNO is '验票银行'
/

comment on column DBMS_BILL.CANEXECFLAG is '是否可被处理(用于票据结清细化登记审批流) 0：可被处理 1：不可被处理'
/

comment on column DBMS_BILL.WAREHOUSEID is '库存ID'
/

comment on column DBMS_BILL.ENDFLAG is '交易结束时票据在库情况，1：在库 0：出库'
/

comment on column DBMS_BILL.ENDTYPE is '出库方式'
/

comment on column DBMS_BILL.ENDDATE is '结束日期'
/

comment on column DBMS_BILL.TRUSTCOLLECTIONFLAG is '托收获兑标记 （0未托收 1已托收 2已获兑）'
/

comment on column DBMS_BILL.REGISTDATE is '获兑日期'
/

comment on column DBMS_BILL.REGISTAMOUNT is '获兑金额'
/

comment on column DBMS_BILL.LASTTXID is '最后一次交易的txid'
/

comment on column DBMS_BILL.LOCKTX is '所有锁定票据的交易'
/

create index IDX_DBMS_BILL_WAREHOUSEID
    on DBMS_BILL (WAREHOUSEID)
/

create index IDX_DBMS_BILL_BILLNO
    on DBMS_BILL (BILLNO)
/

create index IDX_DBMS_BILL_DUEDATE
    on DBMS_BILL (DUEDATE)
/

create index IDX_DBMS_BILL_ISSUEDATE
    on DBMS_BILL (ISSUEDATE)
/

create index INDEX_1
    on DBMS_BILL (HOLDERBANKNO, HOLDERACCOUNT)
/
 Show table preview*/

-- list 不存在