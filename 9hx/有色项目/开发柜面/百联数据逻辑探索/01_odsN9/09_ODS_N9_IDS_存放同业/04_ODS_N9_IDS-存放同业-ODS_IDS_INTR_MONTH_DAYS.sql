-- 表输入
SELECT intr_month_id,
       days,
       name
FROM IDS_INTR_MONTH_DAYS;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: IDS_INTR_MONTH_DAYS  -- 计息每月天数表
-- auto-generated definition
create table IDS_INTR_MONTH_DAYS
(
    INTR_MONTH_ID NUMBER not null
        constraint PK_IDS_INTR_MONTH_DAYS
            primary key,
    DAYS          NUMBER,
    NAME          VARCHAR2(64)
)
/

comment on table IDS_INTR_MONTH_DAYS is '计息每月天数表'
/

comment on column IDS_INTR_MONTH_DAYS.INTR_MONTH_ID is '主键'
/

comment on column IDS_INTR_MONTH_DAYS.DAYS is '天数 null表示按实际天数'
/

comment on column IDS_INTR_MONTH_DAYS.NAME is '描述'
/
 Show table preview*/

-- list 1