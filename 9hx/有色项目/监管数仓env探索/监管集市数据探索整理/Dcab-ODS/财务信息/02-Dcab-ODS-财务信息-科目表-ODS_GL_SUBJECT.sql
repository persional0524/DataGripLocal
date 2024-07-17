-- 根据数据日期删除已有数据集数据
DELETE FROM ODS_GL_SUBJECT
WHERE data_source <>'SUPPLEMENT' and (SJRQ = '${SJRQ}'
    or
        TO_DATE(SJRQ, 'yyyy-mm-dd') <
       ADD_MONTHS(SYSDATE - 1,
                  (select -nvl(d.standard_code, 3) m
                     from dict_detail d
                    where d.code_type = 'KETTLE_VARIABLES'
                      and d.CODE_NAME = 'EXPIRE_DATE')));


--业务系统取数
select '${SJRQ}' as SJRQ,
       '0001' V_DEPT_ID,
       YR as YR,
       YR||KM AS SUBJECT_ID,
       KM as SUBJECT_NO,
       trim(KMNAME) as SUBJECT_NAME,
       DIR as DIR,
       case when ( KM like '7%' or KM like '8%') then 6 else
       decode(KMGRP,1,0,2,1,3,3,4,4,5,5) end as SUBJECT_GRP,  -- 所属类别 1-资产类 2-负债类 3-成本类 4-权益类 5-损益类
       KMLEVEL as KMLEVEL,
       ISLEAF as ISLEAF,
       CASHTYPE as CASHTYPE,
       QTYFLAG as QTYFLAG,
       QTYUNIT as QTYUNIT,
       BUSINESS as BUSINESS,
       OUTFLAG as OUTFLAG,
       LIMITMODE as LIMITMODE,
       QUOTA as QUOTA,
       KMPATH as KMPATH,
       USESTATE as USESTATE,
       CREATETIME as CREATETIME,
   REPLACE(BELONGBUSINESSTYPE,',',';') as ASCRIP_SUBCLASS
  from gls_km where YR >=2020;