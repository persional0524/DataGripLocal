-- 表输入
SELECT yr,
       startflag,
       startdate,
       closetag,
       turnflag
FROM GLS_YEAR;

-- ddl
/*
-- 会计年度_GLS_YEAR
-- auto-generated definition
create table GLS_YEAR
(
    YR        NUMBER           not null
        constraint PK_GLS_YEAR
            primary key
        constraint CKC_GLS_YEAR_YR
            check (YR between 1900 and 2999),
    STARTFLAG NUMBER default 0 not null
        constraint CKC_GLS_YEAR_STARTFLAG
            check (STARTFLAG = 0 OR STARTFLAG = 1),
    STARTDATE DATE             not null,
    CLOSETAG  NUMBER default 0 not null
        constraint CKC_GLS_YEAR_CLOSETAG
            check (CLOSETAG = 0 OR CLOSETAG = 1 OR CLOSETAG = 2),
    TURNFLAG  NUMBER           not null
)
/

comment on table GLS_YEAR is '会计年度_GLS_YEAR'
/

comment on column GLS_YEAR.YR is '年度'
/

comment on column GLS_YEAR.STARTFLAG is '启用标记 1启用;0未启用'
/

comment on column GLS_YEAR.STARTDATE is '启用日期'
/

comment on column GLS_YEAR.CLOSETAG is '年度结帐标记'
/

comment on column GLS_YEAR.TURNFLAG is '年度结转标记'
/*/


-- 总结 核心列表中存在