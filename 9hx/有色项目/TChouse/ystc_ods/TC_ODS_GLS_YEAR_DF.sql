

-- ORACLE 逻辑
-- ODS_GLS_YEAR
/*
prompt
prompt Creating table DWD_FNCE_YR
prompt ==========================
prompt
create table BLSCDW.DWD_FNCE_YR
(
  yr        INTEGER not null,
  startflag INTEGER default 0 not null,
  startdate DATE not null,
  closetag  INTEGER default 0 not null,
  turnflag  INTEGER not null
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
comment on table BLSCDW.DWD_FNCE_YR
  is '会计年度';
comment on column BLSCDW.DWD_FNCE_YR.yr
  is '年度';
comment on column BLSCDW.DWD_FNCE_YR.startflag
  is '启用标记 1启用;0未启用';
comment on column BLSCDW.DWD_FNCE_YR.startdate
  is '启用日期';
comment on column BLSCDW.DWD_FNCE_YR.closetag
  is '年度结帐标记';
comment on column BLSCDW.DWD_FNCE_YR.turnflag
  is '年度结转标记';
alter table BLSCDW.DWD_FNCE_YR
  add constraint PK_DWD_FNCE_YR primary key (YR)
  using index
  tablespace BLSC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/

-- 查看当前用户
select current_user;

-- 转换分区表tc
-- DROP TABLE IF EXISTS GLS_YEAR;
-- CREATE TABLE GLS_YEAR(
--     YR NUMBER(38) NOT NULL,
--     STARTFLAG NUMBER(38) NOT NULL DEFAULT  0 ,
--     STARTDATE DATE NOT NULL,
--     CLOSETAG NUMBER(38) NOT NULL DEFAULT  0 ,
--     TURNFLAG NUMBER(38) NOT NULL,
--     PRIMARY KEY (YR)
-- );
--
-- COMMENT ON TABLE GLS_YEAR IS '会计年度_GLS_YEAR';
-- COMMENT ON COLUMN GLS_YEAR.YR IS '年度';
-- COMMENT ON COLUMN GLS_YEAR.STARTFLAG IS '启用标记 1启用;0未启用';
-- COMMENT ON COLUMN GLS_YEAR.STARTDATE IS '启用日期';
-- COMMENT ON COLUMN GLS_YEAR.CLOSETAG IS '年度结帐标记';
-- COMMENT ON COLUMN GLS_YEAR.TURNFLAG IS '年度结转标记';


-- 创建主分区表 固定表init
drop table gls_year_ods;
CREATE TABLE gls_year_ods (
    snapshot_date DATE NOT NULL,  -- 快照日期，用于分区
    id varchar(255) NOT NULL,  -- 唯一标识符
    yr INTEGER NOT NULL,  -- 年度
    startflag SMALLINT NOT NULL DEFAULT 0,  -- 启用标记
    startdate DATE NOT NULL,  -- 启用日期
    closetag SMALLINT NOT NULL DEFAULT 0,  -- 年度结帐标记
    turnflag SMALLINT NOT NULL,  -- 年度结转标记
    PRIMARY KEY (snapshot_date, id)  -- 主键约束包括分区键
) PARTITION BY RANGE (snapshot_date);

-- 创建子分区表，调度频次
CREATE TABLE gls_year_ods_20240729 PARTITION OF gls_year_ods
FOR VALUES FROM ('2024-07-29') TO ('2024-07-30');


CREATE TABLE gls_year_ods_20240730 PARTITION OF gls_year_ods
FOR VALUES FROM ('2024-07-30') TO ('2024-07-31');

CREATE TABLE gls_year_ods_20240731 PARTITION OF gls_year_ods
FOR VALUES FROM ('2024-07-31') TO ('2024-08-01');


COMMENT ON TABLE gls_year_ods IS '会计年度_GLS_YEAR_ODS';
COMMENT ON COLUMN gls_year_ods.snapshot_date IS '快照日期';
COMMENT ON COLUMN gls_year_ods.id IS '唯一标识符';
COMMENT ON COLUMN gls_year_ods.yr IS '年度';
COMMENT ON COLUMN gls_year_ods.startflag IS '启用标记 1启用;0未启用';
COMMENT ON COLUMN gls_year_ods.startdate IS '启用日期';
COMMENT ON COLUMN gls_year_ods.closetag IS '年度结帐标记';
COMMENT ON COLUMN gls_year_ods.turnflag IS '年度结转标记';


-- 验证，往里面写数据
select * from gls_year_ods;


-- 建立默认shard表


-- 做成两个作业





CREATE TABLE dwd_gls_year_ods_test (
    snapshot_date DATE NOT NULL,  -- 快照日期，用于分区
    id varchar(255) NOT NULL,  -- 唯一标识符
    yr INTEGER NOT NULL,  -- 年度
    startflag SMALLINT NOT NULL DEFAULT 0,  -- 启用标记
    startdate DATE NOT NULL,  -- 启用日期
    closetag SMALLINT NOT NULL DEFAULT 0,  -- 年度结帐标记
    turnflag SMALLINT NOT NULL,  -- 年度结转标记
    PRIMARY KEY (snapshot_date, id)  -- 主键约束包括分区键
) PARTITION BY RANGE (snapshot_date);

CREATE TABLE dwd_gls_year_ods_test_20240730 PARTITION OF dwd_gls_year_ods_test
FOR VALUES FROM ('2024-07-30') TO ('2024-07-31');


-- 测试insert 功能

insert into dwd_gls_year_ods_test(
snapshot_date
,id
,yr
,startflag


) select relname from pg_class limit 3;


**  指定分布键，必须；