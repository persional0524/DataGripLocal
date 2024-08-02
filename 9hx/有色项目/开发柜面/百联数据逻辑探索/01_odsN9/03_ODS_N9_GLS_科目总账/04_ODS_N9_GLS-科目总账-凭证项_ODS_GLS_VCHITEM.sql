-- 执行SQL脚本
-- DELETE FROM ODS_GLS_VCHITEM WHERE  VDATE >= date '${sdate}'

-- 表输入
SELECT VIID,
       YR,
       KM,
       VID,
       UUID,
       DIR,
       EXPLAIN,
       VAL,
       LOCALRATE,
       ORIGINALVAL,
       PRICE,
       QTY,
       UNIT,
       AUXCODE,
       OPTAG,
       OPKM,
       OPKMNAME,
       TXID,
       VCH_ID,
       CUST_NO,
       TAIL_DIFFERENCE,
       SYS_CASHFLOW,
       SYS_DEPTCONTACT,
       SYS_PERSONALCONTACT,
       USER_DEF1,
       USER_DEF2,
       USER_DEF3,
       USER_DEF4,
       USER_DEF5,
       USER_DEF6,
       USER_DEF7,
       USER_DEF8,
       USER_DEF9,
       USER_DEF10,
       USER_DEF11,
       USER_DEF12,
       USER_DEF13,
       USER_DEF14,
       USER_DEF15,
       ASSISTDESC,
       ASSIST,
       FINGERPRINT
--        BRANCH_NO,
--        CUR_CODE
       -- VDATE
FROM GLS_VCHITEM
WHERE VDATE >= to_date('${sdate}', 'yyyy-MM-dd');

/*
      字段缺失
       BRANCH_NO,
       CUR_CODE,
       VDATE*/


-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: GLS_VCHITEM  -- 凭证项_GLS_VCHITEM
-- auto-generated definition
create table GLS_VCHITEM
(
    VIID                NUMBER        not null
        constraint PK_GLS_VCHITEM
            primary key,
    YR                  NUMBER
        constraint CKC_GLS_VCHITEM_YR
            check (YR between 1900 and 2999),
    KM                  VARCHAR2(16),
    VID                 NUMBER
        constraint FK_GLS_VOUCHER_2_GLS_VCHITEM
            references GLS_VOUCHER,
    UUID                VARCHAR2(36),
    DIR                 NUMBER        not null
        constraint CKC_GLS_VCHITEM_DIR
            check (DIR = 1 OR DIR = 2),
    EXPLAIN             VARCHAR2(255),
    VAL                 NUMBER(16, 2),
    LOCALRATE           NUMBER(10, 6),
    ORIGINALVAL         NUMBER(16, 2) not null,
    PRICE               NUMBER(16, 6),
    QTY                 NUMBER(16, 4),
    UNIT                VARCHAR2(10),
    AUXCODE             VARCHAR2(12),
    OPTAG               NUMBER,
    OPKM                VARCHAR2(1024),
    OPKMNAME            VARCHAR2(1024),
    TXID                NUMBER,
    VCH_ID              NUMBER,
    CUST_NO             VARCHAR2(32),
    TAIL_DIFFERENCE     NUMBER(16, 4),
    SYS_CASHFLOW        VARCHAR2(120),
    SYS_DEPTCONTACT     VARCHAR2(18),
    SYS_PERSONALCONTACT VARCHAR2(18),
    USER_DEF1           VARCHAR2(30),
    USER_DEF2           VARCHAR2(30),
    USER_DEF3           VARCHAR2(30),
    USER_DEF4           VARCHAR2(30),
    USER_DEF5           VARCHAR2(30),
    USER_DEF6           VARCHAR2(30),
    USER_DEF7           VARCHAR2(30),
    USER_DEF8           VARCHAR2(30),
    USER_DEF9           VARCHAR2(30),
    USER_DEF10          VARCHAR2(30),
    USER_DEF11          VARCHAR2(30),
    USER_DEF12          VARCHAR2(30),
    USER_DEF13          VARCHAR2(30),
    USER_DEF14          VARCHAR2(30),
    USER_DEF15          VARCHAR2(30),
    ASSISTDESC          VARCHAR2(254),
    ASSIST              VARCHAR2(254),
    FINGERPRINT         VARCHAR2(254),
    constraint FK_GLS_KM_2_GLS_VCHITEM
        foreign key (YR, KM) references GLS_KM
)
/

comment on table GLS_VCHITEM is '凭证项_GLS_VCHITEM'
/

comment on column GLS_VCHITEM.VIID is '凭证项ID'
/

comment on column GLS_VCHITEM.YR is '年度'
/

comment on column GLS_VCHITEM.KM is '科目号'
/

comment on column GLS_VCHITEM.VID is '凭证ID'
/

comment on column GLS_VCHITEM.UUID is '全局唯一码'
/

comment on column GLS_VCHITEM.DIR is '余额方向 1:借 2:贷'
/

comment on column GLS_VCHITEM.EXPLAIN is '摘要'
/

comment on column GLS_VCHITEM.VAL is '本位币金额'
/

comment on column GLS_VCHITEM.LOCALRATE is '汇率'
/

comment on column GLS_VCHITEM.ORIGINALVAL is '原币金额'
/

comment on column GLS_VCHITEM.PRICE is '单价'
/

comment on column GLS_VCHITEM.QTY is '数量'
/

comment on column GLS_VCHITEM.UNIT is '单位'
/

comment on column GLS_VCHITEM.AUXCODE is '附属单据号码'
/

comment on column GLS_VCHITEM.OPTAG is '处理标记'
/

comment on column GLS_VCHITEM.OPKM is '对方科目'
/

comment on column GLS_VCHITEM.OPKMNAME is '对方科目名称'
/

comment on column GLS_VCHITEM.TXID is '交易ID'
/

comment on column GLS_VCHITEM.VCH_ID is '结算凭证ID'
/

comment on column GLS_VCHITEM.CUST_NO is '本方单位编号'
/

comment on column GLS_VCHITEM.TAIL_DIFFERENCE is '尾差'
/

comment on column GLS_VCHITEM.SYS_CASHFLOW is '现金流向辅助核算'
/

comment on column GLS_VCHITEM.SYS_DEPTCONTACT is '部门往来辅助核算'
/

comment on column GLS_VCHITEM.SYS_PERSONALCONTACT is '个人往来辅助核算'
/

comment on column GLS_VCHITEM.USER_DEF1 is '自定义辅助核算1'
/

comment on column GLS_VCHITEM.USER_DEF2 is '自定义辅助核算2'
/

comment on column GLS_VCHITEM.USER_DEF3 is '自定义辅助核算3'
/

comment on column GLS_VCHITEM.USER_DEF4 is '自定义辅助核算4'
/

comment on column GLS_VCHITEM.USER_DEF5 is '自定义辅助核算5'
/

comment on column GLS_VCHITEM.USER_DEF6 is '自定义辅助核算6'
/

comment on column GLS_VCHITEM.USER_DEF7 is '自定义辅助核算7'
/

comment on column GLS_VCHITEM.USER_DEF8 is '自定义辅助核算8'
/

comment on column GLS_VCHITEM.USER_DEF9 is '自定义辅助核算9'
/

comment on column GLS_VCHITEM.USER_DEF10 is '自定义辅助核算10'
/

comment on column GLS_VCHITEM.USER_DEF11 is '自定义辅助核算11'
/

comment on column GLS_VCHITEM.USER_DEF12 is '自定义辅助核算12'
/

comment on column GLS_VCHITEM.USER_DEF13 is '自定义辅助核算13'
/

comment on column GLS_VCHITEM.USER_DEF14 is '自定义辅助核算14'
/

comment on column GLS_VCHITEM.USER_DEF15 is '自定义辅助核算15'
/

comment on column GLS_VCHITEM.ASSISTDESC is '辅助描述'
/

comment on column GLS_VCHITEM.FINGERPRINT is '指纹 增改生成指纹，交易单独的逻辑'
/

create index IND_GLS_VCHITEM_U4
    on GLS_VCHITEM (USER_DEF4)
/

create index IND_GLS_VCHITEM_U2
    on GLS_VCHITEM (USER_DEF2)
/

create index IND_GLS_VCHITEM_U11
    on GLS_VCHITEM (USER_DEF11)
/

create index IND_GLS_VCHITEM_SYS_DC
    on GLS_VCHITEM (SYS_DEPTCONTACT)
/

create index IND_GLS_VCHITEM_U10
    on GLS_VCHITEM (USER_DEF10)
/

create index IND_GLS_VCHITEM_ASSIST
    on GLS_VCHITEM (SYS_CASHFLOW, SYS_DEPTCONTACT, SYS_PERSONALCONTACT, USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4,
                    USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8, USER_DEF9, USER_DEF10, USER_DEF11, USER_DEF12,
                    USER_DEF13, USER_DEF14, USER_DEF15)
/

create index IND_GLS_VCHITEM_U12
    on GLS_VCHITEM (USER_DEF12)
/

create index IND_GLS_VCHITEM_U15
    on GLS_VCHITEM (USER_DEF15)
/

create index IND_GLS_VCHITEM_YR
    on GLS_VCHITEM (YR)
/

create index IND_GLS_VCHITEM_U14
    on GLS_VCHITEM (USER_DEF14)
/

create index IND_GLS_VCHITEM_U1
    on GLS_VCHITEM (USER_DEF1)
/

create index IND_GLS_VCHITEM_U8
    on GLS_VCHITEM (USER_DEF8)
/

create index IND_GLS_VCHITEM_SYS_CF
    on GLS_VCHITEM (SYS_CASHFLOW)
/

create index IND_GLS_VCHITEM_U13
    on GLS_VCHITEM (USER_DEF13)
/

create index FK_GLS_VCHITEM_VID
    on GLS_VCHITEM (VID)
/

create index IND_GLS_VCHITEM_U6
    on GLS_VCHITEM (USER_DEF6)
/

create index IND_GLS_VCHITEM_U3
    on GLS_VCHITEM (USER_DEF3)
/

create index IND_GLS_VCHITEM_KM
    on GLS_VCHITEM (KM)
/

create index IND_GLS_VCHITEM_U7
    on GLS_VCHITEM (USER_DEF7)
/

create index IND_GLS_VCHITEM_YR_KM_DIR
    on GLS_VCHITEM (DIR)
/

create index IND_GLS_VCHITEM_U5
    on GLS_VCHITEM (USER_DEF5)
/

create index IND_GLS_VCHITEM_U9
    on GLS_VCHITEM (USER_DEF9)
/

create index IND_GLS_VCHITEM_SYS_PC
    on GLS_VCHITEM (SYS_PERSONALCONTACT)
/
 Show table preview */

SELECT VIID,
       YR,
       KM,
       VID,
       UUID,
       DIR,
       EXPLAIN,
       VAL,
       LOCALRATE,
       ORIGINALVAL,
       PRICE,
       QTY,
       UNIT,
       AUXCODE,
       OPTAG,
       OPKM,
       OPKMNAME,
       TXID,
       VCH_ID,
       CUST_NO,
       TAIL_DIFFERENCE,
       SYS_CASHFLOW,
       SYS_DEPTCONTACT,
       SYS_PERSONALCONTACT,
       USER_DEF1,
       USER_DEF2,
       USER_DEF3,
       USER_DEF4,
       USER_DEF5,
       USER_DEF6,
       USER_DEF7,
       USER_DEF8,
       USER_DEF9,
       USER_DEF10,
       USER_DEF11,
       USER_DEF12,
       USER_DEF13,
       USER_DEF14,
       USER_DEF15,
       ASSISTDESC,
       ASSIST,
       FINGERPRINT
FROM GLS_VCHITEM;


-- 列表中存在

-- 635816 60w 不考虑建立分区表
select count(1) from GLS_VCHITEM;