-- 执行SQL脚本
delete
from STG_FB_TRADER
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_TRADER', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT TRADER_ID,
       TRADER_NO,
       TRADER_NAME,
       OPEN_BANK,
       ACCOUNT_NAME,
       ACCOUNT_NO,
       BIGPAY_NO,
       CODES,
       OPAREACODE,
       OPADDRESS,
       BANKREGNO,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_TRADER;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_TRADER  -- 交易对手维护
-- auto-generated definition
create table FB_TRADER
(
    TRADER_ID    NUMBER not null
        constraint PK_FB_TRADER_ID
            primary key,
    TRADER_NO    VARCHAR2(32),
    TRADER_NAME  VARCHAR2(100),
    OPEN_BANK    VARCHAR2(100),
    ACCOUNT_NAME VARCHAR2(100),
    ACCOUNT_NO   VARCHAR2(32),
    BIGPAY_NO    VARCHAR2(32),
    CODES        VARCHAR2(32),
    OPAREACODE   VARCHAR2(8),
    OPADDRESS    VARCHAR2(20),
    BANKREGNO    VARCHAR2(8)
)
/

comment on table FB_TRADER is '交易对手维护'
/

comment on column FB_TRADER.TRADER_ID is '主键'
/

comment on column FB_TRADER.TRADER_NO is '交易对手编码'
/

comment on column FB_TRADER.TRADER_NAME is '交易对手名称'
/

comment on column FB_TRADER.OPEN_BANK is '开户行'
/

comment on column FB_TRADER.ACCOUNT_NAME is '户名'
/

comment on column FB_TRADER.ACCOUNT_NO is '账号'
/

comment on column FB_TRADER.BIGPAY_NO is '大额联行号'
/

comment on column FB_TRADER.CODES is '多维玛'
/
 Show table preview*/

-- list 不存在