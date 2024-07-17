-- 客户信息表根据数据日期删除已有数据集数据?

DELETE
FROM ODS_GL_CLTINFO
WHERE SJRQ = '${SJRQ}';

-- 客户信息业务系统取数
WITH temp AS (SELECT A.VALUE AS v_value, b.FIELD_name AS v_name, a.cltcltinfo_id AS v_cltid
              FROM clt_conf_info_value A
                       left JOIN CLT_INFO_FIELD B ON A.CLTCONFINFO_ID = B.FIELD_ID
                       INNER JOIN CLT_CLT_INFO C ON A.CLTCLTINFO_ID = C.ID
                       INNER JOIN CLT_CONF_INFO D ON to_char(D.ID) = B.TAB_FIELD
              WHERE D.type in (6)),
     --AND A.NAME = 'aaa'; --name传字段名称（名称固定）
     temp2 AS (SELECT v_cltid                                                             AS clt_id,
                      MAX(CASE t.v_name WHEN '经济成分' THEN t.v_value ELSE NULL END)     AS QYKGLX,--经济成分
                      MAX(CASE t.v_name WHEN '国民经济部门' THEN t.v_value ELSE NULL END) AS ECONOMIC_SECTOR,--经济部门
                      MAX(CASE t.v_name WHEN '实收资本' THEN t.v_value ELSE NULL END)     AS PAIDIN_CAPITAL,
                      MAX(CASE t.v_name WHEN '总资产' THEN t.v_value ELSE NULL END)       AS TOTAL_ASSETS,
                      MAX(CASE t.v_name WHEN '营业收入' THEN t.v_value ELSE NULL END)     AS OPERAT_INCOME,
                      MAX(CASE t.v_name WHEN '经营状态' THEN t.v_value ELSE NULL END)     AS OPERATE_STATUS,
                      MAX(CASE t.v_name WHEN '是否关联方' THEN t.v_value ELSE NULL END)   AS RELATED_PARTY
               FROM temp t
               GROUP BY t.v_cltid)
SELECT '${SJRQ}'                                                                                                 AS SJRQ,
       '0001'                                                                                                       V_DEPT_ID,
       DECODE(C.TYPE, 2, 8, 6, 99, 7, 99, 8, 99, 9, 99, C.TYPE)                                                  AS CLT_INFO_TYPE,
       C.CLTNO                                                                                                   AS CLTNO,
       C.TREENO                                                                                                  AS TREE_NO,
       C.ORG_PARENT_ID                                                                                           AS ORG_PARENT_ID,
       C.CHINESENAME                                                                                             AS CHINESE_NAME,
       C.ABBREVIATION                                                                                            AS ABBREVIATION,
       C.NAME                                                                                                    AS NAME,
       C.OPBANK                                                                                                  AS OP_BANK,
       C.ACNTNO                                                                                                  AS ACNT_NO,
       C.INTERNETSITE                                                                                            AS INTERNETSITE,
       C.PHONE                                                                                                   AS PHONE,
       C.BUSSADDR                                                                                                AS BUSS_ADDR,
       C.POSTCODE                                                                                                AS POSTCODE,
       C.FAX                                                                                                     AS FAX,
       C.DEPINCHARGE                                                                                             AS DEPINCHARGE,
       C.DAYOFESTB                                                                                               AS DAYOFESTB,
--C.INDUSTRY AS INDUSTRY,
-- case when (regexp_like(A.code,'^[a-z]')) then upper(rpad(A.code,5,0)) else rpad(A.code,5,0) end AS INDUSTRY,
--d.standard_code AS INDUSTRY,--行业
       A.code                                                                                                    AS INDUSTRY,--行业
       C.RANKING                                                                                                 AS RANKING,
       C.ORGCODE                                                                                                 AS ORG_CODE,
       C.ORGCODE_ENDDATE                                                                                         AS ORG_CODE_ENDDATE,
       nvl(to_number(Mapping_dict_detail('CLT_CLT_INFO', 'FINANTYPE',
                                         decode(C.FINANTYPE, 5, 11, 15, 11, 1, 11, 0, 11, C.FINANTYPE))),
           '110')                                                                                                as FINAN_TYPE,
--C.SHAREMETHOD AS QYKGLX,--控股类型
       C.LISENSENO                                                                                               AS LISENSE_NO,
       C.TAXREGNO                                                                                                AS TAXREG_NO,
       C.LOANNO                                                                                                  AS LOAN_NO,
       C.OPRATETERM                                                                                              AS OPRATE_TERM,
       C.FERC                                                                                                    AS FERC,
       C.BUSSSCOPE                                                                                               AS BUSS_SCOPE,
       c.regcapital                                                                                              AS REGCAPITAL,
       DECODE(C.CUR, '', 'CNY', C.CUR)                                                                           AS CUR_CODE,
       C.REGADDR                                                                                                 AS REGADDR,
       C.LEGALPERZIP                                                                                             AS LEGALPERZIP,
       C.LEGALPER                                                                                                AS LEGALPER,
       C.LEGALPERID                                                                                              AS LEGALPERID,
       0                                                                                                         AS LEGALIDTYPE,
--C.CREDITLEVEL AS CREDITL_EVEL,
--COD.CODETEXT AS CREDITL_EVEL,--信用等级
(select COD.CODETEXT
  from CODES COD
 where COD.CODENO =
       (select t_rat.RATING from (select RAT.RATING RATING
                   from PRMS_CREDIT_RATING RAT
                  where RAT.CLTNO = C.CLTNO
                  order by RAT.END_DATE desc) t_rat where rownum =1)) AS CREDITL_EVEL,--信用等级 C.LEGALPERPHONE AS LEGALPERPHONE,
       C.EVALAUTH                                                                                                AS EVALAUTH,
       C.EVALTIME                                                                                                AS EVALTIME,
--C.CREDITRATING AS CREDIT_RATING,
       to_number(Mapping_dict_detail('CLT_CLT_INFO', 'CREDITRATING', C.CREDITRATING))                               CREDIT_RATING,
       C.EXTCLTNO                                                                                                AS EXTCLT_NO,
       C.Islisted                                                                                                AS LISTED_FLAG,
       case when C.area = 0 then 1 else nvl(C.area, 1) end                                                       AS AREA,
       C.COUNTRYCODE                                                                                             AS COUNTRY_CODE,
       C.INGROUP                                                                                                 AS INGROUP,
       C.NATURE                                                                                                  AS NATURE,
       C.CORPTYPE                                                                                                AS CORP_TYPE,
       C.CORSUBTYPE                                                                                              AS CORSUB_TYPE,
       C.BANKNO                                                                                                  AS BANK_NO,
       C.STAUTS                                                                                                  AS STAUTS,
--C.ENTERPRISESCALE AS ENTERPRISE_SCALE,
       to_number(Mapping_dict_detail('CLT_CLT_INFO', 'ENTERPRISESCALE',
                                     C.ENTERPRISESCALE))                                                            ENTERPRISE_SCALE,
       C.LICENSECODE                                                                                             AS LICENSE_CODE,
       C.FINANCIALCODE                                                                                           AS FINANCIAL_CODE,
--C.CLTSTATE AS CLTSTATE,
       to_number(Mapping_dict_detail('CLT_CLT_INFO', 'CLTSTATE', C.CLTSTATE))                                       CLTSTATE,
       C.EMAIL                                                                                                   AS EMAIL,
       C.FINANCIALCONTACT                                                                                        AS FINANCIAL_CONTACT,
       C.ENDDATE                                                                                                 AS END_DATE,
       C.STOCKCODE                                                                                               AS STOCK_CODE,
       C.SITEAREA                                                                                                AS SITE_AREA,
       C.SITETITLE                                                                                               AS SITE_TITLE,
       C.EMPLOYEESNUM                                                                                            AS EMPLOYEES_NUM,
       C.TAXNUM                                                                                                  AS TAX_NUM,
       C.LANDTAXNUM                                                                                              AS LANDTAX_NUM,
       C.PRODUCTSMAJOR                                                                                           AS PRODUCTSMAJOR,
       C.LISTEDPLACE                                                                                             AS LISTED_PLACE,
       C.PROVINCE || '0000'                                                                                      AS PROVINCE,
       C.CITY || '00'                                                                                            AS CITY,
       C.DISTRICT                                                                                                AS DISTRICT,
       C.BORRNATURE                                                                                              AS BORR_NATURE,
       C.MECCODE                                                                                                 AS MEC_CODE,
       C.PROJECTNAME                                                                                             AS PROJECT_NAME,
       C.COMPANTYATTRIBUTE                                                                                       AS COMPANTY_ATTRIBUTE,
       C.REGIONTEXT                                                                                              AS REGIONTEXT,
       C.DEPT_TYPE                                                                                               AS DEPT_TYPE,
       Mapping_dict_detail('CLT_CLT_INFO', 'CLTTYPE', C.CLTTYPE)                                                 AS CLT_TYPE,
       C.MANAGEBANKCODE                                                                                          AS MANAGEBANK_CODE,
       C.INSTICREDITCODE                                                                                         AS INSTICREDIT_CODE,
       C.REGCODE                                                                                                 AS REGCODE,
       C.REGNUMCODE                                                                                              AS REGNUMCODE,
       C.REREDT                                                                                                  AS REREDT,
       C.APPRONUM                                                                                                AS APPRONUM,
       C.ORGTYPE                                                                                                 AS ORGTYPE,
       C.BCOMMADD                                                                                                AS BCOMMADD,
       C.FORTDRTFG                                                                                               AS FORTDRTFG,
       C.REALHOLDINGNAME                                                                                         AS CONTROLLER，--实际控制人名称
C.REALHOLDINGTYPE AS CONTROLLER_TYPE,--实际控制人证件类型 C.REALHOLDINGCARDNUMBER AS CONTROLLER_ID,--实际控制人证件代码
--C.INVOICERECNAME AS INVOICEREC_NAME,
--C.INVOICERECPHONE AS INVOICEREC_PHONE,
--C.INVOICERECADDR AS INVOICEREC_ADDR,
       C.LISENSENO                                                                                               AS CREDIT_CODE, --统一社会信用代码
       '2'                                                                                                       AS JOB,
       case t2.QYKGLX
           when 'A01' then '01'
           when 'A0101' then '0101'
           when 'A0102' then '0102'
           when 'A02' then '02'
           when 'A0201' then '0201'
           when 'A0202' then '0202'
           when 'B01' then '03'
           when 'B0101' then '0301'
           when 'B0102' then '0302'
           when 'B02' then '04'
           when 'B0201' then '0401'
           when 'B0202' then '0402'
           when 'B03' then '05'
           when 'B0301' then '0501'
           when 'B0302' then '0502'
           else null end                                                                                            QYKGLX,--经济成分
       t2.ECONOMIC_SECTOR                                                                                        AS ECONOMIC_SECTOR,--经济部门
       replace(t2.PAIDIN_CAPITAL, ',', '')                                                                       AS PAIDIN_CAPITAL,--实收资本
       replace(t2.TOTAL_ASSETS, ',', '')                                                                         AS TOTAL_ASSETS,--总资产
       replace(t2.OPERAT_INCOME, ',', '')                                                                        AS OPERAT_INCOME,--营业收入
       t2.OPERATE_STATUS                                                                                         AS OPERATE_STATUS,--营业状态
       t2.RELATED_PARTY                                                                                          AS RELATED_PARTY,--是否关联方
       case
           when C.DISTRICT is not null then C.DISTRICT
           when C.CITY is not null then C.CITY || '00'
           when C.PROVINCE is not null then C.PROVINCE || '0000'
           else '' end                                                                                           as ADMIN_DIVISION, -- 行政区划
--nvl(c.RURALCITYSIGNS,'N') AS NCCSBZ ,--农村城市标志
       'N'                                                                                                       AS NCCSBZ,--农村城市标志
       CASE
           WHEN C.INSTITUTIONALLEVEL = '02' or C.INSTITUTIONALLEVEL = '03' THEN
               0
           ELSE 1 END                                                                                               ISLEGAL, --是否独立法人 0 否1是

       decode(c.type, 1, '1', 4, '1', '4')                                                                       as CUSTOMS_RELATION,--客户关系
       (select a.value
        from clt_conf_info_value a
        where a.cltcltinfo_id = c.ID
          and a.cltconfinfo_id = 183)                                                                            AS LEI_CODE --全球法人识别编码
        ,--nvl(c.CANCELLATION_DATE,(select  max(LASTCHANGE_DATE) from clt_clt_info_tbl t where t.cltno=c.cltno  group by cltno)) COLSED_DATE
       case when trunc(CANCELLATION_DATE) > date'${SJRQ}' then null else trunc(CANCELLATION_DATE) end               COLSED_DATE
FROM CLT_CLT_INFO C
         LEFT JOIN temp2 t2 ON t2.clt_id = c.id
         LEFT JOIN CLT_CONF_INFO A ON C.INDUSTRY = A.ID and A.TYPE = 1
         LEFT JOIN CLT_CONF_INFO B ON C.CREDITLEVEL = B.id and B.TYPE = 2
         LEFT JOIN CLT_CONF_INFO D ON C.CREDITLEVEL = D.id and D.TYPE = 63 --农村城市标志
where c.type <> 0
  AND C.CLTNO <> '1000' --and c.AREA<>2

union

SELECT '${SJRQ}'                                                                                                 AS SJRQ,
       '0001'                                                                                                       V_DEPT_ID,
       DECODE(C.TYPE, 2, 8, 6, 99, 7, 99, 8, 99, 9, 99, C.TYPE)                                                  AS CLT_INFO_TYPE,
       C.CLTNO                                                                                                   AS CLTNO,
       C.TREENO                                                                                                  AS TREE_NO,
       C.ORG_PARENT_ID                                                                                           AS ORG_PARENT_ID,
       C.CHINESENAME                                                                                             AS CHINESE_NAME,
       C.ABBREVIATION                                                                                            AS ABBREVIATION,
       C.NAME                                                                                                    AS NAME,
       C.OPBANK                                                                                                  AS OP_BANK,
       C.ACNTNO                                                                                                  AS ACNT_NO,
       C.INTERNETSITE                                                                                            AS INTERNETSITE,
       C.PHONE                                                                                                   AS PHONE,
       C.BUSSADDR                                                                                                AS BUSS_ADDR,
       C.POSTCODE                                                                                                AS POSTCODE,
       C.FAX                                                                                                     AS FAX,
       C.DEPINCHARGE                                                                                             AS DEPINCHARGE,
       C.DAYOFESTB                                                                                               AS DAYOFESTB,
--C.INDUSTRY AS INDUSTRY,
-- case when (regexp_like(A.code,'^[a-z]')) then upper(rpad(A.code,5,0)) else rpad(A.code,5,0) end AS INDUSTRY,
--d.standard_code AS INDUSTRY,--行业
       A.code                                                                                                    AS INDUSTRY,--行业
       C.RANKING                                                                                                 AS RANKING,
       C.ORGCODE                                                                                                 AS ORG_CODE,
       C.ORGCODE_ENDDATE                                                                                         AS ORG_CODE_ENDDATE,
       nvl(to_number(Mapping_dict_detail('CLT_CLT_INFO', 'FINANTYPE',
                                         decode(C.FINANTYPE, 5, 11, 15, 11, 1, 11, 0, 11, C.FINANTYPE))),
           '110')                                                                                                as FINAN_TYPE,
--C.SHAREMETHOD AS QYKGLX,--控股类型
       C.LISENSENO                                                                                               AS LISENSE_NO,
       C.TAXREGNO                                                                                                AS TAXREG_NO,
       C.LOANNO                                                                                                  AS LOAN_NO,
       C.OPRATETERM                                                                                              AS OPRATE_TERM,
       C.FERC                                                                                                    AS FERC,
       C.BUSSSCOPE                                                                                               AS BUSS_SCOPE,
       c.regcapital                                                                                              AS REGCAPITAL,
       DECODE(C.CUR, '', 'CNY', C.CUR)                                                                           AS CUR_CODE,
       C.REGADDR                                                                                                 AS REGADDR,
       C.LEGALPERZIP                                                                                             AS LEGALPERZIP,
       C.LEGALPER                                                                                                AS LEGALPER,
       C.LEGALPERID                                                                                              AS LEGALPERID,
       0                                                                                                         AS LEGALIDTYPE,
--C.CREDITLEVEL AS CREDITL_EVEL,
--COD.CODETEXT AS CREDITL_EVEL,--信用等级
       (select COD.CODETEXT
        from CODES COD
        where COD.CODENO =
              (select t_rat.RATING
               from (select RAT.RATING RATING
                     from PRMS_CREDIT_RATING RAT
                     where RAT.CLTNO = C.CLTNO
                     order by RAT.END_DATE desc) t_rat
               where rownum = 1))                                                                                AS CREDITL_EVEL,--信用等级
       C.LEGALPERPHONE                                                                                           AS LEGALPERPHONE,
       C.EVALAUTH                                                                                                AS EVALAUTH,
       C.EVALTIME                                                                                                AS EVALTIME,
--C.CREDITRATING AS CREDIT_RATING,
       to_number(Mapping_dict_detail('CLT_CLT_INFO', 'CREDITRATING', C.CREDITRATING))                               CREDIT_RATING,
       C.EXTCLTNO                                                                                                AS EXTCLT_NO,
       C.Islisted                                                                                                AS LISTED_FLAG,
       case when C.area = 0 then 1 else nvl(C.area, 1) end                                                       AS AREA,
       C.COUNTRYCODE                                                                                             AS COUNTRY_CODE,
       C.INGROUP                                                                                                 AS INGROUP,
       C.NATURE                                                                                                  AS NATURE,
       C.CORPTYPE                                                                                                AS CORP_TYPE,
       C.CORSUBTYPE                                                                                              AS CORSUB_TYPE,
       C.BANKNO                                                                                                  AS BANK_NO,
       C.STAUTS                                                                                                  AS STAUTS,
--C.ENTERPRISESCALE AS ENTERPRISE_SCALE,
       to_number(Mapping_dict_detail('CLT_CLT_INFO', 'ENTERPRISESCALE',
                                     C.ENTERPRISESCALE))                                                            ENTERPRISE_SCALE,
       C.LICENSECODE                                                                                             AS LICENSE_CODE,
       C.FINANCIALCODE                                                                                           AS FINANCIAL_CODE,
--C.CLTSTATE AS CLTSTATE,
       to_number(Mapping_dict_detail('CLT_CLT_INFO', 'CLTSTATE', C.CLTSTATE))                                       CLTSTATE,
       C.EMAIL                                                                                                   AS EMAIL,
       C.FINANCIALCONTACT                                                                                        AS FINANCIAL_CONTACT,
       C.ENDDATE                                                                                                 AS END_DATE,
       C.STOCKCODE                                                                                               AS STOCK_CODE,
       C.SITEAREA                                                                                                AS SITE_AREA,
       C.SITETITLE                                                                                               AS SITE_TITLE,
       C.EMPLOYEESNUM                                                                                            AS EMPLOYEES_NUM,
       C.TAXNUM                                                                                                  AS TAX_NUM,
       C.LANDTAXNUM                                                                                              AS LANDTAX_NUM,
       C.PRODUCTSMAJOR                                                                                           AS PRODUCTSMAJOR,
       C.LISTEDPLACE                                                                                             AS LISTED_PLACE,
       C.PROVINCE || '0000'                                                                                      AS PROVINCE,
       C.CITY || '00'                                                                                            AS CITY,
       C.DISTRICT                                                                                                AS DISTRICT,
       C.BORRNATURE                                                                                              AS BORR_NATURE,
       C.MECCODE                                                                                                 AS MEC_CODE,
       C.PROJECTNAME                                                                                             AS PROJECT_NAME,
       C.COMPANTYATTRIBUTE                                                                                       AS COMPANTY_ATTRIBUTE,
       C.REGIONTEXT                                                                                              AS REGIONTEXT,
       C.DEPT_TYPE                                                                                               AS DEPT_TYPE,
       Mapping_dict_detail('CLT_CLT_INFO', 'CLTTYPE', C.CLTTYPE)                                                 AS CLT_TYPE,
       C.MANAGEBANKCODE                                                                                          AS MANAGEBANK_CODE,
       C.INSTICREDITCODE                                                                                         AS INSTICREDIT_CODE,
       C.REGCODE                                                                                                 AS REGCODE,
       C.REGNUMCODE                                                                                              AS REGNUMCODE,
       C.REREDT                                                                                                  AS REREDT,
       C.APPRONUM                                                                                                AS APPRONUM,
       C.ORGTYPE                                                                                                 AS ORGTYPE,
       C.BCOMMADD                                                                                                AS BCOMMADD,
       C.FORTDRTFG                                                                                               AS FORTDRTFG,
       C.REALHOLDINGNAME                                                                                         AS CONTROLLER,--实际控制人名称
       C.REALHOLDINGTYPE                                                                                         AS CONTROLLER_TYPE,--实际控制人证件类型
       C.REALHOLDINGCARDNUMBER                                                                                   AS CONTROLLER_ID,--实际控制人证件代码
--C.INVOICERECNAME AS INVOICEREC_NAME,
--C.INVOICERECPHONE AS INVOICEREC_PHONE,
--C.INVOICERECADDR AS INVOICEREC_ADDR,
       C.LISENSENO                                                                                               AS CREDIT_CODE, --统一社会信用代码
       '2'                                                                                                       AS JOB,
       case t2.QYKGLX
           when 'A01' then '01'
           when 'A0101' then '0101'
           when 'A0102' then '0102'
           when 'A02' then '02'
           when 'A0201' then '0201'
           when 'A0202' then '0202'
           when 'B01' then '03'
           when 'B0101' then '0301'
           when 'B0102' then '0302'
           when 'B02' then '04'
           when 'B0201' then '0401'
           when 'B0202' then '0402'
           when 'B03' then '05'
           when 'B0301' then '0501'
           when 'B0302' then '0502'
           else null end                                                                                            QYKGLX,--经济成分
       t2.ECONOMIC_SECTOR                                                                                        AS ECONOMIC_SECTOR,--经济部门
       replace(t2.PAIDIN_CAPITAL, ',', '')                                                                       AS PAIDIN_CAPITAL,--实收资本
       replace(t2.TOTAL_ASSETS, ',', '')                                                                         AS TOTAL_ASSETS,--总资产
       replace(t2.OPERAT_INCOME, ',', '')                                                                        AS OPERAT_INCOME,--营业收入
       t2.OPERATE_STATUS                                                                                         AS OPERATE_STATUS,--营业状态
       t2.RELATED_PARTY                                                                                          AS RELATED_PARTY,--是否关联方
       case
           when C.DISTRICT is not null then C.DISTRICT
           when C.CITY is not null then C.CITY || '00'
           when C.PROVINCE is not null then C.PROVINCE || '0000'
           else '' end                                                                                           as ADMIN_DIVISION, -- 行政区划
       'N'                                                                                                       AS NCCSBZ,--农村城市标志 --客户要求默认是城市
       CASE
           WHEN C.INSTITUTIONALLEVEL = '02' or C.INSTITUTIONALLEVEL = '03' THEN
               0
           ELSE 1 END                                                                                               ISLEGAL, --是否独立法人 0 否1是
       decode(c.type, 1, '1', 4, '1', '4')                                                                       as CUSTOMS_RELATION,--客户关系
       (select a.value
        from clt_conf_info_value a
        where a.cltcltinfo_id = c.ID
          and a.cltconfinfo_id in (SELECT ID
                                   FROM CLT_CONF_INFO
                                   where type = 6
                                     and name = '全球法人识别编码'))                                             AS LEI_CODE --全球法人识别编码
        ,
       c.CANCELLATION_DATE                                                                                          COLSED_DATE
FROM CLT_CLT_INFO C
         LEFT JOIN temp2 t2 ON t2.clt_id = c.id
         LEFT JOIN CLT_CONF_INFO A ON C.INDUSTRY = A.ID and A.TYPE = 1
         LEFT JOIN CLT_CONF_INFO B ON C.CREDITLEVEL = B.id and B.TYPE = 2
         LEFT JOIN CLT_CONF_INFO D ON C.CREDITLEVEL = D.id and D.TYPE = 63 --农村城市标志
where c.type = 0
  and c.cltno = '00000000';

-- 取自核心表
-- CLT_CLT_INFO
-- CLT_CONF_INFO
-- CLT_CONF_INFO_VALUE
-- 缺失 PRMS_CREDIT_RATING
-- 监管集市dw CODES 表，库中缺失 表，以及字段映射
