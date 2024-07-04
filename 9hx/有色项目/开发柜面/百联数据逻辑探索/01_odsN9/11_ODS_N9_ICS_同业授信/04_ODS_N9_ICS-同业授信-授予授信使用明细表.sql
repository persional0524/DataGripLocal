-- 执行SQL脚本
TRUNCATE TABLE ODS_ICS_ACQUIRE_USE_DETAIL;

-- 表输入 研发环境无数据
SELECT USE_DETAIL_ID,
       CREDIT_GRANT_ID,
       DETAIL_ID,
       TYPE_ID,
       TRADER_ID,
       SOURCE_ID,
       ACT_DATE,
       END_DATE,
       DIR,
       AMOUNT,
       USE_PURPOSE,
       REMARK,
       CREATE_TIME,
       CREATOR,
       STATUS,
       REVOKEMEMO,
       BIZSTATUS,
       REVOKTOR,
       REVOKTORNAME,
       UPDATE_TIME
FROM ICS_GRANT_USE_DETAIL;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: ICS_GRANT_USE_DETAIL  -- 授予授信使用明细表
-- auto-generated definition
create table ICS_GRANT_USE_DETAIL
(
    USE_DETAIL_ID   NUMBER        not null
        constraint PK_ICS_GRANT_USE_DETAIL
            primary key,
    CREDIT_GRANT_ID NUMBER        not null
        constraint FK_ICS_G_USEDET_REF_G
            references ICS_CREDIT_GRANT,
    DETAIL_ID       NUMBER
        constraint FK_ICS_G_USEDET_REF_DET
            references ICS_CREDIT_GRANT_DETAIL,
    TYPE_ID         NUMBER
        constraint FK_ICS_G_USEDET_REF_BIZ
            references ICS_BIZ_TYPE,
    TRADER_ID       NUMBER        not null,
    SOURCE_ID       VARCHAR2(64),
    ACT_DATE        DATE          not null,
    END_DATE        DATE,
    DIR             VARCHAR2(1)   not null,
    AMOUNT          NUMBER(17, 2) not null,
    USE_PURPOSE     VARCHAR2(200),
    REMARK          VARCHAR2(200) not null,
    CREATE_TIME     DATE          not null,
    CREATOR         VARCHAR2(64),
    STATUS          NUMBER        not null,
    REVOKEMEMO      VARCHAR2(256),
    BIZSTATUS       NUMBER default 0,
    REVOKTOR        NUMBER,
    REVOKTORNAME    VARCHAR2(32),
    UPDATE_TIME     DATE
)
/

comment on table ICS_GRANT_USE_DETAIL is '授予授信使用明细表'
/

comment on column ICS_GRANT_USE_DETAIL.USE_DETAIL_ID is '使用情况ID'
/

comment on column ICS_GRANT_USE_DETAIL.CREDIT_GRANT_ID is '授予授信ID'
/

comment on column ICS_GRANT_USE_DETAIL.DETAIL_ID is '授信明细ID'
/

comment on column ICS_GRANT_USE_DETAIL.TYPE_ID is '业务品种ID'
/

comment on column ICS_GRANT_USE_DETAIL.TRADER_ID is '交易对手ID'
/

comment on column ICS_GRANT_USE_DETAIL.SOURCE_ID is '业务标识'
/

comment on column ICS_GRANT_USE_DETAIL.ACT_DATE is '业务日期'
/

comment on column ICS_GRANT_USE_DETAIL.END_DATE is '结束日期'
/

comment on column ICS_GRANT_USE_DETAIL.DIR is '使用方向（1：占用；2：释放；3：撤销占用）'
/

comment on column ICS_GRANT_USE_DETAIL.AMOUNT is '金额'
/

comment on column ICS_GRANT_USE_DETAIL.USE_PURPOSE is '用途'
/

comment on column ICS_GRANT_USE_DETAIL.REMARK is '备注'
/

comment on column ICS_GRANT_USE_DETAIL.CREATE_TIME is '创建时间'
/

comment on column ICS_GRANT_USE_DETAIL.CREATOR is '创建人'
/

comment on column ICS_GRANT_USE_DETAIL.STATUS is '状态(同授信状态)'
/

comment on column ICS_GRANT_USE_DETAIL.REVOKEMEMO is '驳回原因'
/

comment on column ICS_GRANT_USE_DETAIL.BIZSTATUS is '业务流程状态（0：已录入；1：已提交；2：已审批；3：已驳回）'
/

comment on column ICS_GRANT_USE_DETAIL.REVOKTOR is '驳回人'
/

comment on column ICS_GRANT_USE_DETAIL.REVOKTORNAME is '驳回人名称'
/

comment on column ICS_GRANT_USE_DETAIL.UPDATE_TIME is '更新时间'
/
 Show table preview*/

-- list 不存在