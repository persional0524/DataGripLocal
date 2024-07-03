-- 执行SQL脚本
delete
from STG_CLT_LAWSUIT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_LAWSUIT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 无数据
SELECT LAWSUIT_ID,
       CLTNO,
       PLAINNM,
       CURTP,
       JDEXAMT,
       JDEXECDT,
       EXECRLT,
       IDCTCAU,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       DELETEFLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_LAWSUIT;

-- ddl

/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_LAWSUIT  -- 诉讼信息表
-- auto-generated definition
create table CLT_LAWSUIT
(
    LAWSUIT_ID NUMBER not null
        constraint PK_CLT_LAWSUIT
            primary key,
    CLTNO      VARCHAR2(30),
    PLAINNM    VARCHAR2(80),
    CURTP      VARCHAR2(3),
    JDEXAMT    NUMBER(16, 2),
    JDEXECDT   DATE,
    EXECRLT    VARCHAR2(100),
    IDCTCAU    VARCHAR2(300),
    CREATOR    VARCHAR2(24),
    CREATETIME DATE,
    MODIFIER   VARCHAR2(24),
    MODIFYTIME DATE,
    DELETEFLAG NUMBER
)
/

comment on table CLT_LAWSUIT is '诉讼信息表'
/

comment on column CLT_LAWSUIT.LAWSUIT_ID is '主键ID'
/

comment on column CLT_LAWSUIT.CLTNO is '客户编号'
/

comment on column CLT_LAWSUIT.PLAINNM is '起诉人名称'
/

comment on column CLT_LAWSUIT.CURTP is '币种'
/

comment on column CLT_LAWSUIT.JDEXAMT is '判决执行金额'
/

comment on column CLT_LAWSUIT.JDEXECDT is '判决执行日期'
/

comment on column CLT_LAWSUIT.EXECRLT is '执行结果'
/

comment on column CLT_LAWSUIT.IDCTCAU is '被起诉原因'
/

comment on column CLT_LAWSUIT.CREATOR is '录入人'
/

comment on column CLT_LAWSUIT.CREATETIME is '录入时间'
/

comment on column CLT_LAWSUIT.MODIFIER is '修改人'
/

comment on column CLT_LAWSUIT.MODIFYTIME is '最后修改时间'
/

comment on column CLT_LAWSUIT.DELETEFLAG is '删除标志(0:正常；1:已删除)'
/
 Show table preview */

