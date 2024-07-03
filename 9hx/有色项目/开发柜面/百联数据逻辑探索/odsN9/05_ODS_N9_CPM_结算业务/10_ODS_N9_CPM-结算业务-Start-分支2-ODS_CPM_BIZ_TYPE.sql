-- 表输入
SELECT BTY_ID,
       PEG_RATE_CODE,
       BTY_CODE,
       BTY_NAME,
       BTY_KIND,
       BTY_TYPE,
       PED_TYPE,
       PED_VALUE,
       INIT_MONEY,
       DRAW_MONEY,
       HOLIDAY_TYPE,
       HOLIDAY_IGNORE,
       SUBJECT_ID,
       CUR_CODE,
       BRANCH_NO,
       CPM_BRANCH_NO,
       MTY_CODE
FROM CPM_BIZ_TYPE;

-- ddl ddl 无表，字段注释

/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_BIZ_TYPE
-- auto-generated definition
create table CPM_BIZ_TYPE
(
    BTY_ID         NUMBER       not null
        constraint PK_CPM_BIZ_TYPE
            primary key,
    PEG_RATE_CODE  VARCHAR2(32),
    BTY_CODE       VARCHAR2(30) not null,
    BTY_NAME       VARCHAR2(30) not null,
    BTY_KIND       NUMBER       not null,
    BTY_TYPE       NUMBER       not null,
    PED_TYPE       NUMBER,
    PED_VALUE      NUMBER,
    INIT_MONEY     NUMBER(16, 2),
    DRAW_MONEY     NUMBER(16, 2),
    HOLIDAY_TYPE   NUMBER,
    HOLIDAY_IGNORE NUMBER,
    SUBJECT_ID     NUMBER,
    CUR_CODE       VARCHAR2(8),
    BRANCH_NO      VARCHAR2(6),
    CPM_BRANCH_NO  VARCHAR2(6),
    MTY_CODE       VARCHAR2(30)
)
/

create index RELATIONSHIP_169_FK
    on CPM_BIZ_TYPE (PEG_RATE_CODE)
/

create index RELATIONSHIP_174_FK
    on CPM_BIZ_TYPE (SUBJECT_ID)
/
 Show table preview */



/*
CPM_BIZ_TYPE 业务品种表
字段	含义	备注
BTY_ID	业务品种ID	　
PEG_RATE_CODE	基准利率代码	基准利率种类
BTY_CODE	业务编号	　
BTY_NAME	业务品种名称	　
BTY_KIND	业务大类	1 存款
2 贷款
3贷款理财
BTY_TYPE	类型	1为定期,
2为通知,
3为常规贷款,
4为银团贷款,
5为票据贴现,
6为委托贷款,
7为其他贷款,
8为中间业务
PED_TYPE	期限类型	1为天，2为月
PED_VALUE	期限	　
INIT_MONEY	起存金额	　
DRAW_MONEY	最小支取金额	　
HOLIDAY_TYPE	假日计息方式	　
HOLIDAY_IGNORE	假日按实际算息	　
SUBJECT_ID	科目ID	　
CUR_CODE	币种代号	　
BRANCH_NO	营业机构号	　
CPM_BRANCH_NO	所属机构	　
*/

-- list 1