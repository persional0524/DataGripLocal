-- 执行SQL脚本
TRUNCATE TABLE ODS_FB_PLAN_CHANGE_LOG;

-- 表输入
SELECT CHANGE_INDEX,
       BID,
       LOG_TYPE,
       ORIGINAL_DATE,
       CHANGE_DATE,
       CORRELATION_NUM,
       CHANGE_REASON,
       CREATE_TIME,
       MEMO,
       LENDING_ID,
       CREATOR,
       APPLY_ID
FROM FB_PLAN_CHANGE_LOG;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_PLAN_CHANGE_LOG  -- 合同计划变更记录
-- auto-generated definition
create table FB_PLAN_CHANGE_LOG
(
    CHANGE_INDEX    NUMBER not null
        constraint PK_FB_PLAN_CHANGE_LOG
            primary key,
    BID             NUMBER not null
        constraint FK_FB_PLAN__REFERENCE_FB_CONTR
            references FB_CONTRACTS,
    LOG_TYPE        NUMBER not null,
    ORIGINAL_DATE   DATE   not null,
    CHANGE_DATE     DATE   not null,
    CORRELATION_NUM VARCHAR2(32),
    CHANGE_REASON   VARCHAR2(1024),
    CREATE_TIME     DATE   not null,
    MEMO            VARCHAR2(512),
    LENDING_ID      NUMBER,
    CREATOR         VARCHAR2(80),
    APPLY_ID        NUMBER
)
/

comment on table FB_PLAN_CHANGE_LOG is '合同计划变更记录'
/

comment on column FB_PLAN_CHANGE_LOG.CHANGE_INDEX is '计划变更序号'
/

comment on column FB_PLAN_CHANGE_LOG.BID is '合同ID'
/

comment on column FB_PLAN_CHANGE_LOG.LOG_TYPE is '日志类型：
0：原始合同计划
1：展期
2：提前还款
3：变更本金计划
'
/

comment on column FB_PLAN_CHANGE_LOG.ORIGINAL_DATE is '变更前原始日期
Change_Action=0时，原始合同计划，对应合同到期日
Change_Action=1时，展期，对应合同原到期日
Change_Action=2时，提前还款，对应合同到期日
Change_Action=3时，本金计划变更，对应合同到期日
'
/

comment on column FB_PLAN_CHANGE_LOG.CHANGE_DATE is '变更后业务日期
Change_Action=0时，原始合同计划，对应合同到期日
Change_Action=1时，展期，对应展期后合同到期日
Change_Action=2时，提前还款，对应期望还款日期
Change_Action=3时，本金计划变更，对应合同到期日'
/

comment on column FB_PLAN_CHANGE_LOG.CORRELATION_NUM is '相关协议编号
Change_Action=0时，原始合同计划，无
Change_Action=1时，展期，展期协议号
Change_Action=2时，提前还款，提前还款协议号
Change_Action=3时，本金计划变更，无'
/

comment on column FB_PLAN_CHANGE_LOG.CHANGE_REASON is '变更原因'
/

comment on column FB_PLAN_CHANGE_LOG.CREATE_TIME is '记录创建时间'
/

comment on column FB_PLAN_CHANGE_LOG.MEMO is '备注
目前用于存储合同号和操作人名称，形如{CTNO=LDZJ00001}{OP=张三}'
/

comment on column FB_PLAN_CHANGE_LOG.APPLY_ID is '申请单ID'
/
 Show table preview*/

-- list 不存在