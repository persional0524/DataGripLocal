-- 执行SQL脚本
delete
from STG_DBMS_MEMBERS
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_DBMS_MEMBERS', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT MEMBERNO,
       MEMBERNAME,
       DISABLED,
       CREATETIME,
       LASTUPDATETIME,
       CDTRATGS,
       CDTRATGAGCY,
       CDTRATGDUEDT,
       ACTIONFLAG,
       MEMO,
       BILLPERCENT,
       '${edate}' as sjrq, '2' as MAKEUP_STATUS
FROM DBMS_MEMBERS;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: DBMS_MEMBERS  -- 成员单位票据业务配置项。
-- auto-generated definition
create table DBMS_MEMBERS
(
    MEMBERNO       VARCHAR2(18)           not null
        constraint PK_DBMS_MEMBERS
            primary key,
    MEMBERNAME     VARCHAR2(128)          not null,
    DISABLED       NUMBER default 0       not null,
    CREATETIME     DATE   default sysdate not null,
    LASTUPDATETIME DATE,
    CDTRATGS       VARCHAR2(3),
    CDTRATGAGCY    VARCHAR2(60),
    CDTRATGDUEDT   DATE,
    ACTIONFLAG     NUMBER,
    MEMO           VARCHAR2(50),
    BILLPERCENT    NUMBER(5, 2)
)
/

comment on table DBMS_MEMBERS is '成员单位票据业务配置项。'
/

comment on column DBMS_MEMBERS.MEMBERNO is '成员单位编号'
/

comment on column DBMS_MEMBERS.MEMBERNAME is '成员单位名称'
/

comment on column DBMS_MEMBERS.DISABLED is '记录失效标记'
/

comment on column DBMS_MEMBERS.CREATETIME is '记录创建时间'
/

comment on column DBMS_MEMBERS.LASTUPDATETIME is '末次更新时间'
/

comment on column DBMS_MEMBERS.CDTRATGS is '信用等级'
/

comment on column DBMS_MEMBERS.CDTRATGAGCY is '信用评级机构'
/

comment on column DBMS_MEMBERS.CDTRATGDUEDT is '信用评级过期时间'
/

comment on column DBMS_MEMBERS.BILLPERCENT is '开票比例'
/
 Show table preview */

-- list 不存在