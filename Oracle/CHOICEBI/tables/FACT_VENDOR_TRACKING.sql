DROP TABLE CHOICEBI.FACT_VENDOR_TRACKING CASCADE CONSTRAINTS;

CREATE TABLE CHOICEBI.FACT_VENDOR_TRACKING
(
  TAX_ID                         VARCHAR2(50 BYTE),
  PHYSICIAN_ID                   NUMBER(19),
  PHYSICIAN_CODE                 VARCHAR2(50 BYTE),
  PROVIDER_NAME                  VARCHAR2(200 BYTE),
  PATIENT_PHYSICIAN_ID           NUMBER(19),
  PATIENT_ID                     NUMBER(19),
  VENDOR_ID                      NUMBER(10),
  VENDOR_NAME                    VARCHAR2(500 BYTE),
  ASSESSMENT_TYPE_ID             NUMBER(10),
  ASSESSMENT_TYPE                VARCHAR2(500 BYTE),
  ASSESSMENT_DUE_MONTH           DATE,
  FILE_NAME                      VARCHAR2(1000 BYTE),
  CREATED_BY                     NUMBER(19),
  UPDATED_BY                     NUMBER(19),
  CREATED_ON                     DATE,
  START_DATE                     DATE,
  END_DATE                       DATE,
  MEMBER_ID                      NUMBER,
  SUBSCRIBER_ID                  VARCHAR2(200 BYTE),
  FIRST_NAME                     VARCHAR2(200 BYTE),
  LAST_NAME                      VARCHAR2(200 BYTE),
  MEDICAID_NUM1                  VARCHAR2(200 BYTE),
  MEDICAID_NUM2                  VARCHAR2(200 BYTE),
  MRN                            NUMBER,
  CARE_MANAGER_NAME              VARCHAR2(101 BYTE),
  ATTEMPT1_DATE                  DATE,
  ATTEMPT1_OUTCOME               VARCHAR2(4000 BYTE),
  ATTEMPT1_DATE_OF_VISIT         DATE,
  ATTEMPT1_COMMENTS              VARCHAR2(4000 BYTE),
  ATTEMPT2_DATE                  DATE,
  ATTEMPT2_OUTCOME               VARCHAR2(4000 BYTE),
  ATTEMPT2_DATE_OF_VISIT         DATE,
  ATTEMPT2_COMMENTS              VARCHAR2(4000 BYTE),
  ATTEMPT3_DATE                  DATE,
  ATTEMPT3_OUTCOME               VARCHAR2(4000 BYTE),
  ATTEMPT3_DATE_OF_VISIT         DATE,
  ATTEMPT3_COMMENTS              VARCHAR2(4000 BYTE),
  ATTEMPT_FINAL_DATE             DATE,
  ATTEMPT_FINAL_OUTCOME          VARCHAR2(4000 BYTE),
  ATTEMPT_FINAL_DATE_OF_VISIT    DATE,
  ATTEMPT_FINAL_COMMENTS         VARCHAR2(4000 BYTE),
  ATTEMPT_FINAL_NUMBER           NUMBER,
  RECORD_ID                      NUMBER,
  ASSESSMENTDATE                 DATE,
  ONURSEDATE                     DATE,
  ONURSENAME                     VARCHAR2(50 BYTE),
  ONURSEORGNAME                  VARCHAR2(100 BYTE),
  ONURSECOMMENTS                 VARCHAR2(4000 BYTE),
  RECORD_ID_OTH_VENDOR           NUMBER,
  ASSESSMENTDATE_OTH_VENDOR      DATE,
  ONURSEDATE_OTH_VENDOR          DATE,
  ONURSENAME_OTH_VENDOR          VARCHAR2(50 BYTE),
  ONURSEORGNAME_OTH_VENDOR       VARCHAR2(100 BYTE),
  ATSP_DOCUMENT_ID               NUMBER(19),
  ATSP_CREATED_ON_DATE           DATE,
  PSP_SCRIPT_RUN_LOG_ID          NUMBER(19),
  PSP_SCPT_ACTIVITY_STATUS       VARCHAR2(10 BYTE),
  PSP_SCPT_FORM_ACTIVITY_STATUS  VARCHAR2(50 BYTE),
  PSP_START_DATE                 DATE,
  PSP_END_DATE                   DATE,
  PSP_APPROVED_UNITS             NUMBER,
  PSP_ASSESSMENT_DATE            VARCHAR2(4000 BYTE),
  PSP_ATSP_TOOL_TOTAL_PER_WEEK   VARCHAR2(4000 BYTE),
  SYS_UPD_DT                     DATE,
  FLAG                           NUMBER         DEFAULT 1,
  ATTEMPT_DATE                   DATE,
  ATTEMPT_NUMBER                 NUMBER,
  ATTEMP_DATE_MONTH_ID           NUMBER,
  ASSESSMENT_DUE_MONTH_ID        NUMBER,
  ASSESSMENTDATE_MONTH_ID        NUMBER,
  DOC_SUBMIT_DATE                DATE,
  DOC_SUBMIT_DATE_MONTH_ID       NUMBER,
  LATEST_ATTEMPT_DATE            DATE,
  LATEST_ATTEMPT_DATE_MONTH_ID   NUMBER,
  LATEST_ATTEMPT_DATE_OUTCOME    VARCHAR2(4000 BYTE),
  ASSESS_DUE_DT_2ND_LAST_BD      DATE,
  ASSESSMENTDATE_5_BUS_DAYS      DATE
);


GRANT SELECT ON CHOICEBI.FACT_VENDOR_TRACKING TO DW_OWNER;

GRANT SELECT ON CHOICEBI.FACT_VENDOR_TRACKING TO MSTRSTG;

GRANT SELECT ON CHOICEBI.FACT_VENDOR_TRACKING TO SF_CHOICE;
