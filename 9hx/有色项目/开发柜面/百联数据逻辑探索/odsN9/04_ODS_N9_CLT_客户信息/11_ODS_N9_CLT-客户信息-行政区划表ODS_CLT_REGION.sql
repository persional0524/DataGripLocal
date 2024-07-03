-- 表输入

SELECT regno,
       regname,
       erpregname,
       reglevel,
       regfullname,
       createtime,
       lastupdatetime
FROM CLT_REGION;

-- ddl 行政区划表
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CLT_REGION
-- auto-generated definition
create table CLT_REGION
(
    REGNO          VARCHAR2(6) not null
        constraint PK_CLT_REGION
            primary key,
    REGNAME        VARCHAR2(30),
    ERPREGNAME     VARCHAR2(30),
    REGLEVEL       NUMBER       default 0,
    REGFULLNAME    VARCHAR2(30) default '',
    CREATETIME     DATE         default sysDate,
    LASTUPDATETIME DATE         default sysDate
)
/
 Show table preview */

/*CLT_REGION 行政区划表
字段	含义	备注
REGNO	行政区划代码
REGNAME	行政区划名称
ERPREGNAME	行政区划名称
REGLEVEL	行政区划等级
REGFULLNAME	空
CREATETIME	创建时间
LASTUPDATETIME	最后修改时间	 */

-- 表清单中存在
