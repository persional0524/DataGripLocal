-- 执行SQL脚本
delete
from STG_FB_DISCOUNT_RE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_DISCOUNT_RE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       BID,
       DISCOUNT_ID,
       TYPE,
       REDISCOUNT_DATE,
       NOTE_DISCOUNT_TYPE,
       RATE,
       TYPES_OF_RATE,
       END_DATE,
       STATE,
       INPUTOR,
       CREATE_TIME,
       DAY_IN_WAY,
       CORRECT_DAYS,
       DAY_NUM,
       INTREST,
       TRADER_ID,
       APPLY_ID,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_DISCOUNT_RE;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_DISCOUNT_RE  -- 转贴现记录表
-- auto-generated definition
create table FB_DISCOUNT_RE
(
    ID                 NUMBER not null
        constraint PK_DISCOUNT_BUSINESS
            primary key,
    BID                NUMBER,
    DISCOUNT_ID        NUMBER,
    TYPE               VARCHAR2(10),
    REDISCOUNT_DATE    DATE,
    NOTE_DISCOUNT_TYPE NUMBER,
    RATE               NUMBER(10, 6),
    TYPES_OF_RATE      VARCHAR2(10),
    END_DATE           DATE,
    STATE              NUMBER,
    INPUTOR            VARCHAR2(100),
    CREATE_TIME        DATE,
    DAY_IN_WAY         NUMBER,
    CORRECT_DAYS       NUMBER,
    DAY_NUM            NUMBER,
    INTREST            NUMBER(15, 2),
    TRADER_ID          NUMBER,
    APPLY_ID           NUMBER
)
/

comment on table FB_DISCOUNT_RE is '转贴现记录表'
/

comment on column FB_DISCOUNT_RE.ID is '主键'
/

comment on column FB_DISCOUNT_RE.BID is '合同主键'
/

comment on column FB_DISCOUNT_RE.DISCOUNT_ID is '票据主键'
/

comment on column FB_DISCOUNT_RE.TYPE is '类型 00 贴现 01 转贴现'
/

comment on column FB_DISCOUNT_RE.REDISCOUNT_DATE is '转贴现日期'
/

comment on column FB_DISCOUNT_RE.NOTE_DISCOUNT_TYPE is '票据转贴现类型 (买断式,回购式)'
/

comment on column FB_DISCOUNT_RE.RATE is '转贴现利率'
/

comment on column FB_DISCOUNT_RE.TYPES_OF_RATE is '利率类型'
/

comment on column FB_DISCOUNT_RE.END_DATE is '票据结束日期'
/

comment on column FB_DISCOUNT_RE.STATE is '执行状态 0 执行中 1 已执行 2 已结束'
/

comment on column FB_DISCOUNT_RE.INPUTOR is '录入人'
/

comment on column FB_DISCOUNT_RE.CREATE_TIME is '创建时间'
/

comment on column FB_DISCOUNT_RE.DAY_IN_WAY is '在途天数'
/

comment on column FB_DISCOUNT_RE.CORRECT_DAYS is '顺延天数'
/

comment on column FB_DISCOUNT_RE.DAY_NUM is '计息天数'
/

comment on column FB_DISCOUNT_RE.INTREST is '利息金额'
/

comment on column FB_DISCOUNT_RE.TRADER_ID is '交易方ID'
/

comment on column FB_DISCOUNT_RE.APPLY_ID is '申请id'
/
 Show table preview */

-- list 1