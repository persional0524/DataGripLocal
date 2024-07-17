-- KT_GL_ASSIST.ktr 文件探查 在金川中

-- 根据数据日期删除已有数据集数据
DELETE FROM ODS_GL_ASSIST WHERE data_source <>'SUPPLEMENT' and (SJRQ = '${SJRQ}'
    or
        TO_DATE(SJRQ, 'yyyy-mm-dd') <
       ADD_MONTHS(SYSDATE - 1,
                  (select -nvl(d.standard_code, 3) m
                     from dict_detail d
                    where d.code_type = 'KETTLE_VARIABLES'
                      and d.CODE_NAME = 'EXPIRE_DATE')));


-- 业务系统取数
select
       '${SJRQ}' AS        sjrq,
      '00100' V_DEPT_ID, -- 部门编号
       a.viid   VTID, -- 凭证项ID
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.sys_cashflow,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.sys_cashflow,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.sys_deptcontact,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.sys_deptcontact,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.sys_personalcontact,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.sys_personalcontact,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def1,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def1,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def2,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def2,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def3,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def3,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def4,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def4,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def5,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def5,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def6,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def6,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def7,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def7,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def8,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def8,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def9,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def9,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def10,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def10,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def11,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def11,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def12,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def12,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def13,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def13,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def14,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def14,null) and m.yr = a.yr) || ',' else null end ||
       case when (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def15,null) and m.yr = a.yr) is not null then
        (select m.mgno from Gls_Mcode m where m.mcno = nvl(a.user_def15,null) and m.yr = a.yr) || ',' else null end
        FZHSFL, -- 辅助核算类型
       case when a.sys_cashflow is not null then
       a.sys_cashflow || ',' else null end ||
       case when a.sys_deptcontact is not null then
       a.sys_deptcontact || ',' else null end ||
       case when a.sys_deptcontact is not null then
       a.sys_personalcontact || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def1 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def2 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def3 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def4 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def5 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def6 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def7 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def8 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def9 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def10 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def11 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def12 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def13 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def14 || ',' else null end ||
       case when a.user_def1 is not null then
       a.user_def15 || ',' else null end
       FZHSBM -- 辅助核算编码
from gls_vchitem a
inner join gls_voucher b on a.vid = b.vid;

-- 备注
-- 1.表已经存在 ods 入仓数据字典中
-- 2.字段是否cover住？ COVER 住了


-- 目标 ddl