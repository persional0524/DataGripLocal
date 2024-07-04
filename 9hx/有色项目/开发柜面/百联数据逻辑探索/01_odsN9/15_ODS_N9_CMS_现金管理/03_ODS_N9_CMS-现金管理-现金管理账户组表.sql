-- 执行SQL脚本
delete
from STG_CMS_GROUP_NEW
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CMS_GROUP_NEW', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 研发无数据
SELECT GROUP_ID,
       BIZ_TYPE_NO,
       GROUP_NO,
       GROUP_NAME,
       USE_FLAG,
       CUR_CODE,
       UP_LIMIT,
       DOWN_LIMIT,
       QUOTA_LIMIT,
       MEMO,
       LINK_NO,
       OVERDRAW_LIMIT,

   '${edate}'as sjrq,
   '2' as MAKEUP_STATUS
  FROM CMS_GROUP_NEW;

/*
-- 字段缺失
       GOUP_PROPERTY,*/


-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CMS_GROUP_NEW  -- 现金管理账户组
-- auto-generated definition
create table CMS_GROUP_NEW
(
    GROUP_ID       NUMBER not null
        constraint PK_CMS_GROUP_NEW
            primary key,
    BIZ_TYPE_NO    VARCHAR2(6)
        constraint FK_CMS_GROU_REFERENCE_CMS_BIZ_
            references CMS_BIZ_TYPE_NEW,
    GROUP_NO       VARCHAR2(12),
    GROUP_NAME     VARCHAR2(80),
    USE_FLAG       NUMBER,
    CUR_CODE       VARCHAR2(3),
    UP_LIMIT       NUMBER(16, 2),
    DOWN_LIMIT     NUMBER(16, 2),
    QUOTA_LIMIT    NUMBER(16, 2),
    MEMO           VARCHAR2(200),
    LINK_NO        VARCHAR2(64),
    OVERDRAW_LIMIT NUMBER(16, 2)
)
/

comment on table CMS_GROUP_NEW is '现金管理账户组'
/

comment on column CMS_GROUP_NEW.GROUP_ID is '账户组ID'
/

comment on column CMS_GROUP_NEW.BIZ_TYPE_NO is 'CMS品种标识'
/

comment on column CMS_GROUP_NEW.GROUP_NO is '账户组编号'
/

comment on column CMS_GROUP_NEW.GROUP_NAME is '账户组名称'
/

comment on column CMS_GROUP_NEW.USE_FLAG is '启用标记'
/

comment on column CMS_GROUP_NEW.CUR_CODE is '币种'
/

comment on column CMS_GROUP_NEW.UP_LIMIT is '资金上划金额上限'
/

comment on column CMS_GROUP_NEW.DOWN_LIMIT is '资金下拨金额留存'
/

comment on column CMS_GROUP_NEW.QUOTA_LIMIT is '组内总留存限额'
/

comment on column CMS_GROUP_NEW.MEMO is '备注'
/

comment on column CMS_GROUP_NEW.LINK_NO is '联动账户'
/

comment on column CMS_GROUP_NEW.OVERDRAW_LIMIT is '组内总透支限额'
/

create index IND_CMS_GROUP_NEW_USE_FLAG
    on CMS_GROUP_NEW (USE_FLAG)
/

create index IND_CMS_GROUP_NEW_BIZ_TYPE_NO
    on CMS_GROUP_NEW (BIZ_TYPE_NO)
/
 Show table preview */

-- list 不存在