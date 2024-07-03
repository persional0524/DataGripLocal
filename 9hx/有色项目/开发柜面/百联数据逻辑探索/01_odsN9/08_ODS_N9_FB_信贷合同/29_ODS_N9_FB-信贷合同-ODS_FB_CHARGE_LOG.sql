-- 执行SQL脚本
delete
from ODS_FB_CHARGE_LOG;

-- FB_CHARGE_LOG

SELECT charge_log_id,
       bid,
       charge_type,
       charge_date,
       begin_date,
       end_date,
       amount,
       charge_rate,
       tally_flag,
       tally_id,
       error_msg,
       create_time,
       last_update_time,
       withdraw_amount,
       last_withdraw_amount,
       charge_rate_id,
       charge_id,
       charge_plan_id

FROM FB_CHARGE_LOG;

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_CHARGE_LOG  -- 合同收费记录
-- auto-generated definition
create table FB_CHARGE_LOG
(
    CHARGE_LOG_ID        NUMBER           not null
        constraint PK_FB_CHARGE_LOG
            primary key,
    BID                  NUMBER           not null
        constraint FK_FB_CHARG_CHARGELOG_FB_CONTR
            references FB_CONTRACTS,
    CHARGE_TYPE          VARCHAR2(8)      not null,
    CHARGE_DATE          DATE             not null,
    BEGIN_DATE           DATE             not null,
    END_DATE             DATE             not null,
    AMOUNT               NUMBER(15, 2)    not null,
    CHARGE_RATE          NUMBER(14, 6)    not null,
    TALLY_FLAG           NUMBER default 0 not null,
    TALLY_ID             NUMBER,
    ERROR_MSG            VARCHAR2(1024),
    CREATE_TIME          DATE             not null,
    LAST_UPDATE_TIME     DATE,
    WITHDRAW_AMOUNT      NUMBER(15, 2),
    LAST_WITHDRAW_AMOUNT NUMBER(15, 2),
    CHARGE_RATE_ID       NUMBER,
    CHARGE_ID            NUMBER,
    CHARGE_PLAN_ID       NUMBER
)
/

comment on table FB_CHARGE_LOG is '合同收费记录'
/

comment on column FB_CHARGE_LOG.CHARGE_LOG_ID is '计费记录Id'
/

comment on column FB_CHARGE_LOG.BID is '合同ID'
/

comment on column FB_CHARGE_LOG.CHARGE_TYPE is '税费类别'
/

comment on column FB_CHARGE_LOG.CHARGE_DATE is '收费日期'
/

comment on column FB_CHARGE_LOG.BEGIN_DATE is '计算开始日'
/

comment on column FB_CHARGE_LOG.END_DATE is '计算截止日'
/

comment on column FB_CHARGE_LOG.AMOUNT is '金额'
/

comment on column FB_CHARGE_LOG.CHARGE_RATE is '费率'
/

comment on column FB_CHARGE_LOG.TALLY_FLAG is '记帐标记'
/

comment on column FB_CHARGE_LOG.TALLY_ID is '核算数据Id'
/

comment on column FB_CHARGE_LOG.ERROR_MSG is '记帐失败原因'
/

comment on column FB_CHARGE_LOG.CREATE_TIME is '记录创建时间'
/

comment on column FB_CHARGE_LOG.LAST_UPDATE_TIME is '末次修改时间'
/

comment on column FB_CHARGE_LOG.WITHDRAW_AMOUNT is '保存已扣收的费用金额，以便对同一条费用记录做多次部分扣收。'
/

comment on column FB_CHARGE_LOG.LAST_WITHDRAW_AMOUNT is '保存上次扣收费用'
/

comment on column FB_CHARGE_LOG.CHARGE_RATE_ID is '收费fb_charge_rate id'
/

comment on column FB_CHARGE_LOG.CHARGE_ID is '价格收费ID'
/

comment on column FB_CHARGE_LOG.CHARGE_PLAN_ID is '合同费用计划ID'
/

create index RELATIONSHIP_21_FK
    on FB_CHARGE_LOG (BID)
/
 Show table preview */

 -- list 1
