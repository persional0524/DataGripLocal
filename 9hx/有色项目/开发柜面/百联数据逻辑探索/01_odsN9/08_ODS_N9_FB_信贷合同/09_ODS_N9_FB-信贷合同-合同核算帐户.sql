-- 执行SQL脚本
delete
from STG_FB_ACCOUNTS
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_ACCOUNTS', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT BID,
       ACCOUNT_TYPE,
       ACCOUNT_NO,
       ISKM,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_ACCOUNTS;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_ACCOUNTS  -- 合同核算帐户
-- auto-generated definition
create table FB_ACCOUNTS
(
    BID          NUMBER       not null
        constraint FK_FB_ACCOU_RELATIONS_FB_CONTR
            references FB_CONTRACTS,
    ACCOUNT_TYPE VARCHAR2(32) not null,
    ACCOUNT_NO   VARCHAR2(32),
    ISKM         NUMBER default 0,
    constraint PK_FB_ACCOUNTS
        primary key (ACCOUNT_TYPE, BID)
)
/

comment on table FB_ACCOUNTS is '合同核算帐户'
/

comment on column FB_ACCOUNTS.BID is '合同ID'
/

comment on column FB_ACCOUNTS.ACCOUNT_TYPE is '账户性质'
/

comment on column FB_ACCOUNTS.ACCOUNT_NO is '账号'
/

comment on column FB_ACCOUNTS.ISKM is '是否账号：0账号1科目'
/

create index RELATIONSHIP_9_FK
    on FB_ACCOUNTS (BID)
/
 Show table preview */


-- list 1