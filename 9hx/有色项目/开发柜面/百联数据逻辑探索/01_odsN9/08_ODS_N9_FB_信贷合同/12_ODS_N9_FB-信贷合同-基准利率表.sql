-- 执行SQL脚本
delete
from STG_FB_NORMRATE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_NORMRATE', 1) as del from dual), 'yyyy-mm-dd')
          );
--表输入 研发环境无数据
SELECT BIZTYPE,
       RATE,
       TYPE,
       UPDATETIME,
       ID,
       LASTTIME,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_NORMRATE;


--ddl
/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_NORMRATE  -- 基准利率表
-- auto-generated definition
create table FB_NORMRATE
(
    BIZTYPE    VARCHAR2(4)   not null,
    RATE       NUMBER(10, 6) not null,
    TYPE       NUMBER        not null,
    UPDATETIME DATE default sysdate,
    ID         NUMBER        not null
        constraint PK_FB_NORMRATE
            primary key,
    LASTTIME   DATE
)
/

comment on table FB_NORMRATE is '基准利率表'
/

comment on column FB_NORMRATE.BIZTYPE is '业务品种'
/

comment on column FB_NORMRATE.RATE is '利率'
/

comment on column FB_NORMRATE.TYPE is '类型'
/

comment on column FB_NORMRATE.UPDATETIME is '最新更新时间'
/

comment on column FB_NORMRATE.ID is '主键'
/

comment on column FB_NORMRATE.LASTTIME is '上次调整时间'
/
 Show table preview */

-- list 不存在