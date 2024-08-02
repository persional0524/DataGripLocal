

-- create table BLSCDW.DWD_LOG
-- (
--   describe    VARCHAR2(500),
--   create_time DATE
-- )
-- tablespace BLSC
--   pctfree 10
--   initrans 1
--   maxtrans 255
--   storage
--   (
--     initial 64K
--     next 1M
--     minextents 1
--     maxextents unlimited
--   );
-- comment on table BLSCDW.DWD_LOG
--   is '日志表';
-- comment on column BLSCDW.DWD_LOG.describe
--   is '描述';
-- comment on column BLSCDW.DWD_LOG.create_time
--   is '创建时间';



CREATE OR REPLACE PROCEDURE sp_akm_balance(startdate DATE, enddate DATE)
LANGUAGE plpgsql
AS $$
DECLARE
    v_startdate DATE := startdate;
    v_enddate DATE := enddate;
    v_err TEXT;
    TYPE row_table IS TABLE OF dwd_fnce_akmbalance%ROWTYPE;
    v_akm_table row_table;
BEGIN
    -- 插入开始日志记录
    INSERT INTO dwd_log (log_message, log_time) VALUES ('sp_akm_balance,开始', CURRENT_TIMESTAMP);
    COMMIT;

    -- 删除现有数据
    DELETE FROM dwd_fnce_akmbalance WHERE vdate >= v_startdate;

    -- 日期循环计算明细科目余额历史
    WHILE v_startdate <= v_enddate LOOP
        FOR v_rec IN
            SELECT
                vdate,
                leiji.akm_code,
                leiji.cur_code,
                leiji.org_code,
                CASE akm.dir
                    WHEN 'J' THEN leiji.jamount - leiji.damount - COALESCE(jintian.jamount, 0) + COALESCE(jintian.damount, 0)
                    ELSE leiji.damount - leiji.jamount - COALESCE(jintian.damount, 0) + COALESCE(jintian.jamount, 0)
                END AS s_balance,
                COALESCE(jintian.jamount, 0) AS jamount,
                COALESCE(jintian.damount, 0) AS damount,
                CASE akm.dir
                    WHEN 'J' THEN leiji.jamount - leiji.damount
                    ELSE leiji.damount - leiji.jamount
                END AS balance,
                leiji.jamount AS totaljamount,
                leiji.damount AS totaldamount,
                leiji.year_jamount,
                leiji.year_damount,
                COALESCE(mon.jamount, 0) AS mon_jamount,
                COALESCE(mon.damount, 0) AS mon_damount
            FROM (
                SELECT
                    year,
                    akm_code,
                    org_code,
                    cur_code,
                    SUM(jamount) AS jamount,
                    SUM(damount) AS damount,
                    SUM(year_jamount) AS year_jamount,
                    SUM(year_damount) AS year_damount
                FROM (
                    SELECT
                        v.year,
                        v.akm_code,
                        v.org_code,
                        v.cur_code,
                        SUM(CASE WHEN v.dir = 'J' THEN v.amount ELSE 0 END) AS jamount,
                        SUM(CASE WHEN v.dir = 'D' THEN v.amount ELSE 0 END) AS damount,
                        SUM(CASE WHEN v.dir = 'J' THEN v.amount ELSE 0 END) AS year_jamount,
                        SUM(CASE WHEN v.dir = 'D' THEN v.amount ELSE 0 END) AS year_damount
                    FROM dwd_fnce_voucher v
                    WHERE v.year = EXTRACT(YEAR FROM vdate)
                      AND v.vdate <= vdate
                    GROUP BY v.year, v.akm_code, v.org_code, v.cur_code

                    UNION ALL

                    SELECT
                        a.year,
                        a.akm_code,
                        a.org_code,
                        a.cur_code,
                        a.jamount,
                        a.damount,
                        0 AS year_jamount,
                        0 AS year_damount
                    FROM dwd_fnce_ainitval a
                    WHERE a.year = EXTRACT(YEAR FROM vdate)
                )
                GROUP BY year, akm_code, org_code, cur_code
            ) leiji
            INNER JOIN dwd_fnce_akm akm
                ON akm.akm_code = leiji.akm_code
                AND akm.org_code = leiji.org_code
                AND akm.year = EXTRACT(YEAR FROM vdate)
            LEFT JOIN (
                SELECT
                    year,
                    akm_code,
                    org_code,
                    cur_code,
                    SUM(jamount) AS jamount,
                    SUM(damount) AS damount
                FROM (
                    SELECT
                        v.year,
                        v.akm_code,
                        v.org_code,
                        v.cur_code,
                        CASE WHEN v.dir = 'J' THEN v.amount ELSE 0 END AS jamount,
                        CASE WHEN v.dir = 'D' THEN v.amount ELSE 0 END AS damount
                    FROM dwd_fnce_voucher v
                    WHERE v.vdate = vdate
                )
                GROUP BY year, akm_code, org_code, cur_code
            ) jintian
                ON jintian.year = leiji.year
                AND jintian.akm_code = leiji.akm_code
                AND jintian.org_code = leiji.org_code
                AND jintian.cur_code = leiji.cur_code
            LEFT JOIN (
                SELECT
                    year,
                    akm_code,
                    org_code,
                    cur_code,
                    SUM(jamount) AS jamount,
                    SUM(damount) AS damount
                FROM (
                    SELECT
                        v.year,
                        v.akm_code,
                        v.org_code,
                        v.cur_code,
                        CASE WHEN v.dir = 'J' THEN v.amount ELSE 0 END AS jamount,
                        CASE WHEN v.dir = 'D' THEN v.amount ELSE 0 END AS damount
                    FROM dwd_fnce_voucher v
                    WHERE v.vdate <= vdate
                      AND v.pmonth = EXTRACT(MONTH FROM vdate)
                      AND v.year = EXTRACT(YEAR FROM vdate)
                )
                GROUP BY year, akm_code, org_code, cur_code
            ) mon
                ON mon.year = leiji.year
                AND mon.akm_code = leiji.akm_code
                AND mon.org_code = leiji.org_code
                AND mon.cur_code = leiji.cur_code
        LOOP
            INSERT INTO dwd_fnce_akmbalance VALUES (v_rec.*);
        END LOOP;

        v_startdate := v_startdate + INTERVAL '1 day';
    END LOOP;

    -- 计算非明细科目余额
    INSERT INTO dwd_fnce_akmbalance (vdate, akm_code, cur_code, branch_code, s_balance, jamount, damount, balance, total_jamount, total_damount, year_jamount, year_damount, mon_jamount, mon_damount)
    SELECT
        vdate,
        akm.akm_code,
        cur_code,
        akm.org_code,
        SUM(CASE WHEN akm.dir = ckm.dir THEN s_balance ELSE -s_balance END) AS s_balance,
        SUM(jamount) AS jamount,
        SUM(damount) AS damount,
        SUM(CASE WHEN akm.dir = ckm.dir THEN balance ELSE -balance END) AS balance,
        SUM(total_jamount) AS total_jamount,
        SUM(total_damount) AS total_damount,
        SUM(year_jamount) AS year_jamount,
        SUM(year_damount) AS year_damount,
        SUM(mon_jamount) AS mon_jamount,
        SUM(mon_damount) AS mon_damount
    FROM dwd_fnce_akm akm
    INNER JOIN dwd_fnce_akmbalance balance
        ON balance.akm_code LIKE akm.akm_code || '%'
        AND akm.year = EXTRACT(YEAR FROM balance.vdate)
    INNER JOIN dwd_fnce_akm ckm
        ON ckm.akm_code = balance.akm_code
        AND ckm.year = EXTRACT(YEAR FROM balance.vdate)
    WHERE akm.isdetailakm = 'N'
      AND vdate >= v_startdate2
    GROUP BY akm.akm_code, akm.org_code, vdate, cur_code
    ON CONFLICT (vdate, akm_code, cur_code, branch_code)
    DO UPDATE SET
        s_balance = EXCLUDED.s_balance,
        jamount = EXCLUDED.jamount,
        damount = EXCLUDED.damount,
        balance = EXCLUDED.balance,
        total_jamount = EXCLUDED.total_jamount,
        total_damount = EXCLUDED.total_damount,
        year_jamount = EXCLUDED.year_jamount,
        year_damount = EXCLUDED.year_damount,
        mon_jamount = EXCLUDED.mon_jamount,
        mon_damount = EXCLUDED.mon_damount;

    -- 插入完成日志记录
    INSERT INTO dwd_log (log_message, log_time) VALUES ('sp_akm_balance,完成', CURRENT_TIMESTAMP);
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        -- 回滚事务并记录错误
        ROLLBACK;
        v_err := 'sp_akm_balance 执行异常: ' || SQLSTATE || ' - ' || SQLERRM;
        INSERT INTO dwd_log (log_message, log_time) VALUES (v_err, CURRENT_TIMESTAMP);
        COMMIT;
END;
$$;
