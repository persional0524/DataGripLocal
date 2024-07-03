-- 执行SQL脚本
delete
from STG_FB_GROUP_BANK
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_FB_GROUP_BANK', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       SUPER_BID,
       GROUPBANK,
       ROLE,
       AMOUNT,
       PROPOTION,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM FB_GROUP_BANK;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: FB_GROUP_BANK  -- 银团贷款框架协议参与行备注信息
-- auto-generated definition
create table FB_GROUP_BANK
(
    ID        NUMBER        not null
        constraint PK_GROUP_BANK
            primary key,
    SUPER_BID NUMBER        not null,
    GROUPBANK VARCHAR2(100) not null,
    ROLE      VARCHAR2(100) not null,
    AMOUNT    NUMBER(15, 2) not null,
    PROPOTION NUMBER(8, 4)  not null
)
/

comment on table FB_GROUP_BANK is '银团贷款框架协议参与行备注信息'
/

comment on column FB_GROUP_BANK.ID is '主键'
/

comment on column FB_GROUP_BANK.SUPER_BID is '所属管理合同主键'
/

comment on column FB_GROUP_BANK.GROUPBANK is '参与行名称'
/

comment on column FB_GROUP_BANK.ROLE is '角色'
/

comment on column FB_GROUP_BANK.AMOUNT is '贷款额度'
/

comment on column FB_GROUP_BANK.PROPOTION is '贷款比例'
/
 Show table preview*/

-- list 1