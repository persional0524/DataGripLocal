-- 执行SQL脚本

delete
from STG_FB_ACCEPTANCE_BILL
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_ACCEPTANCE_BILL', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       BID,
       BILL_NO,
       BILL_KIND,
       BILL_AMOUNT,
       START_DATE,
       END_DATE,
       DAY_NUM,
       BMS_BILL_ID,
       BILL_STATE,
       SURETY,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_ACCEPTANCE_BILL;

-- ddl
/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_ACCEPTANCE_BILL  -- 合同承兑票据
-- auto-generated definition
create table FB_ACCEPTANCE_BILL
(
    ID          NUMBER           not null
        constraint PK_FB_ACCEPTANCE_BILL
            primary key,
    BID         NUMBER           not null
        constraint FK_FB_ACCEP_RELATIONS_FB_CONTR
            references FB_CONTRACTS,
    BILL_NO     VARCHAR2(64),
    BILL_KIND   VARCHAR2(32),
    BILL_AMOUNT NUMBER(15, 2)    not null,
    START_DATE  DATE             not null,
    END_DATE    DATE             not null,
    DAY_NUM     NUMBER           not null,
    BMS_BILL_ID NUMBER,
    BILL_STATE  NUMBER default 1 not null,
    SURETY      VARCHAR2(12),
    RM_AMOUNT   NUMBER(16, 2)
)
/

comment on table FB_ACCEPTANCE_BILL is '合同承兑票据'
/

comment on column FB_ACCEPTANCE_BILL.ID is '票据Id'
/

comment on column FB_ACCEPTANCE_BILL.BID is '合同ID'
/

comment on column FB_ACCEPTANCE_BILL.BILL_NO is '票据编号'
/

comment on column FB_ACCEPTANCE_BILL.BILL_KIND is '票据种类   对应Codes表中CodeNo字段的内容'
/

comment on column FB_ACCEPTANCE_BILL.BILL_AMOUNT is '面值'
/

comment on column FB_ACCEPTANCE_BILL.START_DATE is '出票日期'
/

comment on column FB_ACCEPTANCE_BILL.END_DATE is '到期日期'
/

comment on column FB_ACCEPTANCE_BILL.DAY_NUM is '期限'
/

comment on column FB_ACCEPTANCE_BILL.BMS_BILL_ID is '选择的票据id'
/

comment on column FB_ACCEPTANCE_BILL.BILL_STATE is '状态 1:正常 -1:废弃 9:结束'
/

comment on column FB_ACCEPTANCE_BILL.SURETY is '担保方式'
/

create index RELATIONSHIP_INDEX_REL_FK
    on FB_ACCEPTANCE_BILL (BID)
/
 Show table preview*/

-- list 1