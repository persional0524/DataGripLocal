-- 执行SQL脚本
delete
from STG_CPM_TICKET_TRACE
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- 表输入
SELECT TT_ID,
       TICKET_ID,
       BOOK_DATE,
       EXPLAIN,
       OLD_STATE,
       NEW_STATE,
       REL_TX_ID,
       TIME_TAG,
       REMARK,
       TRACE_TYPE,
       LAST_UPDATE_TIME,
       NEW_BRANCH_NO,
       NEW_TICKET_TAKER,
       OLD_TICKET_TAKER,
       OLD_BRANCH_NO
FROM CPM_TICKET_TRACE
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_TICKET_TRACE
-- auto-generated definition
create table CPM_TICKET_TRACE
(
    TT_ID            NUMBER not null,
    TICKET_ID        NUMBER
        constraint FK_TKT_TKTTRACE_TKTID
            references CPM_TICKET
                on delete cascade,
    BOOK_DATE        DATE,
    EXPLAIN          VARCHAR2(80),
    OLD_STATE        NUMBER,
    NEW_STATE        NUMBER,
    REL_TX_ID        NUMBER,
    TIME_TAG         DATE,
    REMARK           VARCHAR2(255),
    TRACE_TYPE       VARCHAR2(4),
    LAST_UPDATE_TIME DATE,
    NEW_BRANCH_NO    VARCHAR2(6),
    NEW_TICKET_TAKER VARCHAR2(20),
    OLD_TICKET_TAKER VARCHAR2(20),
    OLD_BRANCH_NO    VARCHAR2(6)
)
/

create index IDX_CPM_TICKET_TRACE_2
    on CPM_TICKET_TRACE (TT_ID, LAST_UPDATE_TIME)
/

create index IDX_CPM_TICKET_TRACE_3
    on CPM_TICKET_TRACE (LAST_UPDATE_TIME)
/

create unique index PK_CPM_TICKET_TRACE
    on CPM_TICKET_TRACE (TT_ID)
/

create index IDX_CPM_TICKET_TRACE_7
    on CPM_TICKET_TRACE (NEW_BRANCH_NO, NEW_STATE, TRACE_TYPE, TIME_TAG, LAST_UPDATE_TIME)
/

create index RELATIONSHIP_83_FK
    on CPM_TICKET_TRACE (TICKET_ID)
/

create index IDX_CPM_TICKET_TRACE_4
    on CPM_TICKET_TRACE (NEW_BRANCH_NO, NEW_STATE, TRACE_TYPE)
/

create index IDX_CPM_TICKET_TRACE_1
    on CPM_TICKET_TRACE (NEW_BRANCH_NO, TT_ID, NEW_STATE, TRACE_TYPE, TIME_TAG, LAST_UPDATE_TIME)
/

alter table CPM_TICKET_TRACE
    add constraint PK_CPM_TICKET_TRACE
        primary key (TT_ID, LAST_UPDATE_TIME)
/
 Show table preview */

/*
CPM_TICKET_TRACE 票证流转轨迹表
字段	含义	备注
TT_ID	TT_ID	　
TICKET_ID	单据ID	　
BOOK_DATE	签发日期	　
EXPLAIN	备注项	　
OLD_STATE	原状态	　
NEW_STATE	新状态	　
REL_TX_ID	相关交易流水号	　
TIME_TAG	时间	　
REMARK	备注	　
TRACE_TYPE	轨迹类型	　
LAST_UPDATE_TIME	最后修改时间	　
NEW_BRANCH_NO	新机构号	　
NEW_TICKET_TAKER	新领用人	　
OLD_TICKET_TAKER	原领用人	　
OLD_BRANCH_NO	原机构号	　
*/

-- list 1