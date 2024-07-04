-- 执行SQL脚本
delete
from STG_CMS_PARAM
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CMS_PARAM', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入

SELECT PARAM_CODE,
       PARAM_NAME,
       PARAM_VALUE,
       PARAM_DES,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CMS_PARAM;

--ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CMS_PARAM  -- 系统参数
-- auto-generated definition
create table CMS_PARAM
(
    PARAM_CODE  VARCHAR2(12),
    PARAM_NAME  VARCHAR2(50),
    PARAM_VALUE VARCHAR2(50),
    PARAM_DES   VARCHAR2(200)
)
/

comment on table CMS_PARAM is '系统参数'
/

comment on column CMS_PARAM.PARAM_CODE is '参数代码'
/

comment on column CMS_PARAM.PARAM_NAME is '参数名称'
/

comment on column CMS_PARAM.PARAM_VALUE is '参数值'
/

comment on column CMS_PARAM.PARAM_DES is '描述'
/
 Show table preview */

-- list 不存在