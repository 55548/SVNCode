DROP TABLE CHOICEBI.FACT_IP_SNF_DATA CASCADE CONSTRAINTS;

CREATE TABLE CHOICEBI.FACT_IP_SNF_DATA
(
  MONTH_ID              NUMBER,
  SUBSCRIBER_ID         CHAR(9 BYTE),
  MEMBER_ID             NUMBER,
  DL_LOB_ID             NUMBER,
  DL_PLAN_SK            NUMBER,
  CM_SK_ID              NUMBER,
  DL_ASSESS_SK          NUMBER,
  DL_MEMBER_ADDRESS_SK  NUMBER,
  CLHP_STAMENT_FR_DT    DATE,
  CLHP_STAMENT_TO_DT    DATE,
  TOTPD                 NUMBER,
  CLHP_DC_STAT          VARCHAR2(2 BYTE),
  CLCL_TOT_PAYABLE      NUMBER,
  EFF_DT                DATE,
  TERM_DATE             DATE,
  PLAN_ID               VARCHAR2(8 BYTE),
  ACTIVE                NUMBER,
  SEQ                   NUMBER,
  LOS                   NUMBER,
  SYS_UPD_TS            DATE                    DEFAULT sysdate
);


GRANT SELECT ON CHOICEBI.FACT_IP_SNF_DATA TO MSTRSTG;