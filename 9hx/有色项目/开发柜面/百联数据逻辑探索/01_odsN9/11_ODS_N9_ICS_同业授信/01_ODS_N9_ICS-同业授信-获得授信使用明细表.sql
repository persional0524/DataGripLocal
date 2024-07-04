-- 执行SQL脚本
TRUNCATE TABLE ODS_ICS_ACQUIRE_USE_DETAIL;

-- 表输入 2 研发环境无数据
SELECT USE_DETAIL_ID,
       ACQUIRE_ID,
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
       BIZSTATUS,
       REVOKEMEMO,
       UPDATE_TIME,
       REVOKTOR,
       REVOKTORNAME
FROM ICS_ACQUIRE_USE_DETAIL;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: ICS_ACQUIRE_USE_DETAIL  -- 获得授信使用明细表
-- auto-generated definition
create table ICS_ACQUIRE_USE_DETAIL
(
    USE_DETAIL_ID NUMBER        not null
        constraint PK_ICS_ACQUIRE_USE_DETAIL
            primary key,
    ACQUIRE_ID    NUMBER        not null
        constraint FK_ICS_A_USEDET_REF_A
            references ICS_CREDIT_ACQUIRE,
    DETAIL_ID     NUMBER
        constraint FK_ICS_A_USEDET_REF_DET
            references ICS_CREDIT_ACQUIRE_DETAIL,
    TYPE_ID       NUMBER
        constraint FK_ICS_A_USEDET_REF_BIZ
            references ICS_BIZ_TYPE,
    TRADER_ID     NUMBER        not null,
    SOURCE_ID     VARCHAR2(64),
    ACT_DATE      DATE          not null,
    END_DATE      DATE,
    DIR           VARCHAR2(10)  not null,
    AMOUNT        NUMBER(17, 2) not null,
    USE_PURPOSE   VARCHAR2(200),
    REMARK        VARCHAR2(200) not null,
    CREATE_TIME   DATE          not null,
    CREATOR       VARCHAR2(64),
    STATUS        NUMBER,
    BIZSTATUS     NUMBER default 0,
    REVOKEMEMO    VARCHAR2(256),
    UPDATE_TIME   DATE,
    REVOKTOR      NUMBER,
    REVOKTORNAME  VARCHAR2(32)
)
/

comment on table ICS_ACQUIRE_USE_DETAIL is '获得授信使用明细表'
/

comment on column ICS_ACQUIRE_USE_DETAIL.USE_DETAIL_ID is '使用明细ID'
/

comment on column ICS_ACQUIRE_USE_DETAIL.ACQUIRE_ID is '获得授信ID'
/

comment on column ICS_ACQUIRE_USE_DETAIL.DETAIL_ID is '明细ID'
/

comment on column ICS_ACQUIRE_USE_DETAIL.TYPE_ID is '业务品种ID'
/

comment on column ICS_ACQUIRE_USE_DETAIL.TRADER_ID is '交易对手ID'
/

comment on column ICS_ACQUIRE_USE_DETAIL.SOURCE_ID is '业务标识'
/

comment on column ICS_ACQUIRE_USE_DETAIL.ACT_DATE is '业务日期'
/

comment on column ICS_ACQUIRE_USE_DETAIL.END_DATE is '结束日期'
/

comment on column ICS_ACQUIRE_USE_DETAIL.DIR is '使用方向（1：占用；2：释放；3：撤销占用）'
/

comment on column ICS_ACQUIRE_USE_DETAIL.AMOUNT is '金额'
/

comment on column ICS_ACQUIRE_USE_DETAIL.USE_PURPOSE is '用途'
/

comment on column ICS_ACQUIRE_USE_DETAIL.REMARK is '备注'
/

comment on column ICS_ACQUIRE_USE_DETAIL.CREATE_TIME is '创建时间'
/

comment on column ICS_ACQUIRE_USE_DETAIL.CREATOR is '创建人'
/

comment on column ICS_ACQUIRE_USE_DETAIL.STATUS is '状态（0：已录入；1：已报批；2：已生效；3：已驳回；9：已失效）'
/

comment on column ICS_ACQUIRE_USE_DETAIL.REVOKTOR is '驳回人'
/

comment on column ICS_ACQUIRE_USE_DETAIL.REVOKTORNAME is '驳回人名称'
/
 Show table preview*/

-- list 不存在