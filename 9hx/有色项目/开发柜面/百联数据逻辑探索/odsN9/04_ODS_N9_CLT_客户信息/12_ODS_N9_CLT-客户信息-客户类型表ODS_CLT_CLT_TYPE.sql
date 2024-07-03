-- 执行SQL脚本
delete
from ODS_CLT_CLT_TYPE;


-- 表输入
SELECT type_id AS ID,
       type_id,
       type_name,
       can_use,
       show_order
FROM CLT_CLT_TYPE;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_CLT_TYPE  -- 客户类型表
-- auto-generated definition
create table CLT_CLT_TYPE
(
    TYPE_ID    NUMBER       not null
        constraint PK_CLT_CLT_TYPE
            primary key,
    TYPE_NAME  VARCHAR2(64) not null,
    CAN_USE    NUMBER       not null,
    SHOW_ORDER NUMBER       not null
)
/

comment on table CLT_CLT_TYPE is '客户类型表'
/

comment on column CLT_CLT_TYPE.TYPE_ID is '附件类型流水号'
/

comment on column CLT_CLT_TYPE.TYPE_NAME is '类型名称'
/

comment on column CLT_CLT_TYPE.CAN_USE is '是否可用（0：否；1：是）'
/

comment on column CLT_CLT_TYPE.SHOW_ORDER is '显示顺序'
/
 Show table preview */

-- 表清单存在