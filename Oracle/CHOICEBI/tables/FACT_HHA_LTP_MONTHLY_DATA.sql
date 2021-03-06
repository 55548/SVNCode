drop table FACT_HHA_LTP_MONTHLY_DATA 

create table FACT_HHA_LTP_MONTHLY_DATA 
(
MONTH_ID                    NUMBER
,SUBSCRIBER_ID               VARCHAR2 (200)
,MEMBER_ID                   NUMBER
,DL_LOB_ID                   NUMBER
,DL_PLAN_SK                  NUMBER
,PROGRAM                     VARCHAR2 (10)
,DL_ASSESS_SK                NUMBER
,LEVELOFCARESCORE            NUMBER (3)
,TOOL_SRC_SYS                VARCHAR2 (50)
,TOOL_ID                     NUMBER
,TOOL_HOURS_WEEK             NUMBER
,SCRIPT_RUN_LOG_ID           NUMBER
,PSP_HOURS_WEEK              NUMBER
,OPS_HOURS_AVG_DAY_DOS       NUMBER
,OPS_NBER_DAYS_MONTH         NUMBER
,OPS_HOURS_MONTH             NUMBER
,OPS_HOURS_AVG_WEEK_WOS      NUMBER
,OPS_NBER_WEEK_WOS           NUMBER
,AUTH_HOURS_AVG_DAY_DOS      NUMBER
,AUTH_NBER_DAYS_MONTH        NUMBER
,AUTH_HOURS_MONTH            NUMBER
,AUTH_HOURS_AVG_WEEK_WOS     NUMBER
,AUTH_NBER_WEEK_WOS          NUMBER
,ORDERED_HOURS_AVG_DAY_DOS   NUMBER
,ORDERED_HHA_NBER_DAYS_MONTH NUMBER
,ORDERED_HHA_HOURS_MONTH     NUMBER
,ORDERED_HOURS_AVG_WEEK_WOS  NUMBER
,ORDERED_NBER_WEEK_WOS       NUMBER
,PAID_HHA_HOURS_AVG_DAY_DOS  NUMBER
,PAID_HHA_NBER_DAYS_MONTH    NUMBER
,PAID_HHA_HOURS_MONTH        NUMBER
,PAID_HHA_AMT_MONTH          NUMBER
,ORDERED_SNF_DAYS_MONTH      NUMBER
,PAID_SNF_DAYS_MONTH         NUMBER
,PAID_SNF_AMT_MONTH          NUMBER
,PAID_COMBO_AMT_MONTH        NUMBER
,LTP_IND                     NUMBER
,  CRTE_USR_ID                  VARCHAR2(16 BYTE) DEFAULT sys_context('USERENV', 'OS_USER'),
  CRTE_TS                      DATE             DEFAULT SYSDATE,
  UPDT_USR_ID                  VARCHAR2(16 BYTE) DEFAULT sys_context('USERENV', 'OS_USER'),
  UPDT_TS                      DATE             DEFAULT SYSDATE
)




GRANT SELECT ON FACT_HHA_LTP_MONTHLY_DATA TO CHOICEBI_RO;

GRANT SELECT ON FACT_HHA_LTP_MONTHLY_DATA TO DIONNE_L;

GRANT SELECT ON FACT_HHA_LTP_MONTHLY_DATA TO LINKADM;

GRANT SELECT ON FACT_HHA_LTP_MONTHLY_DATA TO MSTRSTG;

GRANT SELECT ON FACT_HHA_LTP_MONTHLY_DATA TO RESEARCH;

GRANT SELECT ON FACT_HHA_LTP_MONTHLY_DATA TO ROC_RO;

GRANT SELECT ON FACT_HHA_LTP_MONTHLY_DATA TO SF_CHOICE;
