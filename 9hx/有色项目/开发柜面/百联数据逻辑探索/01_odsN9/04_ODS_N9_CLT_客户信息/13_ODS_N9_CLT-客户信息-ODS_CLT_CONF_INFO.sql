-- 表输入
SELECT ID,
       CODE,
       TYPE,
       NAME,
       DESCRIPTION,
       COMMON_USE
FROM CLT_CONF_INFO;

-- ddl

/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_CONF_INFO  -- 该表用来保存“行业定义”、“信用等级定义”、“资信等级定义”、“影像辅助资料种类定义”、“币种设置”
-- auto-generated definition
create table CLT_CONF_INFO
(
    ID          NUMBER(6) not null
        constraint PK_CLT_CONF_INFO
            primary key,
    CODE        VARCHAR2(20),
    TYPE        NUMBER,
    NAME        VARCHAR2(60),
    DESCRIPTION VARCHAR2(400),
    COMMON_USE  NUMBER
)
/

comment on table CLT_CONF_INFO is '该表用来保存“行业定义”、“信用等级定义”、“资信等级定义”、“影像辅助资料种类定义”、“币种设置”'
/

comment on column CLT_CONF_INFO.ID is 'ID'
/

comment on column CLT_CONF_INFO.CODE is '编号'
/

comment on column CLT_CONF_INFO.TYPE is '1:行业定义  2:信用等级定义 3:资信等级4:资信等级影像资料定义 5:币种定义'
/

comment on column CLT_CONF_INFO.NAME is '名称'
/

comment on column CLT_CONF_INFO.DESCRIPTION is '描述'
/

comment on column CLT_CONF_INFO.COMMON_USE is '是否常用（1：是；其他：否）'
/
 Show table preview */

-- 表清单中存在