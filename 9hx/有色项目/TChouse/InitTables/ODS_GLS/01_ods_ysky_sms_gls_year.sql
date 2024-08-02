

--     YR        NUMBER           not null
--         constraint PK_GLS_YEAR
--             primary key
--         constraint CKC_GLS_YEAR_YR
--             check (YR between 1900 and 2999),
--     STARTFLAG NUMBER default 0 not null
--         constraint CKC_GLS_YEAR_STARTFLAG
--             check (STARTFLAG = 0 OR STARTFLAG = 1),
--     STARTDATE DATE             not null,
--     CLOSETAG  NUMBER default 0 not null
--         constraint CKC_GLS_YEAR_CLOSETAG
--             check (CLOSETAG = 0 OR CLOSETAG = 1 OR CLOSETAG = 2),
--     TURNFLAG  NUMBER           not nul

-- create table t (id integer,nc text) distribute by shard (id) to group default_group;
-- 不制定group
DROP TABLE IF EXISTS ystc_ods.ods_ysky_sms_gls_year;
CREATE TABLE IF NOT EXISTS ystc_ods.ods_ysky_sms_gls_year
(
    snapshot_date DATE         NOT NULL,           -- 快照日期，用于分区
    id            varchar(255) NOT NULL,           -- 唯一标识符
    yr            INTEGER      NOT NULL,           -- 年度
    startflag     SMALLINT     NOT NULL DEFAULT 0, -- 启用标记
    startdate     DATE         NOT NULL,           -- 启用日期
    closetag      SMALLINT     NOT NULL DEFAULT 0, -- 年度结帐标记
    turnflag      SMALLINT     NOT NULL,           -- 年度结转标记
    PRIMARY KEY (id, yr)                           -- 主键包括分布列 id
) DISTRIBUTE BY SHARD (id);

COMMENT ON TABLE ystc_ods.ods_ysky_sms_gls_year IS '会计年度_GLS_YEAR_ODS';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_year.snapshot_date IS '快照日期';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_year.id IS '唯一标识符';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_year.yr IS '年度';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_year.startflag IS '启用标记 1启用;0未启用';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_year.startdate IS '启用日期';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_year.closetag IS '年度结帐标记';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_year.turnflag IS '年度结转标记';


truncate table ystc_ods.ods_ysky_sms_gls_year;
SELECT * FROM ods_ysky_sms_gls_year;

-- 获取所有数据库列表
-- 字段 说明
-- datsqlmode 用于标识数据库是 oracle 兼容模式还是 postgresql 兼
-- 容模式
-- o:oracle 兼容模式
-- p:postgresql 兼容模式


select * from pg_database;



select n.nspname, c.relname
from pg_class c,
     pg_namespace n
where c.relkind in ('r', 'p')
  and n.oid = c.relnamespace
  and n.nspname = 'ystc_ods'
order by 1;


-- 平高 作业name truncate_ods_ysky_sms_gls_year


select * from ystc_ods.ods_ysky_sms_gls_year;