-- =====================================================
-- File: ods_ysky_sms_gls_km.sql
-- Description: Create table script for ods_ysky_sms_gls_km
-- Author: [Liutaou]
-- Date: [2024-07-31]
-- =====================================================

-- 创建表的SQL脚本
DROP TABLE IF EXISTS ystc_ods.ods_ysky_sms_gls_km;
CREATE TABLE IF NOT EXISTS ystc_ods.ods_ysky_sms_gls_km
(
    yr                 integer           NOT NULL
        CONSTRAINT fk_gls_year_2_gls_km
            REFERENCES ods_ysky_sms_gls_km,
    km                 varchar(16)       NOT NULL,
    kmname             varchar(80)       NOT NULL,
    dir                integer           NOT NULL
        CONSTRAINT ckc_gls_km_dir
            CHECK (dir = 1 OR dir = 2),
    kmgrp              varchar(6)        NOT NULL
        CONSTRAINT ckc_gls_km_kmgrp
            CHECK (kmgrp IN ('1', '2', '3', '4', '5', '6')),
    kmlevel            integer DEFAULT 0
        CONSTRAINT ckc_gls_km_kmlevel
            CHECK (kmlevel >= 0),
    isleaf             integer DEFAULT 1
        CONSTRAINT ckc_gls_km_isleaf
            CHECK (isleaf IN (0, 1)),
    cashtype           integer DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_cashtype
            CHECK (cashtype IN (0, 1, 2)),
    qtyflag            integer DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_qtyflag
            CHECK (qtyflag IN (0, 1, 2)),
    qtyunit            varchar(8),
    business           integer,
    outflag            integer,
    limitmode          integer,
    quota              numeric(16, 2),
    kmpath             varchar(255),
    usestate           integer DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_usestate
            CHECK (usestate IN (0, 1, 2)),
    createtime         timestamp,
    lastupdatetime     timestamp,
    belongbusinesstype varchar(60),
    CONSTRAINT pk_gls_km
        PRIMARY KEY (yr, km)
);

-- 表的注释
COMMENT ON TABLE ods_ysky_sms_gls_km IS '科目_GLS_KM';

-- 列的注释
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.yr IS '年度';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.km IS '科目号';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmname IS '科目名';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.dir IS '借贷标记 1:借 2:贷';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmgrp IS '所属类别 1-资产类 2-负债类 3-共同类 4-权益类 5-损益类';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmlevel IS '科目级别 1：一级科目；2：二级科目，依此类推；';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.isleaf IS '明细标记 1：明细；0：非明细';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.cashtype IS '银行现金标记 2：现金类，1：银行类，0：既非现金又非银行类；';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.qtyflag IS '数量标记 1：数量类型，0：非数量类；如：121为数量类，单位为股';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.qtyunit IS '数量单位';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.business IS '结算专用标记0-财务专用  1-结算财务共用 2-结算专用';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.outflag IS '账外可用标记 1：可用，0：不可用';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.limitmode IS '限额标记 0：不限额，1：限余额，2：限累计贷方，3：限累计贷方';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.quota IS '限额金额';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmpath IS '科目全称';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.usestate IS '使用状态 0,正常 1,冻结 2,清户';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.createtime IS '创建时间';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.lastupdatetime IS '最后更新时间';

-- 创建索引
CREATE INDEX ix_akm_dir
    ON ystc_ods.ods_ysky_sms_gls_km (dir);

CREATE INDEX ix_akm_isleaf
    ON ystc_ods.ods_ysky_sms_gls_km (isleaf);

CREATE INDEX ix_gls_year_2_gls_km
    ON ystc_ods.ods_ysky_sms_gls_km (yr);

CREATE INDEX ix_akm_level
    ON ystc_ods.ods_ysky_sms_gls_km (kmlevel);

CREATE INDEX ix_akm_misc
    ON ystc_ods.ods_ysky_sms_gls_km (cashtype, kmgrp, business);



-- 主要调整
-- 数据类型转换：在 PostgreSQL 中，NUMBER 被转换为 INTEGER 或 NUMERIC，具体取决于是否有小数位。VARCHAR2 被转换为 VARCHAR。
-- 约束：CONSTRAINT 的使用方式在 PostgreSQL 中与 Oracle 相似，但 PostgreSQL 的 CHECK 约束语法略有不同。
-- 时间类型：DATE 在 PostgreSQL 中转换为 TIMESTAMP。
-- 索引：在 PostgreSQL 中，创建索引的语法与 Oracle 类似。

-- 检查表是否被分区或是分布式表（如果使用了某些扩展，例如 Citus）：
SELECT * FROM pg_dist_table WHERE logicalrelid = 'ystc_ods.ods_ysky_sms_gls_km'::regclass;

-- 确认 ods_ysky_sms_gls_km 表是否被配置为复制表。你可以检查表的复制配置：
SELECT * FROM pg_replication_slots;



-- 创建表
CREATE TABLE ystc_ods.ods_ysky_sms_gls_km
(
    yr                 integer           NOT NULL,
    km                 varchar(16)       NOT NULL,
    kmname             varchar(80)       NOT NULL,
    dir                integer           NOT NULL
        CONSTRAINT ckc_gls_km_dir
            CHECK (dir = 1 OR dir = 2),
    kmgrp              varchar(6)        NOT NULL
        CONSTRAINT ckc_gls_km_kmgrp
            CHECK (kmgrp IN ('1', '2', '3', '4', '5', '6')),
    kmlevel            integer DEFAULT 0
        CONSTRAINT ckc_gls_km_kmlevel
            CHECK (kmlevel >= 0),
    isleaf             integer DEFAULT 1
        CONSTRAINT ckc_gls_km_isleaf
            CHECK (isleaf IN (0, 1)),
    cashtype           integer DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_cashtype
            CHECK (cashtype IN (0, 1, 2)),
    qtyflag            integer DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_qtyflag
            CHECK (qtyflag IN (0, 1, 2)),
    qtyunit            varchar(8),
    business           integer,
    outflag            integer,
    limitmode          integer,
    quota              numeric(16, 2),
    kmpath             varchar(255),
    usestate           integer DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_usestate
            CHECK (usestate IN (0, 1, 2)),
    createtime         timestamp,
    lastupdatetime     timestamp,
    belongbusinesstype varchar(60),
    CONSTRAINT pk_gls_km
        PRIMARY KEY (yr, km)
);

-- 如果需要添加外键约束，可以在表非复制状态下执行
-- ALTER TABLE ystc_ods.ods_ysky_sms_gls_km
-- ADD CONSTRAINT fk_gls_year_2_gls_km
-- FOREIGN KEY (yr) REFERENCES another_table (yr);


DROP TABLE IF EXISTS ystc_ods.ods_ysky_sms_gls_km;
CREATE TABLE IF NOT EXISTS ystc_ods.ods_ysky_sms_gls_km
(
    snapshot_date DATE         NOT NULL,           -- 快照日期，用于分区
    id            varchar(255) NOT NULL,           -- 唯一标识符
    yr                 integer           NOT NULL,
    km                 varchar(16)       NOT NULL,
    kmname             varchar(80)       NOT NULL,
    dir                SMALLINT          NOT NULL
        CONSTRAINT ckc_gls_km_dir
            CHECK (dir = 1 OR dir = 2),
    kmgrp              varchar(6)        NOT NULL
        CONSTRAINT ckc_gls_km_kmgrp
            CHECK (kmgrp IN ('1', '2', '3', '4', '5', '6')),
    kmlevel            SMALLINT DEFAULT 0
        CONSTRAINT ckc_gls_km_kmlevel
            CHECK (kmlevel >= 0),
    isleaf             SMALLINT DEFAULT 1
        CONSTRAINT ckc_gls_km_isleaf
            CHECK (isleaf IN (0, 1)),
    cashtype           SMALLINT DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_cashtype
            CHECK (cashtype IN (0, 1, 2)),
    qtyflag            SMALLINT DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_qtyflag
            CHECK (qtyflag IN (0, 1, 2)),
    qtyunit            varchar(8),
    business           SMALLINT,
    outflag            SMALLINT,
    limitmode          SMALLINT,
    quota              numeric(16, 2),
    kmpath             varchar(255),
    usestate           SMALLINT DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_usestate
            CHECK (usestate IN (0, 1, 2)),
    createtime         timestamp,
    lastupdatetime     timestamp,
    belongbusinesstype varchar(60),
    CONSTRAINT pk_gls_km
        PRIMARY KEY (id, yr, km)
) DISTRIBUTE BY SHARD (yr, km);

-- 错误描述：你试图在 ods_ysky_sms_gls_km 表上添加一个外键约束，该表引用自身（自引用）。在分布式环境下（如 Citus 分布式数据库），只能在复制表上进行自引用。



-- 总结
-- 分布键选择：id 作为分布键在很多情况下是合理的，但如果查询常用字段 yr 和 km，考虑将它们作为分布键可能会提升性能。
-- 外键约束：避免在分布式表上使用自引用外键，如果需要这种约束，考虑将表设为复制表。
-- 数据类型和约束：保持合理的数据类型和约束，以确保数据完整性和查询性能。
-- 如果能提供更多查询模式或表间关系的信息，可以进一步优化分布键选择。


select * from ods_ysky_sms_gls_km;
select count(1) from ods_ysky_sms_gls_km;


-- 正式
-- 创建表的SQL脚本
DROP TABLE IF EXISTS ystc_ods.ods_ysky_sms_gls_km;
CREATE TABLE IF NOT EXISTS ystc_ods.ods_ysky_sms_gls_km
(
    snapshot_date DATE         NOT NULL,           -- 快照日期，用于分区
    id            varchar(255) NOT NULL,           -- 唯一标识符
    yr                 integer           NOT NULL,
    km                 varchar(16)       NOT NULL,
    kmname             varchar(80)       NOT NULL,
    dir                SMALLINT          NOT NULL
        CONSTRAINT ckc_gls_km_dir
            CHECK (dir = 1 OR dir = 2),
    kmgrp              varchar(6)        NOT NULL
        CONSTRAINT ckc_gls_km_kmgrp
            CHECK (kmgrp IN ('1', '2', '3', '4', '5', '6')),
    kmlevel            SMALLINT DEFAULT 0
        CONSTRAINT ckc_gls_km_kmlevel
            CHECK (kmlevel >= 0),
    isleaf             SMALLINT DEFAULT 1
        CONSTRAINT ckc_gls_km_isleaf
            CHECK (isleaf IN (0, 1)),
    cashtype           SMALLINT DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_cashtype
            CHECK (cashtype IN (0, 1, 2)),
    qtyflag            SMALLINT DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_qtyflag
            CHECK (qtyflag IN (0, 1, 2)),
    qtyunit            varchar(8),
    business           SMALLINT,
    outflag            SMALLINT,
    limitmode          SMALLINT,
    quota              numeric(16, 2),
    kmpath             varchar(255),
    usestate           SMALLINT DEFAULT 0 NOT NULL
        CONSTRAINT ckc_gls_km_usestate
            CHECK (usestate IN (0, 1, 2)),
    createtime         timestamp,
    lastupdatetime     timestamp,
    belongbusinesstype varchar(60),
    CONSTRAINT pk_gls_km
        PRIMARY KEY (id, yr, km)
) DISTRIBUTE BY SHARD (yr, km);

-- 表的注释
COMMENT ON TABLE ystc_ods.ods_ysky_sms_gls_km IS '科目_GLS_KM';

-- 列的注释
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.snapshot_date IS '快照日期';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.id IS '唯一标识符';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.yr IS '年度';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.km IS '科目号';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmname IS '科目名';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.dir IS '借贷标记 1:借 2:贷';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmgrp IS '所属类别 1-资产类 2-负债类 3-共同类 4-权益类 5-损益类';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmlevel IS '科目级别 1：一级科目；2：二级科目，依此类推；';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.isleaf IS '明细标记 1：明细；0：非明细';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.cashtype IS '银行现金标记 2：现金类，1：银行类，0：既非现金又非银行类；';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.qtyflag IS '数量标记 1：数量类型，0：非数量类；如：121为数量类，单位为股';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.qtyunit IS '数量单位';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.business IS '结算专用标记0-财务专用  1-结算财务共用 2-结算专用';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.outflag IS '账外可用标记 1：可用，0：不可用';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.limitmode IS '限额标记 0：不限额，1：限余额，2：限累计贷方，3：限累计贷方';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.quota IS '限额金额';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.kmpath IS '科目全称';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.usestate IS '使用状态 0,正常 1,冻结 2,清户';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.createtime IS '创建时间';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km.lastupdatetime IS '最后更新时间';

-- 创建索引
CREATE INDEX idx_gls_km_dir
    ON ystc_ods.ods_ysky_sms_gls_km (dir);

CREATE INDEX idx_gls_km_isleaf
    ON ystc_ods.ods_ysky_sms_gls_km (isleaf);

CREATE INDEX idx_gls_km_yr
    ON ystc_ods.ods_ysky_sms_gls_km (yr);

CREATE INDEX idx_gls_km_kmlevel
    ON ystc_ods.ods_ysky_sms_gls_km (kmlevel);

CREATE INDEX idx_gls_km_ckbc
    ON ystc_ods.ods_ysky_sms_gls_km (cashtype, kmgrp, business);
