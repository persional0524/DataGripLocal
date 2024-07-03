

-- ODS_N9_PUB-公共数据

/*UM_WORKDAY 工作日

字段	含义	备注
ID	流水号
ACTDATE	日期
ISWORKDAY	是否工作日	 */


SELECT id,
       actdate,
       isworkday
FROM UM_WORKDAY order by id;

-- 6209
select count(1) from UM_WORKDAY;
-- 2013-01-01,2029-12-31
select min(actdate),max(actdate) from UM_WORKDAY;