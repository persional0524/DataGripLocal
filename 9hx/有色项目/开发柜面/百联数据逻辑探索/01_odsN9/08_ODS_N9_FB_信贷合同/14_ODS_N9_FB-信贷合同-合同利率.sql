-- 执行SQL脚本
delete
from STG_FB_INTREST_RATES
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_INTREST_RATES', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT RATE_ID,
       BID,
       RATE_TYPE,
       EFT_DATE,
       RATE,
       RELATIVE_FLAG,
       LAST_FLAG,
       FIRST_FLAG,
       TYPESOFRATE,
       OP_TIME,
       OP_NAME,
       REMARK,
       RMS_FLAG,
       RMS_METHOD,
       RMS_VALUE,
       RMS_RATE_ID,
       RMS_TYPE,
       LAST_VALUE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_INTREST_RATES;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_INTREST_RATES  -- 合同利率
-- auto-generated definition
create table FB_INTREST_RATES
(
    RATE_ID       NUMBER                  not null
        constraint PK_FB_INTREST_RATES
            primary key,
    BID           NUMBER                  not null,
    RATE_TYPE     VARCHAR2(4)             not null,
    EFT_DATE      DATE                    not null,
    RATE          NUMBER(10, 6)           not null,
    RELATIVE_FLAG NUMBER        default 0 not null,
    LAST_FLAG     NUMBER                  not null,
    FIRST_FLAG    NUMBER                  not null,
    TYPESOFRATE   NUMBER,
    OP_TIME       DATE,
    OP_NAME       VARCHAR2(100),
    REMARK        VARCHAR2(1024),
    RMS_FLAG      NUMBER(10, 6),
    RMS_METHOD    NUMBER,
    RMS_VALUE     NUMBER(10, 6),
    RMS_RATE_ID   NUMBER,
    RMS_TYPE      NUMBER,
    LAST_VALUE    NUMBER(10, 6) default 0
)
/

comment on table FB_INTREST_RATES is '合同利率'
/

comment on column FB_INTREST_RATES.RATE_ID is '利率记录Id'
/

comment on column FB_INTREST_RATES.BID is '合同ID'
/

comment on column FB_INTREST_RATES.RATE_TYPE is '利率类型'
/

comment on column FB_INTREST_RATES.EFT_DATE is '生效日期'
/

comment on column FB_INTREST_RATES.RATE is '利率值'
/

comment on column FB_INTREST_RATES.RELATIVE_FLAG is '是否为相对值'
/

comment on column FB_INTREST_RATES.LAST_FLAG is '末次利率标记'
/

comment on column FB_INTREST_RATES.FIRST_FLAG is '首次利率标记'
/

comment on column FB_INTREST_RATES.TYPESOFRATE is '年利率1月利率0'
/

comment on column FB_INTREST_RATES.OP_TIME is '操作时间'
/

comment on column FB_INTREST_RATES.OP_NAME is '操作人'
/

comment on column FB_INTREST_RATES.REMARK is '备注'
/

comment on column FB_INTREST_RATES.RMS_FLAG is '价格浮动值'
/

comment on column FB_INTREST_RATES.RMS_METHOD is '价格浮动方式'
/

comment on column FB_INTREST_RATES.RMS_VALUE is '价格基准利率'
/

comment on column FB_INTREST_RATES.RMS_RATE_ID is '价格基准利率ID'
/

comment on column FB_INTREST_RATES.RMS_TYPE is '价格基准利率类型SIBER\LIBER\HIBER'
/

comment on column FB_INTREST_RATES.LAST_VALUE is '最终利率'
/
 Show table preview */

-- list 1