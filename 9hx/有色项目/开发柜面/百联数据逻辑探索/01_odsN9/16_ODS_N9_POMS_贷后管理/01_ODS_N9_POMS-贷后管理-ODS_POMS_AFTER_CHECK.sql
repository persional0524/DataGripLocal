-- 执行SQL脚本
TRUNCATE TABLE ODS_POMS_AFTER_CHECK;

-- 表输入
SELECT * FROM  POMS_AFTER_CHECK;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: POMS_AFTER_CHECK  -- 贷后检查表
-- auto-generated definition
create table POMS_AFTER_CHECK
(
    CHECK_ID     NUMBER       not null
        constraint PK_POMS_AFTER_CHECK
            primary key,
    CHECK_TYPE   NUMBER       not null,
    CHECK_DATE   DATE         not null,
    CLT_NO       VARCHAR2(30) not null,
    CREDIT_LEVEL VARCHAR2(20),
    FIVE_LEVEL   NUMBER,
    REASON       VARCHAR2(512),
    STATE        NUMBER       not null,
    CREATE_TIME  DATE         not null,
    CREATOR      VARCHAR2(64) not null,
    UPDATE_TIME  DATE         not null,
    UPDATOR      VARCHAR2(64) not null,
    CONTENT      BLOB
)
/

comment on table POMS_AFTER_CHECK is '贷后检查表'
/

comment on column POMS_AFTER_CHECK.CHECK_ID is '检查ID'
/

comment on column POMS_AFTER_CHECK.CHECK_TYPE is '检查类型（1：贷后检查；2：五级分类）'
/

comment on column POMS_AFTER_CHECK.CHECK_DATE is '检查日期'
/

comment on column POMS_AFTER_CHECK.CLT_NO is '客户编号'
/

comment on column POMS_AFTER_CHECK.CREDIT_LEVEL is '信用等级'
/

comment on column POMS_AFTER_CHECK.FIVE_LEVEL is '五级分类结果'
/

comment on column POMS_AFTER_CHECK.REASON is '评级理由'
/

comment on column POMS_AFTER_CHECK.STATE is '状态（0：录入；1：上报；2：生效；-1：驳回）'
/

comment on column POMS_AFTER_CHECK.CREATE_TIME is '创建时间'
/

comment on column POMS_AFTER_CHECK.CREATOR is '创建人'
/

comment on column POMS_AFTER_CHECK.UPDATE_TIME is '最后修改时间'
/

comment on column POMS_AFTER_CHECK.UPDATOR is '最后修改人'
/
 Show table preview */

-- list 不存在