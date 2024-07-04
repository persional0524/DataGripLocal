-- 执行SQL脚本
delete
from ODS_BP3_BANK_ORDER
WHERE ORDER_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- 表输入
SELECT ORDER_ID,
       MASTER_ORDER_ID,
       TRANS_CODE,
       APP_NO,
       ORDER_TYPE,
       BIZ_TYPE,
       ORDER_DATE,
       CURRENCY_CODE,
       BANK_CURRENCY_CODE,
       AMOUNT,
       EXPLAIN,
       SOURCE_ID,
       GLOBAL_FINGER_PRINT,
       FINGER_PRINT,
       FRONT_NODE_ID,
       ORDER_OPERATION,
       INTER_BANK_FLAG,
       PERSON_FLAG,
       DIRECTION,
       INTER_CITY_FLAG,
       URGENT_FLAG,
       BROKER_FLAG,
       BROKER_BANK_CODE,
       BROKER_ACCOUNT_NO,
       BROKER_ACCOUNT_NAME,
       BROKER_REGION_CODE,
       BROKER_REGION_NAME,
       BROKER_AREA_CODE,
       BROKER_ADDRESS,
       BROKER_BANK_NAME,
       BROKER_BANK_CNAPS,
       BROKER_CLEAR_BANK_NAME,
       BROKER_CLEAR_BANK_CNAPS,
       BROKER_INSTITUTION_NO,
       PAYER_BANK_CODE,
       PAYER_ACCOUNT_NO,
       PAYER_ACCOUNT_NAME,
       PAYER_REGION_CODE,
       PAYER_REGION_NAME,
       PAYER_AREA_CODE,
       PAYER_ADDRESS,
       PAYER_BANK_NAME,
       PAYER_BANK_CNAPS,
       PAYER_CLEAR_BANK_NAME,
       PAYER_CLEAR_BANK_CNAPS,
       PAYER_INSTITUTION_NO,
       RECEIVER_BANK_CODE,
       RECEIVER_ACCOUNT_NO,
       RECEIVER_ACCOUNT_NAME,
       RECEIVER_ADDRESS,
       RECEIVER_REGION_CODE,
       RECEIVER_REGION_NAME,
       RECEIVER_AREA_CODE,
       RECEIVER_AREA_NAME,
       RECEIVER_BANK_NAME,
       RECEIVER_BANK_CNAPS,
       RECEIVER_CLEAR_BANK_NAME,
       RECEIVER_CLEAR_BANK_CNAPS,
       RECEIVER_INSTITUTION_NO
FROM BP3_BANK_ORDER
where ORDER_DATE >= TO_DATE('${sdate}', 'YYYY-MM-DD');


-- ddl
/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: BP3_BANK_ORDER  -- 银行指令表
-- auto-generated definition
create table BP3_BANK_ORDER
(
    ORDER_ID                  NUMBER        not null
        constraint PK_BP3_BANK_ORDER
            primary key,
    MASTER_ORDER_ID           NUMBER        not null
        constraint FK_BP3_BANK_ORD_REF_MASTER_ORD
            references BP3_MASTER_BANK_ORDER,
    TRANS_CODE                VARCHAR2(15),
    APP_NO                    VARCHAR2(30),
    ORDER_TYPE                VARCHAR2(6)   not null,
    BIZ_TYPE                  VARCHAR2(6)   not null,
    ORDER_DATE                DATE          not null,
    CURRENCY_CODE             VARCHAR2(6)   not null,
    BANK_CURRENCY_CODE        VARCHAR2(6),
    AMOUNT                    NUMBER(15, 2) not null,
    EXPLAIN                   VARCHAR2(200) not null,
    SOURCE_ID                 VARCHAR2(35)  not null,
    GLOBAL_FINGER_PRINT       VARCHAR2(254) not null,
    FINGER_PRINT              VARCHAR2(254),
    FRONT_NODE_ID             VARCHAR2(60),
    ORDER_OPERATION           VARCHAR2(8)   not null,
    INTER_BANK_FLAG           NUMBER,
    PERSON_FLAG               NUMBER,
    DIRECTION                 NUMBER,
    INTER_CITY_FLAG           NUMBER,
    URGENT_FLAG               NUMBER,
    BROKER_FLAG               NUMBER,
    BROKER_BANK_CODE          VARCHAR2(6),
    BROKER_ACCOUNT_NO         VARCHAR2(100),
    BROKER_ACCOUNT_NAME       VARCHAR2(200),
    BROKER_REGION_CODE        VARCHAR2(10),
    BROKER_REGION_NAME        VARCHAR2(128),
    BROKER_AREA_CODE          VARCHAR2(10),
    BROKER_ADDRESS            VARCHAR2(128),
    BROKER_BANK_NAME          VARCHAR2(200),
    BROKER_BANK_CNAPS         VARCHAR2(14),
    BROKER_CLEAR_BANK_NAME    VARCHAR2(200),
    BROKER_CLEAR_BANK_CNAPS   VARCHAR2(14),
    BROKER_INSTITUTION_NO     VARCHAR2(60),
    PAYER_BANK_CODE           VARCHAR2(6),
    PAYER_ACCOUNT_NO          VARCHAR2(100),
    PAYER_ACCOUNT_NAME        VARCHAR2(200),
    PAYER_REGION_CODE         VARCHAR2(10),
    PAYER_REGION_NAME         VARCHAR2(128),
    PAYER_AREA_CODE           VARCHAR2(80),
    PAYER_ADDRESS             VARCHAR2(128),
    PAYER_BANK_NAME           VARCHAR2(200),
    PAYER_BANK_CNAPS          VARCHAR2(14),
    PAYER_CLEAR_BANK_NAME     VARCHAR2(200),
    PAYER_CLEAR_BANK_CNAPS    VARCHAR2(14),
    PAYER_INSTITUTION_NO      VARCHAR2(60),
    RECEIVER_BANK_CODE        VARCHAR2(6),
    RECEIVER_ACCOUNT_NO       VARCHAR2(100),
    RECEIVER_ACCOUNT_NAME     VARCHAR2(200),
    RECEIVER_ADDRESS          VARCHAR2(180),
    RECEIVER_REGION_CODE      VARCHAR2(10),
    RECEIVER_REGION_NAME      VARCHAR2(128),
    RECEIVER_AREA_CODE        VARCHAR2(80),
    RECEIVER_AREA_NAME        VARCHAR2(128),
    RECEIVER_BANK_NAME        VARCHAR2(200),
    RECEIVER_BANK_CNAPS       VARCHAR2(14),
    RECEIVER_CLEAR_BANK_NAME  VARCHAR2(200),
    RECEIVER_CLEAR_BANK_CNAPS VARCHAR2(14),
    RECEIVER_INSTITUTION_NO   VARCHAR2(60),
    POST_SCRIPT               VARCHAR2(100),
    CONTRACT_NO               VARCHAR2(40),
    MESSAGE_ID                VARCHAR2(35),
    PACKET_ID                 VARCHAR2(35),
    ORDER_STATE               NUMBER default 0,
    TRANS_STATUS              NUMBER default 0,
    MESSAGE_COUNT             NUMBER,
    FIRST_EX_TIME             DATE,
    LAST_EX_TIME              DATE,
    NEXT_SURE_TIME            DATE,
    SERVER_RETURN_ID          VARCHAR2(2000),
    SERVER_ERROR_CODE         VARCHAR2(100),
    SERVER_ERROR_TEXT         VARCHAR2(512),
    ITEM_ORDER_ID             NUMBER,
    FOLDER_STATUS             VARCHAR2(40),
    CREATE_TIME               DATE   default SYSDATE,
    RESERVED1                 VARCHAR2(300),
    RESERVED2                 VARCHAR2(300),
    RESERVED3                 VARCHAR2(300),
    RESERVED4                 VARCHAR2(300),
    RESERVED5                 VARCHAR2(3000),
    BANK_NO                   VARCHAR2(15),
    CHANNEL_NO                VARCHAR2(100),
    REFUND_FLAG               VARCHAR2(6),
    BROKER_CURRENCY_CODE      VARCHAR2(6),
    PAYER_CURRENCY_CODE       VARCHAR2(6),
    RECEIVER_CURRENCY_CODE    VARCHAR2(6),
    CUST_ORDER_ID             VARCHAR2(200),
    ATTRIBUTES_JSON           VARCHAR2(4000),
    SEND_BANK_TIME            DATE,
    HANDLER_FLAG              VARCHAR2(10)
)
/

comment on table BP3_BANK_ORDER is '银行指令表'
/

comment on column BP3_BANK_ORDER.ORDER_ID is '指令ID'
/

comment on column BP3_BANK_ORDER.MASTER_ORDER_ID is '主指令ID'
/

comment on column BP3_BANK_ORDER.TRANS_CODE is '交易代码'
/

comment on column BP3_BANK_ORDER.APP_NO is '系统来源标识号'
/

comment on column BP3_BANK_ORDER.ORDER_TYPE is '指令类型'
/

comment on column BP3_BANK_ORDER.BIZ_TYPE is '业务种类'
/

comment on column BP3_BANK_ORDER.ORDER_DATE is '指令日期'
/

comment on column BP3_BANK_ORDER.CURRENCY_CODE is '币种'
/

comment on column BP3_BANK_ORDER.BANK_CURRENCY_CODE is '银行币种'
/

comment on column BP3_BANK_ORDER.AMOUNT is '金额'
/

comment on column BP3_BANK_ORDER.EXPLAIN is '用途'
/

comment on column BP3_BANK_ORDER.SOURCE_ID is '原始业务标识'
/

comment on column BP3_BANK_ORDER.GLOBAL_FINGER_PRINT is '全局指纹码'
/

comment on column BP3_BANK_ORDER.FINGER_PRINT is '指纹码'
/

comment on column BP3_BANK_ORDER.FRONT_NODE_ID is '通讯节点ID'
/

comment on column BP3_BANK_ORDER.ORDER_OPERATION is '指令操作类型'
/

comment on column BP3_BANK_ORDER.INTER_BANK_FLAG is '跨行标记（1：跨行；0：同行）'
/

comment on column BP3_BANK_ORDER.PERSON_FLAG is '对私标志（1：对私；0：对公）'
/

comment on column BP3_BANK_ORDER.DIRECTION is '上收下拨方向(0:下拨,1:上收)'
/

comment on column BP3_BANK_ORDER.INTER_CITY_FLAG is '异地标记'
/

comment on column BP3_BANK_ORDER.URGENT_FLAG is '加急标记'
/

comment on column BP3_BANK_ORDER.BROKER_FLAG is '是否代理标记'
/

comment on column BP3_BANK_ORDER.BROKER_BANK_CODE is '代理人银行编号'
/

comment on column BP3_BANK_ORDER.BROKER_ACCOUNT_NO is '代理人账号'
/

comment on column BP3_BANK_ORDER.BROKER_ACCOUNT_NAME is '代理人户名'
/

comment on column BP3_BANK_ORDER.BROKER_REGION_CODE is '代理人标准地区编码'
/

comment on column BP3_BANK_ORDER.BROKER_REGION_NAME is '代理人标准地区名称'
/

comment on column BP3_BANK_ORDER.BROKER_AREA_CODE is '代理人银行地址编码'
/

comment on column BP3_BANK_ORDER.BROKER_ADDRESS is '代理人银行地址名称'
/

comment on column BP3_BANK_ORDER.BROKER_BANK_NAME is '代理人开户行名称'
/

comment on column BP3_BANK_ORDER.BROKER_BANK_CNAPS is '代理人开户行行号'
/

comment on column BP3_BANK_ORDER.BROKER_CLEAR_BANK_NAME is '代理人开户行清算行名称'
/

comment on column BP3_BANK_ORDER.BROKER_CLEAR_BANK_CNAPS is '代理人开户行清算行行号'
/

comment on column BP3_BANK_ORDER.BROKER_INSTITUTION_NO is '代理人机构编号'
/

comment on column BP3_BANK_ORDER.PAYER_BANK_CODE is '付款人银行编号'
/

comment on column BP3_BANK_ORDER.PAYER_ACCOUNT_NO is '付款人账号'
/

comment on column BP3_BANK_ORDER.PAYER_ACCOUNT_NAME is '付款人户名'
/

comment on column BP3_BANK_ORDER.PAYER_REGION_CODE is '付款人标准地区编码'
/

comment on column BP3_BANK_ORDER.PAYER_REGION_NAME is '付款人标准地区名称'
/

comment on column BP3_BANK_ORDER.PAYER_AREA_CODE is '付款人银行地址编码'
/

comment on column BP3_BANK_ORDER.PAYER_ADDRESS is '付款人银行地址名称'
/

comment on column BP3_BANK_ORDER.PAYER_BANK_NAME is '付款人开户行名称'
/

comment on column BP3_BANK_ORDER.PAYER_BANK_CNAPS is '付款人开户行行号'
/

comment on column BP3_BANK_ORDER.PAYER_CLEAR_BANK_NAME is '付款人开户行清算行名称'
/

comment on column BP3_BANK_ORDER.PAYER_CLEAR_BANK_CNAPS is '付款人开户行清算行行号'
/

comment on column BP3_BANK_ORDER.PAYER_INSTITUTION_NO is '付款人机构编号'
/

comment on column BP3_BANK_ORDER.RECEIVER_BANK_CODE is '收款人银行编号'
/

comment on column BP3_BANK_ORDER.RECEIVER_ACCOUNT_NO is '收款人账号'
/

comment on column BP3_BANK_ORDER.RECEIVER_ACCOUNT_NAME is '收款人户名'
/

comment on column BP3_BANK_ORDER.RECEIVER_ADDRESS is '收款人地址'
/

comment on column BP3_BANK_ORDER.RECEIVER_REGION_CODE is '收款人标准地区编码'
/

comment on column BP3_BANK_ORDER.RECEIVER_REGION_NAME is '收款人标准地区名称'
/

comment on column BP3_BANK_ORDER.RECEIVER_AREA_CODE is '收款人银行地址编码'
/

comment on column BP3_BANK_ORDER.RECEIVER_AREA_NAME is '收款人银行地址名称'
/

comment on column BP3_BANK_ORDER.RECEIVER_BANK_NAME is '收款人开户行名称'
/

comment on column BP3_BANK_ORDER.RECEIVER_BANK_CNAPS is '收款人开户行行号'
/

comment on column BP3_BANK_ORDER.RECEIVER_CLEAR_BANK_NAME is '收款人开户行清算行名称'
/

comment on column BP3_BANK_ORDER.RECEIVER_CLEAR_BANK_CNAPS is '收款人开户行清算行行号'
/

comment on column BP3_BANK_ORDER.RECEIVER_INSTITUTION_NO is '收款人机构编号'
/

comment on column BP3_BANK_ORDER.POST_SCRIPT is '附言'
/

comment on column BP3_BANK_ORDER.CONTRACT_NO is '合同（协议）号'
/

comment on column BP3_BANK_ORDER.MESSAGE_ID is '发送指令消息ID'
/

comment on column BP3_BANK_ORDER.PACKET_ID is '发送指令包ID'
/

comment on column BP3_BANK_ORDER.ORDER_STATE is '指令状态'
/

comment on column BP3_BANK_ORDER.TRANS_STATUS is '传输执行状态（1：成功；9：失败；99：可疑；5：处理中；-1：未达）'
/

comment on column BP3_BANK_ORDER.MESSAGE_COUNT is '通讯次数'
/

comment on column BP3_BANK_ORDER.FIRST_EX_TIME is '首次通讯时间'
/

comment on column BP3_BANK_ORDER.LAST_EX_TIME is '末次通讯时间'
/

comment on column BP3_BANK_ORDER.NEXT_SURE_TIME is '下次析疑时间'
/

comment on column BP3_BANK_ORDER.SERVER_RETURN_ID is '银行端主机标识ID'
/

comment on column BP3_BANK_ORDER.SERVER_ERROR_CODE is '银行端返回的出错代码'
/

comment on column BP3_BANK_ORDER.SERVER_ERROR_TEXT is '银行端返回的出错信息'
/

comment on column BP3_BANK_ORDER.ITEM_ORDER_ID is '原分包指令ID'
/

comment on column BP3_BANK_ORDER.FOLDER_STATUS is '文件目录状态'
/

comment on column BP3_BANK_ORDER.CREATE_TIME is '创建时间'
/

comment on column BP3_BANK_ORDER.RESERVED1 is '备用字段1'
/

comment on column BP3_BANK_ORDER.RESERVED2 is '备用字段2'
/

comment on column BP3_BANK_ORDER.RESERVED3 is '备用字段3'
/

comment on column BP3_BANK_ORDER.RESERVED4 is '备用字段4'
/

comment on column BP3_BANK_ORDER.RESERVED5 is '备用字段5'
/

comment on column BP3_BANK_ORDER.BANK_NO is '银行编号'
/

comment on column BP3_BANK_ORDER.CHANNEL_NO is '渠道编号'
/

comment on column BP3_BANK_ORDER.REFUND_FLAG is '退票标记'
/

comment on column BP3_BANK_ORDER.BROKER_CURRENCY_CODE is '代理人账号币种'
/

comment on column BP3_BANK_ORDER.PAYER_CURRENCY_CODE is '付款人账号币种'
/

comment on column BP3_BANK_ORDER.RECEIVER_CURRENCY_CODE is '收款人账号币种'
/

comment on column BP3_BANK_ORDER.CUST_ORDER_ID is '源系统标识号'
/

comment on column BP3_BANK_ORDER.ATTRIBUTES_JSON is '指令扩展字段'
/

comment on column BP3_BANK_ORDER.SEND_BANK_TIME is '发送银行时间'
/

comment on column BP3_BANK_ORDER.HANDLER_FLAG is '人工操作标记'
/

create index IDX_BP3_BANK_ORDER_DATE
    on BP3_BANK_ORDER (ORDER_DATE)
/

create index IDX_BP3_BANK_ORDER_MASTERID
    on BP3_BANK_ORDER (MASTER_ORDER_ID)
/
 Show table preview */


