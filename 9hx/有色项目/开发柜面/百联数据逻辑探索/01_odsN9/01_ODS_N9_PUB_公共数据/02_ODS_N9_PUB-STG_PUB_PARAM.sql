

/*PUB_PARAM 系统参数表
字段	含义	备注
PARAM_CODE	参数编号	　
PARAM_NAME	参数名称	　
PARAM_VALUE	参数值	　
PARAM_COMMENT	参数说明	　
INPUT_CLASS	参数输入类型	　
SELECT_LIST	可选值对照表	　
PARAM_GROUP	参数组别	　
DISABLE_FLAG	失效标记	是否已失效：1为失效，0为未失效
PARAM_MARK	参数标识	　*/

-- 167 条数据
select count(1) from PUB_PARAM;

-- 表输入 系统参数表|PUB_PARAM
SELECT PARAM_CODE,
       PARAM_NAME,
       PARAM_VALUE,
       PARAM_COMMENT,
       INPUT_CLASS,
       SELECT_LIST,
       PARAM_GROUP,
       DISABLE_FLAG,
       PARAM_APPNO,
       PARAM_MARK,
   '${edate}'as sjrq,
   '2' as MAKEUP_STATUS
  FROM PUB_PARAM;