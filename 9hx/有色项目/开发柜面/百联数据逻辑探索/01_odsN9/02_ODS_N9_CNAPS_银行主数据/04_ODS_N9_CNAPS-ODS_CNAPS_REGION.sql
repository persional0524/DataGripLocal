-- 执行SQL脚本
-- delete from ODS_CNAPS_REGION

-- 表输入

SELECT region_code,
       region_name
FROM CNAPS_REGION;

-- ddl
/*
 -- 人民银行地名
-- auto-generated definition
create table CNAPS_REGION
(
    REGION_CODE VARCHAR2(32) not null
        constraint PK_CNAPS_REGION
            primary key,
    REGION_NAME VARCHAR2(40)
)
/

comment on table CNAPS_REGION is '人民银行地名'
/

comment on column CNAPS_REGION.REGION_CODE is '人民银行地区代码'
/

comment on column CNAPS_REGION.REGION_NAME is '人民银行地区名称'
/
 Show table previ*/

-- 2144
select count(1) from CNAPS_REGION;