-- 执行SQL脚本

delete
from DWD_FNCE_AKM
where year >= extract(year from date '2024-07-12');


---- 增量抽取科目信息
select YR || '_' || KM AS ID,        --科目主键
       '001'           as org_code,  --机构号
       km              as akm_code,  --科目编码
       kmname          as akm_name,  --科目名称
       kmgrp,                        --科目类
       dir             as yedir,     --余额方向
       kmlevel,                      --科目级别
       isleaf,                       --是否明细科目
       cashtype        as cash_type, --是否现金类型
       qtyflag,                      --是否数量类型
       qtyunit,                      --数量单位
       business,                     --是否结算专用、可用
       outflag,                      --账外可用否
       limitmode,                    --限额否
       quota           as quoto,     --限额金额
       usestate,                     --使用状态
       kmpath          as akmpath,   --科目路径
       yr              as year       --账套
FROM GLS_KM
WHERE yr >= extract(year from date '2024-07-12');


--百联 ddl 输出 DWD_FNCE_AKM

create table BLSCDW.DWD_FNCE_AKM
(
    id          VARCHAR2(32),
    org_code    VARCHAR2(32),
    akm_code    VARCHAR2(32),
    akm_name    VARCHAR2(128),
    kmgrp       VARCHAR2(32),
    dir         VARCHAR2(32),
    kmlevel     VARCHAR2(32),
    isdetailakm VARCHAR2(32),
    cash_type   VARCHAR2(32),
    qtyflag     VARCHAR2(32),
    qtyunit     VARCHAR2(32),
    business    VARCHAR2(32),
    outflag     VARCHAR2(32),
    limitmode   VARCHAR2(32),
    quoto       NUMBER(16, 2),
    usestate    VARCHAR2(32),
    akmpath     VARCHAR2(256),
    year        INTEGER
)
    tablespace BLSC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
(
    initial
    64K
    next
    1M
    minextents
    1
    maxextents
    unlimited
);
comment on table BLSCDW.DWD_FNCE_AKM
    is '科目';
comment on column BLSCDW.DWD_FNCE_AKM.id
    is '科目主键';
comment on column BLSCDW.DWD_FNCE_AKM.org_code
    is '机构号';
comment on column BLSCDW.DWD_FNCE_AKM.akm_code
    is '科目编码';
comment on column BLSCDW.DWD_FNCE_AKM.akm_name
    is '科目名称';
comment on column BLSCDW.DWD_FNCE_AKM.kmgrp
    is '1：资产类，2：负债类，3：所有权类，5：损益类';
comment on column BLSCDW.DWD_FNCE_AKM.dir
    is 'J表示借，D表示贷';
comment on column BLSCDW.DWD_FNCE_AKM.kmlevel
    is '科目级别';
comment on column BLSCDW.DWD_FNCE_AKM.isdetailakm
    is 'Y：明细；N：非明细';
comment on column BLSCDW.DWD_FNCE_AKM.cash_type
    is '是否现金类型';
comment on column BLSCDW.DWD_FNCE_AKM.qtyflag
    is '是否数量类型';
comment on column BLSCDW.DWD_FNCE_AKM.qtyunit
    is '数量单位';
comment on column BLSCDW.DWD_FNCE_AKM.business
    is '是否结算专用、可用';
comment on column BLSCDW.DWD_FNCE_AKM.outflag
    is '账外可用否';
comment on column BLSCDW.DWD_FNCE_AKM.limitmode
    is '限额否';
comment on column BLSCDW.DWD_FNCE_AKM.quoto
    is '限额金额';
comment on column BLSCDW.DWD_FNCE_AKM.usestate
    is '使用状态';
comment on column BLSCDW.DWD_FNCE_AKM.akmpath
    is '科目路径';
comment on column BLSCDW.DWD_FNCE_AKM.year
    is '账套';

