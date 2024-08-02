-- 将当前数据迁移到历史数据表
INSERT INTO ystc_ods.historical_data (snapshot_date, id, yr, cur_code, km, jval, dval, jqty, dqty, branch_no, createtime, lastupdatetime)
SELECT snapshot_date, id, yr, cur_code, km, jval, dval, jqty, dqty, branch_no, createtime, lastupdatetime
FROM ystc_ods.current_data
WHERE snapshot_date < CURRENT_DATE - INTERVAL '90 days';  -- 根据实际需求调整日期范围

-- 从当前数据表中删除已迁移的数据
DELETE FROM ystc_ods.current_data
WHERE snapshot_date < CURRENT_DATE - INTERVAL '90 days';  -- 根据实际需求调整日期范围



-- 删除历史数据表中超过5年的数据
DELETE FROM ystc_ods.historical_data
WHERE snapshot_date < CURRENT_DATE - INTERVAL '5 years';  -- 根据实际需求调整日期范围
