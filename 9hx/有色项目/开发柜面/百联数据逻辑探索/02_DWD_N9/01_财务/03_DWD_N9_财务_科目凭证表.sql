-- 执行SQL脚本
---删除大于开始日期的记账凭证，可以处理源表删除数据的情况
DELETE FROM DWD_FNCE_VOUCHER WHERE vdate >= DATE '${v_dwdsdate}';
--TRUNCATE TABLE DW_FNCE_VOUCHER


-- 表输入
SELECT t1.VIID    as voucher_code, --凭证号
       t1.yr      as year, --会计年度
       t2.prd     as pmonth, --凭证制作月份
       t2.vdate   as vdate, --制单日期
       t1.km      as akm_code, --科目号
       t1.explain, --摘要
--        t1.VDATE, --生效日
       t1.opkm, --对方科目号
       --t1.transid, --业务单据号
       t3.outflag as outflag, --表内表外
       t3.dir as kdir,  --科目方向
       t2.BRANCH_NO    as org_code, --机构
       t1.dir as jddir, --金额方向
       t1.VAL     as amount ,--发生金额
       t2.CUR_CODE, --币种
       t2.CREATETIME as last_update_time --时间戳
  from GLS_VCHITEM t1
 inner join GLS_VOUCHER t2
    on t2.vid = t1.vid
 inner join  GLS_KM t3
    on (t3.km = t1.km and t3.yr = t2.yr )
 where t2.vdate >=date '${v_dwdsdate}';


-- 表输出 DWD_FNCE_VOUCHER
-- ddl

create table BLSCDW.DWD_FNCE_VOUCHER
(
  voucher_code     VARCHAR2(32) not null,
  year             NUMBER,
  pmonth           NUMBER,
  vdate            DATE,
  akm_code         VARCHAR2(32),
  opkm             VARCHAR2(255),
  outflag          VARCHAR2(32),
  kmdir            VARCHAR2(32),
  org_code         VARCHAR2(32),
  dir              VARCHAR2(32),
  amount           NUMBER(16,2),
  cur_code         VARCHAR2(32),
  last_update_time DATE,
  explain          VARCHAR2(255),
  originalval      NUMBER(16,2)
)
tablespace BLSC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table BLSCDW.DWD_FNCE_VOUCHER
  is '记账凭证';
comment on column BLSCDW.DWD_FNCE_VOUCHER.voucher_code
  is '凭证号';
comment on column BLSCDW.DWD_FNCE_VOUCHER.year
  is '会计年度';
comment on column BLSCDW.DWD_FNCE_VOUCHER.pmonth
  is '凭证制作月份';
comment on column BLSCDW.DWD_FNCE_VOUCHER.vdate
  is '制单日期';
comment on column BLSCDW.DWD_FNCE_VOUCHER.akm_code
  is '科目号';
comment on column BLSCDW.DWD_FNCE_VOUCHER.opkm
  is '对方科目号';
comment on column BLSCDW.DWD_FNCE_VOUCHER.outflag
  is '账外可用否';
comment on column BLSCDW.DWD_FNCE_VOUCHER.kmdir
  is '科目方向';
comment on column BLSCDW.DWD_FNCE_VOUCHER.org_code
  is '机构号';
comment on column BLSCDW.DWD_FNCE_VOUCHER.dir
  is '余额方向';
comment on column BLSCDW.DWD_FNCE_VOUCHER.amount
  is '金额';
comment on column BLSCDW.DWD_FNCE_VOUCHER.cur_code
  is '币种';
comment on column BLSCDW.DWD_FNCE_VOUCHER.last_update_time
  is '时间戳';
comment on column BLSCDW.DWD_FNCE_VOUCHER.explain
  is '摘要';