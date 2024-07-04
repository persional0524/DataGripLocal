select * from CPM_SUBJECT;


-- create view CPM_SUBJECT as
SELECT c.subject_id        as subject_id,
       c.subject_no        as subject_no,
       c.subject_name      as subject_name,
       c.gl_subject_no     as gl_subject_no,
       c.balance_dir       as balance_dir,
       c.subject_level     as subject_level,
       c.leaf_flag         as leaf_flag,
       c.subject_kind      as subject_kind,
       c.subject_full_name as subject_full_name,
       c.use_state         as use_state,
       c.subject_attribute as subject_attribute,
       c.is_off            as is_off,
       c.is_quantity       as is_quantity,
       c.is_currency       as is_currency,
       c.limit_type        as limit_type,
       c.limit_balance     as LIMIT_balance,
       c.settle_property,
       c.yr
FROM cpm_subject_base c
WHERE c.enable_flag = 1;

-- ddl

/*Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_SUBJECT_BASE
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

/*CPM_SUBJECT_BASE 会计科目表
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
YR	年	　*/
