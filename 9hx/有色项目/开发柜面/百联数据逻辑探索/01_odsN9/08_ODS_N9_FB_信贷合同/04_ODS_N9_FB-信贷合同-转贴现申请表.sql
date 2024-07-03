-- 执行SQL脚本
delete
from STG_FB_DISCOUNT_APPLY
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_DISCOUNT_APPLY', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 研发环境无数据

SELECT APPLY_ID,
       DISCOUNT_TYPE,
       REDISCOUNT_DATE,
       REBUY_DATE,
       DISCOUNT_MODE,
       RATE,
       TYPES_OF_RATE,
       TRADER_ID,
       AMOUNT,
       STATE,
       DISCOUNT_COUNT,
       CREATE_TIME,
       REMARK,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_DISCOUNT_APPLY;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_DISCOUNT_APPLY  -- 转贴现申请表
-- auto-generated definition
create table FB_DISCOUNT_APPLY
(
    APPLY_ID        NUMBER not null
        constraint PK_FB_DISCOUNT_APPLY
            primary key,
    DISCOUNT_TYPE   VARCHAR2(10),
    REDISCOUNT_DATE DATE,
    REBUY_DATE      DATE,
    DISCOUNT_MODE   NUMBER,
    RATE            NUMBER(10, 6),
    TYPES_OF_RATE   VARCHAR2(10),
    TRADER_ID       NUMBER,
    AMOUNT          NUMBER(15, 2),
    STATE           NUMBER,
    DISCOUNT_COUNT  NUMBER,
    CREATE_TIME     DATE,
    REMARK          VARCHAR2(1024)
)
/

comment on table FB_DISCOUNT_APPLY is '转贴现申请表'
/

comment on column FB_DISCOUNT_APPLY.APPLY_ID is '主键'
/

comment on column FB_DISCOUNT_APPLY.DISCOUNT_TYPE is '类型 00 转贴现 01 转贴现'
/

comment on column FB_DISCOUNT_APPLY.REDISCOUNT_DATE is '转贴现日期'
/

comment on column FB_DISCOUNT_APPLY.REBUY_DATE is '回购日期'
/

comment on column FB_DISCOUNT_APPLY.DISCOUNT_MODE is '票据转贴现类型 (卖断式,回购式)'
/

comment on column FB_DISCOUNT_APPLY.RATE is '转贴现利率'
/

comment on column FB_DISCOUNT_APPLY.TYPES_OF_RATE is '利率类型'
/

comment on column FB_DISCOUNT_APPLY.TRADER_ID is '交易方ID'
/

comment on column FB_DISCOUNT_APPLY.AMOUNT is '票据金额'
/

comment on column FB_DISCOUNT_APPLY.STATE is '状态 0新录入，1审批中，2审批通过，3驳回'
/

comment on column FB_DISCOUNT_APPLY.DISCOUNT_COUNT is '票据数'
/

comment on column FB_DISCOUNT_APPLY.CREATE_TIME is '创建时间'
/

comment on column FB_DISCOUNT_APPLY.REMARK is '备注'
/
 Show table preview */

-- list 不存在