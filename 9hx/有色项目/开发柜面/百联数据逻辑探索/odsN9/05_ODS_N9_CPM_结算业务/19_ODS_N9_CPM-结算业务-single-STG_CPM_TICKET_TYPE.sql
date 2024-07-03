-- 执行SQL脚本
delete
from STG_CPM_TICKET_TYPE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_TICKET_TYPE', 1) as del from dual), 'yyyy-mm-dd')
          );


-- 表输入
SELECT TKT_CODE,
       TKT_NAME,
       CHECK_PSWD,
       REMARK,
       TKT_SOURCE,
       TKT_ENABLE,
       SELF_USE,
       TKT_PURPOSE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_TICKET_TYPE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_TICKET_TYPE
-- auto-generated definition
create table CPM_TICKET_TYPE
(
    TKT_CODE    VARCHAR2(4) not null
        constraint PK_CPM_TICKET_TYPE
            primary key,
    TKT_NAME    VARCHAR2(30),
    CHECK_PSWD  NUMBER,
    REMARK      VARCHAR2(256),
    TKT_SOURCE  NUMBER,
    TKT_ENABLE  NUMBER,
    SELF_USE    NUMBER,
    TKT_PURPOSE NUMBER
)
/
 Show table preview */


/*
CPM_TICKET_TYPE 重空凭证种类表
字段	含义	备注
TKT_CODE	票证种类编号	　
TKT_NAME	票证种类名称	　
CHECK_PSWD	验密标记	　
REMARK	备注	　
TKT_SOURCE	票证来源	1为自治凭证,2为外部购入,3为外部凭证
TKT_ENABLE	是否启用	1为启用，0为禁用
SELF_USE	是否自用	1为自用，0为非自用
TKT_PURPOSE	用途	1为重空凭证(控号)，
2为现金预约,
3为限额转账预约,
4为存单,
5为重空凭证(不控号)
*/

-- list 1