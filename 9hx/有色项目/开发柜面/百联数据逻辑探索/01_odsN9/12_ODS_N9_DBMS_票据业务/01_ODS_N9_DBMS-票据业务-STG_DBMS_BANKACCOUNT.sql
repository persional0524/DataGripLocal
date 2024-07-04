-- 执行SQL脚本

delete
from STG_DBMS_BANKACCOUNT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_DBMS_BANKACCOUNT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入

SELECT BAID,
       MEMBERNO,
       BANKNO,
       ACCOUNTID,
       ACCOUNTNO,
       ACCOUNTNAME,
       OPENBANKNO,
       OPENBANKNAME,
       CREATETIME,
       LASTUPDATETIME,
       ACTIONFLAG,
       ISINBIZFLOW,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM DBMS_BANKACCOUNT;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: DBMS_BANKACCOUNT  -- 成员单位票据业务使用的银行账户。
-- auto-generated definition
create table DBMS_BANKACCOUNT
(
    BAID           NUMBER               not null
        constraint PK_DBMS_BANKACCOUNT
            primary key,
    MEMBERNO       VARCHAR2(18)
        constraint FK_DBMS_BAN_REFERENCE_DBMS_MEM
            references DBMS_MEMBERS,
    BANKNO         VARCHAR2(2)          not null,
    ACCOUNTID      NUMBER,
    ACCOUNTNO      VARCHAR2(32)         not null,
    ACCOUNTNAME    VARCHAR2(128)        not null,
    OPENBANKNO     VARCHAR2(12)         not null,
    OPENBANKNAME   VARCHAR2(128)        not null,
    CREATETIME     DATE default sysdate not null,
    LASTUPDATETIME DATE,
    ACTIONFLAG     NUMBER,
    ISINBIZFLOW    NUMBER
)
/

comment on table DBMS_BANKACCOUNT is '成员单位票据业务使用的银行账户。'
/

comment on column DBMS_BANKACCOUNT.BAID is '银行账户ID'
/

comment on column DBMS_BANKACCOUNT.MEMBERNO is '成员单位编号'
/

comment on column DBMS_BANKACCOUNT.BANKNO is '所属银行代号'
/

comment on column DBMS_BANKACCOUNT.ACCOUNTID is '集团票据系统账户ID'
/

comment on column DBMS_BANKACCOUNT.ACCOUNTNO is '账号'
/

comment on column DBMS_BANKACCOUNT.ACCOUNTNAME is '户名'
/

comment on column DBMS_BANKACCOUNT.OPENBANKNO is '开户行行号'
/

comment on column DBMS_BANKACCOUNT.OPENBANKNAME is '开户行名称'
/

comment on column DBMS_BANKACCOUNT.CREATETIME is '记录创建时间'
/

comment on column DBMS_BANKACCOUNT.LASTUPDATETIME is '末次更新时间'
/

comment on column DBMS_BANKACCOUNT.ACTIONFLAG is '账户操作信息'
/

comment on column DBMS_BANKACCOUNT.ISINBIZFLOW is '是否在工作流中 0:不在 1:在'
/

create unique index INDEX_3
    on DBMS_BANKACCOUNT (OPENBANKNO, ACCOUNTNO)
/

create unique index UK_DBMS_BANKACCOUNT_BANKNO
    on DBMS_BANKACCOUNT (BANKNO, ACCOUNTNO)
/

create index IDX_BANKACCOUNT_CLIENTNO
    on DBMS_BANKACCOUNT (MEMBERNO)
/
 Show table preview */

-- list 1