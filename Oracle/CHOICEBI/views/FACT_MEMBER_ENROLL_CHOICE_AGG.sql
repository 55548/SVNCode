DROP VIEW FACT_MEMBER_ENROLL_CHOICE_AGG;

CREATE OR REPLACE VIEW FACT_MEMBER_ENROLL_CHOICE_AGG
(
    DL_LOB_ID_CEDL,
    DL_LOB_ID,
    DL_PLAN_SK,
    MEMBER_ID,
    SUBSCRIBER_ID,
    PRODUCT_ID,
    PRODUCT_NAME,
    ENROLLMENT_DATE,
    ENROLL_MONTH_ID,
    ENROLLMENT_FLAG,
    REF_DISENROLLMENT_RSN_SK
) AS
    (SELECT a."DL_LOB_ID_CEDL",
            a."DL_LOB_ID",
            a."DL_PLAN_SK",
            a."MEMBER_ID",
            a."SUBSCRIBER_ID",
            a."PRODUCT_ID",
            a."PRODUCT_NAME",
            a."ENROLLMENT_DATE",
            a."ENROLL_MONTH_ID",
            a."ENROLLMENT_FLAG",
            a.REF_DISENROLLMENT_RSN_SK
     FROM   FACT_MEMBER_ENROLL_LOB_AGG a,
            (SELECT --CASE WHEN b.PROGRAM = 'MA' THEN 1 WHEN b.PROGRAM = 'MLTC' THEN 2 WHEN b.PROGRAM = 'SH' THEN 3 WHEN b.PROGRAM = 'FIDA' THEN 4 ELSE 0 END  DL_LOB_ID,
                   a  .SUBSCRIBER_ID, a.CHOICE_PERS_START_DT, MIN(a.CHOICE_PERS_START_DT) MIN_CHOICE_PERS_START_DT
             FROM     CHOICEBI.FACT_MEMBER_ENROLL_DISENROLL a, MSTRSTG.D_REF_PLAN b
             WHERE    a.DL_PLAN_SK = b.DL_PLAN_SK
             GROUP BY --CASE WHEN b.PROGRAM = 'MA' THEN 1 WHEN b.PROGRAM = 'MLTC' THEN 2 WHEN b.PROGRAM = 'SH' THEN 3 WHEN b.PROGRAM = 'FIDA' THEN 4 ELSE 0 END,
                     a.SUBSCRIBER_ID, a.CHOICE_PERS_START_DT) b
     WHERE --a.DL_LOB_ID = b.DL_LOB_ID and
          a .SUBSCRIBER_ID = b.SUBSCRIBER_ID AND a.ENROLLMENT_DATE = b.CHOICE_PERS_START_DT);


GRANT SELECT ON FACT_MEMBER_ENROLL_CHOICE_AGG TO MSTRSTG;

GRANT SELECT ON FACT_MEMBER_ENROLL_CHOICE_AGG TO ROC_RO;



