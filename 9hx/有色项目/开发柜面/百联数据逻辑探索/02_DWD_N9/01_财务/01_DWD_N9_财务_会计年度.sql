-- 执行SQL脚本

-- DELETE
-- FROM DWD_FNCE_YR
-- WHERE yr >= extract(year from date '${v_dwdsdate}');


-- test
SELECT EXTRACT(YEAR FROM DATE '2024-07-12') AS year_extracted
FROM dual;

-- Oracle 的 EXTRACT 函数用于从日期或时间值中提取特定的部分，如年、月、日等。以下是 EXTRACT 函数的语法及其常见用法

/*语法
EXTRACT (field FROM source)
  field: 指定要提取的部分，可以是以下值之一：

YEAR
MONTH
DAY
HOUR
MINUTE
SECOND
TIMEZONE_HOUR
TIMEZONE_MINUTE
TIMEZONE_REGION
TIMEZONE_ABBR
source: 是一个可以包含日期或时间值的表达式，通常是一个日期或时间戳类型。
  */


-- 1.提取年份
SELECT EXTRACT(YEAR FROM DATE '2024-07-12') AS year_extracted FROM dual;
-- 2.提取月份
SELECT EXTRACT(MONTH FROM DATE '2024-07-12') AS month_extracted FROM dual;
-- 3.提取日
SELECT EXTRACT(DAY FROM DATE '2024-07-12') AS day_extracted FROM dual;
-- 4.提取小时
SELECT EXTRACT(HOUR FROM TIMESTAMP '2024-07-12 14:30:00') AS hour_extracted FROM dual;
-- 4.提取小时
SELECT EXTRACT(HOUR FROM TIMESTAMP '2024-07-12 14:30:00') AS hour_extracted FROM dual;
-- 5.提取分钟
SELECT EXTRACT(MINUTE FROM TIMESTAMP '2024-07-12 14:30:00') AS minute_extracted FROM dual;

-- 6.提取秒
    SELECT EXTRACT(SECOND FROM TIMESTAMP '2024-07-12 14:30:00') AS second_extracted FROM dual;

-- 7.提取时区小时
    SELECT EXTRACT(TIMEZONE_HOUR FROM TIMESTAMP '2024-07-12 14:30:00 +02:00') AS timezone_hour_extracted FROM dual;

-- 8.提取时区分钟
    SELECT EXTRACT(TIMEZONE_REGION FROM TIMESTAMP '2024-07-12 14:30:00 Europe/London') AS timezone_region_extracted FROM dual;

-- 9.提取时区区域
    SELECT EXTRACT(TIMEZONE_REGION FROM TIMESTAMP '2024-07-12 14:30:00 Europe/London') AS timezone_region_extracted FROM dual;


/*注意事项
EXTRACT 函数返回的结果是一个 NUMBER 类型的值。
在使用 EXTRACT 函数时，确保 source 是一个有效的日期或时间表达式，否则会引发错误。*/


-- 表输入

SELECT yr,
       startflag,
       startdate,
       closetag,
       turnflag
FROM GLS_YEAR
WHERE yr >= extract(year from date '2024-07-12');

SELECT yr,
       startflag,
       startdate,
       closetag,
       turnflag
FROM GLS_YEAR;


-- 输出
-- DWD_FNCE_YR

-- fx export ddl

create table BLSCDW.DWD_FNCE_YR
(
  yr        INTEGER not null,
  startflag INTEGER default 0 not null,
  startdate DATE not null,
  closetag  INTEGER default 0 not null,
  turnflag  INTEGER not null
)
tablespace BLSC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table BLSCDW.DWD_FNCE_YR
  is '会计年度';
comment on column BLSCDW.DWD_FNCE_YR.yr
  is '年度';
comment on column BLSCDW.DWD_FNCE_YR.startflag
  is '启用标记 1启用;0未启用';
comment on column BLSCDW.DWD_FNCE_YR.startdate
  is '启用日期';
comment on column BLSCDW.DWD_FNCE_YR.closetag
  is '年度结帐标记';
comment on column BLSCDW.DWD_FNCE_YR.turnflag
  is '年度结转标记';
alter table BLSCDW.DWD_FNCE_YR
  add constraint PK_DWD_FNCE_YR primary key (YR)
  using index
  tablespace BLSC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


/*
在 Oracle 19c 中，并没有专门的 INT 数据类型。不过，Oracle 提供了一种等效的方式来表示整数类型的数据，通常使用 NUMBER 数据类型来代替 INT。具体来说，NUMBER 数据类型可以指定精度和小数位数，从而实现各种数值类型的表示。

例如：

NUMBER(10)：可以表示最多有10位数的整数，相当于其他数据库中的 INT 类型。
NUMBER(5)：可以表示最多有5位数的整数。
NUMBER(p, 0)：可以表示最多有 p 位数且没有小数部分的整数。

虽然 Oracle 没有直接的 INT 类型，但通过 NUMBER 数据类型及其精度和范围的设定，可以灵活地实现对整数数据的存储和管理。
*/


/*

总结:
   百联Oracle 12c 是有INTEGER ，INTEGER 只是 NUMBER 数据类型的一个子类型，其实际等效于 NUMBER(38)，即最多可以存储 38 位精度的整数;
常见数值数据类型及其说明
NUMBER：灵活的数值数据类型，可以指定精度和小数位数。例如 NUMBER(10, 2) 表示最多有 10 位数字，其中包含 2 位小数。
INTEGER：等效于 NUMBER(38)，用于表示整数。
FLOAT：浮点数。
BINARY_FLOAT：单精度浮点数。
BINARY_DOUBLE：双精度浮点数。
因此，虽然 Oracle 12c 提供了 INTEGER 类型，但它实际上是 NUMBER 类型的一种特定形式，通常用于表示大范围的整数数据。
*/


