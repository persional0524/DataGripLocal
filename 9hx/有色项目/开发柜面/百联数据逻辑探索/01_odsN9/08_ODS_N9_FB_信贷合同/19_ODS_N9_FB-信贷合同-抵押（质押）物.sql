-- 执行SQL脚本
delete
from STG_FB_MORTAGEPLEDGE
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_MORTAGEPLEDGE', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       BID,
       MORTAGEPLEDGETYPE,
       MORTAGEPLEDGENAME,
       MORTAGEPLEDGEAMOUNT,
       ASSESSAMOUNT,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_MORTAGEPLEDGE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_MORTAGEPLEDGE  -- 抵押（质押）物
-- auto-generated definition
create table FB_MORTAGEPLEDGE
(
    ID                  NUMBER        not null
        constraint PK_FB_MORTAGEPLEDGE
            primary key,
    BID                 NUMBER        not null
        constraint FK_FB_MOR_RELATIONS_FB_CONTR
            references FB_SUPER_CONTRACTS,
    MORTAGEPLEDGETYPE   NUMBER        not null,
    MORTAGEPLEDGENAME   VARCHAR2(128) not null,
    MORTAGEPLEDGEAMOUNT NUMBER(15, 2),
    ASSESSAMOUNT        NUMBER(15, 2),
    START_DATE          DATE,
    END_DATE            DATE,
    MORTGAGE_REGISTRY   VARCHAR2(64),
    SAFE_NO             VARCHAR2(32),
    SAFE_AMOUNT         NUMBER(15, 2),
    SAFE_START_DATE     DATE,
    SAFE_END_DATE       DATE,
    SAFE_NAME           VARCHAR2(64),
    SAFE_ORGAN          VARCHAR2(64),
    PLEDGE_AMOUNT       NUMBER(15, 2),
    PLEDGE_START_DATE   DATE,
    PLEDGE_END_DATE     DATE,
    ORGAN_NAME          VARCHAR2(64),
    CARD_NUMBER         VARCHAR2(100),
    IS_FIRST            VARCHAR2(2),
    EVALUATION_TYPE     VARCHAR2(10),
    EVALUATION_METHOD   VARCHAR2(10),
    BASE_DATE           DATE,
    PRIORITY_CLAIMS     NUMBER(15, 2),
    EVALUATION_TERM     VARCHAR2(10)
)
/

comment on table FB_MORTAGEPLEDGE is '抵押（质押）物'
/

comment on column FB_MORTAGEPLEDGE.ID is '抵押物Id'
/

comment on column FB_MORTAGEPLEDGE.BID is '合同ID'
/

comment on column FB_MORTAGEPLEDGE.MORTAGEPLEDGETYPE is '抵押（质押）物分类'
/

comment on column FB_MORTAGEPLEDGE.MORTAGEPLEDGENAME is '抵押（质押）物名称'
/

comment on column FB_MORTAGEPLEDGE.MORTAGEPLEDGEAMOUNT is '抵押（质押）物价值'
/

comment on column FB_MORTAGEPLEDGE.ASSESSAMOUNT is '评估值'
/

comment on column FB_MORTAGEPLEDGE.START_DATE is '评估期限-开始'
/

comment on column FB_MORTAGEPLEDGE.END_DATE is '评估期限-结束'
/

comment on column FB_MORTAGEPLEDGE.MORTGAGE_REGISTRY is '抵押登记机构'
/

comment on column FB_MORTAGEPLEDGE.SAFE_NO is '保险单号'
/

comment on column FB_MORTAGEPLEDGE.SAFE_AMOUNT is '保险金额'
/

comment on column FB_MORTAGEPLEDGE.SAFE_START_DATE is '保险开始日期'
/

comment on column FB_MORTAGEPLEDGE.SAFE_END_DATE is '保险到期日期'
/

comment on column FB_MORTAGEPLEDGE.SAFE_NAME is '保险名称'
/

comment on column FB_MORTAGEPLEDGE.SAFE_ORGAN is '保险机构'
/

comment on column FB_MORTAGEPLEDGE.PLEDGE_AMOUNT is '质押-金额'
/

comment on column FB_MORTAGEPLEDGE.PLEDGE_START_DATE is '质押期限-开始日期'
/

comment on column FB_MORTAGEPLEDGE.PLEDGE_END_DATE is '质押期限-到期日期'
/

comment on column FB_MORTAGEPLEDGE.ORGAN_NAME is '质押-机构名称'
/
 Show table preview */

-- list 不存在