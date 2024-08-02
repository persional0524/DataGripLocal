
/*-- 4.2、自增列与序列的用法
-- 4.2.1、序列的创建和访问
--建立序列
ysdb=# create sequence ystc_ods.tbase_seq;
CREATE SEQUENCE

--建立序列，不存在时才创建
ysdb=# create sequence IF NOT EXISTS ystc_ods.tbase_seq;
NOTICE: relation "tbase_seq" already exists, skipping
CREATE SEQUENCE

--查看序列当前的使用状况
ysdb=# \x
ysdb=# select * from tbase_seq ;

-- ? 切换数据库、shcema、用户后，没有权限查看；public、ystc_ods已经建立，why？
-- 切换超级用户，赋予权限
ysdb=> \c ysdb tbaseadmin
ysdb=# GRANT CREATE ON SCHEMA ystc_ods TO ystc;

ysdb=# \c ysdb ystc
psql (9.2.18, server 10.0 @ TBase_v3.16.4.5 (commit: 9b312a9d8) 2024-05-25 16:10:01)
WARNING: psql version 9.2, server version 10.0.
         Some psql features might not work.
You are now connected to database "ysdb" as user "ystc".
ysdb=> create sequence IF NOT EXISTS tbase_seq;
NOTICE:  relation "tbase_seq" already exists, skipping
CREATE SEQUENCE*/

select * from tbase_seq01 ;

select nextval('tbase_seq01');


select currval('tbase_seq01');




select * from pg_database where datname='template1';

-- 2. 使用 pg_catalog 系统表查询
-- 你可以通过查询 PostgreSQL 的系统表来获取表的详细信息。例如：
--
-- 查看表结构（列信息）

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default
FROM
    information_schema.columns
WHERE
    table_schema = 'ystc_ods'
    AND table_name = 'ods_ysky_sms_gls_km';

-- 查看表约束 ？
SELECT
    constraint_name,
    constraint_type,
    column_name
FROM
    information_schema.key_column_usage
WHERE
    table_schema = 'ystc_ods'
    AND table_name = 'ods_ysky_sms_gls_km';

-- 查看表的索引
SELECT
    indexname AS index_name,
    indexdef AS index_definition
FROM
    pg_indexes
WHERE
    schemaname = 'ystc_ods'
    AND tablename = 'ods_ysky_sms_gls_km_val_init';


-- 查看表的外键约束 ？
SELECT
    constraint_name,
    constraint_type,
    column_name
FROM
    information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
WHERE
    tc.table_schema = 'ystc_ods'
    AND tc.table_name = 'ods_ysky_sms_gls_km'
    AND tc.constraint_type = 'FOREIGN KEY';

-- pg_proc 系统表来获取数据库中的函数列表：
SELECT proname, pg_catalog.pg_get_functiondef(oid) AS definition
FROM pg_catalog.pg_proc
WHERE pg_catalog.pg_function_is_visible(oid)
ORDER BY proname;

select *
FROM pg_catalog.pg_proc;


-- 特定模式（schema）下的函数，可以加入 pg_namespace 表来过滤
SELECT n.nspname                            AS schema_name,
       p.proname                            AS function_name,
       pg_catalog.pg_get_functiondef(p.oid) AS function_definition
FROM pg_catalog.pg_proc p
         JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
WHERE n.nspname = 'public' -- 替换为你需要的模式名
  AND pg_catalog.pg_function_is_visible(p.oid)
ORDER BY schema_name, function_name;
