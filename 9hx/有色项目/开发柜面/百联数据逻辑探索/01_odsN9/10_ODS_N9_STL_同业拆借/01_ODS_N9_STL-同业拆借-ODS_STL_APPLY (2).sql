-- 执行SQL脚本
delete
from ODS_STL_APPLY;
/*WHERE  ( SJRQ='${edate}'   or
    SJRQ<=to_char(to_date('${edate}','yyyy-MM-dd') -
        (select  get_STG_etl_del_para('STG_STL_APPLY',1) as del from dual),'yyyy-mm-dd')
        )*/


-- 表输入
SELECT STLID,
       CUSTOMID,
       ACNTNO,
       SPEED,
       AMOUNT,
       INTERESTRATE,
       SHIBOR_RATE,
       WAI_RATE,
       REFERENCE_RATE,
       MEAN_RATIO,
       STLTYPE,
       STARTDATE,
       DUEDATE,
       TERM,
       PAYRATE,
       BANKNO,
       RECNO,
       MEMO,
       REASON,
       IOTYPE,
       STATE,
       RATIFYNO,
       NOTICENO,
       RECDATE,
       RECREASON,
       APPLYDATE,
       CLTNO,
       USERID,
       AR_ID,
       INTERBANKFLAG,
       CCA_ID,
       TEMP_CREDIT_ID,
       APPROVAL_REMARK,
       TRANSFER_REASON,
       TRANSFER_MEMO,
       MESSAGE,
       FINGER_PRINT,
       REVOKTOR,
       REVOKTORNAME,
       REVOKMEMO,
       NEED_CREDIT,
       CREATE_DATE,
       BUSI_AMOUNT
 /*,
   '${edate}'as sjrq,
   '2' as MAKEUP_STATUS*/
FROM STL_APPLY;

/*
字段缺失
      APPENDIX,
       CHECKERNAME,
       CREATORNAME,
       TRADE_NO*/


-- ddl  无表，字段注释
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: STL_APPLY
-- auto-generated definition
create table STL_APPLY
(
    STLID           NUMBER      not null
        constraint PK_STL_APPLY
            primary key,
    CUSTOMID        VARCHAR2(8) not null,
    ACNTNO          VARCHAR2(128),
    SPEED           VARCHAR2(32),
    AMOUNT          NUMBER(15, 2),
    INTERESTRATE    NUMBER(10, 4),
    SHIBOR_RATE     NUMBER(10, 4),
    WAI_RATE        NUMBER(10, 4),
    REFERENCE_RATE  NUMBER(10, 4),
    MEAN_RATIO      NUMBER(10, 4),
    STLTYPE         NUMBER      not null,
    STARTDATE       TIMESTAMP(6),
    DUEDATE         TIMESTAMP(6),
    TERM            NUMBER,
    PAYRATE         NUMBER(17, 2),
    BANKNO          VARCHAR2(32),
    RECNO           VARCHAR2(32),
    MEMO            VARCHAR2(255),
    REASON          VARCHAR2(255),
    IOTYPE          NUMBER,
    STATE           NUMBER,
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
)
/
 Show table preview*/
/*

STL_APPLY 拆借信息表
字段	类型	备注
STLID	INTEGER	主键
CUSTOMID	VARCHAR2(8)	交易对手ID
ACNTNO	VARCHAR2(128)	交易账户
SPEED	VARCHAR2(32)	清算速度
AMOUNT	NUMBER(15,2)	拆借金额
INTERESTRATE	NUMBER(10,4)	拆借利率
REFERENCE_RATE	NUMBER(10,4)	参考利率
MEAN_RATIO	NUMBER(10,4)	正负均值比率
STLTYPE	INTEGER	拆借品种ID
STARTDATE	TIMESTAMP(6)	起息日
DUEDATE	TIMESTAMP(6)	到期日
TERM	INTEGER	天数
PAYRATE	NUMBER(17,2)	应付利息
BANKNO	VARCHAR2(32)	银行号
RECNO	VARCHAR2(32)	资金存放账号
MEMO	VARCHAR2(255)	用途
REASON	VARCHAR2(255)	原因
IOTYPE	INTEGER	拆借方向(0：拆入；1：拆出)
STATE	INTEGER	拆借状态
RATIFYNO	INTEGER	审批人序号(已过时)
NOTICENO	VARCHAR2(32)	成交通知书编号
RECDATE	TIMESTAMP(6)	收还款日期
RECREASON	VARCHAR2(255)	收款理由
APPLYDATE	TIMESTAMP(6)	创建时间
CLTNO	VARCHAR2(18)	录入单位
USERID	INTEGER	录入人ID
AR_ID	INTEGER	账户登记信息ID
interBankFlag	VARCHAR2(8)	是否跨行
CCA_ID	INTEGER	clt_clt_account.ID账户信息表ID
TEMP_CREDIT_ID	INTEGER	临时授信ID
APPROVAL_REMARK	VARCHAR2(255)	（已过时）
TRANSFER_REASON	VARCHAR2(255)	资金调拨原因
TRANSFER_MEMO	VARCHAR2(255)	资金调拨备注
NEED_CREDIT	INTEGER	授信控制标识（0：不控制；1：监控；2：控制）
*/
