-- 执行SQL脚本
delete
from ODS_CPM_TX
WHERE TX_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- 表输入
SELECT TX_ID,
       TX_TYPE_ID,
       CHANNEL_ID,
       TX_BIZ_TYPE,
       TX_ABSTRACT,
       TX_COMMENT,
       BRANCH_NO,
       SOURCE_ID,
       TX_DATE,
       PRIOR_TXID,
       VCH_UDC,
       TX_FINGER_PRINT,
       TX_STATE,
       EXECUTE_FLAG,
       EXEC_RESULT,
       ERROR_CODE,
       ERROR_TEXT,
       SUCC_BIZ_CODE,
       TX_REFCODE,
       TX_CLASS,
       CUR_CODE,
       TX_CLEAR_STATE,
       TX_CLEAR_RESULT,
       INPUTER,
       INPUTER_NAME,
       CHECKER,
       CHECKER_NAME,
       RATIFIER,
       RATIFIER_NAME,
       INPUT_TIME,
       CHECK_TIME,
       RATIFY_TIME,
       CREATE_BR_NO,
       SPECIAL_TX_FLAG,
       PRINT_COUNT,
       SOURCE_PROMOTER,
       BTX_ID,
       BIZ_FLOW_CASE_ID,
       VERSION_COLUMN

FROM CPM_TX
WHERE TX_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

/*
字段缺失
       REAL_TX_TYPE_ID,
       TX_FLAG*/


-- ddl  无表，字段注释
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_TX
-- auto-generated definition
create table CPM_TX
(
    TX_ID            NUMBER           not null,
    TX_TYPE_ID       NUMBER
        constraint FK_CPM_TX_REL_TX_TX_CPM_TX_T
            references CPM_TX_TYPE,
    CHANNEL_ID       NUMBER           not null
        constraint FK_CPM_TX_REL_TX_CH_CPM_CHAN
            references CPM_CHANNEL,
    TX_BIZ_TYPE      NUMBER,
    TX_ABSTRACT      VARCHAR2(255),
    TX_COMMENT       VARCHAR2(256),
    BRANCH_NO        VARCHAR2(6),
    SOURCE_ID        VARCHAR2(64),
    TX_DATE          DATE             not null,
    PRIOR_TXID       NUMBER,
    VCH_UDC          VARCHAR2(32),
    TX_FINGER_PRINT  VARCHAR2(254)
        constraint UK_CPM_TX_TX_FINGER_PRINT
            unique,
    TX_STATE         NUMBER           not null,
    EXECUTE_FLAG     NUMBER,
    EXEC_RESULT      NUMBER,
    ERROR_CODE       VARCHAR2(16),
    ERROR_TEXT       VARCHAR2(512),
    SUCC_BIZ_CODE    VARCHAR2(64),
    TX_REFCODE       VARCHAR2(10),
    TX_CLASS         VARCHAR2(50),
    CUR_CODE         VARCHAR2(8),
    TX_CLEAR_STATE   NUMBER,
    TX_CLEAR_RESULT  NUMBER,
    INPUTER          VARCHAR2(20),
    INPUTER_NAME     VARCHAR2(128),
    CHECKER          VARCHAR2(20),
    CHECKER_NAME     VARCHAR2(128),
    RATIFIER         VARCHAR2(20),
    RATIFIER_NAME    VARCHAR2(128),
    INPUT_TIME       DATE,
    CHECK_TIME       DATE,
    RATIFY_TIME      DATE,
    CREATE_BR_NO     VARCHAR2(8)
        constraint FK_CPM_TX_RELATIONS_CPM_BRAN
            references CPM_BRANCH,
    SPECIAL_TX_FLAG  NUMBER default 0,
    PRINT_COUNT      NUMBER,
    SOURCE_PROMOTER  VARCHAR2(64),
    BTX_ID           NUMBER,
    BIZ_FLOW_CASE_ID NUMBER,
    VERSION_COLUMN   NUMBER default 0 not null
)
/

comment on column CPM_TX.SOURCE_PROMOTER is '原渠道发起人'
/

comment on column CPM_TX.BTX_ID is '批量开户交易Id'
/

comment on column CPM_TX.VERSION_COLUMN is '版本列'
/

create index REL_TX_TXTYPE_FK
    on CPM_TX (TX_TYPE_ID)
/

create index IDX_CPM_TX_DATE
    on CPM_TX (TX_DATE)
/

create index CPM_TX_CLASS_IDX
    on CPM_TX (TX_CLASS)
/

create index IDX_TX_ID_DATE
    on CPM_TX (TX_ID, TX_DATE, CHANNEL_ID)
/

create unique index PK_CPM_TX
    on CPM_TX (TX_ID)
/

alter table CPM_TX
    add constraint PK_CPM_TX
        primary key (TX_ID, TX_DATE, CHANNEL_ID)
/
 Show table preview */


/*
CPM_TX 核心交易表
字段	含义	备注
TX_ID	交易ID	　
TX_TYPE_ID	交易定义ID	　
CHANNEL_ID	渠道ID	　
TX_BIZ_TYPE	交易业务分类	　
TX_ABSTRACT	交易摘要	　
TX_COMMENT	交易附言	　
BRANCH_NO	营业机构号	　
SOURCE_ID	发起业务ID	　
TX_DATE	交易日期	　
PRIOR_TXID	前置交易ID	　
VCH_UDC	用户自定义分类码	　
TX_FINGER_PRINT	指纹校验	　
TX_STATE	交易状态	1, 已录入
2, 已复核
3, 已审批
4, 已入账
-1, 审批驳回
-2, 复核驳回
-3,已标记删除
EXECUTE_FLAG	处理标记	　
EXEC_RESULT	处理结果	　
ERROR_CODE	错误代码	　
ERROR_TEXT	出错信息	　
SUCC_BIZ_CODE	后续业务标识	　
TX_REFCODE	交易参考号	自动生成的交易参考号，日内不重复，按大类分别编排。
TX_CLASS	类标识	　
CUR_CODE	币种代号	　
TX_CLEAR_STATE	清算状态	　
TX_CLEAR_RESULT	清算结果	清算结果
1 清算成功
2 退票
3 手工提票
4 拒绝
INPUTER	经办人	　
CHECKER	复核人	　
RATIFIER	审批人	　
INPUTER_NAME	经办人姓名	　
CHECKER_NAME	复核人姓名	　
RATIFIER_NAME	审批人姓名	　
INPUT_TIME	录入时间	　
CHECK_TIME	复核时间	　
RATIFY_TIME	审批时间	　
CREATE_BR_NO	营业机_营业机构号	　
SPECIAL_TX_FLAG	特殊交易标识	　
PRINT_COUNT	打印次数	　
SOURCE_PROMOTER	原始发起人	　
BIZ_FLOW_CASE_ID	交易使用的BIZFLOW流程类型ID	　
VERSION_COLUMN	版本号	　
*/
