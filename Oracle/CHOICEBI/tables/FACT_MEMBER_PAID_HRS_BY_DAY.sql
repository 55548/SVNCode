DROP TABLE CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY CASCADE CONSTRAINTS;

CREATE TABLE CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY
(
    THE_DATE          DATE,
    MONTH_ID          NUMBER,
    LOB_ID            NUMBER,
    MRN               NUMBER,
    SUBSCRIBER_ID     VARCHAR2(14),
    ORDERED_DAY       NUMBER,
    ORDERED_DAY_HE    NUMBER,
    PAID_HOURS        NUMBER,
    PAID_HOURS_HE     NUMBER,
    COUNTY_CODE       VARCHAR2(10),
    BOROUGH           VARCHAR2(10),
    IS_ACTIVE         NUMBER,
    LINE_OF_BUSINESS  VARCHAR2(20),
    OPS_HRS_DAY       NUMBER,
    AUTH_HRS_DAY      NUMBER,
    AUTH_HRS_DAY_HE   NUMBER,
	TPPVE_HRS_DAY 	  NUMBER,
	CHG_HRS_DAY 	  NUMBER,
	TMG_HRS_DAY 	  NUMBER,
	TMG_HRS_DAY_HE	  NUMBER,
    JOB_RUN_ID        NUMBER,
    SYS_UPD_TS        DATE  DEFAULT SYSDATE    
)
RESULT_CACHE (MODE DEFAULT)
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
PARTITION BY LIST (LINE_OF_BUSINESS) 
     (
     PARTITION SOURCE_MLTC VALUES ('MLTC'),
     PARTITION SOURCE_FIDA VALUES ('FIDA'),
     PARTITION SOURCE_SH VALUES ('SH'),
     PARTITION SOURCE_MA VALUES ('MA'),
     PARTITION SOURCE_NULL VALUES (NULL),
     PARTITION SOURCE_OTHERS VALUES (DEFAULT)
     );

CREATE INDEX CHOICEBI.FMPD_PKEY_I ON CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY
(LOB_ID,LINE_OF_BUSINESS,THE_DATE, MONTH_ID, MRN, SUBSCRIBER_ID, IS_ACTIVE)
NOLOGGING
NOPARALLEL;

/*
ALTER TABLE CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY ADD (
  CONSTRAINT FMPD_PKEY_I
  PRIMARY KEY
  (THE_DATE,  MONTH_ID, MRN, SUBSCRIBER_ID,LINE_OF_BUSINESS)
  USING INDEX CHOICEBI.FMPD_PKEY_I
  ENABLE VALIDATE);
  */

GRANT SELECT ON CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY TO LINKADM;

GRANT SELECT ON CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY TO NAOMI_S;

GRANT SELECT ON CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY TO PAVEL_C;


GRANT SELECT ON CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY TO MSTRSTG;

GRANT SELECT ON CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY TO RIPUL_P;
GRANT SELECT ON CHOICEBI.FACT_MEMBER_PAID_HRS_BY_DAY TO MSTRSTG;
