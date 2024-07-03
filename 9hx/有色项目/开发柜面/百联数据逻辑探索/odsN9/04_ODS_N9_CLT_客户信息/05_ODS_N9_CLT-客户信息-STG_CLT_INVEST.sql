-- 执行SQL脚本
delete
from STG_CLT_INVEST
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_INVEST', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT INVEST_ID,
       CLTNO,
       INVESTNM,
       BYLNCARDNO,
       ORGNO,
       CURTP1,
       INVAMT1,
       CURTP2,
       INVAMT2,
       CURTP3,
       INVAMT3,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       DELETEFLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_INVEST;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_INVEST  -- 对外投资信息表
-- auto-generated definition
create table CLT_INVEST
(
    INVEST_ID  NUMBER not null
        constraint PK_CLT_INVEST
            primary key,
    CLTNO      VARCHAR2(30),
    INVESTNM   VARCHAR2(80),
    BYLNCARDNO VARCHAR2(16),
    ORGNO      VARCHAR2(10),
    CURTP1     VARCHAR2(3),
    INVAMT1    NUMBER(8),
    CURTP2     VARCHAR2(3),
    INVAMT2    NUMBER(8),
    CURTP3     VARCHAR2(3),
    INVAMT3    NUMBER(8),
    CREATOR    VARCHAR2(24),
    CREATETIME DATE,
    MODIFIER   VARCHAR2(24),
    MODIFYTIME DATE,
    DELETEFLAG NUMBER
)
/

comment on table CLT_INVEST is '对外投资信息表'
/

comment on column CLT_INVEST.INVEST_ID is '主键ID'
/

comment on column CLT_INVEST.CLTNO is '客户编号'
/

comment on column CLT_INVEST.INVESTNM is '被投资单位名称'
/

comment on column CLT_INVEST.BYLNCARDNO is '被投资方贷款卡编码'
/

comment on column CLT_INVEST.ORGNO is '组织机构代码'
/

comment on column CLT_INVEST.CURTP1 is '币种1'
/

comment on column CLT_INVEST.INVAMT1 is '投资金额1'
/

comment on column CLT_INVEST.CURTP2 is '币种2'
/

comment on column CLT_INVEST.INVAMT2 is '投资金额2'
/

comment on column CLT_INVEST.CURTP3 is '币种3'
/

comment on column CLT_INVEST.INVAMT3 is '投资金额3'
/

comment on column CLT_INVEST.CREATOR is '录入人'
/

comment on column CLT_INVEST.CREATETIME is '录入时间'
/

comment on column CLT_INVEST.MODIFIER is '修改人'
/

comment on column CLT_INVEST.MODIFYTIME is '最后修改时间'
/

comment on column CLT_INVEST.DELETEFLAG is '删除标志'
/
 Show table preview */

-- 表清单中存在