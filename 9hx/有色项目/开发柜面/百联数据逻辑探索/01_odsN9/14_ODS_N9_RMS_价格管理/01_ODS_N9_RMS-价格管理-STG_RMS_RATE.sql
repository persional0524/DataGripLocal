-- 执行SQL脚本
delete
from STG_RMS_RATE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_RMS_RATE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       CY_ID,
       RATE_TYPE_ID,
       RATE_KIND_ID,
       FLOAT_METHOD,
       IS_STOP,
       IS_OUTER,
       STATE,
       DOWN_LIMIT,
       UP_LIMIT,
       ACTIVE_DATE,
       RATE_VALUE,
       APPEND_VALUE,
       BASE_RATE_VALUE,
       LARGE_BEGIN_VALUE,
       FLOW_ID,
       CREATE_TIME,
       LAST_UPDATE_TIME,
       CAN_FLOAT,
       FLOAT_VALUE,
       AUTO_ADJUST,
       IS_BASE,
       IS_AUTOMATICALLY,
       BASE_RATE_KIND_ID,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM RMS_RATE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: RMS_RATE
-- auto-generated definition
create table RMS_RATE
(
    ID                NUMBER                        not null
        constraint PK_RMS_RATE
            primary key,
    CY_ID             VARCHAR2(8),
    RATE_TYPE_ID      NUMBER
        constraint FK_RATE_R_RATE_TYPE
            references RMS_RATE_TYPE,
    RATE_KIND_ID      NUMBER                        not null
        constraint FK_RATE_R_RATE_KIND
            references RMS_RATE_KIND,
    FLOAT_METHOD      NUMBER,
    IS_STOP           NUMBER                        not null,
    IS_OUTER          NUMBER                        not null,
    STATE             NUMBER                        not null,
    DOWN_LIMIT        NUMBER(17, 6),
    UP_LIMIT          NUMBER(17, 6),
    ACTIVE_DATE       DATE                          not null,
    RATE_VALUE        NUMBER(17, 6) default 0,
    APPEND_VALUE      NUMBER(17, 6) default 0       not null,
    BASE_RATE_VALUE   NUMBER(17, 6),
    LARGE_BEGIN_VALUE NUMBER(17, 6),
    FLOW_ID           NUMBER                        not null
        constraint FK_RATE_R_FLOW
            references RMS_FLOW,
    CREATE_TIME       DATE          default SYSDATE not null,
    LAST_UPDATE_TIME  DATE                          not null,
    CAN_FLOAT         NUMBER,
    FLOAT_VALUE       NUMBER(17, 6),
    AUTO_ADJUST       NUMBER,
    IS_BASE           NUMBER,
    IS_AUTOMATICALLY  NUMBER,
    BASE_RATE_KIND_ID NUMBER
)
/

comment on column RMS_RATE.FLOAT_METHOD is '0绝对值
1比例
'
/

comment on column RMS_RATE.STATE is '已录入0
待审批1
已审批2
已驳回-1'
/

comment on column RMS_RATE.FLOAT_VALUE is '浮动值'
/

comment on column RMS_RATE.AUTO_ADJUST is '是否根据基准利率自动调整 0不调整1自动调整'
/

comment on column RMS_RATE.IS_BASE is '0挂牌利率1基准利率'
/

comment on column RMS_RATE.IS_AUTOMATICALLY is '是否根据基准利率自动调整'
/

comment on column RMS_RATE.BASE_RATE_KIND_ID is '对应基准利率种类id'
/
 Show table preview */


/*
RMS_RATE 利率
字段	含义	备注
ID	ID标识	　
CY_ID	币种外键	　
RATE_TYPE_ID	利率类型外键	　
RATE_KIND_ID	利率种类	　
FLOAT_METHOD	浮动方式	0绝对值
1比例
IS_STOP	是否停用	　
IS_OUTER	是否外币	0人民币
1外币
STATE	状态	暂存0
待审批1
已审批2
审批驳回-1
DOWN_LIMIT	下限	　
UP_LIMIT	上限	　
ACTIVE_DATE	生效日	　
RATE_VALUE	利率/加收比率	　
APPEND_VALUE	附加值	　
BASE_RATE_VALUE	小额外币基准利率	　
LARGE_BEGIN_VALUE	大额外币起存款点	　
FLOW_ID	流程外键	　
CREATE_TIME	创建日期	　
LAST_UPDATE_TIME	修改日期	　
CAN_FLOAT	是否可浮动	　
*/

