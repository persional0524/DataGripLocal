-- 执行SQL脚本
delete
from STG_FB_BIZ_TYPES
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_BIZ_TYPES', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT BIZ_TYPE,
       BIZ_NAME,
       IS_SUPER,
       RISK_RANK,
       RISK_RATIO,
       REMARK,
       CAN_USE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_BIZ_TYPES;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_BIZ_TYPES  -- 业务品种
-- auto-generated definition
create table FB_BIZ_TYPES
(
    BIZ_TYPE   VARCHAR2(4)      not null
        constraint PK_FB_BIZ_TYPES
            primary key,
    BIZ_NAME   VARCHAR2(64)     not null,
    IS_SUPER   NUMBER default 0 not null
        constraint CKC_IS_SUPER_FB_BIZ_T
            check (Is_Super in (0, 1)),
    RISK_RANK  NUMBER           not null,
    RISK_RATIO NUMBER(10, 6),
    REMARK     VARCHAR2(1024),
    CAN_USE    NUMBER default 0 not null
)
/

comment on table FB_BIZ_TYPES is '业务品种'
/

comment on column FB_BIZ_TYPES.BIZ_TYPE is '业务品种代码'
/

comment on column FB_BIZ_TYPES.BIZ_NAME is '业务品种的名称'
/

comment on column FB_BIZ_TYPES.IS_SUPER is '是否管理合同'
/

comment on column FB_BIZ_TYPES.RISK_RANK is '风险等级'
/

comment on column FB_BIZ_TYPES.RISK_RATIO is '风险系数'
/

comment on column FB_BIZ_TYPES.REMARK is '备注'
/

comment on column FB_BIZ_TYPES.CAN_USE is '是否可用（0：可用；1：不可用）'
/
 Show table preview */

-- list 1