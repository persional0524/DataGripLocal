-- 执行SQL脚本
delete
from STG_FB_DISCOUNT_NOTES
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_DISCOUNT_NOTES', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT NOTE_ID,
       BID,
       NOTE_NO,
       PAR_VALUE,
       ISSUE_DATE,
       MATURITY,
       DAY_IN_WAY,
       INTREST,
       ISSUER_ID,
       ISSUER,
       ISSUE_BANK,
       BILL_KIND,
       NOTE_STATE,
       CORRECT_DAYS,
       REDISCOUNT_DATE,
       ACCEPTOR,
       CASH_DATE,
       PAYINTREST,
       BUYINTREST,
       RETURN_INTREST,
       FACT_INTREST,
       NOTE_MODE,
       REDEEM_DATE,
       REDEEM_START_DATE,
       REDEEM_END_DATE,
       BMS_BILLID,
       SURETY,
       DISCOUNTOR_FACTOR,
       ISSUER_BANK_FACTOR,
       TAX_RATE,
       TAX_AMOUNT,
       EXCLUDE_TAX_AMOUNT,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_DISCOUNT_NOTES;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_DISCOUNT_NOTES  -- 合同贴现票据
-- auto-generated definition
create table FB_DISCOUNT_NOTES
(
    NOTE_ID            NUMBER           not null
        constraint PK_FB_DISCOUNT_NOTES
            primary key,
    BID                NUMBER           not null
        constraint FK_FB_DISCO_RELATIONS_FB_CONTR
            references FB_CONTRACTS,
    NOTE_NO            VARCHAR2(64)     not null,
    PAR_VALUE          NUMBER(15, 2)    not null,
    ISSUE_DATE         DATE             not null,
    MATURITY           DATE             not null,
    DAY_IN_WAY         NUMBER           not null,
    INTREST            NUMBER(15, 2)    not null,
    ISSUER_ID          NUMBER           not null,
    ISSUER             VARCHAR2(128)    not null,
    ISSUE_BANK         VARCHAR2(128)    not null,
    BILL_KIND          VARCHAR2(32),
    NOTE_STATE         NUMBER default 0 not null,
    CORRECT_DAYS       NUMBER default 0 not null,
    REDISCOUNT_DATE    DATE,
    ACCEPTOR           VARCHAR2(128),
    CASH_DATE          DATE,
    PAYINTREST         NUMBER(15, 2),
    BUYINTREST         NUMBER(15, 2),
    RETURN_INTREST     NUMBER(15, 2),
    FACT_INTREST       NUMBER(15, 2),
    NOTE_MODE          NUMBER,
    REDEEM_DATE        DATE,
    REDEEM_START_DATE  DATE,
    REDEEM_END_DATE    DATE,
    BMS_BILLID         NUMBER,
    SURETY             VARCHAR2(12),
    DISCOUNTOR_FACTOR  NUMBER(15, 2),
    ISSUER_BANK_FACTOR NUMBER(15, 2),
    TAX_RATE           NUMBER(15, 2),
    TAX_AMOUNT         NUMBER(15, 2),
    EXCLUDE_TAX_AMOUNT NUMBER(15, 2)
)
/

comment on table FB_DISCOUNT_NOTES is '合同贴现票据'
/

comment on column FB_DISCOUNT_NOTES.NOTE_ID is '票据Id'
/

comment on column FB_DISCOUNT_NOTES.BID is '合同ID'
/

comment on column FB_DISCOUNT_NOTES.NOTE_NO is '票据编号'
/

comment on column FB_DISCOUNT_NOTES.PAR_VALUE is '面值'
/

comment on column FB_DISCOUNT_NOTES.ISSUE_DATE is '出票日期'
/

comment on column FB_DISCOUNT_NOTES.MATURITY is '到期日期'
/

comment on column FB_DISCOUNT_NOTES.DAY_IN_WAY is '在途天数'
/

comment on column FB_DISCOUNT_NOTES.INTREST is '利息'
/

comment on column FB_DISCOUNT_NOTES.ISSUER_ID is '出票人Id'
/

comment on column FB_DISCOUNT_NOTES.ISSUER is '出票人'
/

comment on column FB_DISCOUNT_NOTES.ISSUE_BANK is '出票行信息'
/

comment on column FB_DISCOUNT_NOTES.BILL_KIND is '票据种类
对应Codes表中CodeNo字段的内容'
/

comment on column FB_DISCOUNT_NOTES.NOTE_STATE is '票据状态
0：正常
1：转贴中
9：已转贴
-1：未接受
-2：已退票
'
/

comment on column FB_DISCOUNT_NOTES.CORRECT_DAYS is '修正日：用于计算贴现息时调整计息天数。修正日取值范围为-（到期日-贴现日）到+（到期日-贴现日）间整数，默认为0。
计息天数=（到期日-贴现日）+在途天数+修正日'
/

comment on column FB_DISCOUNT_NOTES.REDISCOUNT_DATE is '转贴现日期'
/

comment on column FB_DISCOUNT_NOTES.ACCEPTOR is '承兑人'
/

comment on column FB_DISCOUNT_NOTES.CASH_DATE is '兑付日期'
/

comment on column FB_DISCOUNT_NOTES.PAYINTREST is '卖方付息金额'
/

comment on column FB_DISCOUNT_NOTES.BUYINTREST is '买方付息金额'
/

comment on column FB_DISCOUNT_NOTES.RETURN_INTREST is '计划返息：提前兑付时，兑付日到到期日的利息，是财务公司反给出票人的利息'
/

comment on column FB_DISCOUNT_NOTES.FACT_INTREST is '实际扣息：合同开始日到提前兑付那天的利息'
/

comment on column FB_DISCOUNT_NOTES.NOTE_MODE is '贴现类型 0：卖断式 1：卖出回购式 2：非卖断式'
/

comment on column FB_DISCOUNT_NOTES.REDEEM_DATE is '票据赎回日期'
/

comment on column FB_DISCOUNT_NOTES.REDEEM_START_DATE is '票据赎回开放日期'
/

comment on column FB_DISCOUNT_NOTES.REDEEM_END_DATE is '票据赎回截止日期'
/

comment on column FB_DISCOUNT_NOTES.SURETY is '担保方式'
/

comment on column FB_DISCOUNT_NOTES.DISCOUNTOR_FACTOR is '贴现人级别风险系数'
/

comment on column FB_DISCOUNT_NOTES.ISSUER_BANK_FACTOR is '出票行级别风险系数'
/

comment on column FB_DISCOUNT_NOTES.TAX_RATE is '税率'
/

comment on column FB_DISCOUNT_NOTES.TAX_AMOUNT is '税额'
/

comment on column FB_DISCOUNT_NOTES.EXCLUDE_TAX_AMOUNT is '不含税金额'
/

create index RELATIONSHIP_31_X_FK
    on FB_DISCOUNT_NOTES (BID)
/
 Show table preview */

-- list 1