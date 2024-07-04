-- 执行SQL脚本
delete
from STG_ICS_CREDIT_ACQUIRE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_ICS_CREDIT_ACQUIRE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 2
SELECT ACQUIRE_ID,
       TRADER_ID,
       START_DATE,
       END_DATE,
       AMOUNT,
       USED_AMOUNT,
       CTRL_METHOD,
       STATUS,
       CREATOR,
       CREATE_TIME,
       UPDATOR,
       UPDATE_TIME,
       BIZSTATUS,
       REVOKEMEMO,
       REVOKTOR,
       REVOKTORNAME,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM ICS_CREDIT_ACQUIRE;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: ICS_CREDIT_ACQUIRE  -- 获得授信表
-- auto-generated definition
create table ICS_CREDIT_ACQUIRE
(
    ACQUIRE_ID   NUMBER        not null
        constraint PK_ICS_CREDIT_ACQUIRE
            primary key,
    TRADER_ID    NUMBER        not null,
    START_DATE   DATE          not null,
    END_DATE     DATE          not null,
    AMOUNT       NUMBER(17, 2) not null,
    USED_AMOUNT  NUMBER(17, 2) not null,
    CTRL_METHOD  NUMBER        not null,
    STATUS       NUMBER        not null,
    CREATOR      NUMBER        not null,
    CREATE_TIME  DATE          not null,
    UPDATOR      NUMBER        not null,
    UPDATE_TIME  DATE          not null,
    BIZSTATUS    NUMBER default 0,
    REVOKEMEMO   VARCHAR2(256),
    REVOKTOR     NUMBER,
    REVOKTORNAME VARCHAR2(32)
)
/

comment on table ICS_CREDIT_ACQUIRE is '获得授信表'
/

comment on column ICS_CREDIT_ACQUIRE.ACQUIRE_ID is '获得授信ID'
/

comment on column ICS_CREDIT_ACQUIRE.TRADER_ID is '交易对手'
/

comment on column ICS_CREDIT_ACQUIRE.START_DATE is '开始日期'
/

comment on column ICS_CREDIT_ACQUIRE.END_DATE is '截止日期'
/

comment on column ICS_CREDIT_ACQUIRE.AMOUNT is '授信额度'
/

comment on column ICS_CREDIT_ACQUIRE.USED_AMOUNT is '已占用金额'
/

comment on column ICS_CREDIT_ACQUIRE.CTRL_METHOD is '控制方式'
/

comment on column ICS_CREDIT_ACQUIRE.STATUS is '状态（0：已录入；1：已报批；2：已生效；3：已驳回；9：已失效）'
/

comment on column ICS_CREDIT_ACQUIRE.CREATOR is '创建人'
/

comment on column ICS_CREDIT_ACQUIRE.CREATE_TIME is '创建时间'
/

comment on column ICS_CREDIT_ACQUIRE.UPDATOR is '最后修改人'
/

comment on column ICS_CREDIT_ACQUIRE.UPDATE_TIME is '最后修改时间'
/

comment on column ICS_CREDIT_ACQUIRE.BIZSTATUS is '业务流程状态（0：已录入；1：已提交；2：已审批；3：已驳回）'
/

comment on column ICS_CREDIT_ACQUIRE.REVOKEMEMO is '驳回原因'
/

comment on column ICS_CREDIT_ACQUIRE.REVOKTOR is '驳回人'
/

comment on column ICS_CREDIT_ACQUIRE.REVOKTORNAME is '驳回人名称'
/
 Show table preview*/

-- list 不存在