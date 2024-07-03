-- 执行SQL脚本
delete
from STG_CLT_ARTIFAMI
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_ARTIFAMI', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 拉链逻辑
SELECT FAMILY_ID,
       CLTNO,
       MAINLEAGNM,
       MAINCERTTP,
       MAINCERTNO,
       FAMRELA,
       LEAGNM,
       CERTTP,
       CERTNO,
       COMPNM,
       ENTLNNO,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       DELETEFLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_ARTIFAMI;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_ARTIFAMI  -- 家族成员信息表
-- auto-generated definition
create table CLT_ARTIFAMI
(
    FAMILY_ID  NUMBER not null
        constraint PK_CLT_ARTIFAMI
            primary key,
    CLTNO      VARCHAR2(30),
    MAINLEAGNM VARCHAR2(30),
    MAINCERTTP VARCHAR2(1),
    MAINCERTNO VARCHAR2(20),
    FAMRELA    VARCHAR2(1),
    LEAGNM     VARCHAR2(30),
    CERTTP     VARCHAR2(1),
    CERTNO     VARCHAR2(20),
    COMPNM     VARCHAR2(80),
    ENTLNNO    VARCHAR2(16),
    CREATOR    VARCHAR2(24),
    CREATETIME DATE,
    MODIFIER   VARCHAR2(24),
    MODIFYTIME DATE,
    DELETEFLAG NUMBER
)
/

comment on table CLT_ARTIFAMI is '家族成员信息表'
/

comment on column CLT_ARTIFAMI.FAMILY_ID is '主键ID'
/

comment on column CLT_ARTIFAMI.CLTNO is '客户编号'
/

comment on column CLT_ARTIFAMI.MAINLEAGNM is '主要关系人姓名'
/

comment on column CLT_ARTIFAMI.MAINCERTTP is '主要关系人证件类型'
/

comment on column CLT_ARTIFAMI.MAINCERTNO is '主要关系人证件号码'
/

comment on column CLT_ARTIFAMI.FAMRELA is '家族关系'
/

comment on column CLT_ARTIFAMI.LEAGNM is '家族成员姓名'
/

comment on column CLT_ARTIFAMI.CERTTP is '证件类型'
/

comment on column CLT_ARTIFAMI.CERTNO is '证件号码'
/

comment on column CLT_ARTIFAMI.COMPNM is '家族成员所在企业名称'
/

comment on column CLT_ARTIFAMI.ENTLNNO is '所在企业贷款卡编码'
/

comment on column CLT_ARTIFAMI.CREATOR is '录入人'
/

comment on column CLT_ARTIFAMI.CREATETIME is '录入时间'
/

comment on column CLT_ARTIFAMI.MODIFIER is '修改人'
/

comment on column CLT_ARTIFAMI.MODIFYTIME is '最后修改时间'
/

comment on column CLT_ARTIFAMI.DELETEFLAG is '删除标志(0:正常；1:已删除)'
/
 Show table preview */

-- 表清单中存在