-- 执行SQL脚本

delete
from ODS_CPM_VOUCHER
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

-- 表输入
SELECT vch_id,
       vd_id,
       cur_code,
       branch_no,
       account_id,
       tx_id,
       book_date,
       voucher_num,
       dir_flag,
       amount,
       account_no,
       subject_no,
       op_account_id,
       op_subject_no,
       op_account_no,
       biz_code,
       intr_date,
       end_date,
       booking_state,
       ticket_id,
       vch_inputor,
       vch_checker,
       vch_ratifier,
       input_time,
       check_time,
       ratify_time,
       cf_code,
       mctype_code,
       mctype_name,
       reconcile_mark,
       ebk_no,
       ebk_name,
       cnaps_code,
       ebk_acc_no,
       ebk_account_name,
       ebk_rigion,
       ebk_city,
       ebk_ticket_no,
       remark,
       vch_udc,
       finger_print,
       vch_ref_no,
       ticket_code,
       user_no,
       create_br_no,
       book_time,
       vch_booker,

-- CPM_F_GET_ACC_RVAL(ACCOUNT_NO, BOOK_DATE, VCH_ID) AS ACCBALANCE
       NULL ACCBALANCE
FROM CPM_VOUCHER a
WHERE BOOK_DATE >= to_date('${sdate}', 'yyyy-MM-dd');

/*
字段缺失
       ibsshielding,*/

-- ddl 无表，字段注释

/*
Data Source: N9测试环境1（开发环境）-柜面 Schema: YSKY_SMS Table: CPM_VOUCHER
-- auto-generated definition
create table CPM_VOUCHER
(
    VCH_ID           NUMBER        not null
        constraint PK_CPM_VOUCHER
            primary key,
    VD_ID            NUMBER,
    CUR_CODE         VARCHAR2(8),
    BRANCH_NO        VARCHAR2(8),
    ACCOUNT_ID       NUMBER
        constraint FK_CPM_VOUC_REL_VOU_A_CPM_ACCO
            references CPM_ACCOUNT,
    TX_ID            NUMBER
        constraint FK_CPM_VOUC_REFERENCE_CPM_TX
            references CPM_TX
        constraint FK_CPM_VOUC_RELATIONS_CPM_VTX
            references CPM_VTX,
    BOOK_DATE        DATE          not null,
    VOUCHER_NUM      NUMBER        not null,
    DIR_FLAG         NUMBER,
    AMOUNT           NUMBER(16, 2) not null,
    ACCOUNT_NO       VARCHAR2(32),
    SUBJECT_NO       VARCHAR2(16),
    OP_ACCOUNT_ID    NUMBER,
    OP_SUBJECT_NO    VARCHAR2(16),
    OP_ACCOUNT_NO    VARCHAR2(32),
    BIZ_CODE         VARCHAR2(60),
    INTR_DATE        DATE,
    END_DATE         DATE,
    BOOKING_STATE    NUMBER        not null,
    TICKET_ID        NUMBER
        constraint FK_CPM_VOUC_RELATIONS_CPM_TICK
            references CPM_TICKET,
    VCH_INPUTOR      VARCHAR2(30)  not null,
    VCH_CHECKER      VARCHAR2(30),
    VCH_RATIFIER     VARCHAR2(30),
    INPUT_TIME       DATE          not null,
    CHECK_TIME       DATE,
    RATIFY_TIME      DATE,
    CF_CODE          VARCHAR2(8),
    MCTYPE_CODE      VARCHAR2(4),
    MCTYPE_NAME      VARCHAR2(30),
    RECONCILE_MARK   VARCHAR2(64),
    EBK_NO           VARCHAR2(4),
    EBK_NAME         VARCHAR2(80),
    CNAPS_CODE       VARCHAR2(32),
    EBK_ACC_NO       VARCHAR2(32),
    EBK_ACCOUNT_NAME VARCHAR2(180),
    EBK_RIGION       VARCHAR2(80),
    EBK_CITY         VARCHAR2(80),
    EBK_TICKET_NO    VARCHAR2(32),
    REMARK           VARCHAR2(255),
    VCH_UDC          VARCHAR2(32),
    FINGER_PRINT     VARCHAR2(254),
    VCH_REF_NO       VARCHAR2(32),
    TICKET_CODE      VARCHAR2(32),
    USER_NO          VARCHAR2(64),
    CREATE_BR_NO     VARCHAR2(8)
        constraint FK_CPM_VOUC_RELATIONS_CPM_BRAN
            references CPM_BRANCH,
    BOOK_TIME        DATE,
    VCH_BOOKER       VARCHAR2(30),
    VCH_NUM          VARCHAR2(8)
)
/

create index CPM_VOUCHER_IDX
    on CPM_VOUCHER (CUR_CODE, BRANCH_NO, BOOKING_STATE, ACCOUNT_NO)
/

create index RELATIONSHIP_156_FK
    on CPM_VOUCHER (TX_ID)
/

create index IND_CPM_ACCOUNT_STATE
    on CPM_VOUCHER (BOOKING_STATE)
/

create index IDX_VCH_ACCNO_DATE
    on CPM_VOUCHER (ACCOUNT_NO, BOOK_DATE)
/

create index CPM_VOUCHER_ACC_DATE
    on CPM_VOUCHER (ACCOUNT_ID, BOOK_DATE)
/

create index IND_CPM_VOUCHER_BD_AI_BS
    on CPM_VOUCHER (BOOK_DATE, ACCOUNT_ID, BOOKING_STATE)
/

create index IDX_CPM_VOUCHER_DATE
    on CPM_VOUCHER (BOOK_DATE)
/

create index REL_VOU_ACC_FK
    on CPM_VOUCHER (ACCOUNT_ID)
/

create index CPM_VOUCHER_NO
    on CPM_VOUCHER (VOUCHER_NUM)
/
 Show table preview */

/*
CPM_VOUCHER 凭证表
字段	含义	备注
VCH_ID	凭证ID	　
VD_ID	记账底稿ID	　
CUR_CODE	币种代号	　
BRANCH_NO	营业机构号	　
ACCOUNT_ID	账户ID	　
TX_ID	交易ID	　
BOOK_DATE	签发日期	　
VOUCHER_NUM	凭证号	　
DIR_FLAG	收付方向	1为借，2为贷
AMOUNT	主交易金额	　
ACCOUNT_NO	账号	　
SUBJECT_NO	科目号	　
OP_ACCOUNT_ID	对方账户ID	　
OP_SUBJECT_NO	对方科目号	　
OP_ACCOUNT_NO	对方账号	　
BIZ_CODE	业务标识	合同号/借据号/存单号等
INTR_DATE	交易起息日期	　
END_DATE	业务结束日期	　
BOOKING_STATE	记账状态	1为已入账，0为未入账
TICKET_ID	单据ID	　
VCH_INPUTOR	录入人	　
VCH_CHECKER	复核人	　
VCH_RATIFIER	审批人	　
INPUT_TIME	录入时间	　
CHECK_TIME	复核时间	　
RATIFY_TIME	审批时间	　
CF_CODE	现金流编号	　
MCTYPE_CODE	多维分类	　
MCTYPE_NAME	多维类别名称	　
RECONCILE_MARK	客户对账标识	　
EBK_NO	他行银行代号	　
EBK_NAME	他行行名	　
CNAPS_CODE	清算行号	　
EBK_ACC_NO	他行账号	　
EBK_ACCOUNT_NAME	他行户名	　
EBK_RIGION	他行地址（省）	　
EBK_CITY	他行地址（市）	　
EBK_TICKET_NO	他行票号	　
REMARK	备注	　
VCH_UDC	用户自定义分类码	　
FINGER_PRINT	校验码	　
VCH_REF_NO	凭证参考号	　
TICKET_CODE	票证号码	　
USER_NO	制证人	　
CREATE_BR_NO	营业机_营业机构号	　
BOOK_TIME	记账时间	　
VCH_BOOKER	记账人	　
*/

-- list 1
