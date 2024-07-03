-- 执行SQL脚本
delete
from STG_FB_FACTORING
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_FACTORING', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       BID,
       FACTORING_CONNO,
       FACTORING_CLTNO,
       FACTORING_CLTNAME,
       FACTORING_NO,
       FACTORING_AMOUNT,
       FACTORING_MATURITY,
       FACTORING_BILL_COUNT,
       FACTORING_BILL_NO,
       FACTORING_BILL_ACT_AMT,
       FACTORING_BILL_RETURN_AMT,
       FACTORING_INTREST,
       FACTORING_REPAY_DATE,
       FACTORING_REPAY_AMOUNT,
       SURETY,
       STATE,
       PLAN_ID,
       FACTORING_FLAG,
       REPAY_ID,
       FACTORING_KIND,
       FACTORING_RATE,
       FACTORING_START_DATE,
       TAX_RATE,
       TAX_AMOUNT,
       EXCLUDE_TAX_AMOUNT,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_FACTORING;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_FACTORING  -- 保理业务应收账款表
-- auto-generated definition
create table FB_FACTORING
(
    ID                        NUMBER       not null
        constraint PK_FB_FACTORING
            primary key,
    BID                       NUMBER       not null,
    FACTORING_CONNO           VARCHAR2(32) not null,
    FACTORING_CLTNO           VARCHAR2(32) not null,
    FACTORING_CLTNAME         VARCHAR2(100),
    FACTORING_NO              VARCHAR2(32) not null,
    FACTORING_AMOUNT          NUMBER(15, 2),
    FACTORING_MATURITY        DATE,
    FACTORING_BILL_COUNT      NUMBER,
    FACTORING_BILL_NO         VARCHAR2(32),
    FACTORING_BILL_ACT_AMT    NUMBER(15, 2),
    FACTORING_BILL_RETURN_AMT NUMBER(15, 2),
    FACTORING_INTREST         NUMBER(15, 2),
    FACTORING_REPAY_DATE      DATE,
    FACTORING_REPAY_AMOUNT    NUMBER(15, 2),
    SURETY                    VARCHAR2(32),
    STATE                     NUMBER,
    PLAN_ID                   NUMBER,
    FACTORING_FLAG            NUMBER,
    REPAY_ID                  NUMBER
        constraint FK_FB_REPAYMENTS_02
            references FB_REPAYMENTS,
    FACTORING_KIND            VARCHAR2(32),
    FACTORING_RATE            NUMBER(10, 6) default 0.000000,
    FACTORING_START_DATE      DATE,
    TAX_RATE                  NUMBER(15, 2),
    TAX_AMOUNT                NUMBER(15, 2),
    EXCLUDE_TAX_AMOUNT        NUMBER(15, 2)
)
/

comment on table FB_FACTORING is '保理业务应收账款表'
/

comment on column FB_FACTORING.ID is '主键'
/

comment on column FB_FACTORING.BID is '合同id'
/

comment on column FB_FACTORING.FACTORING_CONNO is '购销合同号'
/

comment on column FB_FACTORING.FACTORING_CLTNO is '购货方编号'
/

comment on column FB_FACTORING.FACTORING_CLTNAME is '购货方名称'
/

comment on column FB_FACTORING.FACTORING_NO is '应收账款编号'
/

comment on column FB_FACTORING.FACTORING_AMOUNT is '应收账款'
/

comment on column FB_FACTORING.FACTORING_MATURITY is '应收账款到期日期'
/

comment on column FB_FACTORING.FACTORING_BILL_COUNT is '发票数量'
/

comment on column FB_FACTORING.FACTORING_BILL_NO is '发票号'
/

comment on column FB_FACTORING.FACTORING_BILL_ACT_AMT is '发票实际金额'
/

comment on column FB_FACTORING.FACTORING_BILL_RETURN_AMT is '发票回笼金额'
/

comment on column FB_FACTORING.FACTORING_INTREST is '利息'
/

comment on column FB_FACTORING.FACTORING_REPAY_DATE is '到账确认日、还款日'
/

comment on column FB_FACTORING.FACTORING_REPAY_AMOUNT is '到账确认金额、还款金额'
/

comment on column FB_FACTORING.SURETY is '担保方式'
/

comment on column FB_FACTORING.STATE is '状态  对应FactoringState. java 类'
/

comment on column FB_FACTORING.PLAN_ID is '应收账款还款计划id'
/

comment on column FB_FACTORING.FACTORING_FLAG is '0,成员单位 1,交易对手'
/

comment on column FB_FACTORING.REPAY_ID is '还款记录id'
/

comment on column FB_FACTORING.FACTORING_KIND is '应收账款类型 FKND.01:现金 FKND.02:票据'
/

comment on column FB_FACTORING.FACTORING_RATE is '利率'
/

comment on column FB_FACTORING.FACTORING_START_DATE is '应收账款开始日'
/

comment on column FB_FACTORING.TAX_RATE is '税率'
/

comment on column FB_FACTORING.TAX_AMOUNT is '税额'
/

comment on column FB_FACTORING.EXCLUDE_TAX_AMOUNT is '不含税金额'
/
 Show table preview*/

-- list 不存在