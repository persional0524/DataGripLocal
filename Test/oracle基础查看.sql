
-- 方法 1: 使用V$VERSION视图
-- 这是一个简单且常用的方法来查看Oracle数据库的版本。你可以使用以下SQL命令：

SELECT * FROM v$version;


-- 方法 2: 使用PRODUCT_COMPONENT_VERSION视图
-- 这个视图提供了数据库各组件的版本信息，使用如下：
SELECT * FROM product_component_version;

-- 方法 3: 使用DBA_REGISTRY视图
-- 如果你有足够的权限，也可以从DBA_REGISTRY视图查询版本信息：

SELECT comp_id, comp_name, version, status FROM dba_registry;


-- 需要配置19c的客户端


-- 查看系统表
        SELECT table_name
        FROM user_tables ;

        SELECT table_name
        FROM user_tables where table_name like  'CNAPS%';