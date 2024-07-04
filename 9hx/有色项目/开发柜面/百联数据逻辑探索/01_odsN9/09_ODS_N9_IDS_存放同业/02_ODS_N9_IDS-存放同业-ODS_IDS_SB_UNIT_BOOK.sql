-- 表输入 研发无数据
SELECT book_id,
       sb_unit_id,
       order_id,
       draft_id,
       sd_unit_id,
       end_date,
       begin_date,
       remark,
       book_dir,
       amount,
       book_date,
       biz_code
FROM IDS_SB_UNIT_BOOK;

-- ddl

/*

Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: IDS_SB_UNIT_BOOK
-- auto-generated definition
create table IDS_SB_UNIT_BOOK
(
    BOOK_ID    NUMBER not null
        constraint PK_IDS_SB_UNIT_BOOK
            primary key,
    SB_UNIT_ID NUMBER,
    ORDER_ID   NUMBER,
    DRAFT_ID   NUMBER,
    SD_UNIT_ID NUMBER,
    END_DATE   DATE,
    BEGIN_DATE DATE,
    REMARK     VARCHAR2(255),
    BOOK_DIR   CHAR,
    AMOUNT     NUMBER(16, 2),
    BOOK_DATE  DATE,
    BIZ_CODE   VARCHAR2(32)
)
/
 Show table preview */

-- 缺失表注释 数据存储单元账簿
/*
DS_SB_UNIT_BOOK
字段	含义
BOOK_ID	记账ID
SB_UNIT_ID	业务户ID
ORDER_ID	指令ID
DRAFT_ID	底稿ID
SD_UNIT_ID	业务账户ID
END_DATE	业务结束日期
BEGIN_DATE	开始日期
REMARK	备注
BOOK_DIR	记账方向
AMOUNT	记账金额
BOOK_DATE	记账日
BIZ_CODE	业务标识
*/

-- list 1