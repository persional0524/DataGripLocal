-- 创建表的SQL脚本
DROP TABLE IF EXISTS ystc_ods.ods_ysky_sms_vch_item;
CREATE TABLE IF NOT EXISTS ystc_ods.ods_ysky_sms_vchitem
(
    snapshot_date DATE NOT NULL,                -- 快照日期
    viid                NUMERIC        NOT NULL,
    yr                  NUMERIC
        CHECK (yr BETWEEN 1900 AND 2999),
    km                  VARCHAR(16),
    vid                 NUMERIC,
    uuid                VARCHAR(36),
    dir                 NUMERIC        NOT NULL
        CHECK (dir = 1 OR dir = 2),
    explain             VARCHAR(255),
    val                 NUMERIC(16, 2),
    localrate           NUMERIC(10, 6),
    originalval         NUMERIC(16, 2) NOT NULL,
    price               NUMERIC(16, 6),
    qty                 NUMERIC(16, 4),
    unit                VARCHAR(10),
    auxcode             VARCHAR(12),
    optag               NUMERIC,
    opkm                VARCHAR(1024),
    opkmname            VARCHAR(1024),
    txid                NUMERIC,
    vch_id              NUMERIC,
    cust_no             VARCHAR(32),
    tail_difference     NUMERIC(16, 4),
    sys_cashflow        VARCHAR(120),
    sys_deptcontact     VARCHAR(18),
    sys_personalcontact VARCHAR(18),
    user_def1           VARCHAR(30),
    user_def2           VARCHAR(30),
    user_def3           VARCHAR(30),
    user_def4           VARCHAR(30),
    user_def5           VARCHAR(30),
    user_def6           VARCHAR(30),
    user_def7           VARCHAR(30),
    user_def8           VARCHAR(30),
    user_def9           VARCHAR(30),
    user_def10          VARCHAR(30),
    user_def11          VARCHAR(30),
    user_def12          VARCHAR(30),
    user_def13          VARCHAR(30),
    user_def14          VARCHAR(30),
    user_def15          VARCHAR(30),
    assistdesc          VARCHAR(254),
    assist              VARCHAR(254),
    fingerprint         VARCHAR(254),
    PRIMARY KEY (viid),
    FOREIGN KEY (yr, km) REFERENCES ystc_ods.ods_ysky_sms_km (yr, km),
    FOREIGN KEY (vid) REFERENCES ystc_ods.ods_ysky_sms_voucher (vid)
)
DISTRIBUTED BY HASH (yr, km)  -- 选择合适的分布键
SORTKEY (yr, km, dir);     -- 选择排序键

-- 表的注释
COMMENT ON TABLE ystc_ods.ods_ysky_sms_vch_item IS '凭证项_GLS_VCHITEM';

-- 列的注释
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.snapshot_date IS '快照日期';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.viid IS '凭证项ID';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.yr IS '年度';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.km IS '科目号';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.vid IS '凭证ID';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.uuid IS '全局唯一码';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.dir IS '余额方向 1:借 2:贷';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.explain IS '摘要';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.val IS '本位币金额';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.localrate IS '汇率';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.originalval IS '原币金额';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.price IS '单价';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.qty IS '数量';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.unit IS '单位';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.auxcode IS '附属单据号码';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.optag IS '处理标记';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.opkm IS '对方科目';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.opkmname IS '对方科目名称';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.txid IS '交易ID';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.vch_id IS '结算凭证ID';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.cust_no IS '本方单位编号';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.tail_difference IS '尾差';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.sys_cashflow IS '现金流向辅助核算';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.sys_deptcontact IS '部门往来辅助核算';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.sys_personalcontact IS '个人往来辅助核算';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def1 IS '自定义辅助核算1';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def2 IS '自定义辅助核算2';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def3 IS '自定义辅助核算3';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def4 IS '自定义辅助核算4';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def5 IS '自定义辅助核算5';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def6 IS '自定义辅助核算6';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def7 IS '自定义辅助核算7';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def8 IS '自定义辅助核算8';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def9 IS '自定义辅助核算9';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def10 IS '自定义辅助核算10';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def11 IS '自定义辅助核算11';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def12 IS '自定义辅助核算12';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def13 IS '自定义辅助核算13';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def14 IS '自定义辅助核算14';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.user_def15 IS '自定义辅助核算15';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.assistdesc IS '辅助描述';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.assist IS '辅助字段';
COMMENT ON COLUMN ystc_ods.ods_ysky_sms_vch_item.fingerprint IS '指纹标记';

-- 添加索引
CREATE INDEX idx_ysk_vch_item_yr ON ystc_ods.ods_ysky_sms_vch_item (yr);
COMMENT ON INDEX idx_ysk_vch_item_yr IS '按年度索引';

CREATE INDEX idx_ysk_vch_item_km ON ystc_ods.ods_ysky_sms_vch_item (km);
COMMENT ON INDEX idx_ysk_vch_item_km IS '按科目号索引';

CREATE INDEX idx_ysk_vch_item_vid ON ystc_ods.ods_ysky_sms_vch_item (vid);
COMMENT ON INDEX idx_ysk_vch_item_vid IS '按凭证ID索引';

CREATE INDEX idx_ysk_vch_item_dir ON ystc_ods.ods_ysky_sms_vch_item (dir);
COMMENT ON INDEX idx_ysk_vch_item_dir IS '按余额方向索引';

CREATE INDEX idx_ysk_vch_item_cust_no ON ystc_ods.ods_ysky_sms_vch_item (cust_no);
COMMENT ON INDEX idx_ysk_vch_item_cust_no IS '按单位编号索引';
