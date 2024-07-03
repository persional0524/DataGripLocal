-- 表输入

SELECT tx_type_id,
       tx_code,
       tx_name,
       tx_key,
       tx_catlog,
       tx_short_name,
       description,
       active_flag,
       remark,
       tx_class_id,
       mctype_code,
       type_ctrl,
       mc_id,
       special_tx_type_flag
FROM CPM_TX_TYPE;

-- ddl
/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_TX_TYPE
-- auto-generated definition
create table CPM_TX_TYPE
(
    TX_TYPE_ID           NUMBER       not null
        constraint PK_CPM_TX_TYPE
            primary key,
    TX_CODE              VARCHAR2(6)  not null,
    TX_NAME              VARCHAR2(64) not null,
    TX_KEY               VARCHAR2(32) not null,
    TX_CATLOG            VARCHAR2(4)  not null,
    TX_SHORT_NAME        VARCHAR2(32),
    DESCRIPTION          VARCHAR2(256),
    ACTIVE_FLAG          NUMBER       not null,
    REMARK               VARCHAR2(256),
    TX_CLASS_ID          NUMBER
        constraint FK_CPM_TX_T_RELATIONS_CPM_TX_C
            references CPM_TX_CLASS,
    MCTYPE_CODE          VARCHAR2(4),
    TYPE_CTRL            NUMBER,
    MC_ID                NUMBER,
    SPECIAL_TX_TYPE_FLAG NUMBER
)
/

create unique index CPM_TX_TYPE_UK
    on CPM_TX_TYPE (TX_CODE)
/

create index RELATIONSHIP_168_FK3
    on CPM_TX_TYPE (MCTYPE_CODE)
/
 Show table preview */


/*
CPM_TX_TYPE 交易定义表
字段	含义	备注
TX_TYPE_ID	交易定义ID	　
TX_CODE	交易代码	　
TX_NAME	交易名称	　
TX_KEY	交易类标识	系统内置的交易Class的标识
TX_CATLOG	所属大类	标明交易的大类，即记账类、帐户类、管理类等
TX_SHORT_NAME	交易简称	　
DESCRIPTION	交易描述	　
ACTIVE_FLAG	启用标志	1为启用，0为停用
REMARK	备注	　
TX_CLASS_ID	交易分类ID	　
MCTYPE_CODE	多维分类	　
交易类型控制	0 可修改
1 只读
2 隐藏
MC_ID	多维码ID*/
