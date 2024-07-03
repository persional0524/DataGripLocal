-- 执行SQL脚本
delete
from STG_FB_CONTRACTS
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_CONTRACTS', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT BID,
       CONSIGNER,
       BENEFICIARY,
       WARRANTEE,
       BROKER,
       MULTI_LENDING,
       REPAY_CHANNEL,
       IN_SUIT,
       FIVE_LEVEL,
       REPAY_CAPITAL,
       INTREST_PERIOD,
       PERIOD_BASE,
       INTREST_DAY,
       IS_FLOATING_RATE,
       FLOATING_METHOD,
       FLOATING_FREQ,
       PERIOD_FREEDAY,
       ENTIRE_FREEDAY,
       OLD_CONTARCT_NO,
       CORRELATION_NUM1,
       CORRELATION_NUM2,
       DISCOUNT_MODE,
       HANDLE_METHOD,
       SURETY_RATE,
       RECTIFY_RATE,
       EX_RATE,
       NOT_WITHHOLDING,
       CYC_LOAN,
       PAGENUM,
       NORMRATEID,
       NORMRATE_METHOD,
       NORMRATE_FALG,
       ISSPLIT,
       FINANCETERM,
       GROUPBANK,
       SELLMODE,
       SELF_SUPPORT,
       PERIOD_TYPE,
       FIX_PLAN,
       RMSRATETYPE,
       BUYOUT,
       MAIN_CONTRACT_AMOUNT,
       MAIN_CURRENCY,
       PROPORTION,
       DESCRIPTION,
       GUARANTEE_TYPE,
       GUARANTEE_USE,
       PAYMENT_TERM,
       NORMRATE_RULE,
       NORMRATE_RULE_MONTH,
       NORMRATE_RULE_DAY,
       SUPPLY_BANK_NAME,
       LOAN_TYPE,
       LOAN_INVEST_DIRECTION,
       SURETY_TYPES,
       BILLNO,
       REPAYMENT_INT_UNIT,
       LENDING_INT_UNIT,
       PAYSOURCE,
       ACTIVE_DATE,
       DISCOUNT_OPENDATE,
       DISCOUNT_DUEDATE,
       BORROWEROPBANKNAME,
       BORROWEROPBANKNO,
       BORROWERACNTNO,
       RECOPBANKNAME,
       RECOPBANKNO,
       RECACNTNO,
       BNFTNAME,
       BILLTYPE,
       PAYRATETYPE,
       RENT_MODEL,
       PAYRATEPROPORTION,
       PAYRATETOTAL,
       BUYER_PAY,
       CONTRACTUSE,
       OP_SURETY_REMARK,
       RISK_EXPOSURE,
       OP_SURETY_TYPES,
       CONSIGN,
       FROM_DBMS,
       ASTR_FLAG,
       FACTORING_TYPE,
       SUM_AMOUNT,
       RATIO,
       SURTY_AMOUNT,
       DAMAGES_AMOUNT,
       DRAW_INTREST_TYPE,
       FACTORING_CLT_KIND,
       ISCHANGEBYFLOAT,
       BIZ_TYPE_FACTOR,
       TERM_FACTOR,
       APPLY_ID,
       CONTROL_MODEL,

       PROJECT_CAPITAL,

       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_CONTRACTS;

/*-- 字段缺失
       PAYLOANWAY,
       SENTLOANACCOUNTNUMBER,
       PAYEE_NAME,
       LOAN_INVEST_DIRECTION_MBTD,
       PROJECTNAME,
       PROJECTMONEY,
       PROJECTAPPROVAL,
       APPROVALNUMBER,
       EIAREPORTNUMBER,
       INTERESTHOLDERNAME,
       MAX_AMOUNT,
       UN_USED_AMOUNT,
       USED_AMOUNT,
       LOANPRODUCTTYPE,
       LOAN_PRICE_BENCHMARK_TYPE,
       PLANNING_LICENSE,
       USE_LAND_LICENSE,
       EIA_LICENSE,
       CONSTRUCTION_LICENSE,
       OTHER_LICENSE,
       OPEN_DATE,
       GUARANTEE_MODE,
 */

 -- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_CONTRACTS  -- 业务合同
-- auto-generated definition
create table FB_CONTRACTS
(
    BID                   NUMBER                  not null
        constraint PK_FB_CONTRACTS
            primary key
        constraint FK_FB_CONTR_INHERITAN_FB_BUSIN
            references FB_BUSINESS,
    CONSIGNER             NUMBER,
    BENEFICIARY           VARCHAR2(32)
        constraint FK_CONTRACTS_REFERENCE_CODES
            references CODES,
    WARRANTEE             NUMBER,
    BROKER                NUMBER,
    MULTI_LENDING         NUMBER      default 0   not null,
    REPAY_CHANNEL         VARCHAR2(2),
    IN_SUIT               NUMBER                  not null,
    FIVE_LEVEL            NUMBER,
    REPAY_CAPITAL         NUMBER                  not null,
    INTREST_PERIOD        NUMBER                  not null,
    PERIOD_BASE           NUMBER                  not null,
    INTREST_DAY           NUMBER,
    IS_FLOATING_RATE      NUMBER                  not null,
    FLOATING_METHOD       VARCHAR2(1) default '+',
    FLOATING_FREQ         NUMBER,
    PERIOD_FREEDAY        VARCHAR2(4),
    ENTIRE_FREEDAY        VARCHAR2(4),
    OLD_CONTARCT_NO       VARCHAR2(32),
    CORRELATION_NUM1      VARCHAR2(32),
    CORRELATION_NUM2      VARCHAR2(32),
    DISCOUNT_MODE         NUMBER,
    HANDLE_METHOD         NUMBER,
    SURETY_RATE           NUMBER(8, 4),
    RECTIFY_RATE          NUMBER(8, 4),
    EX_RATE               NUMBER(12, 6),
    NOT_WITHHOLDING       NUMBER      default 0   not null,
    CYC_LOAN              NUMBER      default (0) not null,
    PAGENUM               NUMBER,
    NORMRATEID            NUMBER,
    NORMRATE_METHOD       NUMBER,
    NORMRATE_FALG         NUMBER(10, 6),
    ISSPLIT               NUMBER,
    FINANCETERM           NUMBER,
    GROUPBANK             VARCHAR2(50),
    SELLMODE              NUMBER      default '0',
    SELF_SUPPORT          NUMBER      default (0),
    PERIOD_TYPE           VARCHAR2(32),
    FIX_PLAN              NUMBER      default (0),
    RMSRATETYPE           NUMBER,
    BUYOUT                NUMBER      default (0),
    MAIN_CONTRACT_AMOUNT  NUMBER(15, 2),
    MAIN_CURRENCY         VARCHAR2(32),
    PROPORTION            NUMBER(15, 2),
    DESCRIPTION           VARCHAR2(2000),
    GUARANTEE_TYPE        NUMBER,
    GUARANTEE_USE         VARCHAR2(2000),
    PAYMENT_TERM          VARCHAR2(2000),
    NORMRATE_RULE         NUMBER,
    NORMRATE_RULE_MONTH   NUMBER,
    NORMRATE_RULE_DAY     NUMBER,
    SUPPLY_BANK_NAME      VARCHAR2(64),
    LOAN_TYPE             NUMBER,
    LOAN_INVEST_DIRECTION VARCHAR2(32),
    SURETY_TYPES          VARCHAR2(200),
    BILLNO                VARCHAR2(32),
    REPAYMENT_INT_UNIT    VARCHAR2(20),
    LENDING_INT_UNIT      VARCHAR2(20),
    PAYSOURCE             VARCHAR2(128),
    ACTIVE_DATE           DATE,
    DISCOUNT_OPENDATE     DATE,
    DISCOUNT_DUEDATE      DATE,
    BORROWEROPBANKNAME    VARCHAR2(80),
    BORROWEROPBANKNO      VARCHAR2(16),
    BORROWERACNTNO        VARCHAR2(64),
    RECOPBANKNAME         VARCHAR2(80),
    RECOPBANKNO           VARCHAR2(32),
    RECACNTNO             VARCHAR2(64),
    BNFTNAME              VARCHAR2(80),
    BILLTYPE              VARCHAR2(8),
    PAYRATETYPE           NUMBER,
    RENT_MODEL            NUMBER,
    PAYRATEPROPORTION     NUMBER(6, 2),
    PAYRATETOTAL          NUMBER(15, 2),
    BUYER_PAY             NUMBER      default 0,
    CONTRACTUSE           VARCHAR2(200),
    OP_SURETY_REMARK      VARCHAR2(1000),
    RISK_EXPOSURE         VARCHAR2(1000),
    OP_SURETY_TYPES       VARCHAR2(200),
    CONSIGN               NUMBER,
    FROM_DBMS             NUMBER      default 0   not null,
    ASTR_FLAG             NUMBER      default 0   not null,
    FACTORING_TYPE        NUMBER      default 0   not null,
    SUM_AMOUNT            NUMBER(15, 2),
    RATIO                 NUMBER(15, 6),
    SURTY_AMOUNT          NUMBER(15, 2),
    DAMAGES_AMOUNT        NUMBER(15, 2),
    DRAW_INTREST_TYPE     NUMBER,
    FACTORING_CLT_KIND    NUMBER      default 1,
    ISCHANGEBYFLOAT       NUMBER      default 0   not null,
    BIZ_TYPE_FACTOR       NUMBER(15, 2),
    TERM_FACTOR           NUMBER(15, 2),
    APPLY_ID              NUMBER,
    CONTROL_MODEL         NUMBER,
    DUE_CONFIRM           VARCHAR2(1),
    GREENCREDIT           NUMBER      default 0,
    RATE_TYPE             VARCHAR2(10),
    FINANCIAL_SUPPORT     VARCHAR2(10),
    RESTRUCTURING_METHOD  VARCHAR2(10),
    SECUTITIZATION_CODE   VARCHAR2(200),
    RATE_TERM             VARCHAR2(30),
    PAY_METHOD            NUMBER(38),
    OPP_BANK_NUMBER       VARCHAR2(256),
    OPP_ACCOUNT_NUMBER    VARCHAR2(80),
    OPP_ACCOUNT_NAME      VARCHAR2(256),
    IF_DOMESTIC           NUMBER(38),
    TARGET_AREA           VARCHAR2(80),
    PROVINCE              VARCHAR2(6),
    CITY                  VARCHAR2(6),
    DISTRICT              VARCHAR2(6),
    COUNTRY_ID            NUMBER(38),
    CONTRACT_AWARDED      NUMBER(15, 2),
    LOAN_TYPE_NEW         VARCHAR2(10),
    PROJECT_NAME          VARCHAR2(80),
    PROJECT_TYPE          VARCHAR2(80),
    PROJECT_INVEST        NUMBER(15, 2),
    PROJECT_APPROVAL      VARCHAR2(80),
    PROJECT_LICENCE       VARCHAR2(80),
    CONSTRUCTION_LICENCE  VARCHAR2(80),
    ENV_LICENCE           VARCHAR2(80),
    BUILD_LICENCE         VARCHAR2(80),
    OTHER_LICENCE         VARCHAR2(80),
    BUILD_DATE            DATE,
    PROJECT_CAPITAL       NUMBER(15, 2),
    GROUP_NUM             NUMBER,
    IS_CHENDUISHOUXIN     NUMBER,
    IS_TIEXIANSHOUXIN     VARCHAR2(16),
    GROUP_NUM2            NUMBER,
    USERS                 VARCHAR2(128),
    MONEYS                VARCHAR2(128),
    GROUP_NUMS            VARCHAR2(128),
    TRADER_AMOUNTS        VARCHAR2(128),
    TRADER_IDS            VARCHAR2(128)
)
/

comment on table FB_CONTRACTS is '业务合同'
/

comment on column FB_CONTRACTS.BID is '合同ID'
/

comment on column FB_CONTRACTS.CONSIGNER is '委托人'
/

comment on column FB_CONTRACTS.BENEFICIARY is '受益人'
/

comment on column FB_CONTRACTS.WARRANTEE is '被保证人'
/

comment on column FB_CONTRACTS.BROKER is '代理人（经纪人）'
/

comment on column FB_CONTRACTS.MULTI_LENDING is '是否多次放款'
/

comment on column FB_CONTRACTS.REPAY_CHANNEL is '还款渠道'
/

comment on column FB_CONTRACTS.IN_SUIT is '诉讼中标记'
/

comment on column FB_CONTRACTS.FIVE_LEVEL is '五级分类'
/

comment on column FB_CONTRACTS.REPAY_CAPITAL is '还本方式'
/

comment on column FB_CONTRACTS.INTREST_PERIOD is '计息周期'
/

comment on column FB_CONTRACTS.PERIOD_BASE is '分期依据'
/

comment on column FB_CONTRACTS.INTREST_DAY is '每期还款日'
/

comment on column FB_CONTRACTS.IS_FLOATING_RATE is '利率是否浮动'
/

comment on column FB_CONTRACTS.FLOATING_METHOD is '利率浮动方法'
/

comment on column FB_CONTRACTS.FLOATING_FREQ is '利率浮动频次'
/

comment on column FB_CONTRACTS.PERIOD_FREEDAY is '各期宽限期'
/

comment on column FB_CONTRACTS.ENTIRE_FREEDAY is '最终宽限期'
/

comment on column FB_CONTRACTS.OLD_CONTARCT_NO is '借新还旧合同号'
/

comment on column FB_CONTRACTS.CORRELATION_NUM1 is '相关协议编号1'
/

comment on column FB_CONTRACTS.CORRELATION_NUM2 is '相关协议编号2'
/

comment on column FB_CONTRACTS.DISCOUNT_MODE is '贴现业务模式'
/

comment on column FB_CONTRACTS.HANDLE_METHOD is '租赁资产到期处置方式'
/

comment on column FB_CONTRACTS.SURETY_RATE is '担保比例(%)'
/

comment on column FB_CONTRACTS.RECTIFY_RATE is '溢短装比例(%)'
/

comment on column FB_CONTRACTS.EX_RATE is '委托汇率'
/

comment on column FB_CONTRACTS.NOT_WITHHOLDING is '是否预提标记
0：预提
1：不预提
预提功能仅对流动资金贷款、项目贷款、银团贷款业务品种有效，其他业务品种不进行预提。'
/

comment on column FB_CONTRACTS.CYC_LOAN is '是否为循环贷款
0：否
1：是'
/

comment on column FB_CONTRACTS.PAGENUM is '担保票据张数'
/

comment on column FB_CONTRACTS.NORMRATEID is '基准利率主健'
/

comment on column FB_CONTRACTS.NORMRATE_METHOD is '利率调整方法（按基准利率）990次年初，991次年同期'
/

comment on column FB_CONTRACTS.NORMRATE_FALG is '浮动比例'
/

comment on column FB_CONTRACTS.ISSPLIT is '是否分摊 0 不分摊 1分摊'
/

comment on column FB_CONTRACTS.FINANCETERM is '贷款期限'
/

comment on column FB_CONTRACTS.GROUPBANK is '参与行'
/

comment on column FB_CONTRACTS.SELLMODE is '是否卖断 2 已卖断'
/

comment on column FB_CONTRACTS.SELF_SUPPORT is '是否自营 0 代理 1'
/

comment on column FB_CONTRACTS.PERIOD_TYPE is '年、半年期还款依据'
/

comment on column FB_CONTRACTS.FIX_PLAN is '0计划表1固定计划表'
/

comment on column FB_CONTRACTS.RMSRATETYPE is '价格系统利率类型'
/

comment on column FB_CONTRACTS.BUYOUT is '是否录入式买断合同0不是1是'
/

comment on column FB_CONTRACTS.MAIN_CONTRACT_AMOUNT is '非融资类保函 主合同金额'
/

comment on column FB_CONTRACTS.MAIN_CURRENCY is '非融资类保函 主合同币种'
/

comment on column FB_CONTRACTS.PROPORTION is '非融资类保函 担保比例'
/

comment on column FB_CONTRACTS.DESCRIPTION is '非融资类保函 其他主要条款'
/

comment on column FB_CONTRACTS.GUARANTEE_TYPE is '非融资类保函  保函类型'
/

comment on column FB_CONTRACTS.GUARANTEE_USE is '非融资类保函  保函用途'
/

comment on column FB_CONTRACTS.PAYMENT_TERM is '非融资类保函  付款条件'
/

comment on column FB_CONTRACTS.NORMRATE_RULE is '利率调整规则'
/

comment on column FB_CONTRACTS.NORMRATE_RULE_MONTH is '利率调整规则 生效月'
/

comment on column FB_CONTRACTS.NORMRATE_RULE_DAY is '利率调整规则 生效日'
/

comment on column FB_CONTRACTS.SUPPLY_BANK_NAME is '非代理式贷款代理行名称'
/

comment on column FB_CONTRACTS.LOAN_TYPE is '贷款类型'
/

comment on column FB_CONTRACTS.LOAN_INVEST_DIRECTION is '贷款投向'
/

comment on column FB_CONTRACTS.PAYSOURCE is '合同还款来源'
/

comment on column FB_CONTRACTS.ACTIVE_DATE is '激活日期'
/

comment on column FB_CONTRACTS.BORROWEROPBANKNAME is '票据承兑合同 出票人开户行名'
/

comment on column FB_CONTRACTS.BORROWEROPBANKNO is '票据承兑合同 出票人开户行号'
/

comment on column FB_CONTRACTS.BORROWERACNTNO is '票据承兑合同 出票人账号'
/

comment on column FB_CONTRACTS.RECOPBANKNAME is '票据承兑合同 收款人开户行名'
/

comment on column FB_CONTRACTS.RECOPBANKNO is '票据承兑合同 收款人开户行号'
/

comment on column FB_CONTRACTS.RECACNTNO is '票据承兑合同 收款人账号'
/

comment on column FB_CONTRACTS.BNFTNAME is '票据承兑合同 收款人全称'
/

comment on column FB_CONTRACTS.BILLTYPE is '票据承兑合同 票据种类'
/

comment on column FB_CONTRACTS.PAYRATETYPE is '贴现付息类型 0：卖方付息 1：买方付息  2：协议付息'
/

comment on column FB_CONTRACTS.RENT_MODEL is '租赁方式 1：直租 2：回租'
/

comment on column FB_CONTRACTS.PAYRATEPROPORTION is '卖方付息比例'
/

comment on column FB_CONTRACTS.PAYRATETOTAL is '卖方付息合计'
/

comment on column FB_CONTRACTS.BUYER_PAY is '是否买方付息'
/

comment on column FB_CONTRACTS.CONTRACTUSE is '合同用途'
/

comment on column FB_CONTRACTS.OP_SURETY_REMARK is '反担保的备注'
/

comment on column FB_CONTRACTS.RISK_EXPOSURE is '风险敞口'
/

comment on column FB_CONTRACTS.OP_SURETY_TYPES is '反担保方式'
/

comment on column FB_CONTRACTS.CONSIGN is '循环贷款是否委托贷款1是，其它不是'
/

comment on column FB_CONTRACTS.FROM_DBMS is '贴现合同是否来自票据系统，1是，0不是'
/

comment on column FB_CONTRACTS.ASTR_FLAG is '资产转让标记：0正常合同，1：已录入；2：卖断型资产转让已到账确认；3：回购型资产转让合同已到账确认；4:回购型合同已经回购后'
/

comment on column FB_CONTRACTS.FACTORING_TYPE is '保理业务保理方式，0明保，1暗保'
/

comment on column FB_CONTRACTS.SUM_AMOUNT is '应收账款总额'
/

comment on column FB_CONTRACTS.RATIO is '比例'
/

comment on column FB_CONTRACTS.SURTY_AMOUNT is '保证金'
/

comment on column FB_CONTRACTS.DAMAGES_AMOUNT is '违约金'
/

comment on column FB_CONTRACTS.DRAW_INTREST_TYPE is '结息方式'
/

comment on column FB_CONTRACTS.FACTORING_CLT_KIND is '销货方类型 1成员单位，3合作伙伴'
/

comment on column FB_CONTRACTS.ISCHANGEBYFLOAT is '是否按浮动方式浮动，1是，0不是'
/

comment on column FB_CONTRACTS.BIZ_TYPE_FACTOR is '业务品种风险系数'
/

comment on column FB_CONTRACTS.TERM_FACTOR is '期限风险系数'
/

comment on column FB_CONTRACTS.APPLY_ID is '贷款申请ID(贷前)'
/

comment on column FB_CONTRACTS.CONTROL_MODEL is '限额方式'
/

comment on column FB_CONTRACTS.DUE_CONFIRM is '是否发送逾期回执'
/

comment on column FB_CONTRACTS.GREENCREDIT is '绿色信贷'
/

comment on column FB_CONTRACTS.PAY_METHOD is '支付方式0：自主支付；1：受托支付；2：混合支付'
/

comment on column FB_CONTRACTS.OPP_BANK_NUMBER is '对方行名'
/

comment on column FB_CONTRACTS.OPP_ACCOUNT_NUMBER is '对方账号'
/

comment on column FB_CONTRACTS.OPP_ACCOUNT_NAME is '对方户名'
/

comment on column FB_CONTRACTS.IF_DOMESTIC is '境内境外1：境内；2：境外'
/

comment on column FB_CONTRACTS.PROVINCE is '省份'
/

comment on column FB_CONTRACTS.CITY is '市'
/

comment on column FB_CONTRACTS.DISTRICT is '县(区)'
/

comment on column FB_CONTRACTS.COUNTRY_ID is '国家的id'
/

comment on column FB_CONTRACTS.CONTRACT_AWARDED is '已放款金额'
/

comment on column FB_CONTRACTS.LOAN_TYPE_NEW is '贷款类型'
/

comment on column FB_CONTRACTS.PROJECT_NAME is '项目名称'
/

comment on column FB_CONTRACTS.PROJECT_TYPE is '项目类型'
/

comment on column FB_CONTRACTS.PROJECT_INVEST is '项目总投资'
/

comment on column FB_CONTRACTS.PROJECT_APPROVAL is '立项批文'
/

comment on column FB_CONTRACTS.PROJECT_LICENCE is '规划许可证'
/

comment on column FB_CONTRACTS.CONSTRUCTION_LICENCE is '建设用地许可证'
/

comment on column FB_CONTRACTS.ENV_LICENCE is '环评许可证'
/

comment on column FB_CONTRACTS.BUILD_LICENCE is '施工许可证'
/

comment on column FB_CONTRACTS.OTHER_LICENCE is '其他许可证'
/

comment on column FB_CONTRACTS.BUILD_DATE is '开工日期'
/

comment on column FB_CONTRACTS.PROJECT_CAPITAL is '项目资本金'
/

comment on column FB_CONTRACTS.IS_CHENDUISHOUXIN is '承兑授信 保证金是否占用授信参数{0=不占用}{1=占用}'
/

comment on column FB_CONTRACTS.IS_TIEXIANSHOUXIN is '贴现授信 A. 贴现授信默认占承兑人，B. 承兑人不够，也能占贴现申请人 C. 只占贴现申请人 D. 双方都占用'
/

comment on column FB_CONTRACTS.GROUP_NUM2 is '授信组2'
/

comment on column FB_CONTRACTS.USERS is '贴现综合授信用户组'
/

comment on column FB_CONTRACTS.MONEYS is '贴现综合授信金额组'
/

comment on column FB_CONTRACTS.GROUP_NUMS is '贴现综合授信组'
/

comment on column FB_CONTRACTS.TRADER_AMOUNTS is '贴现同业授信金额组'
/

comment on column FB_CONTRACTS.TRADER_IDS is '贴现同业授信用户组'
/
 Show table preview */
