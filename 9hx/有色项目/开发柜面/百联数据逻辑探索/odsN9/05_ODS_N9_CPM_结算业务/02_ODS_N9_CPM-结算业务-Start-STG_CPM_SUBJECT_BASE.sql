-- 执行SQL脚本
delete
from STG_CPM_SUBJECT_BASE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_SUBJECT_BASE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT subject_id,
       subject_no,
       subject_name,
       gl_subject_no,
       balance_dir,
       subject_level,
       leaf_flag,
       subject_kind,
       subject_full_name,
       use_state,
       subject_attribute,
       is_off,
       is_quantity,
       is_currency,
       limit_type,
       limit_balance,
       settle_property,
       yr,
       enable_flag,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_SUBJECT_BASE;

-- ddl 无表注释，ddl详情

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_SUBJECT_BASE
-- auto-generated definition
create table CPM_SUBJECT_BASE
(
    SUBJECT_ID        NUMBER       not null
        constraint PK_CPM_SUBJECT_BASE
            primary key,
    SUBJECT_NO        VARCHAR2(16) not null,
    SUBJECT_NAME      VARCHAR2(80) not null,
    GL_SUBJECT_NO     VARCHAR2(32),
    BALANCE_DIR       NUMBER       not null,
    SUBJECT_LEVEL     NUMBER default 0,
    LEAF_FLAG         NUMBER,
    SUBJECT_KIND      NUMBER       not null,
    SUBJECT_FULL_NAME VARCHAR2(512),
    USE_STATE         NUMBER,
    SUBJECT_ATTRIBUTE NUMBER,
    IS_OFF            NUMBER,
    IS_QUANTITY       NUMBER,
    IS_CURRENCY       NUMBER,
    LIMIT_TYPE        NUMBER,
    LIMIT_BALANCE     NUMBER(16, 2),
    SETTLE_PROPERTY   NUMBER,
    YR                NUMBER,
    ENABLE_FLAG       NUMBER default 0
)
/

create unique index CPM_SUBJECT_BASE_UK
    on CPM_SUBJECT_BASE (YR, SUBJECT_NO)
/
 Show table preview */



/*
CPM_SUBJECT_BASE 会计科目表
字段	含义	备注
SUBJECT_ID	科目ID	　
SUBJECT_NO	科目号	　
SUBJECT_NAME	科目名称	　
GL_SUBJECT_NO	对应总账科目号	　
BALANCE_DIR	增减方向	1为借，2为贷
SUBJECT_LEVEL	科目级别	科目级别。1-一级科目;2-二级科目...
LEAF_FLAG	叶节点标记	1为叶节点，0为非叶节点
SUBJECT_KIND	科目性质	1为资产，2为负债，3为权益，4为成本，5为损益
SUBJECT_FULL_NAME	科目全称	科目全称。从一级科目算起的名称。
USE_STATE	使用状态	指定该科目是否启用：1为启用，0为冻结
SUBJECT_ATTRIBUTE	科目属性	　
IS_OFF	表外	　
IS_QUANTITY	数量	　
IS_CURRENCY	复币	　
LIMIT_TYPE	限额方式	0：不限额，1：限余额，2：限累计贷方，3：限累计贷方
LIMIT_BALANCE	限额金额	　
SETTLE_PROPERTY	结算属性	1为结算专用，2为结算可用
YR	年	　
*/

-- 表list 存在