-- 执行SQL脚本
delete
from STG_FB_FIVELEVEL_LOG
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_FIVELEVEL_LOG', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT LEVEL_LOG_ID,
       LENDING_ID,
       ACT_DATE,
       FIVE_LEVEL,
       DESCRIPTION,
       REMARK,
       CREATE_TIME,
       BID,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_FIVELEVEL_LOG;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_FIVELEVEL_LOG  -- 金融资产五级分类历史记录
-- auto-generated definition
create table FB_FIVELEVEL_LOG
(
    LEVEL_LOG_ID NUMBER not null
        constraint PK_FB_FIVELEVEL_LOG
            primary key,
    LENDING_ID   NUMBER
        constraint FK_FB_FIVEL_REFERENCE_FB_LENDI
            references FB_LENDINGS,
    ACT_DATE     DATE   not null,
    FIVE_LEVEL   NUMBER not null,
    DESCRIPTION  VARCHAR2(1024),
    REMARK       VARCHAR2(1024),
    CREATE_TIME  DATE   not null,
    BID          NUMBER
        constraint FK_FB_FIVEL_FB_CONTR
            references FB_CONTRACTS
)
/

comment on table FB_FIVELEVEL_LOG is '金融资产五级分类历史记录'
/

comment on column FB_FIVELEVEL_LOG.LEVEL_LOG_ID is '记录ID'
/

comment on column FB_FIVELEVEL_LOG.LENDING_ID is '贷款ID'
/

comment on column FB_FIVELEVEL_LOG.ACT_DATE is '分类日期'
/

comment on column FB_FIVELEVEL_LOG.FIVE_LEVEL is '五级分类'
/

comment on column FB_FIVELEVEL_LOG.DESCRIPTION is '分类描述'
/

comment on column FB_FIVELEVEL_LOG.REMARK is '备注'
/

comment on column FB_FIVELEVEL_LOG.CREATE_TIME is '记录创建时间'
/
 Show table preview*/

-- list 1