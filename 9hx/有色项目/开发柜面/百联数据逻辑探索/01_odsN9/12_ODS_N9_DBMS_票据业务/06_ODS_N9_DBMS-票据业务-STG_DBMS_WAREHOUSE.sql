-- 执行SQL脚本
delete
from STG_DBMS_WAREHOUSE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_DBMS_WAREHOUSE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       MEMBERNO,
       MEMBERNAME,
       OPENBANKNO,
       OPENBANKNAME,
       BANKNO,
       WAREHOUSE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM DBMS_WAREHOUSE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: DBMS_WAREHOUSE  -- 票据库存表
-- auto-generated definition
create table DBMS_WAREHOUSE
(
    ID           NUMBER not null
        primary key,
    MEMBERNO     VARCHAR2(60),
    MEMBERNAME   VARCHAR2(256),
    OPENBANKNO   VARCHAR2(18),
    OPENBANKNAME VARCHAR2(256),
    BANKNO       VARCHAR2(4),
    WAREHOUSE    VARCHAR2(20)
)
/

comment on table DBMS_WAREHOUSE is '票据库存表'
/

comment on column DBMS_WAREHOUSE.ID is '库存ID'
/

comment on column DBMS_WAREHOUSE.MEMBERNO is '单位编号(非系统内的单位用账号+行号来标识)'
/

comment on column DBMS_WAREHOUSE.MEMBERNAME is '单位名称'
/

comment on column DBMS_WAREHOUSE.OPENBANKNO is '业务对方联行号'
/

comment on column DBMS_WAREHOUSE.OPENBANKNAME is '业务对方行名'
/

comment on column DBMS_WAREHOUSE.BANKNO is '业务对方大行行号'
/

comment on column DBMS_WAREHOUSE.WAREHOUSE is '库存类型编号'
/
 Show table preview*/

-- list 1