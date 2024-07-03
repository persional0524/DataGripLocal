-- 执行SQL脚本
delete
from STG_CPM_CHANNEL
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CPM_CHANNEL', 1) as del from dual), 'yyyy-mm-dd')
          );


-- 表输入
SELECT CHANNEL_ID,
       CHANNEL_CODE,
       CHANNEL_NAME,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CPM_CHANNEL;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_CHANNEL
-- auto-generated definition
create table CPM_CHANNEL
(
    CHANNEL_ID   NUMBER not null
        constraint PK_CPM_CHANNEL
            primary key,
    CHANNEL_CODE VARCHAR2(16),
    CHANNEL_NAME VARCHAR2(30)
)
/

create unique index CPM_CHANNEL_UK
    on CPM_CHANNEL (CHANNEL_CODE)
/
 Show table preview */

/*

CPM_CHANNEL 交易发起渠道表
字段	含义	备注
CHANNEL_ID	渠道ID	　
CHANNEL_CODE	渠道代码	　
CHANNEL_NAME	渠道名称	　
*/

-- list 1
