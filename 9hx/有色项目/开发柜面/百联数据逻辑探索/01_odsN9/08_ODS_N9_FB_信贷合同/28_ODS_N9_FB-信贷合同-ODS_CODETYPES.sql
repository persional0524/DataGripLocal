-- 执行SQL脚本
delete
from ODS_CODETYPES;

-- 表输入
SELECT codetypeno,
       codetypename,
       istree,
       treemask,
       leafonly,
       syslevel,
       stored_index
FROM CODETYPES;


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CODETYPES  -- 编码类别
-- auto-generated definition
create table CODETYPES
(
    CODETYPENO   VARCHAR2(4)                  not null
        constraint PK_CODETYPES
            primary key,
    CODETYPENAME VARCHAR2(30)                 not null,
    ISTREE       NUMBER       default 0       not null
        constraint CKC_ISTREE_CODETYPE
            check (IsTree in (0, 1)),
    TREEMASK     VARCHAR2(32),
    LEAFONLY     NUMBER       default 0       not null
        constraint CKC_LEAFONLY_CODETYPE
            check (LeafOnly in (0, 1)),
    SYSLEVEL     NUMBER       default 0       not null
        constraint CKC_SYSLEVEL_CODETYPE
            check (SysLevel between 0 and 1),
    STORED_INDEX TIMESTAMP(6) default SYSDATE not null
)
/

comment on table CODETYPES is '编码类别'
/

comment on column CODETYPES.CODETYPENAME is '类别名称'
/

comment on column CODETYPES.ISTREE is '是否为分级码
TreeMask = null，IsTree = 0
TreeMask <> null，IsTree = 1
'
/

comment on column CODETYPES.TREEMASK is '分级码的掩码'
/

comment on column CODETYPES.LEAFONLY is '是否只允许使用叶子编码'
/

comment on column CODETYPES.SYSLEVEL is '是否为系统级类别'
/

comment on column CODETYPES.STORED_INDEX is '存储顺序'
/
 Show table preview