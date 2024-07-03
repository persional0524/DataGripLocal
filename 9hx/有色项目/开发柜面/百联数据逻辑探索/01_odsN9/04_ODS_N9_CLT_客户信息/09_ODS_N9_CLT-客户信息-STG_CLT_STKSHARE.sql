-- 执行SQL脚本
delete
from STG_CLT_STKSHARE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_STKSHARE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       CLTNO,
       STOCKHOLDERTYPE,
       STOCKHOLDER,
       STOCKHOLDERCLTNO,
       CONTRIBUTOR,
       REGISTERTYPE,
       REGISTERNO,
       PROPOFINV,
       PROPOFSHARE,
       INVAMT,
       INVCUR,
       INVTYOPE,
       INVTIME,
       ISPLACE,
       CCOMMENT,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       STATUS,
       CAUSE,
       TYPE,
       EXPIRYDATE,
       CLTNAME,
       PRIBUSINESS,
       ASSETSIZE,
       DEBTRATIO,
       NETMARGIN,
       DELETEFLAG,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_STKSHARE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_STKSHARE  -- 股权结构信息表
-- auto-generated definition
create table CLT_STKSHARE
(
    ID                 NUMBER(6) not null
        constraint PK_CLT_STKSHARE
            primary key,
    CLTNO              VARCHAR2(30),
    STOCKHOLDERTYPE    VARCHAR2(20),
    STOCKHOLDER        VARCHAR2(100),
    STOCKHOLDERCLTNO   VARCHAR2(30),
    CONTRIBUTOR        VARCHAR2(30),
    REGISTERTYPE       VARCHAR2(20),
    REGISTERNO         VARCHAR2(30),
    PROPOFINV          NUMBER(5, 2),
    PROPOFSHARE        NUMBER(5, 2),
    INVAMT             NUMBER(14, 2),
    INVCUR             VARCHAR2(8),
    INVTYOPE           NUMBER,
    INVTIME            DATE,
    ISPLACE            NUMBER,
    CCOMMENT           VARCHAR2(100),
    CREATOR            VARCHAR2(24),
    CREATETIME         DATE,
    MODIFIER           VARCHAR2(24),
    MODIFYTIME         DATE,
    STATUS             NUMBER,
    CAUSE              VARCHAR2(100),
    TYPE               NUMBER,
    EXPIRYDATE         DATE,
    CLTNAME            VARCHAR2(100),
    PRIBUSINESS        VARCHAR2(30),
    ASSETSIZE          NUMBER(14, 2),
    DEBTRATIO          NUMBER(5, 2),
    NETMARGIN          NUMBER(14, 2),
    DELETEFLAG         NUMBER,
    STKGLOBLACODE      VARCHAR2(50),
    STK_STARTDATE      DATE,
    STK_PROVINCE       VARCHAR2(10),
    STK_CITY           VARCHAR2(10),
    STK_DISTRICT       VARCHAR2(10),
    STOCKHOLDER_STATUS VARCHAR2(2),
    ISSTK_INVEST       VARCHAR2(2)
)
/

comment on table CLT_STKSHARE is '股权结构信息表'
/

comment on column CLT_STKSHARE.ID is '主键'
/

comment on column CLT_STKSHARE.CLTNO is '客户编号'
/

comment on column CLT_STKSHARE.STOCKHOLDERTYPE is '股东类型'
/

comment on column CLT_STKSHARE.STOCKHOLDER is '出资方名称'
/

comment on column CLT_STKSHARE.STOCKHOLDERCLTNO is '出资方客户编号'
/

comment on column CLT_STKSHARE.CONTRIBUTOR is '实际出资人'
/

comment on column CLT_STKSHARE.REGISTERTYPE is '证件类型/ 登记注册号类型'
/

comment on column CLT_STKSHARE.REGISTERNO is '证件类型/ 登记注册号码'
/

comment on column CLT_STKSHARE.PROPOFINV is '投资比例（%）'
/

comment on column CLT_STKSHARE.PROPOFSHARE is '持股比例（%）'
/

comment on column CLT_STKSHARE.INVAMT is '出资金额'
/

comment on column CLT_STKSHARE.INVCUR is '出资币种'
/

comment on column CLT_STKSHARE.INVTYOPE is '出资方式'
/

comment on column CLT_STKSHARE.INVTIME is '出资时间'
/

comment on column CLT_STKSHARE.ISPLACE is '是否到位'
/

comment on column CLT_STKSHARE.CCOMMENT is '备注'
/

comment on column CLT_STKSHARE.CREATOR is '录入人'
/

comment on column CLT_STKSHARE.CREATETIME is '录入时间'
/

comment on column CLT_STKSHARE.MODIFIER is '修改人'
/

comment on column CLT_STKSHARE.MODIFYTIME is '最后修改时间'
/

comment on column CLT_STKSHARE.STATUS is '状态'
/

comment on column CLT_STKSHARE.CAUSE is '驳回原因'
/

comment on column CLT_STKSHARE.TYPE is '类型'
/

comment on column CLT_STKSHARE.EXPIRYDATE is '证件有效期'
/

comment on column CLT_STKSHARE.CLTNAME is '公司名称'
/

comment on column CLT_STKSHARE.PRIBUSINESS is '主营业务'
/

comment on column CLT_STKSHARE.ASSETSIZE is '资产规模'
/

comment on column CLT_STKSHARE.DEBTRATIO is '资产负债率（%）'
/

comment on column CLT_STKSHARE.NETMARGIN is '本年净利润'
/

comment on column CLT_STKSHARE.DELETEFLAG is '删除标志(0:正常；1:已删除)'
/

comment on column CLT_STKSHARE.STKGLOBLACODE is '股东全球法人识别编码'
/

comment on column CLT_STKSHARE.STK_STARTDATE is '股东入股日期'
/

comment on column CLT_STKSHARE.STK_PROVINCE is '股东地址-省'
/

comment on column CLT_STKSHARE.STK_CITY is '股东地址-市'
/

comment on column CLT_STKSHARE.STK_DISTRICT is '股东地址-区'
/

comment on column CLT_STKSHARE.STOCKHOLDER_STATUS is '股东状态'
/

comment on column CLT_STKSHARE.ISSTK_INVEST is '投资其它金融机构标识'
/
 Show table preview */

-- 表清单存在