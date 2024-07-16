-- 执行SQL脚本


-- 表输入
SELECT YR AS YEAR, --账本创建年
       CUR_CODE, --币种
       KM AS AKM_CODE, --科目号
     --  PRD AS PMONTH, --会计期间
       branch_no AS ORG_CODE, --机构号
       SUM(JVAL) AS JAMOUNT, --借方发生额
       SUM(DVAL) AS DAMOUNT --贷方发生额
  FROM GLS_KM_VAL_INIT
 GROUP BY YR, CUR_CODE, KM, branch_no

-- 表输出
-- DWD_FNCE_AINITVAL

-- ddl
create table BLSCDW.DWD_FNCE_AINITVAL
(
  year     NUMBER not null,
  cur_code VARCHAR2(32),
  akm_code VARCHAR2(32),
  pmonth   NUMBER,
  org_code VARCHAR2(32),
  jamount  NUMBER(16,2),
  damount  NUMBER(16,2)
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
comment on table BLSCDW.DWD_FNCE_AINITVAL
  is '年初科目余额';
comment on column BLSCDW.DWD_FNCE_AINITVAL.year
  is '会计年度';
comment on column BLSCDW.DWD_FNCE_AINITVAL.cur_code
  is '币种';
comment on column BLSCDW.DWD_FNCE_AINITVAL.akm_code
  is '科目号';
comment on column BLSCDW.DWD_FNCE_AINITVAL.pmonth
  is '凭证制作月份';
comment on column BLSCDW.DWD_FNCE_AINITVAL.org_code
  is '机构号';
comment on column BLSCDW.DWD_FNCE_AINITVAL.jamount
  is '借方发生额';
comment on column BLSCDW.DWD_FNCE_AINITVAL.damount
  is '贷方发生额';