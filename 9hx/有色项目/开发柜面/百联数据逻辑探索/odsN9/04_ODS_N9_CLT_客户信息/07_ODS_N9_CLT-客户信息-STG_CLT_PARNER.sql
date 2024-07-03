-- 执行SQL脚本
delete
from STG_CLT_PARNER
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_PARNER', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 研发无数据
SELECT ID,
       CLTNO,
       PARRELATION,
       PARNAME,
       TRANSTYPE,
       TRANSSIZE,
       TRANSCOUNT,
       TRANSPRICE,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       STATUS,
       CAUSE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_PARNER;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_PARNER  -- 合作伙伴信息表
-- auto-generated definition
create table CLT_PARNER
(
    ID          NUMBER(6) not null
        constraint PK_CLT_PARNER
            primary key,
    CLTNO       VARCHAR2(30),
    PARRELATION NUMBER,
    PARNAME     VARCHAR2(100),
    TRANSTYPE   VARCHAR2(30),
    TRANSSIZE   VARCHAR2(30),
    TRANSCOUNT  NUMBER,
    TRANSPRICE  NUMBER(14, 2),
    CREATOR     VARCHAR2(24),
    CREATETIME  DATE,
    MODIFIER    VARCHAR2(24),
    MODIFYTIME  DATE,
    STATUS      NUMBER,
    CAUSE       VARCHAR2(100)
)
/

comment on table CLT_PARNER is '合作伙伴信息表'
/

comment on column CLT_PARNER.ID is '主键'
/

comment on column CLT_PARNER.CLTNO is '客户编号'
/

comment on column CLT_PARNER.PARRELATION is '企业关系'
/

comment on column CLT_PARNER.PARNAME is '企业名称'
/

comment on column CLT_PARNER.TRANSTYPE is '交易类型'
/

comment on column CLT_PARNER.TRANSSIZE is '交易规模/ 年'
/

comment on column CLT_PARNER.TRANSCOUNT is '年交易次数'
/

comment on column CLT_PARNER.TRANSPRICE is '交易价格/ 次'
/

comment on column CLT_PARNER.CREATOR is '录入人'
/

comment on column CLT_PARNER.CREATETIME is '录入时间'
/

comment on column CLT_PARNER.MODIFIER is '修改人'
/

comment on column CLT_PARNER.MODIFYTIME is '最后修改时间'
/

comment on column CLT_PARNER.STATUS is '状态'
/

comment on column CLT_PARNER.CAUSE is '驳回原因'
/
 Show table preview */

-- 表清单中存在
