## TChouse 有色项目映射整理内训手册

### 一、系统数据库级别探查

#### **创建** **TCHouse** **默认的分布式使用环境**

1. ##### **创建数据表默认的** **default group**

   1. 连接tbase_1服务器
![img.png](img.png)

   2. 切换为 tbase 用户 
   3. ![img_1.png](img_1.png)

   3. 连接数据库--注意是连接到 cn 节点(后面没特别说明，所有数据库操作都是连接到 cn 节点)

      ```shell
      psql -h 10.63.245.121 -p 11345 -U tbase -d postgres
      ```

   4. 查询当前什么数据节点（DN）,这些 DN 节点就是上面初始化集群时建立


   #### **为** **default group** **创建** **shardmap**

   1. 配置完成数据表默认使用的 DN 节点后，我们接下来需要配置记录的分区方案，shardmap 就是 TCHouse

      各个哈希值与 DN 的对照表，下面演示如何创建一个 shardmap 给 default_group 使用

      ```sql
      postgres=# create default node group default_group with(dn01,dn02);
      postgres=# create sharding group to group default_group;clean sharding;
      ```

   2. **查询集群中** **group** **的数量**

      ```sql
      select * from pgxc_group;
      ```


   3. **查询** **GROUP** **每个分片中对应的** **shard** **数量**

      ```sql
      select pgxc_node.node_name, count(1) as shardnum
      from pgxc_shard_map,
           pgxc_node,
           pgxc_group
      where pgxc_node.oid = pgxc_shard_map.primarycopy
        and pgxc_group.oid = pgxc_shard_map.disgroup
      group by pgxc_node.node_name;
      ```
   #### shell 交互客户端 psql
1. 连接到一个数据库
   
2. 建立一个新连接
3. 建立ysods_db数据库

    ![img_2.png](img_2.png)
4. 显示指定数据库编码格式
    ```shell 
    \l+  ysods_db
    ```
   ![img_3.png](img_3.png)
5. 


      

### 二、Oracle语法兼容探查











