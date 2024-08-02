
-- 执行SQL脚本 2

-- DELETE FROM ODS_GLS_KM_VAL_INIT WHERE  yr >= extract(year from date '${sdate}')

-- 表输入

SELECT KVI_ID,
       YR,
       CUR_CODE,
       KM,
       JVAL,
       DVAL,
       JQTY,
       DQTY,
       BRANCH_NO,
       CREATETIME,
       LASTUPDATETIME
FROM GLS_KM_VAL_INIT
WHERE yr >= extract(year from date '${sdate}');

-- 1951
select count(1) from GLS_KM_VAL_INIT
-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: GLS_KM_VAL_INIT  -- 年初科目余额_GLS_KM_VAL_INIT
-- auto-generated definition
create table GLS_KM_VAL_INIT
(
    KVI_ID         NUMBER       not null
        constraint PK_GLS_KM_VAL_INIT
            primary key,
    YR             NUMBER       not null
        constraint CKC_GLS_KM_VAL_INIT_YR
            check (YR between 1900 and 2999),
    CUR_CODE       VARCHAR2(8)  not null,
    KM             VARCHAR2(16) not null,
    JVAL           NUMBER(16, 2),
    DVAL           NUMBER(16, 2),
    JQTY           NUMBER(16, 4),
    DQTY           NUMBER(16, 4),
    BRANCH_NO      VARCHAR2(6)  not null,
    CREATETIME     DATE,
    LASTUPDATETIME DATE,
    constraint FK_GLS_KM_2_GLS_KM_VAL_INIT
        foreign key (YR, KM) references GLS_KM
)
/

comment on table GLS_KM_VAL_INIT is '年初科目余额_GLS_KM_VAL_INIT'
/

comment on column GLS_KM_VAL_INIT.YR is '年度'
/

comment on column GLS_KM_VAL_INIT.CUR_CODE is '币种代号'
/

comment on column GLS_KM_VAL_INIT.KM is '科目号'
/

comment on column GLS_KM_VAL_INIT.JVAL is '借方金额'
/

comment on column GLS_KM_VAL_INIT.DVAL is '贷方金额'
/

comment on column GLS_KM_VAL_INIT.JQTY is '借方数量'
/

comment on column GLS_KM_VAL_INIT.DQTY is '贷方数量'
/

comment on column GLS_KM_VAL_INIT.BRANCH_NO is '机构号'
/

comment on column GLS_KM_VAL_INIT.CREATETIME is '创建时间'
/

comment on column GLS_KM_VAL_INIT.LASTUPDATETIME is '最后更新时间'
/

create index IND_GLS_KM_VAL_INIT_KM
    on GLS_KM_VAL_INIT (KM)
/

create index IND_GLS_KM_VAL_INIT_CUR_CODE
    on GLS_KM_VAL_INIT (CUR_CODE)
/

create index IND_GLS_KM_VAL_INIT_BRANCH_NO
    on GLS_KM_VAL_INIT (BRANCH_NO)
/

create index FK_GLS_KM_VAL_INIT_YR_KM
    on GLS_KM_VAL_INIT (YR, KM)
/
 Show table preview */

-- 表清单中存在
