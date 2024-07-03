-- 执行SQL脚本
TRUNCATE TABLE ODS_FBCM_CEDIT_PAR;

-- 表输入
SELECT ID,
       TYPE,
       NAME,
       VAL,
       RISK_FACTOR,
       CREATOR,
       LASTUPDATOR,
       LASTUPDATETIME

FROM FBCM_CEDIT_PAR;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FBCM_CEDIT_PAR  -- 授信参数表
-- auto-generated definition
create table FBCM_CEDIT_PAR
(
    ID             NUMBER not null
        constraint PK_FBCM_CEDIT_PAR
            primary key,
    TYPE           NUMBER,
    NAME           VARCHAR2(256),
    VAL            NUMBER(15, 2),
    RISK_FACTOR    NUMBER(15, 2),
    CREATOR        VARCHAR2(24),
    LASTUPDATOR    VARCHAR2(24),
    LASTUPDATETIME DATE
)
/

comment on table FBCM_CEDIT_PAR is '授信参数表'
/

comment on column FBCM_CEDIT_PAR.ID is '主键'
/

comment on column FBCM_CEDIT_PAR.TYPE is '参数类型'
/

comment on column FBCM_CEDIT_PAR.NAME is '参数名称'
/

comment on column FBCM_CEDIT_PAR.VAL is '参数值'
/

comment on column FBCM_CEDIT_PAR.RISK_FACTOR is '风险系数(或客户ID)'
/

comment on column FBCM_CEDIT_PAR.CREATOR is '录入人'
/

comment on column FBCM_CEDIT_PAR.LASTUPDATOR is '最后修改人'
/

comment on column FBCM_CEDIT_PAR.LASTUPDATETIME is '最后修改时间'
/
 Show table preview*/

-- list 不存在