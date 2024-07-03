-- 执行SQL脚本

delete
from STG_CORPORATIONS
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CORPORATIONS', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入

SELECT CORPID,
       CORPNO,
       CORPNAME,
       CORPNAMEEN,
       VOCATION,
       ECONOMYTYPE,
       ZXGRADE,
       CRGRADE,
       CRGRADE_PROJECT,
       ORGANCODE,
       LICENCE,
       WORKINGRANGE,
       REGADDR,
       REGDATE,
       POSTALCODE,
       ARTIFICIALPERSON,
       APIDCARD,
       APTEL,
       REVENUECARD,
       TIMELIMIT,
       WORKINGADDR,
       LOANCARD,
       AUTHDEPUTY,
       FOREXCHANGECARD,
       FINGOVERNOR,
       FGTEL,
       FGEMAIL,
       REMARK,
       EVALUATINGORGAN,
       EVALUATINGTIME,
       PRACTICETIME,
       HOMEPAGE,
       COMPLEXCODE,
       INPUTOR,
       INPUTIME,
       INBLACKLIST,
       GENERALMANAGER,
       GENERALPHONE,
       FINICALDEMO,
       FINICALDPHONE,
       FINICALMANAGER,
       FINICALMPHONE,
       CLTSTATE,
       CLTTYPE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CORPORATIONS;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CORPORATIONS  -- 企业类客户
-- auto-generated definition
create table CORPORATIONS
(
    CORPID           NUMBER        not null
        constraint PK_CORPORATIONS
            primary key,
    CORPNO           VARCHAR2(32)  not null,
    CORPNAME         VARCHAR2(100) not null,
    CORPNAMEEN       VARCHAR2(100),
    VOCATION         VARCHAR2(32),
    ECONOMYTYPE      VARCHAR2(32)
        constraint FK_CORPORAT_ECONOMYTY_CODES
            references CODES,
    ZXGRADE          VARCHAR2(32)
        constraint FK_CORPORAT_ZXGRADE_CODES
            references CODES,
    CRGRADE          VARCHAR2(32)
        constraint FK_CORPORAT_CRGRADE_CODES
            references CODES,
    CRGRADE_PROJECT  VARCHAR2(32),
    ORGANCODE        VARCHAR2(60),
    LICENCE          VARCHAR2(60),
    WORKINGRANGE     VARCHAR2(1024),
    REGADDR          VARCHAR2(255),
    REGDATE          DATE,
    POSTALCODE       VARCHAR2(6),
    ARTIFICIALPERSON VARCHAR2(20),
    APIDCARD         VARCHAR2(18),
    APTEL            VARCHAR2(255),
    REVENUECARD      VARCHAR2(60),
    TIMELIMIT        VARCHAR2(512),
    WORKINGADDR      VARCHAR2(255),
    LOANCARD         VARCHAR2(60),
    AUTHDEPUTY       VARCHAR2(60),
    FOREXCHANGECARD  VARCHAR2(60),
    FINGOVERNOR      VARCHAR2(20),
    FGTEL            VARCHAR2(255),
    FGEMAIL          VARCHAR2(255),
    REMARK           VARCHAR2(1024),
    EVALUATINGORGAN  VARCHAR2(255),
    EVALUATINGTIME   DATE,
    PRACTICETIME     DATE,
    HOMEPAGE         VARCHAR2(255),
    COMPLEXCODE      VARCHAR2(255),
    INPUTOR          VARCHAR2(100) not null,
    INPUTIME         DATE          not null,
    INBLACKLIST      NUMBER default 0
        constraint CKC_INBLACKLIST_CORPORAT
            check (InBlacklist is null or (InBlacklist between 0 and 1)),
    GENERALMANAGER   VARCHAR2(20),
    GENERALPHONE     VARCHAR2(255),
    FINICALDEMO      VARCHAR2(20),
    FINICALDPHONE    VARCHAR2(255),
    FINICALMANAGER   VARCHAR2(20),
    FINICALMPHONE    VARCHAR2(255),
    CLTSTATE         NUMBER default 0,
    CLTTYPE          NUMBER default 1
)
/

comment on table CORPORATIONS is '企业类客户'
/

comment on column CORPORATIONS.CORPID is '企业类客户ID'
/

comment on column CORPORATIONS.CORPNO is '客户编号'
/

comment on column CORPORATIONS.CORPNAME is '客户名称'
/

comment on column CORPORATIONS.CORPNAMEEN is '客户名称（英文）'
/

comment on column CORPORATIONS.VOCATION is '所属行业'
/

comment on column CORPORATIONS.ECONOMYTYPE is '经济类型
'
/

comment on column CORPORATIONS.ZXGRADE is '资信等级'
/

comment on column CORPORATIONS.CRGRADE is '信用等级'
/

comment on column CORPORATIONS.CRGRADE_PROJECT is '项目评级等级'
/

comment on column CORPORATIONS.ORGANCODE is '企业组织机构代码'
/

comment on column CORPORATIONS.LICENCE is '营业执照号'
/

comment on column CORPORATIONS.WORKINGRANGE is '经营范围'
/

comment on column CORPORATIONS.REGADDR is '注册地址'
/

comment on column CORPORATIONS.REGDATE is '注册日期'
/

comment on column CORPORATIONS.POSTALCODE is '邮政编码'
/

comment on column CORPORATIONS.ARTIFICIALPERSON is '法人代表'
/

comment on column CORPORATIONS.APIDCARD is '法人代表身份证号'
/

comment on column CORPORATIONS.APTEL is '法人联系电话'
/

comment on column CORPORATIONS.REVENUECARD is '税务登记证'
/

comment on column CORPORATIONS.TIMELIMIT is '经营期限'
/

comment on column CORPORATIONS.WORKINGADDR is '营业地址'
/

comment on column CORPORATIONS.LOANCARD is '贷款证号'
/

comment on column CORPORATIONS.AUTHDEPUTY is '授权代表'
/

comment on column CORPORATIONS.FOREXCHANGECARD is '外汇登记证'
/

comment on column CORPORATIONS.FINGOVERNOR is '财务主管'
/

comment on column CORPORATIONS.FGTEL is '财务主管联系电话'
/

comment on column CORPORATIONS.FGEMAIL is '财务主管邮件地址'
/

comment on column CORPORATIONS.REMARK is '备注'
/

comment on column CORPORATIONS.EVALUATINGORGAN is '评估机构'
/

comment on column CORPORATIONS.EVALUATINGTIME is '评估时间'
/

comment on column CORPORATIONS.PRACTICETIME is '开业时间'
/

comment on column CORPORATIONS.HOMEPAGE is '单位网址'
/

comment on column CORPORATIONS.COMPLEXCODE is '复合分类码
'
/

comment on column CORPORATIONS.INPUTOR is '录入人'
/

comment on column CORPORATIONS.INPUTIME is '录入时间'
/

comment on column CORPORATIONS.INBLACKLIST is '是否为预警客户
0：正常客户
1：预警客户'
/

comment on column CORPORATIONS.GENERALMANAGER is '总经理'
/

comment on column CORPORATIONS.GENERALPHONE is '总经理电话'
/

comment on column CORPORATIONS.FINICALDEMO is '财务总监'
/

comment on column CORPORATIONS.FINICALDPHONE is '财务总监电话'
/

comment on column CORPORATIONS.FINICALMANAGER is '财务经理'
/

comment on column CORPORATIONS.FINICALMPHONE is '财务经理电话'
/

comment on column CORPORATIONS.CLTSTATE is '单位状态 0 正常 1注销  2停用'
/

comment on column CORPORATIONS.CLTTYPE is '客户类型：1 成员单位 3 其他合作伙伴'
/

create unique index CORP_UNIQ_IDX
    on CORPORATIONS (CORPNO)
/

create index VOCATION_FK
    on CORPORATIONS (VOCATION)
/

create index ZXGRADE_FK
    on CORPORATIONS (ZXGRADE)
/

create index CRGRADE_FK
    on CORPORATIONS (CRGRADE)
/

create index ECONOMYTYPE_FK
    on CORPORATIONS (ECONOMYTYPE)
/
 Show table preview */

-- list 1
