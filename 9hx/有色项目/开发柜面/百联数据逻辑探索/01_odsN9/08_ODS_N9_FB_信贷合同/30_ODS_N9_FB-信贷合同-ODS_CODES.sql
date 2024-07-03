-- 执行SQL脚本
delete
from ODS_CODES;

-- 表输入
SELECT CODENO,
       CODETYPENO,
       CODETEXT,
       CODELEVEL,
       ISLEAF,
       FULLPATH,
       TREECODE,
       REMARK,
       SYSLEVEL
FROM CODES;

-- ddl


Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CODES  -- 通用编码
-- auto-generated definition
create table CODES
(
    CODENO     VARCHAR2(32)     not null
        constraint PK_CODES
            primary key,
    CODETYPENO VARCHAR2(4)      not null
        constraint FK_CODES_REL_CODETYPE
            references CODETYPES,
    CODETEXT   VARCHAR2(60)     not null,
    CODELEVEL  NUMBER,
    ISLEAF     NUMBER,
    FULLPATH   VARCHAR2(255),
    TREECODE   VARCHAR2(32),
    REMARK     VARCHAR2(255),
    SYSLEVEL   NUMBER default 0 not null
        constraint CKC_SYSLEVEL_CODES
            check (SysLevel between 0 and 1)
)
/

comment on table CODES is '通用编码'
/

comment on column CODES.CODENO is '代码'
/

comment on column CODES.CODETEXT is '名称'
/

comment on column CODES.CODELEVEL is '级别'
/

comment on column CODES.ISLEAF is '是否为明细'
/

comment on column CODES.FULLPATH is '名称的全称'
/

comment on column CODES.TREECODE is '级别编码'
/

comment on column CODES.REMARK is '备注'
/

comment on column CODES.SYSLEVEL is '是否为系统级类别
0：非系统级（应用程序中自定义的多维分类码）
1：系统级（不允许在应用程序中修改）'
/

create index RELATIONSHIP_12
    on CODES (CODETYPENO)
/
 Show table preview