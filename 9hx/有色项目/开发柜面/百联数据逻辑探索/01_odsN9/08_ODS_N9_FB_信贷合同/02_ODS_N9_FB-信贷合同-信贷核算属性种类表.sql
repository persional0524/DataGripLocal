-- 执行SQL脚本

delete
from STG_FB_ACCOUNTS_TYPE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_ACCOUNTS_TYPE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       BIZ_TYPE,
       TYPE_CODE,
       TYPE_NAME,
       IS_SHOW,
       CAN_EMPTY,
       CAN_EDIT,
       SHOW_ORDER,
       SET_WAY,
       RULE_ID,
       PRINCIPAL_CHECK,
       INTR_CHECK,
       REMARK,
       ACCOUNT_KIND,
       DELETED,
   '${edate}'as sjrq,
   '2' as MAKEUP_STATUS
  FROM FB_ACCOUNTS_TYPE;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_ACCOUNTS_TYPE  -- 信贷核算属性种类表
-- auto-generated definition
create table FB_ACCOUNTS_TYPE
(
    ID              NUMBER           not null
        constraint PK_FB_ACCOUNTS_TYPE
            primary key,
    BIZ_TYPE        VARCHAR2(4)      not null
        constraint FK_FB_ACCOU_REFERENCE_FB_BIZ_T
            references FB_BIZ_TYPES,
    TYPE_CODE       VARCHAR2(64)     not null,
    TYPE_NAME       VARCHAR2(64)     not null,
    IS_SHOW         NUMBER default 1 not null,
    CAN_EMPTY       NUMBER default 1 not null,
    CAN_EDIT        NUMBER default 1 not null,
    SHOW_ORDER      NUMBER,
    SET_WAY         NUMBER default 1 not null,
    RULE_ID         NUMBER
        constraint FK_FB_ACNT_FB_RULE
            references FB_ACNT_RULE,
    PRINCIPAL_CHECK NUMBER default 0 not null,
    INTR_CHECK      NUMBER default 0 not null,
    REMARK          VARCHAR2(128),
    ACCOUNT_KIND    NUMBER,
    DELETED         NUMBER default 0
)
/

comment on table FB_ACCOUNTS_TYPE is '信贷核算属性种类表'
/

comment on column FB_ACCOUNTS_TYPE.ID is '主键'
/

comment on column FB_ACCOUNTS_TYPE.BIZ_TYPE is '业务品种代码'
/

comment on column FB_ACCOUNTS_TYPE.TYPE_CODE is '核算属性编码'
/

comment on column FB_ACCOUNTS_TYPE.TYPE_NAME is '核算属性名称'
/

comment on column FB_ACCOUNTS_TYPE.IS_SHOW is '是否显示'
/

comment on column FB_ACCOUNTS_TYPE.CAN_EMPTY is '是否可以为空(0:不可空；1:可空)'
/

comment on column FB_ACCOUNTS_TYPE.CAN_EDIT is '是否可以编辑(0:否；1:是)'
/

comment on column FB_ACCOUNTS_TYPE.SHOW_ORDER is '显示顺序'
/

comment on column FB_ACCOUNTS_TYPE.SET_WAY is '设置方式(1:人工设置；2:自动设置)'
/

comment on column FB_ACCOUNTS_TYPE.RULE_ID is '规则ID'
/

comment on column FB_ACCOUNTS_TYPE.PRINCIPAL_CHECK is '收本校验(1:校验；0:不校验)'
/

comment on column FB_ACCOUNTS_TYPE.INTR_CHECK is '收息校验(1:校验；0:不校验)'
/

comment on column FB_ACCOUNTS_TYPE.REMARK is '备注'
/

comment on column FB_ACCOUNTS_TYPE.ACCOUNT_KIND is '账户种类：0内部账户，1外部账户'
/

comment on column FB_ACCOUNTS_TYPE.DELETED is '删除标记：1 已删除,0 未删除'
/
 Show table preview */


-- list 不存在