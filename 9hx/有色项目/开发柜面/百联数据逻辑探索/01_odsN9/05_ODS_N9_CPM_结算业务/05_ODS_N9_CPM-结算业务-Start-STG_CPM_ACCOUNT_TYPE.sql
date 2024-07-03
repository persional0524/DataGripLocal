-- 执行SQL脚本

delete
from STG_CPM_ACCOUNT_TYPE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_ACCOUNT_TYPE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入

SELECT TYPE_ID,
       TYPE_NO,
       TYPE_NAME,
       TYPE_DESC,
       TYPE_PARENT,
       TYPE_TREE_NO,
       TYPE_LEAF,
       TYPE_BOND,
       INTR_CODE,
       CUR_CODE,
       BRANCH_NO,
       CPM_BRANCH_NO,
       MASS_TYPE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_ACCOUNT_TYPE;

-- ddl  无表，字段注释

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_ACCOUNT_TYPE
-- auto-generated definition
create table CPM_ACCOUNT_TYPE
(
    TYPE_ID       NUMBER       not null
        constraint PK_CPM_ACCOUNT_TYPE
            primary key,
    TYPE_NO       VARCHAR2(4),
    TYPE_NAME     VARCHAR2(30),
    TYPE_DESC     VARCHAR2(200),
    TYPE_PARENT   NUMBER
        constraint FK_CPM_ACCO_REFERENCE_CPM_ACCO
            references CPM_ACCOUNT_TYPE,
    TYPE_TREE_NO  VARCHAR2(64) not null,
    TYPE_LEAF     NUMBER,
    TYPE_BOND     NUMBER,
    INTR_CODE     VARCHAR2(32)
        constraint FK_CPM_ACCO_RELATIONS_CPM_INTR
            references CPM_INTR_TYPE,
    CUR_CODE      VARCHAR2(8),
    BRANCH_NO     VARCHAR2(6),
    CPM_BRANCH_NO VARCHAR2(6),
    MASS_TYPE     NUMBER
)
/

create index CPM_ACCOUNT_TYPE_PRT_FK
    on CPM_ACCOUNT_TYPE (TYPE_PARENT)
/

create index CPM_ACCOUNT_TYPE_INTR_FK
    on CPM_ACCOUNT_TYPE (INTR_CODE)
/

create unique index CPM_ACCOUNT_TYPE_UK
    on CPM_ACCOUNT_TYPE (CUR_CODE, TYPE_TREE_NO, BRANCH_NO)
/
 Show table preview*/

/*
CPM_ACCOUNT_TYPE 账户分类表
字段	含义	备注
TYPE_ID	账户分类主键	　
TYPE_NO	账户分类号	　
TYPE_NAME	账户分类名称	　
TYPE_DESC	账户分类描述	　
TYPE_PARENT	账户分_账户分类主键	　
TYPE_TREE_NO	级别码	　
TYPE_LEAF	是否是子节点	　
TYPE_BOND	是否与结算账号绑定	　
INTR_CODE	利息代码	　
CUR_CODE	币种代号	　
BRANCH_NO	营业机构号	　
CPM_BRANCH_NO	所属机构	　
MASS_TYPE	积数累计方式	0 不累积数
1 累账户积数
2 累台账户积数
3 累账户和台账户积数

*/




-- list 存在