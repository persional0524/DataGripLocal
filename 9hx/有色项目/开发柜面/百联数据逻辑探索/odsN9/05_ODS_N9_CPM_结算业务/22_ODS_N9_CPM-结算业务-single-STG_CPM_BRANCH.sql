-- 执行SQL脚本
delete
from STG_CPM_BRANCH
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_BRANCH', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT BRANCH_NO,
       BRANCH_NAME,
       LEVEL_CODE,
       BRANCH_TYPE,
       SINGLE_BOOK,
       BRANCH_CUST_ID,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_BRANCH;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_BRANCH
-- auto-generated definition
create table CPM_BRANCH
(
    BRANCH_NO      VARCHAR2(6)  not null
        constraint PK_CPM_BRANCH
            primary key,
    BRANCH_NAME    VARCHAR2(30) not null,
    LEVEL_CODE     VARCHAR2(12) not null,
    BRANCH_TYPE    NUMBER,
    SINGLE_BOOK    NUMBER,
    BRANCH_CUST_ID NUMBER
)
/

create index CPM_BRANCH_TYPE_IDX
    on CPM_BRANCH (BRANCH_TYPE)
/
 Show table preview */

/*

CPM_BRANCH 营业机构表
字段	含义	备注
BRANCH_NO	营业机构号	　
BRANCH_NAME	营业机构名称	　
LEVEL_CODE	级别码	　
BRANCH_TYPE	机构性质	1为总部，2为一般分支，3为代办点
SINGLE_BOOK	独立记账	1为独立记账，0为不独立记账
*/

-- list 1