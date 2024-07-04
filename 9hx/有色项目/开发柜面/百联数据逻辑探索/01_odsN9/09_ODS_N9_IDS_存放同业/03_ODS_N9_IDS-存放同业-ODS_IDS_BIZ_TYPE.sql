-- 表输入 研发无数据
SELECT biz_type_id, biz_type_name, remark, due_time
FROM IDS_BIZ_TYPE;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: IDS_BIZ_TYPE  -- 存款业务品种表
-- auto-generated definition
create table IDS_BIZ_TYPE
(
    BIZ_TYPE_ID   NUMBER not null
        constraint PK_IDS_BIZ_TYPE
            primary key,
    BIZ_TYPE_NAME VARCHAR2(255),
    REMARK        VARCHAR2(255),
    DUE_TIME      NUMBER
)
/

comment on table IDS_BIZ_TYPE is '存款业务品种表'
/

comment on column IDS_BIZ_TYPE.BIZ_TYPE_ID is '品种ID'
/

comment on column IDS_BIZ_TYPE.BIZ_TYPE_NAME is '品种名称'
/

comment on column IDS_BIZ_TYPE.REMARK is '备注'
/
 Show table preview*/

-- list 1