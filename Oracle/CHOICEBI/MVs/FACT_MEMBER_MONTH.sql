DROP MATERIALIZED VIEW CHOICEBI.FACT_MEMBER_MONTH;

CREATE MATERIALIZED VIEW CHOICEBI.FACT_MEMBER_MONTH 
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
WITH PRIMARY KEY
AS 
WITH member_mrn AS
         (SELECT   member_id, MAX(COALESCE(MRN, MRN_TMG, MRN_MF)) AS MRN
          FROM     (SELECT a.*, b.MRN_TMG, c.mrn AS MRN_MF
                    FROM   (SELECT   member_id,
                                     meme_ck,
                                     medicaid_number,
                                     mrn
                            FROM     choice.dim_member_detail@dlake
                            GROUP BY member_id,
                                     meme_ck,
                                     medicaid_number,
                                     mrn) a
                           LEFT JOIN
                           (SELECT meme_ck,
                                   CASE
                                       WHEN (   REGEXP_INSTR(
                                                    TRIM(
                                                        meme_record_no),
                                                    '[^0-9]') > 0
                                             OR TRIM(meme_record_no) IS NULL) THEN
                                           NULL
                                       ELSE
                                           TO_NUMBER(TRIM(meme_record_no))
                                   END
                                       AS mrn_tmg
                            FROM   TMG.CMC_MEME_MEMBER
                            WHERE  TRIM(MEME_RECORD_NO) NOT IN
                                       ('123456789',
                                        '999999999',
                                        '12345',
                                        '123')) b
                               ON (a.meme_ck = b.meme_ck)
                           LEFT JOIN (SELECT   medicaid_num, MAX(MRN) mrn
                                      FROM     DW_OWNER.TPCLN_PATIENT
                                      WHERE    medicaid_num IS NOT NULL
                                      GROUP BY medicaid_num) c
                               ON (c.medicaid_num = a.medicaid_number))
          GROUP BY member_id),
     REF_LOB_GROUP_MAPPING AS
         (SELECT 1 DL_LOB_GRP_ID, 1 DL_LOB_ID FROM DUAL
          UNION ALL
          SELECT 1 DL_LOB_GRP_ID, 5 DL_LOB_ID FROM DUAL
          UNION ALL
          SELECT 2, 2 DL_LOB_ID FROM DUAL
          UNION ALL
          --SELECT 2, 5 DL_LOB_ID FROM DUAL UNION ALL
          SELECT 3, 3 DL_LOB_ID FROM DUAL
          UNION ALL
          SELECT 4, 4 DL_LOB_ID FROM DUAL),
     V_REF_PLAN AS
         (SELECT D.DL_LOB_GRP_ID, E.LOB_GRP_DESC, B.*
          FROM   CHOICE.REF_PLAN@DLAKE B
                 JOIN CHOICE.REF_LOB@DLAKE C ON (C.DL_LOB_ID = B.DL_LOB_ID)
                 JOIN REF_LOB_GROUP_MAPPING D ON (C.DL_LOB_ID = D.DL_LOB_ID)
                 JOIN mstrstg.D_LOB_GROUP E
                     ON (E.DL_LOB_GRP_ID = D.DL_LOB_GRP_ID))
SELECT /*+ driving_site(a)  cardinality(A 400000) cardinality(b 60000000) cardinality(c 60000000)   cardinality(d 60000000)  cardinality(e 60000000) cardinality(f 60000000) no_merge */
      'CHOICEDM' DATA_SOURCE,
       NVL(c.MRN, member_mrn.mrn) MRN,
       REPORTING_MONTH MONTH_ID,
       PLAN_PACKAGE PROGRAM,
       E.BOROUGH,
       COUNTY_CODE,
       --NULL TEAM,
       CARE_MANAGER_ID STAFF_ID,
       MEDICAID_NUMBER MEDICAID_NUM,
       HICN MEDICARE_NUM,
       SUBSCRIBER_ID,
       C.BENEFIT_REGION,
       ASSESSMENTDATE UAS_DATE,
       LEVELOFCARESCORE UAS_NFLOC_SCORE,
       DISENROLL_RSN_CODE DC_REASON,
       DISENROLL_RSN_DESC DISENROLL_DISP,
       1 FLAG,
       CASE_NBR,
       STATE STATE_CODE,
       TO_DATE(TO_CHAR(ORIG_ENROLLMENT_START_MONTH)||
               '01',
               'YYYYMMDD')
           ENROLLMENT_DATE,
         ADD_MONTHS(TO_DATE(TO_CHAR(LATEST_ENROLLMENT_END_MONTH), 'YYYYMM'),
                    1)
       - 1
           DISENROLLMENT_DATE,
       NEW_ENR_IND ENROLLED_FLAG,
       NEW_DISENR_IND DISENROLLED_FLAG,
       LOB_GRP_DESC LINE_OF_BUSINESS,
       PROVIDER_ID,
       PCP_NAME PROVIDER_NAME,
       REPORTING_MONTH MONTH,
       SSN,
       D.LAST_NAME,
       D.FIRST_NAME,
       DOB DATE_OF_BIRTH,
       ROUND(MONTHS_BETWEEN(SYSDATE, DOB) / 12, 1) AGE,
       SEX_CODE SEX,
       COUNTY,
       TO_CHAR(CASE_NBR) HIGHEST_CASE_NUMBER,
       A.dl_LOB_ID LOB_ID,
       A.DL_ASSESS_SK UAS_RECORD_ID,
       I.REFERRAL_DATE,
       NVL(MANDATORY_ENROLLMENT, 'N') MANDATORY_ENROLLMENT,
       --NVL(C.MANDATORY_ENROLLMENT, 'N') mandatory_enrollment,
       -- DISENROLLMENT_MONTH,
       c.DISENROLL_RSN_DESC,
       b.product_id,
       PRODUCT_NAME,
       b.PLAN_ID,
       PLAN_DESC,
       REGION_NAME, 
       DESCRIPTION_1 REGION_NAME2, 
       A.DL_MEMBER_SK,
       D.MEMBER_ID,
       A.DL_PMPM_ENR_SK,
       A.DL_ENROLL_ID,
       A.DL_ENRL_SK,
       A.DL_LOB_ID,
       A.DL_PLAN_SK,
       A.DL_PROV_SK,
       A.CM_SK_ID,
       A.DL_ASSESS_SK,
       DL_LOB_GRP_ID,
       DL_MEMBER_ADDRESS_SK, 
       cnty.DL_COUNTY_SK,
       A.DL_JOB_RUN_ID,
       A.DL_CRT_TS,
       A.DL_UPD_TS
FROM   CHOICE.FCT_PMPM_ENROLLMENT_CURR@DLAKE A
       LEFT JOIN V_REF_PLAN B ON (A.DL_PLAN_SK = B.DL_PLAN_SK)
       LEFT JOIN CHOICE.DIM_MEMBER_ENROLLMENT@DLAKE C
           ON (A.DL_ENRL_SK = C.DL_ENRL_SK)
       LEFT JOIN CHOICE.DIM_MEMBER@DLAKE D
           ON (A.DL_MEMBER_SK = D.DL_MEMBER_SK)
       LEFT JOIN CHOICE.DIM_MEMBER_ADDRESS@DLAKE E
           ON (E.DL_MBR_ADDR_SK = A.DL_MEMBER_ADDRESS_SK)
       LEFT JOIN CHOICE.DIM_MEMBER_ASSESSMENTS@DLAKE F
           ON (F.DL_ASSESS_SK = A.DL_ASSESS_SK)
       LEFT JOIN CHOICE.DIM_MEMBER_PRIMARY_PROVIDER@DLAKE G
           ON (G.DL_PROV_SK = A.DL_PROV_SK)
       LEFT JOIN CHOICE.DIM_MEMBER_CARE_MANAGER@DLAKE H
           ON (H.CM_SK_ID = A.CM_SK_ID)
       LEFT JOIN member_mrn ON (member_mrn.member_id = D.member_id)
       LEFT JOIN choice.REF_COUNTY@dlake cnty on (COUNTY_CODE = FIPS_CODE)
       LEFT JOIN
       (SELECT DL_ENRL_SK,
               DL_ENROLL_ID,
               NVL(MIN(referral_date) OVER (PARTITION BY DL_ENROLL_ID),
                   orig_enrollment_start_dt)
                   AS referral_date  --keep the earliest referral date for the
        --                                                                                                                                consecutive enrollment, if null then populate
        --                                                                                                                                with orig enrollment date
        FROM   CHOICE.DIM_MEMBER_ENROLLMENT@DLAKE
        WHERE  dl_lob_id IN (2, 4, 5)) I      --For MLTC, FIDA, and Total only
           ON (I.DL_ENRL_SK = A.DL_ENRL_SK)
WHERE  AS_OF_MONTH_DT =
           (SELECT /*+ driving_site(a)  cardinality(A 400000) no_merge */
                  MAX(AS_OF_MONTH_DT)
            FROM   CHOICE.FCT_PMPM_ENROLLMENT_CURR@DLAKE);

COMMENT ON MATERIALIZED VIEW CHOICEBI.FACT_MEMBER_MONTH IS 'snapshot table for snapshot CHOICEBI.FACT_MEMBER_MONTH';

GRANT SELECT ON CHOICEBI.FACT_MEMBER_MONTH TO LINKADM;

GRANT SELECT ON CHOICEBI.FACT_MEMBER_MONTH TO MSTRSTG;

GRANT SELECT ON CHOICEBI.FACT_MEMBER_MONTH TO ROC_RO;