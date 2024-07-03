-- 执行SQL脚本
TRUNCATE TABLE ODS_FB_SPECIAL_ACTIONS;

-- 表输入
SELECT ACTION_TYPE,
       ACT_DATE,
       AMOUNT,
       REMARK,
       STATE,
       OP_NAME,
       OP_TIME,
       ACTION_ID,
       BID,
       OLD_MATURITY,
       LENDING_ID
FROM FB_SPECIAL_ACTIONS;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_SPECIAL_ACTIONS  -- 合同特别处理记录
-- auto-generated definition
create table FB_SPECIAL_ACTIONS
(
    ACTION_TYPE  VARCHAR2(16),
    ACT_DATE     DATE          not null,
    AMOUNT       NUMBER(15, 2) not null,
    REMARK       VARCHAR2(1024),
    STATE        NUMBER,
    OP_NAME      VARCHAR2(100),
    OP_TIME      DATE,
    ACTION_ID    NUMBER        not null
        constraint PK_FB_SPECIAL_ACTIONS
            primary key,
    BID          NUMBER
        constraint FK_FB_SPECIAL_FB_CONTRACT
            references FB_CONTRACTS,
    OLD_MATURITY DATE,
    LENDING_ID   NUMBER
        constraint FK_FB_SPECIAL_LEND
            references FB_LENDINGS
)
/

comment on table FB_SPECIAL_ACTIONS is '合同特别处理记录'
/

comment on column FB_SPECIAL_ACTIONS.ACTION_TYPE is '处理类型'
/

comment on column FB_SPECIAL_ACTIONS.ACT_DATE is '处理日期'
/

comment on column FB_SPECIAL_ACTIONS.AMOUNT is '金额'
/

comment on column FB_SPECIAL_ACTIONS.REMARK is '备注'
/

comment on column FB_SPECIAL_ACTIONS.STATE is '状态'
/

comment on column FB_SPECIAL_ACTIONS.OP_NAME is '操作人'
/

comment on column FB_SPECIAL_ACTIONS.OP_TIME is '操作时间'
/

comment on column FB_SPECIAL_ACTIONS.LENDING_ID is '借据id'
/
 Show table preview */

-- list 不存在