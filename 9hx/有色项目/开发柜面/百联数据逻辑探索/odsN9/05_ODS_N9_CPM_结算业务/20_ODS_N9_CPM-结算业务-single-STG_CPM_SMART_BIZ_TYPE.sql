-- 执行SQL脚本
delete
from STG_CPM_SMART_BIZ_TYPE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_SMART_BIZ_TYPE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 研发无数据
SELECT SMART_BTY_ID,
       BTY_CODE,
       BTY_NAME,
       TYPE_FLAG,
       ALL_CUST_USE_FLAG,
       INIT_MONEY,
       DRAW_MONEY,
       FEE_RATE_VALUE,
       LEFT_DAY_MODE,
       OVER_DUE_MODE,
       DRAW_BEFORE_TIMES,
       CUR_CODE,
       BRANCH_NO,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_SMART_BIZ_TYPE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_SMART_BIZ_TYPE
-- auto-generated definition
create table CPM_SMART_BIZ_TYPE
(
    SMART_BTY_ID      NUMBER not null
        constraint PK_CPM_SMART_BIZ_TYPE
            primary key,
    BTY_CODE          VARCHAR2(30),
    BTY_NAME          VARCHAR2(30),
    TYPE_FLAG         NUMBER,
    ALL_CUST_USE_FLAG NUMBER,
    INIT_MONEY        NUMBER(16, 2),
    DRAW_MONEY        NUMBER(16, 2),
    FEE_RATE_VALUE    NUMBER(10, 6),
    LEFT_DAY_MODE     NUMBER,
    OVER_DUE_MODE     NUMBER,
    DRAW_BEFORE_TIMES NUMBER,
    CUR_CODE          VARCHAR2(8),
    BRANCH_NO         VARCHAR2(6)
)
/
 Show table preview */

/*CPM_SMART_BIZ_TYPE 智能业务品种
字段	含义	备注
SMART_BTY_ID	主键	　
BTY_CODE	品种编号	　
BTY_NAME	品种名称
TYPE_FLAG	智能品种默认类型标记	0,普通
1,基础型
2,加强型
ALL_CUST_USE_FLAG	全部客户都可用	0，否
1，是　
INIT_MONEY	起存金额	　
DRAW_MONEY	最小支取金额	　
FEE_RATE_VALUE	手续费率	　
LEFT_DAY_MODE	冗余天数计息规则	　
OVER_DUE_MODE	逾期天数计息规则	　
DRAW_BEFORE_TIMES	提前支取次数	　
CUR_CODE	币种	　
BRANCH_NO	机构	　*/

-- list 1