-- 执行SQL脚本
delete
from STG_CMS_ACCOUNT_GROUP_BOOK
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CMS_ACCOUNT_GROUP_BOOK', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       GROUPID,
       ACCOUNTNO,
       BOOKDATE,
       DIR,
       CREATETIME,
   '${edate}'as sjrq,
   '2' as MAKEUP_STATUS
  FROM CMS_ACCOUNT_GROUP_BOOK;

-- 表不存在，数据字典没有