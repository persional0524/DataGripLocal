-- 根据数据日期删除已有数据集数据

-- 业务系统取数
select distinct '${SJRQ}'                                                                                SJRQ,
                '0001'                                                                                   V_DEPT_ID,
                trim(A.CONTRACT_NO)                                                                      CONTRACT_NO,
                A.BID                                                                                    BID,
                C.CORPNO                                                                                 CLTNO,
                decode(to_int(A.BIZ_TYPE), '109', '101', '110', '101', '111', '101', to_int(A.BIZ_TYPE)) BIZ_TYPE,
                A.SIGN_DATE                                                                              SIGN_DATE,
                A.START_DATE                                                                             START_DATE,
                A.MATURITY                                                                               MATURITY,
                A.CURRENCY_NO                                                                            CURRENCY_NO,
                A.AMOUNT                                                                                 AMOUNT,
                -- CON.IS_FLOATING_RATE IS_FLOATING_RATE,--利率是否浮动
                case
                    WHEN CON.NORMRATE_RULE = '0' THEN '0'
                    ELSE
                        '1'
                    END                                                                                  IS_FLOATING_RATE,--利率是否浮动

                (select lv.RMS_VALUE as RMS_VALUE
                 from fb_intrest_rates lv
                 where lv.rate_id = (select t2_lv.rate_id
                                     from (select t_lv.rate_id
                                           from fb_intrest_rates t_lv
                                           where t_lv.bid = a.bid
                                             and t_lv.rate_type = 00
                                           order by t_lv.eft_date, t_lv.rate_id desc) t2_lv
                                     where rownum = 1)
                   and lv.bid = a.bid)                                                                   BASE_RATE, --基准利率
                (select d.rate
                 from FB_INTREST_RATES d
                 where d.bid = a.bid
                   and d.rate_type = '00'
                   and d.eft_date = (select max(b.eft_date)
                                     from FB_INTREST_RATES b
                                     where b.bid = a.bid and b.eft_date <= date'${SJRQ}'))               LAST_RATE,
                con.normrate_falg                                                                        FLOATRATIO,
                case
                    WHEN CON.NORMRATE_RULE = '1' THEN 99
                    WHEN CON.NORMRATE_RULE = '2' THEN 1
                    WHEN CON.NORMRATE_RULE = '3' THEN 2
                    WHEN CON.NORMRATE_RULE = '4' THEN 3
                    WHEN CON.NORMRATE_RULE = '5' THEN 4
                    ELSE
                        CON.NORMRATE_RULE
                    end
                                                                                                         RATE_FLOAT_code,
                -- con.DISTRICT INVEST_REGION,
                nvl(CON.DISTRICT, clt.DISTRICT)                                                          INVEST_REGION,--贷款投向地区
                --case when (regexp_like(conf.code,'^[a-z]')) then upper(rpad(conf.code,5,0)) else rpad(conf.code,5,0) end INVEST_DIRECTION,
                --  (select mapp.standard_code from Mapp_dict_detail mapp where mapp.src_code = con.LOAN_INVEST_DIRECTION ) INVEST_DIRECTION,--贷款实际投向
                con.LOAN_INVEST_DIRECTION                                                                INVEST_DIRECTION,--贷款实际投向
                --case when A.BIZ_TYPE ='104' then nvl(CON.Contractuse,'经营周转')
                -- else CON.Contractuse end as  DKYT,
                nvl(CON.Contractuse, '经营周转')                                                         DKYT,
                CON.FINANCETERM                                                                          FINANCETERM,
                CON.GROUPBANK                                                                            GROUPBANK,
                CON.SELF_SUPPORT                                                                         SELF_SUPPORT,
                CON.SUPPLY_BANK_NAME                                                                     SUPPLY_BANK_NAME,
                CON.LOAN_TYPE                                                                            LOAN_TYPE,
                CON.MULTI_LENDING                                                                        MULTI_LENDING,
                CON.REPAY_CAPITAL as                                                                     REPAY_CAPITAL,
                --CON.REPAY_CAPITAL as REPAY_CAPITAL,
                CON.INTREST_PERIOD                                                                       INTREST_PERIOD,
                CON.INTREST_DAY                                                                          INTREST_DAY,
                CON.FINANCIAL_SUPPORT                                                                    FINANCIAL_SUPPORT,--贷款财政扶持方式
                CON.RESTRUCTURING_METHOD                                                                 LOAN_RESTRUCTUR,--贷款重组方式
                CON.SECUTITIZATION_CODE                                                                  ASSET_SECURIT_CODE,--资产证券化产品代码
                nvl(CON.IN_SUIT, 0)                                                                      IN_SUIT,
                CON.risk_exposure                                                                        risk_exposure,
                A.STATE                                                                                  STATE,
                CASE
                    WHEN (SELECT distinct L.FIVE_LEVEL
                          FROM FB_FIVELEVEL_LOG L

                          WHERE L.CREATE_TIME = (SELECT MAX(F.CREATE_TIME)
                                                 FROM FB_FIVELEVEL_LOG F
                                                 WHERE F.BID = A.BID
                                                   AND F.CREATE_TIME <= date'${SJRQ}' + 1)
                            AND L.BID = A.BID) IS NOT NULL THEN
                        (SELECT distinct L.FIVE_LEVEL
                         FROM FB_FIVELEVEL_LOG L

                         WHERE L.CREATE_TIME = (SELECT MAX(F.CREATE_TIME)
                                                FROM FB_FIVELEVEL_LOG F
                                                WHERE F.BID = A.BID
                                                  AND F.CREATE_TIME <= date'${SJRQ}' + 1)
                           AND L.BID = A.BID)
                    ELSE
                        1
                    END                                                                                  FIVE_LEVEL,
                con.description   as                                                                     "DESCRIPTION",
                CASE
                    WHEN (SELECT MAX(F.CREATE_TIME)
                          FROM FB_FIVELEVEL_LOG F
                          WHERE F.BID = A.BID
                            AND F.CREATE_TIME <= date'${SJRQ}' + 1) IS NOT NULL THEN
                        (SELECT MAX(F.CREATE_TIME)
                         FROM FB_FIVELEVEL_LOG F
                         WHERE F.BID = A.BID
                           AND F.CREATE_TIME <= date'${SJRQ}' + 1)
                    ELSE
                        NULL
                    END                                                                                  FIVE_LEVEL_DATE,
                con.astr_flag                                                                            ASSET_FLAG,
                case
                    when (select count(fs.bid)
                          from fb_special_actions fs
                          where fs.bid = a.bid
                            and fs.action_type = 'MAT.EXT') > 0 then
                        '1'
                    else
                        '0'
                    end                                                                                  EXT_FLAG, --展期标记
                case
                    when (select count(fs.bid)
                          from FB_PLAN_CHANGE_LOG fs
                          where fs.bid = a.bid
                            and fs.LOG_TYPE = '2') > 0 then TO_CHAR(A.MATURITY, 'yyyy-MM-dd')
                    else null
                    end                                                                                  EXPIRY_DATE,--展期后到期日
                a.remark                                                                                 REMARK,
                null                                                                                     EXPECT_ENDDATE,--预计终止日
                CASE
                    WHEN (select nvl(sum(case
                                             when fl.dir_flag = '+' then
                                                 fl.amount
                                             else
                                                 -fl.amount
                        end),
                                     0)
                          from fb_ledgers fl
                          where fl.bid = a.bid
                            and fl.act_date <= sysdate
                            and fl.ledger_type in ('00', '01', '02')) <= 0 THEN
                        (select MAX(fl.act_date)
                         from fb_ledgers fl
                         where fl.bid = a.bid
                           and fl.act_date <= sysdate
                           and fl.ledger_type in ('00', '01', '02'))
                    ELSE
                        NULL
                    END                                                                                  ACTUAL_ENDDATE, --实际终止日
                case when a.biz_type in ('101', '102', '109', '110', '111', '118', '130') then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'CREDIT'）
                    when a.biz_type='104' then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'BUSSINESS.ASSETS'） when a.biz_type='105' then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'DISCOUNT'） when a.biz_type='106' then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'TENANCY.ASSETS'） when a.biz_type in ('107','116') then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'CREDIT.SURETY'） when a.biz_type='109' then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'CREDIT.SURETY'） when a.biz_type='116' then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'CREDIT.SURETY'） when a.biz_type='128' then （
select t.account_no
from fb_accounts t
where t.bid = a.bid
  and t.account_type = 'CREDIT.OVERDRAFT'） end LOAN_ACCOUNT, --贷款账户
/*(SELECT NVL(SUM(Q.AMOUNT), 0)
                   FROM FB_CHARGE_RATES P
                  INNER JOIN FB_CHARGE_PLANS Q
                     ON P.CHARGE_RATE_ID = Q.CHARGE_RATE_ID
                    AND P.BID = A.BID  and exec_flag=1) CHARGE_AMT, --手续费金额 */
  case when p1.CHARGE_TYPE=2  then  (SELECT NVL(SUM(Q.AMOUNT), 0)
                   FROM FB_CHARGE_RATES P
                  INNER JOIN FB_CHARGE_PLANS Q
                     ON P.CHARGE_RATE_ID = Q.CHARGE_RATE_ID
                    AND P.BID = A.BID and EXEC_FLAG=1 and CHARGE_TYPE=2  )  else
                      (SELECT NVL(SUM(Q.AMOUNT), 0)
                   FROM FB_CHARGE_RATES P
                  INNER JOIN FB_CHARGE_PLANS Q
                     ON P.CHARGE_RATE_ID = Q.CHARGE_RATE_ID
                    AND P.BID = A.BID and CHARGE_TYPE<>2 ) end CHARGE_AMT, --手续费金额
       null     WRITEOFF_DATE,
       TRUNC(FSA.ACT_DATE) WRITEOFF_RECOVERY_DATE, --核销贷款回收日期
CASE
                  WHEN A.BIZ_TYPE IN ('110', '111') THEN
                   1
                  ELSE
                   0
                END IS_SYNDICATE_LOAN, --是否银团贷款
       (select nvl(sum(case when fl.dir_flag = '+' then fl.amount else -fl.amount end),0)
       from fb_ledgers fl where fl.bid = a.bid and fl.act_date <= date'${SJRQ}' and fl.ledger_type in('00','01','02')) BALANCE,
     conf.code as    HIGH_TECH,
   -- '2' RATE_TYPE,--贷款定价基准类型
 DECODE(con.RATE_TYPE,'TR05','B03','TR08','B01','TR09','B02','B99') RATE_TYPE2,--贷款定价基准类型 金数用
     CASE
            WHEN  con.FINANCETERM = '0' THEN 'B0101'
            WHEN  con.FINANCETERM = '1' THEN 'B0101'
            WHEN  con.FINANCETERM = '2' THEN 'B0102'
            WHEN  con.FINANCETERM = '3' THEN 'B0102'
            WHEN  con.FINANCETERM = '4' THEN 'B0103'
       ELSE 'B01' END RATE_TYPE, --利率报备
 --(select max(eft_date) from (select fb.eft_date eft_date from fb_intrest_rates fb where  rate_type='00'and fb.bid=con.bid  and fb.eft_date<=date'${SJRQ}')) CDJ_DATE,--贷款利率重新定价日
 CDJ_DATE(con.normrate_rule,con.normrate_rule_month,con.normrate_rule_day,date'${SJRQ}') CDJ_DATE,--贷款利率重新定价日
        ''  SFSNDK,
      (SELECT NVL((CASE WHEN temp.principal > 0 THEN CASE WHEN temp.intrest > 0 THEN '03' ELSE '01' END ELSE CASE WHEN temp.intrest > 0 THEN '02' ELSE NULL END END ),NULL) FROM(
SELECT sum(fp.principal) AS principal ,sum(fp.intrest) AS intrest
  from fb_plans fp
 inner join fb_plan_exec_log fpel
    on fp.plan_id = fpel.plan_id
 inner join fb_ledgers fl
    on fpel.ledger_id = fl.ledger_id WHERE fp.plan_date < fl.act_date AND fp.bid=a.bid ) temp)  OVERDUE_TYPE ,--逾期类型
     case when a.biz_type ='116'
     then (select act.account_no from fb_accounts act where act.bid=a.bid and act.account_type='CHARGE.PAY')
     when a.biz_type ='111'
     then (select act.account_no from fb_accounts act where act.bid=a.bid and act.account_type='DUE.FROM.BANKS')
     else (select act.account_no from fb_accounts act where act.bid=a.bid and act.account_type='DEPOSIT') end INCOME_ACCOUNT ,
     case when a.biz_type ='105'
     then (select act.account_no from fb_accounts act where act.bid=a.bid and act.account_type='DEPOSIT')
      when a.biz_type ='116'
     then (select act.account_no from fb_accounts act where act.bid=a.bid and act.account_type='CHARGE.PAY')
     when a.biz_type ='111'
     then (select act.account_no from fb_accounts act where act.bid=a.bid and act.account_type='DUE.FROM.BANKS')
     else (select act.account_no from fb_accounts act where act.bid=a.bid and act.account_type='EXPEND') end OUTLAY_ACCOUNT,
                (SELECT MIN(FL.ACT_DATE)
                   FROM FB_LEDGERS FL
                  WHERE FL.LEDGER_TYPE = '01'
                    AND FL.LEDGER_ID = A.BID) OVERDUE_DATE, -- 逾期日期
                A.CURRENCY_NO as CURE_CODE,
                ( select count(*) from fb_lendings plan where plan.bid = a.bid) CONTRACT_PERIOD, --合同期数
                (  select coalesce(inf.lisenseno,inf.orgcode) from fb_accounts acc inner join v_cpm_account ac on acc.account_no =ac.ACCOUNT_NO
                   inner join clt_clt_info inf on inf.cltno =ac.cust_no
                 where  acc.account_type ='CHARGE.PAY' and acc.bid =a.bid )  FEE_CREDIT_CODE, --手续费支付方机构代码
               (  select inf.chinesename from fb_accounts acc inner join v_cpm_account ac on acc.account_no =ac.ACCOUNT_NO
                   inner join clt_clt_info inf on inf.cltno =ac.cust_no
                 where  acc.account_type ='CHARGE.PAY' and acc.bid =a.bid ) FEE_PAYER, --手续费支付方名称
                (select t.account_no
                   from fb_accounts t
                  where t.bid = a.bid
                    and t.account_type = 'CHARGE.INCOME') FINANCE_COLLECT_ACCT, -- 财务公司收款账户
                FSA.AMOUNT WRITEOFF_AMT, --  核销收回本金
                FSA.OP_TIME WRITEOFF_DATE, --  核销操作日期
                DECODE(FSA.AMOUNT, NULL, 0, 1) WRITEOFF_FLAG , --  核销收回标志
(select nvl(sum(case when fl.dir_flag = '+' then fl.amount else -fl.amount end),0)
       from fb_ledgers fl where fl.bid = a.bid and fl.act_date <= date'${SJRQ}'
       and fl.ledger_type in('00','01','02')) BALANCE  ,
'01' AS HANDLE_CHANNEL , -- 填写默认值   01-柜台办理
case when trim(A.CONTRACT_NO) = '(2020)有色财司(流贷)-11号'  then '1' else
(case when CON.GREENCREDIT is null or CON.GREENCREDIT=0 then '0' else '1' end) end IS_GREEN_LOAN,--是否绿色贷款
decode(a.biz_type,109,1,0) CYC_LOAN
from fb_business A
    left JOIN CORPORATIONS C
ON A.DEBTOR = C.CORPID
    left join clt_clt_info clt on c.corpno = clt.cltno
    left JOIN FB_CONTRACTS CON ON A.BID = CON.BID
    left JOIN CLT_CONF_INFO CONF ON CON.LOAN_INVEST_DIRECTION = CONF.CODE
    and conf.type = 1
    LEFT JOIN FB_SPECIAL_ACTIONS FSA ON FSA.BID= A.BID AND FSA.ACTION_TYPE='CANCEL'
    LEFT JOIN FB_CHARGE_RATES p1 on P1.BID = A.BID
WHERE a.biz_type <= 130