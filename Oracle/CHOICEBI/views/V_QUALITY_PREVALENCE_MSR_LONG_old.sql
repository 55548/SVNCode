DROP VIEW CHOICEBI.V_QUALITY_PREVALENCE_MSR_LONG;

CREATE OR REPLACE FORCE VIEW CHOICEBI.V_QUALITY_PREVALENCE_MSR_LONG
AS   (SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'locomotion' AS MSR_TOKEN,
            (CASE
                 WHEN ADLLOCOMOTION IN (0, 1, 2, 3, 4, 5, 6) THEN 1
                 ELSE 0
             END)
                AS DENOMINATOR,
            (CASE WHEN ADLLOCOMOTION IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN ADLLOCOMOTION IN (3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'bathing' AS MSR_TOKEN,
            (CASE WHEN ADLBATHING IN (0, 1, 2, 3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS DENOMINATOR,
            (CASE WHEN ADLBATHING IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN ADLBATHING IN (3, 4, 5, 6) THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'toilettransfer' AS MSR_TOKEN,
            (CASE
                 WHEN ADLTOILETTRANSFER IN (0, 1, 2, 3, 4, 5, 6) THEN 1
                 ELSE 0
             END)
                AS DENOMINATOR,
            (CASE WHEN ADLTOILETTRANSFER IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN ADLTOILETTRANSFER IN (3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'dressupper' AS MSR_TOKEN,
            (CASE
                 WHEN ADLDRESSUPPER IN (0, 1, 2, 3, 4, 5, 6) THEN 1
                 ELSE 0
             END)
                AS DENOMINATOR,
            (CASE WHEN ADLDRESSUPPER IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN ADLDRESSUPPER IN (3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'dresslower' AS MSR_TOKEN,
            (CASE
                 WHEN ADLDRESSLOWER IN (0, 1, 2, 3, 4, 5, 6) THEN 1
                 ELSE 0
             END)
                AS DENOMINATOR,
            (CASE WHEN ADLDRESSLOWER IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN ADLDRESSLOWER IN (3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'toiletuse' AS MSR_TOKEN,
            (CASE
                 WHEN ADLTOILETUSE IN (0, 1, 2, 3, 4, 5, 6) THEN 1
                 ELSE 0
             END)
                AS DENOMINATOR,
            (CASE WHEN ADLTOILETUSE IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN ADLTOILETUSE IN (3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'eating' AS MSR_TOKEN,
            (CASE WHEN ADLEATING IN (0, 1, 2, 3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS DENOMINATOR,
            (CASE WHEN ADLEATING IN (0, 1) THEN 1 ELSE 0 END) AS NUMERATOR,
            (CASE WHEN ADLEATING IN (2, 3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'adlmeds' AS MSR_TOKEN,
            (CASE WHEN IADLPERFORMANCEMEDS IS NOT NULL THEN 1 ELSE 0 END)
                AS DENOMINATOR,
            (CASE WHEN IADLPERFORMANCEMEDS = 0 THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE
                 WHEN IADLPERFORMANCEMEDS IN (1, 2, 3, 4, 5, 6) THEN 1
                 ELSE 0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'urinary' AS MSR_TOKEN,
            (CASE
                 WHEN BLADDERCONTINENCE IN (0, 1, 2, 3, 4, 5) THEN 1
                 ELSE 0
             END)
                AS DENOMINATOR,
            (CASE WHEN BLADDERCONTINENCE IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN BLADDERCONTINENCE IN (3, 4, 5) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'bowel' AS MSR_TOKEN,
            (CASE
                 WHEN BOWELCONTINENCE IN (0, 1, 2, 3, 4, 5) THEN 1
                 ELSE 0
             END)
                AS DENOMINATOR,
            (CASE WHEN BOWELCONTINENCE IN (0, 1, 2) THEN 1 ELSE 0 END)
                AS NUMERATOR,
            (CASE WHEN BOWELCONTINENCE IN (3, 4, 5) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'cognitive' AS MSR_TOKEN,
            (CASE
                 WHEN     COGNITIVESKILLS IS NOT NULL
                      AND MEMORYRECALLSHORT IS NOT NULL
                      AND MEMORYRECALLPROCEDURAL IS NOT NULL
                      AND SELFUNDERSTOOD IS NOT NULL
                      AND ADLEATING IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     COGNITIVESKILLS IS NOT NULL
                      AND MEMORYRECALLSHORT IS NOT NULL
                      AND MEMORYRECALLPROCEDURAL IS NOT NULL
                      AND SELFUNDERSTOOD IS NOT NULL
                      AND ADLEATING IS NOT NULL
                      AND CPS2_SCALE IN (0, 1) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN CPS2_SCALE IN (2, 3, 4, 5, 6) THEN 1 ELSE 0 END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'behavioral' AS MSR_TOKEN,
            (CASE
                 WHEN     BEHAVIORWANDERING IS NOT NULL
                      AND BEHAVIORVERBAL IS NOT NULL
                      AND BEHAVIORPHYSICAL IS NOT NULL
                      AND BEHAVIORDISRUPTIVE IS NOT NULL
                      AND BEHAVIORSEXUAL IS NOT NULL
                      AND BEHAVIORRESISTS IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     BEHAVIORWANDERING = 0
                      AND BEHAVIORVERBAL = 0
                      AND BEHAVIORPHYSICAL = 0
                      AND BEHAVIORDISRUPTIVE = 0
                      AND BEHAVIORSEXUAL = 0
                      AND BEHAVIORRESISTS = 0 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE
                 WHEN    BEHAVIORWANDERING IN (1, 2, 3)
                      OR BEHAVIORVERBAL IN (1, 2, 3)
                      OR BEHAVIORPHYSICAL IN (1, 2, 3)
                      OR BEHAVIORDISRUPTIVE IN (1, 2, 3)
                      OR BEHAVIORSEXUAL IN (1, 2, 3)
                      OR BEHAVIORRESISTS IN (1, 2, 3) THEN
                     1
                 ELSE
                     0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'livingarr' AS MSR_TOKEN,
            (CASE WHEN LIVINGARRANGEMENT IS NOT NULL THEN 1 ELSE 0 END)
                AS DENOMINATOR,
            (CASE WHEN LIVINGARRANGEMENT = 1 THEN 1 ELSE 0 END) AS NUMERATOR,
            (CASE WHEN LIVINGARRANGEMENT = 1 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'anxious' AS MSR_TOKEN,
            (CASE WHEN MOODANXIOUS IN (0, 1, 2, 3) THEN 1 ELSE 0 END)
                AS DENOMINATOR,
            (CASE WHEN MOODANXIOUS IN (0) THEN 1 ELSE 0 END) AS NUMERATOR,
            (CASE WHEN MOODANXIOUS IN (1, 2, 3) THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'depressed' AS MSR_TOKEN,
            (CASE WHEN MOODSAD IN (0, 1, 2, 3) THEN 1 ELSE 0 END)
                AS DENOMINATOR,
            (CASE WHEN MOODSAD IN (0) THEN 1 ELSE 0 END) AS NUMERATOR,
            (CASE WHEN MOODSAD IN (1, 2, 3) THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'dyspnea' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND DYSPNEA IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND DYSPNEA = 0 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN DYSPNEA IN (1, 2, 3) THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'noseverepain' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND PAININTENSITY IS NOT NULL
                      AND PAINFREQUENCY IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN        NVL(B.ASSESSMENTREASON, 0) <> 1
                         AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                         AND PAININTENSITY IN (0, 1, 2)
                      OR (    PAININTENSITY IN (3, 4)
                          AND PAINFREQUENCY IN (0, 1)) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE
                 WHEN     PAININTENSITY IN (3, 4)
                      AND PAINFREQUENCY IN (2, 3) THEN
                     1
                 ELSE
                     0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'paincontrol' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (    PAINFREQUENCY IS NOT NULL
                           AND PAINCONTROL IS NOT NULL) THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (   (    PAINFREQUENCY = 0
                               AND PAINCONTROL IS NOT NULL)
                           OR (    PAINFREQUENCY IN (1, 2, 3)
                               AND PAINCONTROL IN (0, 1, 2))) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN PAINCONTROL IN (3, 4, 5) THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'notlonely' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND LONELY IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (   LONELY = 0
                           OR (    LONELY = 1
                               AND (    NVL(SOCIALCHANGEACTIVITIES, 0) < 1
                                    AND NVL(TIMEALONE, 0) <> 3
                                    AND NVL(LIFESTRESSORS, 0) <> 1
                                    AND NVL(WITHDRAWAL, 0) < 1
                                    AND NVL(MOODSAD, 0) < 1))) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE
                 WHEN     LONELY = 1
                      AND (   SOCIALCHANGEACTIVITIES IN (1, 2)
                           OR TIMEALONE = 3
                           OR LIFESTRESSORS = 1
                           OR WITHDRAWAL IN (1, 2, 3)
                           OR MOODSAD IN (1, 2, 3)) THEN
                     1
                 ELSE
                     0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'fluvax' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXINFLUENZA IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXINFLUENZA = 1 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN TXINFLUENZA = 0 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'pneumovax' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND AGE >= 65
                      AND TXPNEUMOVAX IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND AGE >= 65
                      AND TXPNEUMOVAX = 1 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE
                 WHEN     AGE >= 65
                      AND TXPNEUMOVAX = 0 THEN
                     1
                 ELSE
                     0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'dental' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXDENTAL IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXDENTAL = 1 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN TXDENTAL = 0 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'eye' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXEYE IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXEYE = 1 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN TXEYE = 0 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'hearing' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXHEARING IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXHEARING = 1 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN TXHEARING = 0 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'mammogram' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND GENDER = '2'
                      AND AGE BETWEEN 50 AND 74
                      AND TXMAMMOGRAM IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND GENDER = '2'
                      AND AGE BETWEEN 50 AND 74
                      AND TXMAMMOGRAM = 1 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE
                 WHEN     GENDER = '2'
                      AND AGE BETWEEN 50 AND 74
                      AND TXMAMMOGRAM = 0 THEN
                     1
                 ELSE
                     0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'nofalls' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND FALLSMEDICAL IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND FALLSMEDICAL = 0 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN FALLSMEDICAL IN (1, 2, 3) THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'noER' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7 THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (   TXEMERGENCY = 0
                           OR TXEMERGENCY IS NULL) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN NVL(TXEMERGENCY, 0) > 0 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'falls' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND FALLS IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND FALLS IN (1, 2, 3) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN FALLS IN (1, 2, 3) THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'fracture' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (   MUSCULOSKELETALHIP IS NOT NULL
                           OR MUSCULOSKELETALOTHERFRACTURE IS NOT NULL) THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (   MUSCULOSKELETALHIP IN (1, 2, 3)
                           OR MUSCULOSKELETALOTHERFRACTURE IN (1, 2, 3)) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE
                 WHEN (   MUSCULOSKELETALHIP IN (1, 2, 3)
                       OR MUSCULOSKELETALOTHERFRACTURE IN (1, 2, 3)) THEN
                     1
                 ELSE
                     0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'hosp_er' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (   TXINPATIENT IS NOT NULL
                           OR TXEMERGENCY IS NOT NULL) THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND (   TXINPATIENT > 0
                           OR TXEMERGENCY > 0) THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE
                 WHEN    TXINPATIENT > 0
                      OR TXEMERGENCY > 0 THEN
                     1
                 ELSE
                     0
             END)
                AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'inpatient' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7 THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND TXINPATIENT > 0 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN TXINPATIENT > 0 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1
     UNION
     SELECT A."MEDICAID_NUM",
            A."SUBSCRIBER_ID",
            A."MRN",
            A."CHOICE_CASE_NUM",
            A."LOB_ID",
            A."LINE_OF_BUSINESS",
            A."REFERRAL_DATE",
            A."ENROLLMENT_DATE",
            A."DISENROLLMENT_DATE",
            A."RECORD_ID",
            A."ASSESSMENTDATE",
            A."ASSESSMONTH",
            A."NEXT_DUE",
            A."NEXT_DUE_PERIOD",
            A."ASSESSMENTREASON",
            A."RESIDENCEASSESSMENT",
            A."ONURSEORG",
            A."ONURSEORGNAME",
            A."MEMBER_ID",
            A."DL_LOB_ID",
            A."DL_ENROLL_ID",
            A."DL_ASSESS_SK",
            A."DL_PROV_SK",
            A."PROVIDER_ID",
            A."DL_PLAN_SK",
            A."DL_LOB_GRP_ID",
            A."DL_MEMBER_SK",
            A."QIP_MONTH_ID",
            A."QIP_PERIOD",
            A."QIP_PERIOD_SEQ",
            A."QIP_PERIOD_SEQ_DESC",
            A."QIP_ENROLL_SEQ",
            A."QIP_FLAG",
            A."COMPLIANCE_FLAG",
            A."ENROLL_ASSESS_SEQ",
            A."ENROLL_ASSESS_SEQ_DESC",
            'weightloss' AS MSR_TOKEN,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND WEIGHTLOSS IS NOT NULL THEN
                     1
                 ELSE
                     0
             END)
                AS DENOMINATOR,
            (CASE
                 WHEN     NVL(B.ASSESSMENTREASON, 0) <> 1
                      AND NVL(B.RESIDENCEASSESSMENT, 0) <> 7
                      AND WEIGHTLOSS = 1 THEN
                     1
                 ELSE
                     0
             END)
                AS NUMERATOR,
            (CASE WHEN WEIGHTLOSS = 1 THEN 1 ELSE 0 END) AS RISK
     FROM   MV_QUALITY_MEASURE_ALL_ASSESS A
            JOIN V_QUALITY_PREVALENCE_MSR_DTL B
                ON (A.RECORD_ID = B.RECORD_ID)
     WHERE  A.QIP_FLAG = 1);