-- 执行SQL脚本
delete
from STG_CLT_STOCK
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_STOCK', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 研发环境无数据
SELECT ID,
       CLTNO,
       STOCKCODE,
       STOCKNAME,
       LISTINGDATE,
       LISTINGPLACE,
       STATUS,
       TYPE,
       TOTALSHARE,
       CIRCULSHARE,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       DELETEFLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_STOCK;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_STOCK  -- 股票信息表
-- auto-generated definition
create table CLT_STOCK
(
    ID           NUMBER(6) not null
        constraint PK_CLT_STOCK
            primary key,
    CLTNO        VARCHAR2(30),
    STOCKCODE    VARCHAR2(20),
    STOCKNAME    VARCHAR2(40),
    LISTINGDATE  DATE,
    LISTINGPLACE VARCHAR2(40),
    STATUS       NUMBER,
    TYPE         VARCHAR2(20),
    TOTALSHARE   NUMBER,
    CIRCULSHARE  NUMBER,
    CREATOR      VARCHAR2(24),
    CREATETIME   DATE,
    MODIFIER     VARCHAR2(24),
    MODIFYTIME   DATE,
    DELETEFLAG   NUMBER
)
/

comment on table CLT_STOCK is '股票信息表'
/

comment on column CLT_STOCK.ID is '主键'
/

comment on column CLT_STOCK.CLTNO is '客户编号'
/

comment on column CLT_STOCK.STOCKCODE is '股票代码'
/

comment on column CLT_STOCK.STOCKNAME is '股票名称'
/

comment on column CLT_STOCK.LISTINGDATE is '上市日期'
/

comment on column CLT_STOCK.LISTINGPLACE is '上市地'
/

comment on column CLT_STOCK.STATUS is '状态'
/

comment on column CLT_STOCK.TYPE is '股票种类（A/ B/ H等）'
/

comment on column CLT_STOCK.TOTALSHARE is '总股本数'
/

comment on column CLT_STOCK.CIRCULSHARE is '流通股数'
/

comment on column CLT_STOCK.CREATOR is '录入人'
/

comment on column CLT_STOCK.CREATETIME is '录入时间'
/

comment on column CLT_STOCK.MODIFIER is '修改人'
/

comment on column CLT_STOCK.MODIFYTIME is '最后修改时间'
/

comment on column CLT_STOCK.DELETEFLAG is '删除标志(0:正常；1:已删除)'
/
 Show table preview */

-- 表清单中存在