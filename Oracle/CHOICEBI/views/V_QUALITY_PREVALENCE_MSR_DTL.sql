CREATE OR REPLACE FORCE VIEW V_QUALITY_PREVALENCE_MSR_DTL AS
(
    SELECT A.MEDICAID_NUM, A.SUBSCRIBER_ID, A.MRN
        , A.CHOICE_CASE_NUM CASE_NBR
        , A.LOB_ID
        , A.DL_MEMBER_SK
        , A.MEMBER_ID
        --, a.DL_ENRL_SK
        --, a.DL_PMPM_ENR_SK
        , A.DL_LOB_GRP_ID 
        , A.REFERRAL_DATE
        , A.ENROLLMENT_DATE
        , A.DISENROLLMENT_DATE
/*        , a.record_id, a.assessmentdate */
        , A.ASSESSMONTH
        , A.NEXT_DUE
        , A.ONURSEORG
        , A.ONURSEORGNAME
        , A.ONURSENAME
        , A.QIP_MONTH_ID
        , A.QIP_PERIOD, A.QIP_PERIOD_SEQ, A.QIP_PERIOD_SEQ_DESC
        , A.QIP_ENROLL_SEQ, A.QIP_FLAG, A.COMPLIANCE_FLAG, A.ENROLL_ASSESS_SEQ, A.ENROLL_ASSESS_SEQ_DESC
        , B.* 
    FROM MV_QUALITY_MEASURE_ALL_ASSESS A
    JOIN MV_UAS_DETAILS B ON (A.RECORD_ID=B.RECORD_ID)
    WHERE A.QIP_FLAG=1
);

