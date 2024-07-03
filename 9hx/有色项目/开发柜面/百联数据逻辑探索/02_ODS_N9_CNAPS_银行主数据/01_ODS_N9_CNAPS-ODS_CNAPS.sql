

-- 执行SQL脚本
-- delete from ODS_CNAPS
    -- 备注，数据字典中没有找到， 银行联行号表

-- 表输入
SELECT CNAPSNO,
       BANKNO,
       OPBANKNAME,
       OPBANKADDR,
       REGNO,
       CNAPS_SOURCE,
       STD_REGION_CODE
FROM CNAPS;

-- 154442
select count(1) from CNAPS;


-- 查看系统表
        SELECT table_name
        FROM user_tables ;

        SELECT table_name
        FROM user_tables where table_name like  'CNAPS%';


/*314227200238,314,辽宁农村商业银行股份有限公司凌海人民路分理处, ,2272,1,2107
314227200246,314,辽宁农村商业银行股份有限公司凌海石山支行, ,2272,1,2107
314227200254,314,辽宁农村商业银行股份有限公司凌海白台子支行, ,2272,1,2107
314227200262,314,辽宁农村商业银行股份有限公司凌海高峰支行, ,2272,1,2107
314227200279,314,辽宁农村商业银行股份有限公司凌海谢屯支行, ,2272,1,2107
314232200138,314,辽宁农村商业银行股份有限公司盘山胡家支行, ,2322,1,2111
314232200187,314,辽宁农村商业银行股份有限公司盘山坝墙子分理处, ,2322,1,2111*/
