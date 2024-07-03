-- 执行SQL脚本

delete
from STG_CLT_CLT_INFO
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_CLT_INFO', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       TYPE,
       CLTNO,
       TREENO,
       CHINESENAME,
       ABBREVIATION,
       NAME,
       OPBANK,
       ACNTNO,
       INTERNETSITE,
       PHONE,
       BUSSADDR,
       POSTCODE,
       FAX,
       DEPINCHARGE,
       DAYOFESTB,
       INDUSTRY,
       RANKING,
       ORGCODE,
       FINANTYPE,
       LISENSENO,
       TAXREGNO,
       LOANNO,
       OPRATETERM,
       FERC,
       BUSSSCOPE,
       REGCAPITAL,
       CUR,
       REGADDR,
       LEGALPERZIP,
       LEGALPER,
       LEGALPERID,
       LEGALPERPHONE,
       CREDITLEVEL,
       EVALAUTH,
       EVALTIME,
       CREDITRATING,
       EXTCLTNO,
       ISLISTED,
       AREA,
       COUNTRYCODE,
       INGROUP,
       NATURE,
       CORPTYPE,
       CORSUBTYPE,
       OTHER,
       BANKNO,
       CREATOR,
       CREATETIME,
       STAUTS,
       CAUSE,
       ENTERPRISESCALE,
       LICENSECODE,
       FINANCIALCODE,
       CLTSTATE,
       EMAIL,
       FINANCIALCONTACT,
       ENDDATE,
       STOCKCODE,
       SITEAREA,
       SITETITLE,
       EMPLOYEESNUM,
       TAXNUM,
       LANDTAXNUM,
       PRODUCTSMAJOR,
       LISTEDPLACE,
       PROVINCE,
       CITY,
       DISTRICT,
       BORRNATURE,
       MECCODE,
       PROJECTNAME,
       COMPANTYATTRIBUTE,
       REGIONTEXT,
       LEFTFIG_N3,
       RIGHTFIG_N3,
       DEPT_TYPE,
       ORG_PARENT_ID,
       ROLEGROUPID,
       FINA_PRINCIPAL,
       PRIMARY_ACC_NO,
       CONTACT_PERSON,
       REMARK_,
       SYNC_FLAG,
       SYNC_VERSION,
       AUTH_BY_USER_FLAG,
       AGENCY_NO,
       STATUS,
       ORG_ORDER,
       ORG_LEVEL,
       MOBILE_PHONE,
       ORGCLASSID,
       BRNO,
       BASE_ACCOUNT_STATE,
       INVOICERECADDR,
       INVOICERECPHONE,
       INVOICERECNAME,
       FORTDRTFG,
       BCOMMADD,
       ORGTYPEDETAIL,
       ORGTYPE,
       APPRONUM,
       REGNUMCODE,
       REGCODE,
       INSTICREDITCODE,
       MANAGEBANKCODE,
       CLTTYPE,
       PARENT_ID,
       ORGCODE_ENDDATE,
       REREDT,
       CURDFLAG,
       DETAILEDTYPE,
       THREECARDBYONE,
       THREECARDBYONE_DATE,
       APPRO_DATE,
       INSTICREDITCODE_DATE,
       SEOPENINGBANK,
       SENUMBER,
       LEGALPERIDTYPE,
       LEGALPERID_DATE,
       REALHOLDINGNAME,
       REALHOLDINGTYPE,
       REALHOLDINGCARDNUMBER,
       REALHOLDINGCARD_DATE,
       SHAREHOLDER_ONE_NAME,
       SHAREHOLDER_ONE_CARDTYPE,
       SHAREHOLDER_ONE_CARDNUMBER,
       SHAREHOLDER_ONE_CARDDATE,
       SHAREHOLDER_TWO_NAME,
       SHAREHOLDER_TWO_CARDTYPE,
       SHAREHOLDER_TWO_CARDNUMBER,
       SHAREHOLDER_TWO_CARDDATE,
       AGENTNAME,
       AGENT_CARDTYPE,
       AGENT_CARDNUMBER,
       AGENT_CARDDATE,
       CBRCBUSINESSID,
       U_SHIELD_DATE,
       ACCOUNT_NATURE,
       ACCOUNT_STATUS,
       CANCELLATION_DATE,
       LASTCHANGE_DATE,

       '${edate}' as sjrq, '2' as MAKEUP_STATUS
FROM CLT_CLT_INFO;

/*
字段缺失
       INDUSTRYMIN,
       INDUSTRYMBTD,
       LASTUPDATETIME,
       CODE_FOR_UPDATE,
       NAME_FOR_UPDATE,
       CUSTOMERTYPE,
       TRUE_PARENT_ID,*/


-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_CLT_INFO  -- 客户基本信息表
-- auto-generated definition
create table CLT_CLT_INFO
(
    ID                         NUMBER(6) not null
        constraint PK_CLT_CLT_INFO
            primary key,
    TYPE                       NUMBER,
    CLTNO                      VARCHAR2(30)
        constraint UK_CLT_CLT_INFO_CLTNO
            unique,
    TREENO                     VARCHAR2(24),
    CHINESENAME                VARCHAR2(100),
    ABBREVIATION               VARCHAR2(100),
    NAME                       VARCHAR2(100),
    OPBANK                     VARCHAR2(80),
    ACNTNO                     VARCHAR2(32),
    INTERNETSITE               VARCHAR2(30),
    PHONE                      VARCHAR2(60),
    BUSSADDR                   VARCHAR2(255),
    POSTCODE                   VARCHAR2(6),
    FAX                        VARCHAR2(30),
    DEPINCHARGE                VARCHAR2(60),
    DAYOFESTB                  DATE,
    INDUSTRY                   NUMBER
        constraint FK_CLT_REF_CONF1
            references CLT_CONF_INFO,
    RANKING                    NUMBER,
    ORGCODE                    VARCHAR2(30),
    FINANTYPE                  NUMBER,
    LISENSENO                  VARCHAR2(50),
    TAXREGNO                   VARCHAR2(50),
    LOANNO                     VARCHAR2(50),
    OPRATETERM                 VARCHAR2(20),
    FERC                       VARCHAR2(50),
    BUSSSCOPE                  VARCHAR2(2000),
    REGCAPITAL                 NUMBER(16, 2),
    CUR                        VARCHAR2(8),
    REGADDR                    VARCHAR2(100),
    LEGALPERZIP                VARCHAR2(10),
    LEGALPER                   VARCHAR2(60),
    LEGALPERID                 VARCHAR2(18),
    LEGALPERPHONE              VARCHAR2(30),
    CREDITLEVEL                NUMBER
        constraint FK_CLT_REF_CONF2
            references CLT_CONF_INFO,
    EVALAUTH                   VARCHAR2(60),
    EVALTIME                   DATE,
    CREDITRATING               NUMBER
        constraint FK_CLT_REF_CONF3
            references CLT_CONF_INFO,
    EXTCLTNO                   VARCHAR2(30),
    ISLISTED                   NUMBER,
    AREA                       NUMBER,
    COUNTRYCODE                CHAR(3),
    INGROUP                    VARCHAR2(100),
    NATURE                     NUMBER,
    CORPTYPE                   NUMBER,
    CORSUBTYPE                 NUMBER,
    OTHER                      VARCHAR2(1024),
    BANKNO                     VARCHAR2(30),
    CREATOR                    VARCHAR2(24),
    CREATETIME                 DATE,
    STAUTS                     NUMBER,
    CAUSE                      VARCHAR2(200),
    ENTERPRISESCALE            NUMBER,
    LICENSECODE                VARCHAR2(30),
    FINANCIALCODE              VARCHAR2(20),
    CLTSTATE                   NUMBER       default 0,
    EMAIL                      VARCHAR2(50),
    FINANCIALCONTACT           VARCHAR2(50),
    ENDDATE                    DATE,
    STOCKCODE                  VARCHAR2(50),
    SITEAREA                   NUMBER(15, 4),
    SITETITLE                  VARCHAR2(50),
    EMPLOYEESNUM               NUMBER,
    TAXNUM                     VARCHAR2(50),
    LANDTAXNUM                 VARCHAR2(50),
    PRODUCTSMAJOR              VARCHAR2(50),
    LISTEDPLACE                VARCHAR2(50),
    PROVINCE                   VARCHAR2(50),
    CITY                       VARCHAR2(50),
    DISTRICT                   VARCHAR2(50),
    BORRNATURE                 NUMBER,
    MECCODE                    VARCHAR2(50),
    PROJECTNAME                VARCHAR2(200),
    COMPANTYATTRIBUTE          NUMBER,
    REGIONTEXT                 VARCHAR2(200),
    LEFTFIG_N3                 NUMBER(38),
    RIGHTFIG_N3                NUMBER(38),
    DEPT_TYPE                  VARCHAR2(50),
    ORG_PARENT_ID              VARCHAR2(32),
    ROLEGROUPID                NUMBER,
    FINA_PRINCIPAL             VARCHAR2(30),
    PRIMARY_ACC_NO             VARCHAR2(32),
    CONTACT_PERSON             VARCHAR2(80),
    REMARK_                    VARCHAR2(500),
    SYNC_FLAG                  NUMBER,
    SYNC_VERSION               NUMBER,
    AUTH_BY_USER_FLAG          NUMBER,
    AGENCY_NO                  VARCHAR2(32),
    STATUS                     CHAR,
    ORG_ORDER                  NUMBER,
    ORG_LEVEL                  NUMBER,
    MOBILE_PHONE               VARCHAR2(32),
    ORGCLASSID                 NUMBER(18)   default 0,
    BRNO                       VARCHAR2(4),
    BASE_ACCOUNT_STATE         VARCHAR2(20),
    INVOICERECADDR             VARCHAR2(50),
    INVOICERECPHONE            VARCHAR2(20),
    INVOICERECNAME             VARCHAR2(32),
    FORTDRTFG                  VARCHAR2(20),
    BCOMMADD                   VARCHAR2(80),
    ORGTYPEDETAIL              VARCHAR2(20),
    ORGTYPE                    VARCHAR2(20),
    APPRONUM                   VARCHAR2(20),
    REGNUMCODE                 VARCHAR2(20),
    REGCODE                    VARCHAR2(20),
    INSTICREDITCODE            VARCHAR2(20),
    MANAGEBANKCODE             VARCHAR2(20),
    CLTTYPE                    VARCHAR2(20),
    PARENT_ID                  NUMBER(6),
    ORGCODE_ENDDATE            DATE,
    REREDT                     DATE,
    CURDFLAG                   NUMBER(1)    default 0,
    DETAILEDTYPE               VARCHAR2(1000),
    THREECARDBYONE             VARCHAR2(100),
    THREECARDBYONE_DATE        DATE,
    APPRO_DATE                 DATE,
    INSTICREDITCODE_DATE       DATE,
    SEOPENINGBANK              VARCHAR2(1000),
    SENUMBER                   VARCHAR2(1000),
    LEGALPERIDTYPE             NUMBER,
    LEGALPERID_DATE            DATE,
    REALHOLDINGNAME            VARCHAR2(1000),
    REALHOLDINGTYPE            NUMBER,
    REALHOLDINGCARDNUMBER      VARCHAR2(50),
    REALHOLDINGCARD_DATE       DATE,
    SHAREHOLDER_ONE_NAME       VARCHAR2(50),
    SHAREHOLDER_ONE_CARDTYPE   NUMBER,
    SHAREHOLDER_ONE_CARDNUMBER VARCHAR2(50),
    SHAREHOLDER_ONE_CARDDATE   DATE,
    SHAREHOLDER_TWO_NAME       VARCHAR2(50),
    SHAREHOLDER_TWO_CARDTYPE   NUMBER,
    SHAREHOLDER_TWO_CARDNUMBER VARCHAR2(50),
    SHAREHOLDER_TWO_CARDDATE   DATE,
    AGENTNAME                  VARCHAR2(50),
    AGENT_CARDTYPE             NUMBER,
    AGENT_CARDNUMBER           VARCHAR2(50),
    AGENT_CARDDATE             DATE,
    CBRCBUSINESSID             VARCHAR2(1000),
    U_SHIELD_DATE              DATE,
    ACCOUNT_NATURE             NUMBER,
    ACCOUNT_STATUS             NUMBER,
    CANCELLATION_DATE          DATE,
    LASTCHANGE_DATE            DATE,
    SHAREMETHOD                VARCHAR2(30),
    ISENCRYPTY                 VARCHAR2(2),
    REGISTERED                 VARCHAR2(10),
    ECONOMYDEPT                VARCHAR2(50),
    HOLDINGTYPE                VARCHAR2(50),
    RURALCITYSIGNS             VARCHAR2(50) default 'N',
    INSTITUTIONALLEVEL         VARCHAR2(50),
    PARENTINSTITUTIONSNO       VARCHAR2(50),
    FINANCIALINSTITUTIONTYPE   VARCHAR2(50)
)
/

comment on table CLT_CLT_INFO is '客户基本信息表'
/

comment on column CLT_CLT_INFO.ID is '主键'
/

comment on column CLT_CLT_INFO.TYPE is '客户类型'
/

comment on column CLT_CLT_INFO.CLTNO is '客户编号'
/

comment on column CLT_CLT_INFO.TREENO is '级别编码'
/

comment on column CLT_CLT_INFO.CHINESENAME is '客户中文名称'
/

comment on column CLT_CLT_INFO.ABBREVIATION is '简称'
/

comment on column CLT_CLT_INFO.NAME is '客户英文名称'
/

comment on column CLT_CLT_INFO.OPBANK is '基本账户开户行'
/

comment on column CLT_CLT_INFO.ACNTNO is '账号'
/

comment on column CLT_CLT_INFO.INTERNETSITE is '单位网址'
/

comment on column CLT_CLT_INFO.PHONE is '联系电话'
/

comment on column CLT_CLT_INFO.BUSSADDR is '注册登记地址'
/

comment on column CLT_CLT_INFO.POSTCODE is '邮政编码'
/

comment on column CLT_CLT_INFO.FAX is '传真号码'
/

comment on column CLT_CLT_INFO.DEPINCHARGE is '主管部门'
/

comment on column CLT_CLT_INFO.DAYOFESTB is '成立时间'
/

comment on column CLT_CLT_INFO.INDUSTRY is '行业分类'
/

comment on column CLT_CLT_INFO.RANKING is '行业排名'
/

comment on column CLT_CLT_INFO.ORGCODE is '组织机构代码'
/

comment on column CLT_CLT_INFO.FINANTYPE is '经济类型'
/

comment on column CLT_CLT_INFO.LISENSENO is '登记注册号'
/

comment on column CLT_CLT_INFO.TAXREGNO is '税务登记号'
/

comment on column CLT_CLT_INFO.LOANNO is '贷款卡编码'
/

comment on column CLT_CLT_INFO.OPRATETERM is '经营期限'
/

comment on column CLT_CLT_INFO.FERC is '外汇登记证'
/

comment on column CLT_CLT_INFO.BUSSSCOPE is '经营范围'
/

comment on column CLT_CLT_INFO.REGCAPITAL is '注册资金'
/

comment on column CLT_CLT_INFO.CUR is '注册资本币种'
/

comment on column CLT_CLT_INFO.REGADDR is '注册地址'
/

comment on column CLT_CLT_INFO.LEGALPERZIP is '法人邮政编码'
/

comment on column CLT_CLT_INFO.LEGALPER is '法人代表'
/

comment on column CLT_CLT_INFO.LEGALPERID is '法人代表身份证号'
/

comment on column CLT_CLT_INFO.LEGALPERPHONE is '法人代表联系电话'
/

comment on column CLT_CLT_INFO.CREDITLEVEL is '信用等级'
/

comment on column CLT_CLT_INFO.EVALAUTH is '评估机构'
/

comment on column CLT_CLT_INFO.EVALTIME is '评估时间'
/

comment on column CLT_CLT_INFO.CREDITRATING is '资信等级'
/

comment on column CLT_CLT_INFO.EXTCLTNO is '附加客户编码'
/

comment on column CLT_CLT_INFO.ISLISTED is '是否上市'
/

comment on column CLT_CLT_INFO.AREA is '境内外'
/

comment on column CLT_CLT_INFO.COUNTRYCODE is '国家代码'
/

comment on column CLT_CLT_INFO.INGROUP is '归属集团'
/

comment on column CLT_CLT_INFO.NATURE is '性质'
/

comment on column CLT_CLT_INFO.CORPTYPE is '企业类型'
/

comment on column CLT_CLT_INFO.CORSUBTYPE is '公用企业明细类型'
/

comment on column CLT_CLT_INFO.OTHER is '其他'
/

comment on column CLT_CLT_INFO.BANKNO is '行号'
/

comment on column CLT_CLT_INFO.CREATOR is '录入人'
/

comment on column CLT_CLT_INFO.CREATETIME is '录入时间'
/

comment on column CLT_CLT_INFO.STAUTS is '状态'
/

comment on column CLT_CLT_INFO.CAUSE is '驳回原因'
/

comment on column CLT_CLT_INFO.ENTERPRISESCALE is '企业规模'
/

comment on column CLT_CLT_INFO.LICENSECODE is '金融许可证代码'
/

comment on column CLT_CLT_INFO.FINANCIALCODE is '金融机构代码'
/

comment on column CLT_CLT_INFO.EMAIL is 'Email地址'
/

comment on column CLT_CLT_INFO.FINANCIALCONTACT is '财务联系方式'
/

comment on column CLT_CLT_INFO.ENDDATE is '营业执照到期日期'
/

comment on column CLT_CLT_INFO.STOCKCODE is '股票代码'
/

comment on column CLT_CLT_INFO.SITEAREA is '经营场地面积'
/

comment on column CLT_CLT_INFO.SITETITLE is '经营场地所有权'
/

comment on column CLT_CLT_INFO.EMPLOYEESNUM is '从业人数'
/

comment on column CLT_CLT_INFO.TAXNUM is '国税登记证号码'
/

comment on column CLT_CLT_INFO.LANDTAXNUM is '地税登记证号码'
/

comment on column CLT_CLT_INFO.PRODUCTSMAJOR is '主要产品情况'
/

comment on column CLT_CLT_INFO.LISTEDPLACE is '上市地'
/

comment on column CLT_CLT_INFO.PROVINCE is '省'
/

comment on column CLT_CLT_INFO.CITY is '市'
/

comment on column CLT_CLT_INFO.DISTRICT is '区'
/

comment on column CLT_CLT_INFO.BORRNATURE is '借款人性质'
/

comment on column CLT_CLT_INFO.PROJECTNAME is '项目名称'
/

comment on column CLT_CLT_INFO.COMPANTYATTRIBUTE is '公司属性'
/

comment on column CLT_CLT_INFO.REGIONTEXT is '区域'
/

comment on column CLT_CLT_INFO.DEPT_TYPE is '单位类型'
/

comment on column CLT_CLT_INFO.INVOICERECADDR is '发票收件人地址'
/

comment on column CLT_CLT_INFO.INVOICERECPHONE is '发票收件人电话'
/

comment on column CLT_CLT_INFO.INVOICERECNAME is '发票收件人姓名'
/

comment on column CLT_CLT_INFO.DETAILEDTYPE is '明细类别'
/

comment on column CLT_CLT_INFO.THREECARDBYONE is '三证合一号码'
/

comment on column CLT_CLT_INFO.THREECARDBYONE_DATE is '三证合一有效期'
/

comment on column CLT_CLT_INFO.APPRO_DATE is '开户许可证有效期'
/

comment on column CLT_CLT_INFO.INSTICREDITCODE_DATE is '机构信用代码有效期'
/

comment on column CLT_CLT_INFO.SEOPENINGBANK is '银企直联开户行'
/

comment on column CLT_CLT_INFO.SENUMBER is '银企直联账号'
/

comment on column CLT_CLT_INFO.LEGALPERIDTYPE is '法人代表证件类型'
/

comment on column CLT_CLT_INFO.LEGALPERID_DATE is '法人代表证件有效期'
/

comment on column CLT_CLT_INFO.REALHOLDINGNAME is '实际控股人姓名'
/

comment on column CLT_CLT_INFO.REALHOLDINGTYPE is '实际控股人证件类型'
/

comment on column CLT_CLT_INFO.REALHOLDINGCARDNUMBER is '实际控股人证件号码'
/

comment on column CLT_CLT_INFO.REALHOLDINGCARD_DATE is '实际控股人证件有效期'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_ONE_NAME is '股东1姓名'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_ONE_CARDTYPE is '股东1证件类型'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_ONE_CARDNUMBER is '股东1证件号码'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_ONE_CARDDATE is '股东1证件有效期'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_TWO_NAME is '股东2姓名'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_TWO_CARDTYPE is '股东2证件类型'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_TWO_CARDNUMBER is '股东2证件号码'
/

comment on column CLT_CLT_INFO.SHAREHOLDER_TWO_CARDDATE is '股东2证件有效期'
/

comment on column CLT_CLT_INFO.AGENTNAME is '经办人'
/

comment on column CLT_CLT_INFO.AGENT_CARDTYPE is '经办人证件类型'
/

comment on column CLT_CLT_INFO.AGENT_CARDNUMBER is '经办人证件号码'
/

comment on column CLT_CLT_INFO.AGENT_CARDDATE is '经办人证件有效期'
/

comment on column CLT_CLT_INFO.CBRCBUSINESSID is '银监会小企业标识'
/

comment on column CLT_CLT_INFO.U_SHIELD_DATE is 'U盾到期日'
/

comment on column CLT_CLT_INFO.ACCOUNT_NATURE is '账户性质'
/

comment on column CLT_CLT_INFO.ACCOUNT_STATUS is '账户状态'
/

comment on column CLT_CLT_INFO.CANCELLATION_DATE is '销户时间'
/

comment on column CLT_CLT_INFO.LASTCHANGE_DATE is '最后一次变更时间'
/

comment on column CLT_CLT_INFO.ISENCRYPTY is '涉密法人标识'
/

comment on column CLT_CLT_INFO.REGISTERED is '注册地区'
/
 Show table preview */


-- 表清单中存在