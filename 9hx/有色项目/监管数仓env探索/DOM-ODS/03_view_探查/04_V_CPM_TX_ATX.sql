select * from V_CPM_TX_ATX;


create view V_CPM_TX_ATX as
select
  a.TX_ID          ,
  a.CHANNEL_ID     ,
  a.TX_TYPE_ID      ,
  a.CUR_CODE   ,
  a.BRANCH_NO   ,
  a.CREATE_BR_NO,
  a.SOURCE_ID      ,
  a.PRIOR_TXID    ,
  a.BTX_ID,
  a.TX_DATE        ,
  a.EXEC_RESULT    ,
  a.ERROR_CODE     ,
  a.ERROR_TEXT     ,
  a.TX_REFCODE    ,
  a.TX_ABSTRACT    ,
  a.TX_COMMENT     ,
  a.TX_STATE       ,
  a.EXECUTE_FLAG   ,
  a.SUCC_BIZ_CODE  ,
  a.TX_FINGER_PRINT ,
  a.VCH_UDC        ,
  a.TX_CLASS	,
  a.SPECIAL_TX_FLAG     ,
  a.BIZ_FLOW_CASE_ID,
  a.VERSION_COLUMN,
  b.ACC_NO,
  b.SB_UNIT_NO,
  b.AMOUNT,
  b.START_DATE,
  b.END_DATE,
  b.INTR_RATE,
  b.TX_BIZNUMBER,
  b.RECONCILE_MARK,
  b.X_CASE_ID,
  b.ACM_TYPE,
  b.SUBJECT_NO,
  b.INPUT_ACC_NO,
  b.ACC_TYPE_ID,
  b.CUST_NO,
  b.BUSNISS_TYPE,
  b.TREAT_WAY,
  b.ACCOUNT_NAME,
  b.OPEN_DATE,
  b.INTER_BRANCH_FLAG,
  b.VALIDATE_MODE,
  b.IS_OFF_SHORE,
  b.IS_OVER_DRAFT,
  b.OVER_MODE,
  b.OVER_LIMITATION,
  b.IS_BILLING,
  b.IS_POSTPONE,
  b.POSTPONE_DATE,
  b.SOURCE_ACC_DATE,
  b.SOURCE_ACC_NO,
  b.BIZ_FILL_MODE,
  b.TX_OP_CODE,
  b.A_MCTYPE_CODE,
  b.CONTRACT_NO,
  b.IS_INTR_BEAR,
  b.INTR_BEAR_MODE,
  b.IS_OVERDUE,
  b.RATE_SET_MODE,
  b.OPEN_RATE,
  b.END_RATE,
  b.INTR_RULE,
  b.FLOATING_MODE,
  b.FLOATING_AMOUNT,
  b.ISCA_PAY_INTR_ACC_NO,
  b.ISCA_OVERDUE_PAY_INTR_ACC_NO,
  b.ISCA_REC_INTR_ACC_NO,
  b.ISCA_CF_CODE,
  b.IS_MERGE_INTR,
  b.PRO_REC_INTR_ACC_NO,
  b.PRO_PAY_INTR_ACC_NO,
  b.INIT_DATE,
  b.IS_FOLLOW_ACC_RATE,
  b.IS_FOLLOW_ACC_INTR,
  b.INTR_PERIOD,
  b.INTR_MOTH,
  b.INTR_DAY,
  a.INPUTER              ,
  a.INPUTER_NAME         ,
  a.CHECKER              ,
  a.CHECKER_NAME         ,
  a.RATIFIER             ,
  a.RATIFIER_NAME        ,
  a.INPUT_TIME           ,
  a.CHECK_TIME           ,
  a.RATIFY_TIME,
  b.TX_CREATE_WAY        ,
  b.FOREIGN_ACCOUNT_TYPE,
  b.LIMIT_TYPE,
  b.FOREIGN_ACCOUNT_MOLD,
  b.ACCOUNT_LIMIT,
  b.BUSINESS_NUMBER
from CPM_ATX b join CPM_TX a on a.tx_id=b.tx_id
;