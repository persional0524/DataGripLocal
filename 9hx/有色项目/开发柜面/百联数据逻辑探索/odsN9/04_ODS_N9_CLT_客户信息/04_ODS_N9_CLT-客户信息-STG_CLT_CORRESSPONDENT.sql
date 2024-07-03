-- 执行SQL脚本
delete
from STG_CLT_CORRESSPONDENT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_CORRESSPONDENT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       CLTNO,
       CODE,
       RELATIONTYPE,
       ISGROUP,
       NAME,
       OPBANK,
       BANKNO,
       ADDRESS,
       ZIPCODE,
       CCOMMNET,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       DELETEFLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_CORRESSPONDENT;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_CORRESSPONDENT  -- 关联企业信息表
-- auto-generated definition
create table CLT_CORRESSPONDENT
(
    ID           NUMBER(6) not null
        constraint PK_CLT_CORRESSPONDENT
            primary key,
    CLTNO        VARCHAR2(30),
    CODE         VARCHAR2(60),
    RELATIONTYPE VARCHAR2(20),
    ISGROUP      NUMBER,
    NAME         VARCHAR2(60),
    OPBANK       VARCHAR2(100),
    BANKNO       VARCHAR2(60),
    ADDRESS      VARCHAR2(100),
    ZIPCODE      VARCHAR2(10),
    CCOMMNET     VARCHAR2(100),
    CREATOR      VARCHAR2(24),
    CREATETIME   DATE,
    MODIFIER     VARCHAR2(24),
    MODIFYTIME   DATE,
    DELETEFLAG   NUMBER
)
/

comment on table CLT_CORRESSPONDENT is '关联企业信息表'
/

comment on column CLT_CORRESSPONDENT.ID is '主键'
/

comment on column CLT_CORRESSPONDENT.CLTNO is '客户编号'
/

comment on column CLT_CORRESSPONDENT.CODE is '单位编码'
/

comment on column CLT_CORRESSPONDENT.RELATIONTYPE is '关联类型'
/

comment on column CLT_CORRESSPONDENT.ISGROUP is '0:集团内   1：集团外'
/

comment on column CLT_CORRESSPONDENT.NAME is '名称'
/

comment on column CLT_CORRESSPONDENT.OPBANK is '开户行'
/

comment on column CLT_CORRESSPONDENT.BANKNO is '银行账号'
/

comment on column CLT_CORRESSPONDENT.ADDRESS is '地址'
/

comment on column CLT_CORRESSPONDENT.ZIPCODE is '邮编'
/

comment on column CLT_CORRESSPONDENT.CCOMMNET is '备注'
/

comment on column CLT_CORRESSPONDENT.CREATOR is '录入人'
/

comment on column CLT_CORRESSPONDENT.CREATETIME is '录入时间'
/

comment on column CLT_CORRESSPONDENT.MODIFIER is '修改人'
/

comment on column CLT_CORRESSPONDENT.MODIFYTIME is '最后修改时间'
/

comment on column CLT_CORRESSPONDENT.DELETEFLAG is '删除标志(0:正常；1:已删除)'
/
 Show table preview */

-- 表清单中存在