-- 执行SQL脚本
delete
from STG_FB_BUSINESS
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_BUSINESS', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入

SELECT BID,
       BIZ_TYPE,
       CONTRACT_NO,
       DEBTOR,
       CURRENCY_NO,
       COMPLEXCODE,
       START_DATE,
       MATURITY,
       AMOUNT,
       STATE,
       CHECK_STATE,
       SUB_STATE,
       SIGN_DATE,
       REMARK,
       APPROVE_MEMO,
       CREATE_TIME,
       LAST_UPDATE_TIME,
       INPUTOR,
       AMOUNT1,
       BRNO,
       INPUTOR_ID,
       PRE_APPLY_NO,
       EXCHANGE_RATE,
       OVERDRAFT_SET,
       OVERDRAFT_SET_UNITS,
       GRACEPERIOD,
       GRACEPERIOD_UNITS,
       OVERDRAFT_STATE,
       OVERDRAFT_DAYS,
       CONTRACT_TYPE,
       STAMP_STATE,
       STAMPPROCESS_STATE,
       STAMP_REMARK,
       BENEFITOR,
--        LOANPRODUCTTYPE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_BUSINESS;

/*-- 字段缺失
       LOANPRODUCTTYPE,*/


-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_BUSINESS  -- 合同
-- auto-generated definition
create table FB_BUSINESS
(
    BID                 NUMBER                not null
        constraint PK_FB_BUSINESS
            primary key,
    BIZ_TYPE            VARCHAR2(4)           not null
        constraint FK_FB_BUSIN_RL_BUSINE_FB_BIZ_T
            references FB_BIZ_TYPES,
    CONTRACT_NO         VARCHAR2(60)          not null,
    DEBTOR              NUMBER                not null,
    CURRENCY_NO         VARCHAR2(4)           not null,
    COMPLEXCODE         VARCHAR2(512),
    START_DATE          DATE                  not null,
    MATURITY            DATE                  not null,
    AMOUNT              NUMBER(15, 2)         not null,
    STATE               NUMBER                not null,
    CHECK_STATE         NUMBER,
    SUB_STATE           NUMBER,
    SIGN_DATE           DATE,
    REMARK              VARCHAR2(1024),
    APPROVE_MEMO        VARCHAR2(1024),
    CREATE_TIME         DATE                  not null,
    LAST_UPDATE_TIME    DATE,
    INPUTOR             VARCHAR2(100)         not null,
    AMOUNT1             NUMBER(15, 2),
    BRNO                VARCHAR2(32),
    INPUTOR_ID          NUMBER,
    PRE_APPLY_NO        VARCHAR2(32),
    EXCHANGE_RATE       NUMBER(15, 6),
    OVERDRAFT_SET       NUMBER      default 0,
    OVERDRAFT_SET_UNITS VARCHAR2(1),
    GRACEPERIOD         NUMBER      default 0,
    GRACEPERIOD_UNITS   VARCHAR2(1),
    OVERDRAFT_STATE     VARCHAR2(1) default '0',
    OVERDRAFT_DAYS      NUMBER      default 0,
    CONTRACT_TYPE       NUMBER,
    STAMP_STATE         NUMBER      default 0 not null,
    STAMPPROCESS_STATE  NUMBER      default 0 not null,
    STAMP_REMARK        VARCHAR2(1024),
    BENEFITOR           NUMBER
)
/

comment on table FB_BUSINESS is '合同'
/

comment on column FB_BUSINESS.BID is '合同ID'
/

comment on column FB_BUSINESS.BIZ_TYPE is '业务品种代码'
/

comment on column FB_BUSINESS.CONTRACT_NO is '合同号'
/

comment on column FB_BUSINESS.DEBTOR is '借款人ID'
/

comment on column FB_BUSINESS.CURRENCY_NO is '币种'
/

comment on column FB_BUSINESS.COMPLEXCODE is '多维码'
/

comment on column FB_BUSINESS.START_DATE is '开始日期'
/

comment on column FB_BUSINESS.MATURITY is '到期日期'
/

comment on column FB_BUSINESS.AMOUNT is '金额'
/

comment on column FB_BUSINESS.STATE is '状态'
/

comment on column FB_BUSINESS.CHECK_STATE is '首次检查状态'
/

comment on column FB_BUSINESS.SUB_STATE is '子状态'
/

comment on column FB_BUSINESS.SIGN_DATE is '签约日期'
/

comment on column FB_BUSINESS.REMARK is '备注'
/

comment on column FB_BUSINESS.APPROVE_MEMO is '审批意见'
/

comment on column FB_BUSINESS.CREATE_TIME is '记录创建时间'
/

comment on column FB_BUSINESS.LAST_UPDATE_TIME is '末次修改时间'
/

comment on column FB_BUSINESS.INPUTOR is '录入人'
/

comment on column FB_BUSINESS.AMOUNT1 is '银团贷款总贷款额'
/

comment on column FB_BUSINESS.PRE_APPLY_NO is '贷前申请流水号'
/

comment on column FB_BUSINESS.EXCHANGE_RATE is '外币折人民币汇率（占授信用）'
/

comment on column FB_BUSINESS.OVERDRAFT_SET is '连续透支设置'
/

comment on column FB_BUSINESS.OVERDRAFT_SET_UNITS is '连续透支设置对应的单位 0天 1月'
/

comment on column FB_BUSINESS.GRACEPERIOD is '宽限期'
/

comment on column FB_BUSINESS.GRACEPERIOD_UNITS is '宽限期对应的单位  0天 1月'
/

comment on column FB_BUSINESS.OVERDRAFT_STATE is '透支状态  0已关闭 1已开启'
/

comment on column FB_BUSINESS.OVERDRAFT_DAYS is '连续透支天数'
/

comment on column FB_BUSINESS.CONTRACT_TYPE is '担保总协议合同类型'
/

comment on column FB_BUSINESS.STAMP_STATE is '盖章状态(0：（待）成员单位盖章；1：成员单位已盖章；2：成员单位盖章生效；3：财务公司已盖章；4：财务公司盖章生效；'
/

comment on column FB_BUSINESS.STAMPPROCESS_STATE is '盖章流程状态(0：（待）成员单位提交；1：成员单位提交；-1：成员单位驳回；2：成员单位结束；3：财务公司提交；-3：财务公司驳回)'
/

comment on column FB_BUSINESS.STAMP_REMARK is '合同盖章审批意见'
/

comment on column FB_BUSINESS.BENEFITOR is '担保总协议受益人'
/

create index RELATIONSHIP_8_FK
    on FB_BUSINESS (BIZ_TYPE)
/
 Show table preview */

-- list 1