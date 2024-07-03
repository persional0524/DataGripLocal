-- 执行SQL脚本

-- delete from ODS_CNAPS_REGION_MAPPING

-- 表输入

SELECT region_code,
       stand_region_code
FROM CNAPS_REGION_MAPPING;

-- ddl
/*

-- 人民银行地名-标准地名映射
-- auto-generated definition
create table CNAPS_REGION_MAPPING
(
    REGION_CODE       VARCHAR2(32) not null
        constraint PK_CNAPS_REGION_MAPPING
            primary key,
    STAND_REGION_CODE VARCHAR2(32)
)
/

comment on table CNAPS_REGION_MAPPING is '人民银行地名-标准地名映射'
/

comment on column CNAPS_REGION_MAPPING.REGION_CODE is '人民银行地区代码'
/

comment on column CNAPS_REGION_MAPPING.STAND_REGION_CODE is '标准地区代码'
/*/
