-- 执行SQL脚本

-- delete from ODS_GLS_KM WHERE yr >= extract(year from date '${sdate}')

-- 表输入

SELECT YR,
       KM,
       case when km = '400106' then 'XXXX' ELSE KMNAME END AS KMNAME,
       DIR,
       KMGRP,
       KMLEVEL,
       ISLEAF,
       CASHTYPE,
       QTYFLAG,
       QTYUNIT,
       BUSINESS,
       OUTFLAG,
       LIMITMODE,
       QUOTA,
       KMPATH,
       USESTATE,
       CREATETIME,
       LASTUPDATETIME
FROM GLS_KM
where yr >= extract(year from date '${sdate}');

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: GLS_KM  -- 科目_GLS_KM
-- auto-generated definition
create table GLS_KM
(
    YR                 NUMBER           not null
        constraint FK_GLS_YEAR_2_GLS_KM
            references GLS_YEAR
        constraint CKC_GLS_KM_YR
            check (YR between 1900 and 2999),
    KM                 VARCHAR2(16)     not null,
    KMNAME             VARCHAR2(80)     not null,
    DIR                NUMBER           not null
        constraint CKC_GLS_KM_DIR
            check (DIR = 1 OR DIR = 2),
    KMGRP              VARCHAR2(6)      not null
        constraint CKC_GLS_KM_KMGRP
            check (KMGRP = '1' OR KMGRP = '2' OR KMGRP = '3' OR KMGRP = '4' OR KMGRP = '5' OR KMGRP = '6'),
    KMLEVEL            NUMBER default 0
        constraint CKC_GLS_KM_KMLEVEL
            check (KMLEVEL >= 0),
    ISLEAF             NUMBER default 1
        constraint CKC_GLS_KM_ISLEAF
            check (ISLEAF = 0 OR ISLEAF = 1),
    CASHTYPE           NUMBER default 0 not null
        constraint CKC_GLS_KM_CASHTYPE
            check (CASHTYPE = 0 OR CASHTYPE = 1 OR CASHTYPE = 2),
    QTYFLAG            NUMBER default 0 not null
        constraint CKC_GLS_KM_QTYFLAG
            check (QTYFLAG = 0 OR QTYFLAG = 1 OR QTYFLAG = 2),
    QTYUNIT            VARCHAR2(8),
    BUSINESS           NUMBER,
    OUTFLAG            NUMBER,
    LIMITMODE          NUMBER,
    QUOTA              NUMBER(16, 2),
    KMPATH             VARCHAR2(255),
    USESTATE           NUMBER default 0 not null
        constraint CKC_GLS_KM_USESTATE
            check (USESTATE = 0 OR USESTATE = 1 OR USESTATE = 2),
    CREATETIME         DATE,
    LASTUPDATETIME     DATE,
    BELONGBUSINESSTYPE VARCHAR2(60),
    constraint PK_GLS_KM
        primary key (YR, KM)
)
/

comment on table GLS_KM is '科目_GLS_KM'
/

comment on column GLS_KM.YR is '年度'
/

comment on column GLS_KM.KM is '科目号'
/

comment on column GLS_KM.KMNAME is '科目名'
/

comment on column GLS_KM.DIR is '借贷标记 1:借 2:贷'
/

comment on column GLS_KM.KMGRP is '所属类别 1-资产类 2-负债类 3-共同类 4-权益类 5-损益类 '
/

comment on column GLS_KM.KMLEVEL is '科目级别 1：一级科目；2：二级科目，依此类推；'
/

comment on column GLS_KM.ISLEAF is '明细标记 1：明细；0：非明细'
/

comment on column GLS_KM.CASHTYPE is '银行现金标记 2：现金类，1：银行类，0：既非现金又非银行类；'
/

comment on column GLS_KM.QTYFLAG is '数量标记 1：数量类型，0：非数量类；如：121为数量类，单位为股'
/

comment on column GLS_KM.QTYUNIT is '数量单位'
/

comment on column GLS_KM.BUSINESS is '结算专用标记0-财务专用  1-结算财务共用 2-结算专用'
/

comment on column GLS_KM.OUTFLAG is '账外可用标记 1：可用，0：不可用'
/

comment on column GLS_KM.LIMITMODE is '限额标记 0：不限额，1：限余额，2：限累计贷方，3：限累计贷方'
/

comment on column GLS_KM.QUOTA is '限额金额'
/

comment on column GLS_KM.KMPATH is '科目全称'
/

comment on column GLS_KM.USESTATE is '使用状态 0,正常 1,冻结 2,清户'
/

comment on column GLS_KM.CREATETIME is '创建时间'
/

comment on column GLS_KM.LASTUPDATETIME is '最后更新时间'
/

create index IX_AKM_DIR
    on GLS_KM (DIR)
/

create index IX_AKM_ISLEAF
    on GLS_KM (ISLEAF)
/

create index FK_GLS_YEAR_2_GLS_KM
    on GLS_KM (YR)
/

create index IX_AKM_LEVEL
    on GLS_KM (KMLEVEL)
/

create index IX_AKM_MISC
    on GLS_KM (CASHTYPE, KMGRP, BUSINESS)
/
 Show table preview */
