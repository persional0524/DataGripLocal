-- 执行SQL脚本
-- DELETE FROM ODS_GLS_VOUCHER WHERE  VDATE >= to_date('${sdate}','yyyy-MM-dd')

-- 表输入 2
SELECT VID,
       UUID,
       BRANCH_NO,
       YR,
       VGNO,
       PRD,
       VNO,
       VDATE,
       CUR_CODE,
       PROMPTVAL,
       PROMPTEXPLAIN,
       VSTATE,
       CREATOR,
       CHECKER,
       BOOKER,
       CREATORNAME,
       CHECKERNAME,
       BOOKERNAME,
       APPENDIX,
       VCHTYPE,
       CREATETIME,
       LASTUPDATETIME
FROM GLS_VOUCHER
WHERE VDATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- ddl

/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: GLS_VOUCHER  -- 凭证_GLS_VOUCHER
-- auto-generated definition
create table GLS_VOUCHER
(
    VID            NUMBER                not null
        constraint PK_GLS_VOUCHER
            primary key,
    UUID           VARCHAR2(36),
    BRANCH_NO      VARCHAR2(6),
    YR             NUMBER                not null
        constraint CKC_GLS_VOUCHER_YR
            check (YR between 1900 and 2999),
    VGNO           VARCHAR2(4) default 0,
    PRD            VARCHAR2(6),
    VNO            NUMBER                not null,
    VDATE          DATE                  not null,
    CUR_CODE       VARCHAR2(8)           not null,
    PROMPTVAL      NUMBER(16, 2),
    PROMPTEXPLAIN  VARCHAR2(255),
    VSTATE         NUMBER      default 0 not null
        constraint CKC_GLS_VOUCHER_VSTATE
            check (VSTATE = 0 OR VSTATE = 1 OR VSTATE = 2),
    CREATOR        VARCHAR2(100)         not null,
    CHECKER        VARCHAR2(100),
    BOOKER         VARCHAR2(100),
    CREATORNAME    VARCHAR2(100)         not null,
    CHECKERNAME    VARCHAR2(100),
    BOOKERNAME     VARCHAR2(100),
    APPENDIX       NUMBER      default 0 not null,
    VCHTYPE        NUMBER      default 0 not null,
    CREATETIME     DATE                  not null,
    LASTUPDATETIME DATE,
    constraint FK_GLS_PERIOD_2_GLS_VOUCHER
        foreign key (YR, PRD) references GLS_PERIOD,
    constraint FK_GLS_VCHGRP_2_GLS_VOUCHER
        foreign key (YR, VGNO) references GLS_VCHGRP
)
/

comment on table GLS_VOUCHER is '凭证_GLS_VOUCHER'
/

comment on column GLS_VOUCHER.VID is '凭证ID'
/

comment on column GLS_VOUCHER.UUID is '全局唯一码'
/

comment on column GLS_VOUCHER.BRANCH_NO is '机构号'
/

comment on column GLS_VOUCHER.YR is '年度'
/

comment on column GLS_VOUCHER.VGNO is '字类编号'
/

comment on column GLS_VOUCHER.PRD is '期间编号'
/

comment on column GLS_VOUCHER.VNO is '凭证编号'
/

comment on column GLS_VOUCHER.VDATE is '制证日期'
/

comment on column GLS_VOUCHER.CUR_CODE is '币种'
/

comment on column GLS_VOUCHER.PROMPTVAL is '提示金额'
/

comment on column GLS_VOUCHER.PROMPTEXPLAIN is '提示摘要'
/

comment on column GLS_VOUCHER.VSTATE is '凭证状态0,录入;1,审核;2,记账'
/

comment on column GLS_VOUCHER.CREATOR is '制证人编号'
/

comment on column GLS_VOUCHER.CHECKER is '审核人编号'
/

comment on column GLS_VOUCHER.BOOKER is '记帐人编号'
/

comment on column GLS_VOUCHER.CREATORNAME is '制证人名称'
/

comment on column GLS_VOUCHER.CHECKERNAME is '审核人名称'
/

comment on column GLS_VOUCHER.BOOKERNAME is '记帐人名称'
/

comment on column GLS_VOUCHER.APPENDIX is '附件张数'
/

comment on column GLS_VOUCHER.VCHTYPE is '类型标记 0:手工凭证;1:自动转账;2:标准模板;20:结算凭证'
/

comment on column GLS_VOUCHER.CREATETIME is '创建时间'
/

comment on column GLS_VOUCHER.LASTUPDATETIME is '最后更新时间'
/

create index FK_GLS_VCHGRP_2_GLS_VOUCHER
    on GLS_VOUCHER (YR)
/

create index IND_GLS_VOUCHER_VSTATE
    on GLS_VOUCHER (VSTATE)
/

create index IND_GLS_VOUCHER_CHECKER
    on GLS_VOUCHER (CHECKER, CREATOR)
/

create index IND_GLS_VOUCHER_CUR_CODE
    on GLS_VOUCHER (CUR_CODE)
/

create index IND_GLS_VOUCHER_VDATE
    on GLS_VOUCHER (VDATE)
/

create index IND_GLS_VOUCHER_BRANCH_NO
    on GLS_VOUCHER (BRANCH_NO)
/
 Show table preview */

-- 列表清单中存在