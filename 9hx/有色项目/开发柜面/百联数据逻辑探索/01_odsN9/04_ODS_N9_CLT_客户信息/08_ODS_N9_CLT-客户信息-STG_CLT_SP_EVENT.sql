-- 执行SQL脚本
delete
from STG_CLT_SP_EVENT
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_CLT_SP_EVENT', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入 表中无数据
SELECT ID,
       CLTNO,
       EVENTDATE,
       DESCRIPTION,
       CREATOR,
       CREATETIME,
       MODIFIER,
       MODIFYTIME,
       STATUS,
       CAUSE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM CLT_SP_EVENT;

--ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_SP_EVENT  -- 客户大事记录表
-- auto-generated definition
create table CLT_SP_EVENT
(
    ID          NUMBER(6) not null
        constraint PK_CLT_SP_EVENT
            primary key,
    CLTNO       VARCHAR2(30),
    EVENTDATE   DATE,
    DESCRIPTION VARCHAR2(100),
    CREATOR     VARCHAR2(24),
    CREATETIME  DATE,
    MODIFIER    VARCHAR2(24),
    MODIFYTIME  DATE,
    STATUS      NUMBER,
    CAUSE       VARCHAR2(100)
)
/

comment on table CLT_SP_EVENT is '客户大事记录表'
/

comment on column CLT_SP_EVENT.ID is '主键'
/

comment on column CLT_SP_EVENT.CLTNO is '客户编码'
/

comment on column CLT_SP_EVENT.EVENTDATE is '事件发生日期'
/

comment on column CLT_SP_EVENT.DESCRIPTION is '事件描述'
/

comment on column CLT_SP_EVENT.CREATOR is '录入人'
/

comment on column CLT_SP_EVENT.CREATETIME is '录入时间'
/

comment on column CLT_SP_EVENT.MODIFIER is '修改人'
/

comment on column CLT_SP_EVENT.MODIFYTIME is '最后修改时间'
/

comment on column CLT_SP_EVENT.STATUS is '状态'
/

comment on column CLT_SP_EVENT.CAUSE is '驳回原因'
/
 Show table preview */

-- 表清单存在