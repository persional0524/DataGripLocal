-- 执行SQL脚本
delete
from STG_DBMS_BILLPROP
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_DBMS_BILLPROP', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT BPID,
       BILLID,
       PROPCODE,
       PROPVALUE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM DBMS_BILLPROP;


-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: DBMS_BILLPROP  -- 票据附加属性
-- auto-generated definition
create table DBMS_BILLPROP
(
    BPID      NUMBER not null
        constraint PK_DBMS_BILLPROP
            primary key,
    BILLID    NUMBER
        constraint FK_DBMS_BIL_REF19_DBMS_BIL
            references DBMS_BILL,
    PROPCODE  VARCHAR2(128),
    PROPVALUE VARCHAR2(255)
)
/

comment on table DBMS_BILLPROP is '票据附加属性'
/

comment on column DBMS_BILLPROP.BPID is '票据附加属性ID'
/

comment on column DBMS_BILLPROP.BILLID is '票据ID'
/

comment on column DBMS_BILLPROP.PROPCODE is '属性代码'
/

comment on column DBMS_BILLPROP.PROPVALUE is '属性值'
/

create index IDX_DBMS_BILLPROP_BILLID
    on DBMS_BILLPROP (BILLID)
/
 Show table preview*/

-- list 1