-- 根据数据日期删除已有数据集数据
DELETE FROM ODS_GL_KMYE_D WHERE  data_source <> 'SUPPLEMENT' and( SJRQ = '${SJRQ}'
    or
        TO_DATE(SJRQ, 'yyyy-mm-dd') <
       ADD_MONTHS(SYSDATE - 1,
                  (select -nvl(d.standard_code, 3) m
                     from dict_detail d
                    where d.code_type = 'KETTLE_VARIABLES'
                      and d.CODE_NAME = 'EXPIRE_DATE')));