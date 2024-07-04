-- 执行SQL脚本
delete
from STG_ICS_CREDIT_GRANT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_ICS_CREDIT_GRANT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT CREDIT_GRANT_ID,
       TRADER_ID,
       CREDIT_TYPE,
       START_DATE,
       END_DATE,
       CTRL_METHOD,
       RATION_PERCENT,
       QLT_PERCENT,
       SCORE,
       ADVICE_LEVEL,
       ADVICE_AMOUNT,
       CREDIT_LEVEL,
       AMOUNT,
       USED_AMOUNT,
       TYPE_ID,
       ADVICE_REASON,
       REMARK,
       USE_PURPOSE,
       STATUS,
       CREATOR,
       CREATE_TIME,
       UPDATOR,
       UPDATE_TIME,
       REPORT_YEAR,
       BIZSTATUS,
       REVOKEMEMO,
       REVOKTOR,
       REVOKTORNAME,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM ICS_CREDIT_GRANT;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: ICS_CREDIT_GRANT  -- 授予授信表
-- auto-generated definition
create table ICS_CREDIT_GRANT
(
    CREDIT_GRANT_ID NUMBER        not null
        constraint PK_ICS_CREDIT_GRANT
            primary key,
    TRADER_ID       NUMBER        not null,
    CREDIT_TYPE     NUMBER        not null,
    START_DATE      DATE          not null,
    END_DATE        DATE          not null,
    CTRL_METHOD     NUMBER        not null,
    RATION_PERCENT  NUMBER(10, 2),
    QLT_PERCENT     NUMBER(10, 2),
    SCORE           NUMBER(12, 2),
    ADVICE_LEVEL    NUMBER,
    ADVICE_AMOUNT   NUMBER(17, 2),
    CREDIT_LEVEL    NUMBER,
    AMOUNT          NUMBER(17, 2) not null,
    USED_AMOUNT     NUMBER(17, 2) not null,
    TYPE_ID         NUMBER
        constraint FK_ICS_CRED_REFERENCE_ICS_BIZ_
            references ICS_BIZ_TYPE,
    ADVICE_REASON   VARCHAR2(200),
    REMARK          VARCHAR2(200),
    USE_PURPOSE     VARCHAR2(200),
    STATUS          NUMBER        not null,
    CREATOR         NUMBER        not null,
    CREATE_TIME     DATE          not null,
    UPDATOR         NUMBER        not null,
    UPDATE_TIME     DATE          not null,
    REPORT_YEAR     VARCHAR2(4),
    BIZSTATUS       NUMBER,
    REVOKEMEMO      VARCHAR2(256),
    REVOKTOR        NUMBER,
    REVOKTORNAME    VARCHAR2(32)
)
/

comment on table ICS_CREDIT_GRANT is '授予授信表'
/

comment on column ICS_CREDIT_GRANT.CREDIT_GRANT_ID is '授予授信ID'
/

comment on column ICS_CREDIT_GRANT.TRADER_ID is '交易对手'
/

comment on column ICS_CREDIT_GRANT.CREDIT_TYPE is '授信类型
1：系统授信
2：直接授信
3：临时授信'
/

comment on column ICS_CREDIT_GRANT.START_DATE is '开始日期'
/

comment on column ICS_CREDIT_GRANT.END_DATE is '截止日期'
/

comment on column ICS_CREDIT_GRANT.CTRL_METHOD is '控制方式'
/

comment on column ICS_CREDIT_GRANT.RATION_PERCENT is '定量指标权重'
/

comment on column ICS_CREDIT_GRANT.QLT_PERCENT is '定性指标权重'
/

comment on column ICS_CREDIT_GRANT.SCORE is '综合得分'
/

comment on column ICS_CREDIT_GRANT.ADVICE_LEVEL is '建议评级'
/

comment on column ICS_CREDIT_GRANT.ADVICE_AMOUNT is '建议额度'
/

comment on column ICS_CREDIT_GRANT.CREDIT_LEVEL is '授信评级'
/

comment on column ICS_CREDIT_GRANT.AMOUNT is '授信额度'
/

comment on column ICS_CREDIT_GRANT.USED_AMOUNT is '已占用额度'
/

comment on column ICS_CREDIT_GRANT.TYPE_ID is '业务品种ID'
/

comment on column ICS_CREDIT_GRANT.ADVICE_REASON is '建议理由'
/

comment on column ICS_CREDIT_GRANT.REMARK is '其他说明'
/

comment on column ICS_CREDIT_GRANT.USE_PURPOSE is '用途'
/

comment on column ICS_CREDIT_GRANT.STATUS is '状态（0：已录入；1：已报批；2：已生效；3：已驳回；9：已失效）'
/

comment on column ICS_CREDIT_GRANT.CREATOR is '创建人'
/

comment on column ICS_CREDIT_GRANT.CREATE_TIME is '创建时间'
/

comment on column ICS_CREDIT_GRANT.UPDATOR is '最后修改人'
/

comment on column ICS_CREDIT_GRANT.UPDATE_TIME is '最后修改时间'
/

comment on column ICS_CREDIT_GRANT.REPORT_YEAR is '申报年份'
/

comment on column ICS_CREDIT_GRANT.BIZSTATUS is '业务流程状态（0：已录入；1：已提交；2：已审批；3：已驳回）'
/

comment on column ICS_CREDIT_GRANT.REVOKEMEMO is '驳回原因'
/
 Show table preview */

-- list 不存在