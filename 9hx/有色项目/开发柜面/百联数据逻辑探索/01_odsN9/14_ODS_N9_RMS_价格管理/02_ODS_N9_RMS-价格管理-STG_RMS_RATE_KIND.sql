-- 执行SQL脚本
delete
from STG_RMS_RATE_KIND
WHERE (SJRQ = '${edate}' or
       SJRQ <= to_char(to_date('${edate}', 'yyyy-MM-dd') -
                       (select get_STG_etl_del_para('STG_RMS_RATE_KIND', 1) as del from dual), 'yyyy-mm-dd')
          );

-- 表输入
SELECT ID,
       NO,
       TYPE,
       KIND_NAME,
       PERIOD_NAME,
       ORDER_NUM,
       USE_DEF,
       AFFECT_BUSINESS,
       BREED,
       IS_BASE,
       '${edate}' as sjrq,
       '2'        as MAKEUP_STATUS
FROM RMS_RATE_KIND;

-- ddl
/*


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: RMS_RATE_KIND
-- auto-generated definition
create table RMS_RATE_KIND
(
    ID              NUMBER                      not null
        constraint PK_RMS_RATE_KIND
            primary key,
    NO              VARCHAR2(10)                not null,
    TYPE            VARCHAR2(1)                 not null,
    KIND_NAME       VARCHAR2(40)                not null,
    PERIOD_NAME     VARCHAR2(40) default 'NONE' not null,
    ORDER_NUM       NUMBER       default 0      not null,
    USE_DEF         NUMBER(1)    default 0,
    AFFECT_BUSINESS NUMBER       default 1      not null,
    BREED           NUMBER       default NULL,
    IS_BASE         NUMBER
)
/

comment on column RMS_RATE_KIND.NO is '编号	利率种类	利率周期
L_DL	贴现	                空格
L_CL_6M	短期贷款	六个月以内(含六个月)
L_CL_9M1Y	短期贷款	六个月至一年(含一年)
L_TL_1Y3Y	中长期贷款	一年至三年(含三年)
L_TL_3Y5Y	中长期贷款	三年至五年(含五年)
L_TL_5Y	中长期贷款	五年以上
PI_B	本金罚息	空格
PI_I	利息罚息	空格
PI_BM	本金挪用罚息	空格
OL_N	外币贷款	隔夜
OL_1W	外币贷款	1周
OL_2W	外币贷款	2周
OL_1M	外币贷款	1个月
OL_2M	外币贷款	2个月
OL_3M	外币贷款	3个月
OL_4M	外币贷款	4个月
OL_5M	外币贷款	5个月
OL_6M	外币贷款	6个月
OL_7M	外币贷款	7个月
OL_8M	外币贷款	8个月
OL_9M	外币贷款	9个月
OL_10M	外币贷款	10个月
OL_11M	外币贷款	11个月
OL_12M	外币贷款	12个月
'
/

comment on column RMS_RATE_KIND.TYPE is '存款=D
贷款=L'
/

comment on column RMS_RATE_KIND.IS_BASE is '0挂牌利率1挂牌和基准利率'
/

create index RMS_RATE_KIND_UK_INDEX_NO
    on RMS_RATE_KIND (NO)
/
 Show table preview */

/*

RMS_RATE_KIND 利率类型
字段	含义	备注
ID	ID标识	　
NO
编码	编号 利率种类 利率周期
L_DL 贴现 空格
L_CL_6M 短期贷款 六个月以内(含六个月)
L_CL_9M1Y 短期贷款 六个月至一年(含一年)
L_TL_1Y3Y 中长期贷款 一年至三年(含三年)
L_TL_3Y5Y 中长期贷款 三年至五年(含五年)
L_TL_5Y 中长期贷款 五年以上
PI_B 本金罚息 空格
PI_I 利息罚息 空格
PI_BM 本金挪用罚息 空格
OL_N 外币贷款 隔夜
OL_1W 外币贷款 1周
OL_2W 外币贷款 2周
OL_1M 外币贷款 1个月
OL_2M 外币贷款 2个月
OL_3M 外币贷款 3个月
OL_4M 外币贷款 4个月
OL_5M 外币贷款 5个月
OL_6M 外币贷款 6个月
OL_7M 外币贷款 7个月
OL_8M 外币贷款 8个月
OL_9M 外币贷款 9个月
OL_10M 外币贷款 10个月
OL_11M 外币贷款 11个月
OL_12M 外币贷款 12个月
TYPE	利率类型	存款=D
贷款=L
同业=T
KIND_NAME	名称	　
PERIOD_NAME	利率周期	　
ORDER_NUM	排序	　
USE_DEF	是否自定义	　
AFFECT_BUSINESS	是否影响现有业务	　
BREED	存款利率种类	　
*/
