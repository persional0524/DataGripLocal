-- STG_PUB_BANK
-- 备注：可以找到此表

        SELECT table_name
        FROM user_tables where table_name like  '%PUB_BANK%';


-- 执行脚本

/*
delete from STG_PUB_BANK WHERE  ( SJRQ='${edate}'   or
    SJRQ<=to_char(to_date('${edate}','yyyy-MM-dd') -
        (select  get_STG_etl_del_para('STG_PUB_BANK',1) as del from dual),'yyyy-mm-dd')
        )*/


-- 表输入 相关银行表|PUB_BANK

/*字段	含义	备注
BANK_CODE	银行代号	　
BANK_NAME	相关银行名称	　
BANK_TYPE	银行性质	　
BANK_SHORT_NAME	银行简称	　
BANK_CNAPS_NO	CNAPS网点编号	　
ACC_TALLY_FLAG	是否按挂账户入账	　
INNER_OUTER_FLAG	内外部标识	1-内部账户；2-外部账户
CONNECT_FLAG	是否联网	1联网；0不联网
WEB_BANK_FLAG	网银收方标记	1代表启用，0代表不启用
BANK_BRANCH_ID	银行网点ID	　
BANK_CODE	银行代号	　
BANK_BRANCH_NAME	银行网点名称	　
BANK_REGION_NAME	开户地银行地名	　
BANK_REGION_CODE	标准地名代码	　
BANK_CNAPS_NO	CNAPS网点编号	　
BANK_BRANCH_NO	行内网点编号	　
STAND_REGION_CODE	银行地名代码	　*/

/*create table PUB_BANK
(
    BANK_CODE        VARCHAR2(4)      not null
        constraint PK_PUB_BANK
            primary key,
    BANK_NAME        VARCHAR2(80)     not null,
    BANK_TYPE        NUMBER           not null,
    BANK_SHORT_NAME  VARCHAR2(20)     not null,
    BANK_CNAPS_NO    VARCHAR2(16),
    ACC_TALLY_FLAG   NUMBER,
    INNER_OUTER_FLAG NUMBER default 2 not null,
    CONNECT_FLAG     NUMBER default 0 not null,
    WEB_BANK_FLAG    NUMBER default 0 not null,
    BANK_KEY         VARCHAR2(10)
)*/


SELECT BANK_CODE,
       BANK_NAME,
       BANK_TYPE,
       BANK_SHORT_NAME,
       BANK_CNAPS_NO,
       ACC_TALLY_FLAG,
       INNER_OUTER_FLAG,
       CONNECT_FLAG,
       WEB_BANK_FLAG,
       BANK_KEY,
   '${edate}'as sjrq,
   '2' as MAKEUP_STATUS
  FROM PUB_BANK;

-- 目标表输出 STG_PUB_BANK
-- BANK_KEY 无注释
-- WEB_BANK_FLAG 无注释


---- 48 条数据
select count(1)  FROM PUB_BANK;
--
-- 01,中国工商银行,1,中国工商银行
-- 02,中国建设银行,1,中国建设银行
-- 03,中国银行,1,中国银行
-- 04,中国农业银行,1,中国农业银行
-- 05,交通银行,1,交通银行
-- 06,招商银行,1,招商银行
-- 07,中国光大银行,1,中国光大银行
-- 08,兴业银行,1,兴业银行
-- 09,中信银行,1,中信银行
-- 10,中国民生银行,1,中国民生银行
-- 11,华夏银行,1,华夏银行
-- 12,上海浦东发展银行,1,上海浦东发展银行
-- 13,广东发展银行,1,广东发展银行
-- 14,平安银行,1,平安银行
-- 41,北京市商业银行,1,北京市商业银行
-- 42,上海银行,1,上海银行
-- 49,攀枝花市商业银行,1,攀枝花市商业银行
-- 50,晋商银行,1,晋商银行
-- 51,徽商银行,1,徽商银行
-- 53,青岛城阳农村合作银行,1,青岛城阳农村合作银行
-- 54,张家港商业农村银行,1,张家港商业农村银行
-- 55,北京农村商业银行,1,北京农村商业银行
-- 57,兰州银行,1,兰州银行
-- 58,富滇银行,1,富滇银行
-- 82,国家开发银行,1,国家开发银行
-- 93,非直连银行,1,非直连银行
-- 94,现金,1,现金
-- 98,内部银行,1,内部银行
-- -1,其他银行,1,其他银行
-- 00,财务公司,1,财务公司
-- 15,中国邮政储蓄银行,1,邮储银行
-- 16,湖北银行,1,湖北银行
-- 19,农村商业银行,1,农村商业银行
-- 20,江苏银行,1,江苏银行
-- 89,恒丰银行,1,恒丰银行
-- 83,中国农业发展银行,1,中国农业发展银行
-- 61,渤海银行,1,渤海银行
-- 17,汉口银行,1,汉口银行
-- 141,中国进出口银行,1,中国进出口银行
-- 84,宁波银行,1,宁波银行


-- 业务梳理

-- 内部账和外部账是两种不同的会计处理方法，它们在用途和管理上有明显的区别；
