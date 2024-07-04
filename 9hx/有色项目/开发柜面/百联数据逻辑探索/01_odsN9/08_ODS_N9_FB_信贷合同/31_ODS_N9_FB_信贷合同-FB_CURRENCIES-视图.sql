
-- 视图，如何查看视图的建表语句？
select * from FB_CURRENCIES;


/*create view FB_CURRENCIES as
SELECT A.CODENO AS CURRENCY_NO,
                   A.CODENAME AS CURRENCY_NAME,
                   A.SYMBOL AS DENOTATION,
                   A.CURRENCYTYPE AS CURRENCY_TYPE,
                   CASE
                     WHEN A.CODENO = 'CNY' THEN
                      'R'
                     WHEN A.CODENO = 'USD' THEN
                      'U'
                     WHEN A.CODENO = 'EUR' THEN
                      'E'
                     ELSE
                      NULL
                   END AS CURRENCY,
                   ISENABLE
              FROM UM_CURRENCY A ORDER BY A.CURRENCYTYPE,A.CODEORDER
/*/

select * from UM_CURRENCY;

/*create table UM_CURRENCY
(
    ID           NUMBER       not null
        constraint PK_UM_CURRENCY
            primary key,
    CODENO       VARCHAR2(8)  not null
        constraint UM_CURRENCY_CONSTRAINT
            unique,
    CODENAME     VARCHAR2(32) not null,
    CURRENCYTYPE NUMBER       not null,
    ENGLISNAME   VARCHAR2(64),
    SYMBOL       VARCHAR2(8),
    COUNTRYNAME  VARCHAR2(32),
    ISENABLE     NUMBER default 1,
    CODEORDER    NUMBER
)
/

comment on column UM_CURRENCY. ID is '流水号'
/*/


SELECT DBMS_METADATA.GET_DDL('VIEW', 'FB_CURRENCIES', 'HR')
FROM DUAL;

/*
字段	含义	备注
ID	流水号
CODENO	国际代码
CODENAME	中文名称
CURRENCYTYPE	币种类型	0 本位币(人民币);1 基准外币（美元）;2 其它;
ENGLISNAME	英文名称
SYMBOL	货币符号
COUNTRYNAME	国家名称
CODEORDER	排列顺序
ISEnable	是否启用	1：启用，0：不启用*/
