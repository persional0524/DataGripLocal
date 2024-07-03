-- 执行SQL脚本
delete
from STG_PRMS_CREDIT_LINE
where (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_PRMS_CREDIT_LINE', 1) as del from dual), 'yyyy-mm-dd'));

-- 表输入
SELECT LINE_ID,
       CLTNO,
       CREDIT_TYPE,
       RATING,
       CREDIT_PERIOD,
       CONTRACT_NO,
       ADVICE_AMOUNT,
       ADJUST_RATIO,
       ADJUST_AMOUNT,
       CAL_AMOUNT,
       START_DATE,
       END_DATE,
       CEDIT_AMOUNT,
       USED_AMOUNT,
       STATE,
       LAST_TX_ID,
       CTRL_DATE,
       CTRL_METHOD,
       CREATOR,
       CREATER_TIME,
       UPDATOR,
       UPDATE_TIME,
       STATUS,
       LINK_ID,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM PRMS_CREDIT_LINE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: PRMS_CREDIT_LINE  -- 授信表
-- auto-generated definition
create table PRMS_CREDIT_LINE
(
    LINE_ID       NUMBER        not null
        constraint PK_PRMS_CREDIT_LINE
            primary key,
    CLTNO         VARCHAR2(32)  not null,
    CREDIT_TYPE   NUMBER        not null,
    RATING        VARCHAR2(16),
    CREDIT_PERIOD NUMBER,
    CONTRACT_NO   VARCHAR2(64)  not null,
    ADVICE_AMOUNT NUMBER(17, 2),
    ADJUST_RATIO  NUMBER(10, 6),
    ADJUST_AMOUNT NUMBER(17, 2),
    CAL_AMOUNT    NUMBER(17, 2),
    START_DATE    DATE          not null,
    END_DATE      DATE          not null,
    CEDIT_AMOUNT  NUMBER(17, 2) not null,
    USED_AMOUNT   NUMBER(17, 2) not null,
    STATE         NUMBER        not null,
    LAST_TX_ID    NUMBER        not null,
    CTRL_DATE     NUMBER        not null,
    CTRL_METHOD   NUMBER,
    CREATOR       VARCHAR2(64)  not null,
    CREATER_TIME  DATE          not null,
    UPDATOR       VARCHAR2(64)  not null,
    UPDATE_TIME   DATE          not null,
    STATUS        NUMBER,
    LINK_ID       NUMBER
)
/

comment on table PRMS_CREDIT_LINE is '授信表'
/

comment on column PRMS_CREDIT_LINE.LINE_ID is '授信流水号'
/

comment on column PRMS_CREDIT_LINE.CLTNO is '客户号'
/

comment on column PRMS_CREDIT_LINE.CREDIT_TYPE is '授信类别（1：客户类；2：项目类； 3：临时授信）'
/

comment on column PRMS_CREDIT_LINE.RATING is '授信信用级别'
/

comment on column PRMS_CREDIT_LINE.CREDIT_PERIOD is '建立授信关系时间（0：新客户；1：1年以内（含1年）；2：1-3年（含3年）；3：3-5年（含5年）；4：5年以上）'
/

comment on column PRMS_CREDIT_LINE.CONTRACT_NO is '授信合同号'
/

comment on column PRMS_CREDIT_LINE.ADVICE_AMOUNT is '建议综合授信额度'
/

comment on column PRMS_CREDIT_LINE.ADJUST_RATIO is '调整系数'
/

comment on column PRMS_CREDIT_LINE.ADJUST_AMOUNT is '调整额度'
/

comment on column PRMS_CREDIT_LINE.CAL_AMOUNT is '调整后综合授信额度'
/

comment on column PRMS_CREDIT_LINE.START_DATE is '授信开始日期'
/

comment on column PRMS_CREDIT_LINE.END_DATE is '授信结束日期'
/

comment on column PRMS_CREDIT_LINE.CEDIT_AMOUNT is '综合授信额度'
/

comment on column PRMS_CREDIT_LINE.USED_AMOUNT is '已占用金额'
/

comment on column PRMS_CREDIT_LINE.STATE is '状态（0：未生效；1：已生效；2：调整中；3：已失效）'
/

comment on column PRMS_CREDIT_LINE.LAST_TX_ID is '最终交易ID（PRMS_TX表的TX_ID）'
/

comment on column PRMS_CREDIT_LINE.CTRL_DATE is '日期控制(0,开始日;1,期间;2,结束日)'
/

comment on column PRMS_CREDIT_LINE.CTRL_METHOD is '控制方式(0,余额;1,发生额)'
/

comment on column PRMS_CREDIT_LINE.CREATOR is '创建人'
/

comment on column PRMS_CREDIT_LINE.CREATER_TIME is '创建时间'
/

comment on column PRMS_CREDIT_LINE.UPDATOR is '修改人'
/

comment on column PRMS_CREDIT_LINE.UPDATE_TIME is '修改时间'
/

comment on column PRMS_CREDIT_LINE.STATUS is '集团授信状态'
/

comment on column PRMS_CREDIT_LINE.LINK_ID is '上级单位授信流水号'
/
 Show table preview */

/*

PRMS_CREDIT_LINE 授信表
字段	含义	备注
LINE_ID	授信流水号
CLTNO	客户号
CREDIT_TYPE	授信类别（1：客户类；2：项目类； 3：临时授信）
RATING	授信信用级别
CREDIT_PERIOD	建立授信关系时间（0：新客户；1：1年以内（含1年）；2：1-3年（含3年）；3：3-5年（含5年）；4：5年以上）
CONTRACT_NO	授信合同号
ADVICE_AMOUNT	建议综合授信额度
ADJUST_RATIO	调整系数
ADJUST_AMOUNT	调整额度
CAL_AMOUNT	调整后综合授信额度
START_DATE	授信开始日期
END_DATE	授信结束日期
CEDIT_AMOUNT	综合授信额度
USED_AMOUNT	已占用金额
STATE	状态（0：未生效；1：已生效；2：调整中；3：已失效）
LAST_TX_ID	最终交易ID（PRMS_TX表的TX_ID）
CTRL_DATE	日期控制(0,开始日;1,期间;2,结束日)
CTRL_METHOD	控制方式(0,余额;1,发生额)
CREATOR	创建人
CREATER_TIME	创建时间
UPDATOR	修改人
UPDATE_TIME	修改时间
STATUS	集团授信状态
LINK_ID	上级单位授信流水号
*/

-- list 缺失