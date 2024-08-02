

DROP TABLE IF EXISTS ystc_ods.ods_ysky_sms_gls_km_val_init;
CREATE TABLE IF NOT EXISTS ystc_ods.ods_ysky_sms_gls_km_val_init
(
    snapshot_date DATE NOT NULL,                -- 快照日期
    id            varchar(255) NOT NULL,           -- 唯一标识符
    kvi_id         integer      NOT NULL,
    yr            INTEGER NOT NULL
        CONSTRAINT ckc_gls_km_val_init_yr
            CHECK (yr BETWEEN 1900 AND 2999),
    cur_code       VARCHAR(8) NOT NULL,
    km             VARCHAR(16) NOT NULL,
    jval           NUMERIC(16, 2),
    dval           NUMERIC(16, 2),
    jqty           NUMERIC(16, 4),
    dqty           NUMERIC(16, 4),
    branch_no      VARCHAR(6) NOT NULL,
    createtime     TIMESTAMP,
    lastupdatetime TIMESTAMP
)
DISTRIBUTE BY SHARD (id);  -- 使用 UUID 列作为分布键


-- 表的注释
COMMENT ON TABLE ystc_ods.ods_ysky_sms_gls_km_val_init IS '年初科目余额_GLS_KM_VAL_INIT';

-- 列的注释
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.snapshot_date IS '快照日期';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.id IS '唯一标识符';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.kvi_id IS '唯一标识符';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.yr IS '年度';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.cur_code IS '币种代号';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.km IS '科目号';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.jval IS '借方金额';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.dval IS '贷方金额';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.jqty IS '借方数量';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.dqty IS '贷方数量';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.branch_no IS '机构号';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.createtime IS '创建时间';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_gls_km_val_init.lastupdatetime IS '最后更新时间';


-- 添加索引
CREATE INDEX idx_ysk_gls_km_val_init_yr ON ystc_ods.ods_ysky_sms_gls_km_val_init (yr);
CREATE INDEX idx_ysk_gls_km_val_init_km ON ystc_ods.ods_ysky_sms_gls_km_val_init (km);
CREATE INDEX idx_ysk_gls_km_val_init_cur_code ON ystc_ods.ods_ysky_sms_gls_km_val_init (cur_code);
CREATE INDEX idx_ysk_gls_km_val_init_branch_no ON ystc_ods.ods_ysky_sms_gls_km_val_init (branch_no);


-- 因此无法在 ods_ysky_sms_gls_km_val_init 表中创建外键约束。


-- 总结
-- 1900条数据量不大，不需要复杂的分区方案。使用简单的表结构和基本索引即


truncate table "ystc_ods"."ods_ysky_sms_gls_km_val_init";


select * from ods_ysky_sms_gls_km_val_init;