

-- 执行SQL脚本 delete from ODS_CNAPS_BANK

-- 表输入

SELECT bank_code,
       bank_name,
       cnaps_bank_no,
       cnaps_bank_name
FROM CNAPS_BANK_MAPPING;

/*
-- 标准银行/ CNAPS银行关联
-- auto-generated definition
create table CNAPS_BANK_MAPPING
(
    BANK_CODE       VARCHAR2(6)  not null
        constraint PK_CNAPS_BANK_MAPPING
            primary key,
    BANK_NAME       VARCHAR2(80) not null,
    CNAPS_BANK_NO   VARCHAR2(10),
    CNAPS_BANK_NAME VARCHAR2(100)
)
/

comment on table CNAPS_BANK_MAPPING is '标准银行/ CNAPS银行关联'
/

comment on column CNAPS_BANK_MAPPING.BANK_CODE is '标准银行编号'
/

comment on column CNAPS_BANK_MAPPING.BANK_NAME is '标准银行名称'
/

comment on column CNAPS_BANK_MAPPING.CNAPS_BANK_NO is 'cnaps银行编号'
/

comment on column CNAPS_BANK_MAPPING.CNAPS_BANK_NAME is 'cnaps银行名称'
/*/
