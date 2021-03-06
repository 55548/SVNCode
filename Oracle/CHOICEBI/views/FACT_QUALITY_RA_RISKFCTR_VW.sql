DROP VIEW FACT_QUALITY_RA_RISKFCTR_VW;

CREATE OR REPLACE VIEW FACT_QUALITY_RA_RISKFCTR_VW
(
    RECORD_ID,
    INTERCEPT,
    AGE_LTE54,
    AGE_55_64,
    AGE_65_74,
    AGE_75_84,
    AGE_85,
    AGE_MISSING,
    BADLDECLINE,
    BADLH2,
    BADLH3,
    BADLH4,
    BBATHING,
    BCHF,
    BCONDITIONS,
    BDECSN,
    BDEPRATE,
    BDIABETES,
    BDYSPNEA,
    BENDSTAGE,
    BFALLS,
    BLOCO,
    BLOCOMOT,
    BOUTSIDE,
    BPAIN,
    BSADNESS,
    BSTROKE,
    BUNSTAND,
    BUNSTEADYGAIT,
    BWALKASS,
    COGNTV_2,
    COPD_2,
    CVD_2,
    DIZZY_2,
    GENDER_2,
    LIFESTYLE_ALCOHOL_CD,
    MED_MANAG_2,
    MUSCULOSKELETAL_HIP_CD,
    MUSCULOSKELETAL_OTHR_FRACT_CD,
    NFLOC_BAD,
    OTHER_CANCER_CD,
    PAIN_DAILY_2,
    PAIN_INTENSITY_BAD,
    PIALZOTH,
    POORHEALTH_2,
    PSYCHIATRIC_ANXIETY_CD,
    PSYCHIATRIC_BIPOLAR_CD,
    PSYCHIATRIC_SCHIZOPHRENIA_CD,
    SAD_2,
    SHORT_OF_BREATH_BAD,
    URINARY_CONT_BAD,
    ADL_BAD,
    BALZ,
    BEHAV_DISRPT_2,
    BOTHDEM,
    BSHORTTERM,
    COGNITION_BAD,
    LOCOMOTION_BAD,
    MANAGING_MEDS_BAD,
    MOOD_BAD
) AS
    SELECT A.RECORD_ID,
           1 AS INTERCEPT,
           CASE WHEN A.ASSESSMENTDATE IS NOT NULL AND A.DATEOFBIRTH IS NOT NULL AND NVL(B.VALUE, FLOOR((A.ASSESSMENTDATE - A.DATEOFBIRTH) / 365.25)) BETWEEN 0 AND 55 THEN 1 ELSE 0 END AS AGE_LTE54,
           CASE WHEN A.ASSESSMENTDATE IS NOT NULL AND A.DATEOFBIRTH IS NOT NULL AND NVL(B.VALUE, FLOOR((A.ASSESSMENTDATE - A.DATEOFBIRTH) / 365.25)) BETWEEN 55 AND 64 THEN 1 ELSE 0 END AS AGE_55_64,
           CASE WHEN A.ASSESSMENTDATE IS NOT NULL AND A.DATEOFBIRTH IS NOT NULL AND NVL(B.VALUE, FLOOR((A.ASSESSMENTDATE - A.DATEOFBIRTH) / 365.25)) BETWEEN 65 AND 74 THEN 1 ELSE 0 END AS AGE_65_74,
           CASE WHEN A.ASSESSMENTDATE IS NOT NULL AND A.DATEOFBIRTH IS NOT NULL AND NVL(B.VALUE, FLOOR((A.ASSESSMENTDATE - A.DATEOFBIRTH) / 365.25)) BETWEEN 75 AND 84 THEN 1 ELSE 0 END AS AGE_75_84,
           CASE WHEN A.ASSESSMENTDATE IS NOT NULL AND A.DATEOFBIRTH IS NOT NULL AND NVL(B.VALUE, FLOOR((A.ASSESSMENTDATE - A.DATEOFBIRTH) / 365.25)) >= 85 THEN 1 ELSE 0 END AS AGE_85,
           CASE WHEN A.DATEOFBIRTH IS NULL OR A.ASSESSMENTDATE IS NULL THEN 1 ELSE 0 END AS AGE_MISSING,
           CASE WHEN NVL(A.ADLSTATUS, 0) = 2 THEN 1 WHEN NVL(A.ADLSTATUS, 0) IN (0, 1, 8) THEN 0 END AS BADLDECLINE,
           CASE WHEN B1.VALUE BETWEEN 2 AND 6 THEN 1 ELSE 0 END AS BADLH2,
           CASE WHEN B1.VALUE BETWEEN 3 AND 6 THEN 1 ELSE 0 END AS BADLH3,
           CASE WHEN B1.VALUE BETWEEN 4 AND 6 THEN 1 ELSE 0 END AS BADLH4,
           CASE WHEN NVL(A.ADLBATHING, 0) IN (1, 2, 3, 4, 5, 6) THEN 1 WHEN NVL(A.ADLBATHING, 0) IN (0, 8) THEN 0 END AS BBATHING, -- according to email response, everything except 0 and 8 should be counted
           CASE WHEN NVL(A.CARDIACFAILURE, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BCHF,
           CASE WHEN NVL(A.INSTABILITYPATTERNS, 0) = 1 THEN 1 ELSE 0 END AS BCONDITIONS,
           CASE WHEN NVL(A.COGNITIVESKILLS, 0) IN (1, 2, 3, 4, 5) THEN 1 ELSE 0 END AS BDECSN, -- according to email response, count everything except 0
           CASE WHEN NVL(B2.VALUE, 0) BETWEEN 0 AND 2 THEN 0 WHEN NVL(B2.VALUE, 0) >= 3 THEN 1 END AS BDEPRATE,
           CASE WHEN NVL(A.OTHERDIABETES, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BDIABETES,
           CASE WHEN NVL(A.DYSPNEA, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BDYSPNEA,
           CASE WHEN NVL(C.INSTABILITYENDSTAGE, 0) = 1 THEN 1 ELSE 0 END AS BENDSTAGE,
           CASE WHEN NVL(A.FALLS, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BFALLS,
           CASE WHEN NVL(A.ADLLOCOMOTION, 0) IN (2, 3, 4, 5, 6) THEN 1 WHEN NVL(A.ADLLOCOMOTION, 0) IN (0, 1, 8) THEN 0 END AS BLOCO,
           CASE WHEN NVL(A.ADLLOCOMOTION, 0) IN (4, 5, 6) THEN 1 WHEN NVL(A.ADLLOCOMOTION, 0) IN (0, 1, 2, 3, 8) THEN 0 END AS BLOCOMOT,
           CASE WHEN A.DAYSOUTDOORS IN (0, 1) THEN 1 ELSE 0 END AS BOUTSIDE,
           CASE WHEN NVL(A.PAINFREQUENCY, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BPAIN,
           CASE WHEN NVL(A.NEGATIVESTATEMENTS, 0) IN (0, 1) THEN 0 WHEN NVL(A.NEGATIVESTATEMENTS, 0) IN (2, 3) THEN 1 END AS BSADNESS,
           CASE WHEN NVL(A.NEUROLOGICALSTROKE, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BSTROKE,
           CASE WHEN NVL(A.UNDERSTANDOTHERS, 0) IN (1, 2, 3, 4) THEN 1 ELSE 0 END AS BUNSTAND,
           CASE WHEN NVL(A.PROBLEMUNSTEADYGAIT, 0) IN (1, 2, 3, 4) THEN 1 ELSE 0 END AS BUNSTEADYGAIT,
           CASE WHEN NVL(A.LOCOMOTIONINDOORS, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BWALKASS,
           CASE WHEN NVL(A.COGNITIVESKILLS, 0) IN (2, 3, 4, 5) THEN 1 WHEN NVL(A.COGNITIVESKILLS, 0) IN (0, 1) THEN 0 END AS COGNTV_2,
           CASE WHEN NVL(A.CARDIACPULMONARY, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS COPD_2,
           CASE WHEN NVL(A.CARDIACHEARTDISEASE, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS CVD_2,
           CASE WHEN NVL(A.PROBLEMDIZZINESS, 0) IN (1, 2, 3, 4) THEN 1 ELSE 0 END AS DIZZY_2,
           CASE WHEN NVL(D.GENDER, 0) = 1 THEN 1 ELSE 0 END AS GENDER_2, -- 1 is for male and 0 is for female
           CASE WHEN NVL(A.LIFESTYLEALCOHOL, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS LIFESTYLE_ALCOHOL_CD,
           CASE WHEN NVL(A.IADLPERFORMANCEMEDS, 0) IN (0, 1, 8) THEN 0 WHEN NVL(A.IADLPERFORMANCEMEDS, 0) IN (2, 3, 4, 5, 6) THEN 1 END AS MED_MANAG_2,
           CASE WHEN NVL(A.MUSCULOSKELETALHIP, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS MUSCULOSKELETAL_HIP_CD,
           CASE WHEN NVL(A.MUSCULOSKELETALOTHERFRACTURE, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS MUSCULOSKELETAL_OTHR_FRACT_CD,
           CASE WHEN NVL(D.LEVELOFCARESCORE, 0) >= 34 THEN 1 ELSE 0 END AS NFLOC_BAD,
           CASE WHEN NVL(A.OTHERCANCER, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS OTHER_CANCER_CD,
           CASE WHEN NVL(A.PAINFREQUENCY, 0) = 3 THEN 1 ELSE 0 END AS PAIN_DAILY_2, -- used 3 as its the only option for daily pain but feel like 2 should be too since its 1-2 days out of 3
           CASE WHEN NVL(B3.VALUE, 0) >= 3 THEN 1 ELSE 0 END AS PAIN_INTENSITY_BAD,
           CASE WHEN (NVL(A.NEUROLOGICALALZHEIMERS, 0) IN (1, 2, 3) OR NVL(A.NEUROLOGICALDEMENTIA, 0) IN (1, 2, 3)) THEN 1 ELSE 0 END AS PIALZOTH,
           CASE WHEN NVL(A.SELFRATEDHEALTH, 0) = 3 THEN 1 WHEN NVL(A.SELFRATEDHEALTH, 0) IN (0, 1, 2, 8) THEN 0 END AS POORHEALTH_2,
           CASE WHEN NVL(A.PSYCHIATRICANXIETY, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS PSYCHIATRIC_ANXIETY_CD,
           CASE WHEN NVL(A.PSYCHIATRICBIPOLAR, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS PSYCHIATRIC_BIPOLAR_CD,
           CASE WHEN NVL(A.PSYCHIATRICSCHIZOPHRENIA, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS PSYCHIATRIC_SCHIZOPHRENIA_CD,
           CASE WHEN NVL(A.MOODSAD, 0) IN (2, 3) THEN 1 WHEN NVL(A.MOODSAD, 0) IN (0, 1, 8) THEN 0 END AS SAD_2, -- did not include 1 becasue it asking for reported or not
           CASE WHEN NVL(A.DYSPNEA, 0) IN (2, 3) THEN 1 WHEN NVL(A.DYSPNEA, 0) IN (0, 1) THEN 0 END AS SHORT_OF_BREATH_BAD,
           CASE WHEN NVL(A.BLADDERCONTINENCE, 0) IN (0, 1, 2, 3, 4, 8) THEN 0 WHEN NVL(A.BLADDERCONTINENCE, 0) = 5 THEN 1 END AS URINARY_CONT_BAD, -- according to email response, its value 5 against all others
           CASE WHEN (A.ADLLOCOMOTION = 6 AND A.ADLHYGIENE = 6 AND A.ADLBATHING = 6) THEN 1 ELSE 0 END AS ADL_BAD,
           CASE WHEN NVL(A.NEUROLOGICALALZHEIMERS, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BALZ,
           CASE WHEN NVL(A.BEHAVIORDISRUPTIVE, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BEHAV_DISRPT_2,
           CASE WHEN NVL(A.NEUROLOGICALDEMENTIA, 0) IN (1, 2, 3) THEN 1 ELSE 0 END AS BOTHDEM,
           CASE WHEN NVL(A.MEMORYRECALLSHORT, 0) = 1 THEN 1 ELSE 0 END AS BSHORTTERM,
           CASE WHEN NVL(B4.VALUE, 0) >= 5 THEN 1 ELSE 0 END AS COGNITION_BAD,
           CASE WHEN NVL(A.ADLLOCOMOTION, 0) = 6 THEN 1 ELSE 0 END AS LOCOMOTION_BAD,
           CASE WHEN NVL(A.IADLPERFORMANCEMEDS, 0) = 6 THEN 1 ELSE 0 END AS MANAGING_MEDS_BAD,
           CASE
               WHEN NVL(
                        (CASE
                             WHEN (NVL2(A.NEGATIVESTATEMENTS, 0, 1) + NVL2(A.PERSISTENTANGER, 0, 1) + NVL2(A.UNREALFEARS, 0, 1) + NVL2(A.HEALTHCOMPLAINTS, 0, 1) + NVL2(A.ANXIOUSCOMPLAINTS, 0, 1) +
                                  NVL2(
                                  A.SADFACIAL,
                                  0,
                                  1) + NVL2(A.CRYING, 0, 1)) < 3 AND NVL(A.MOODINTEREST, 8) = 8 AND NVL(A.MOODANXIOUS, 8) = 8 AND NVL(A.MOODSAD, 8) = 8 THEN
                                 (CASE
                                      WHEN ((CASE WHEN A.NEGATIVESTATEMENTS = 0 THEN 0 WHEN A.NEGATIVESTATEMENTS IN (1, 2) THEN 1 WHEN A.NEGATIVESTATEMENTS = 3 THEN 2 ELSE 0 END) + (CASE
                                                WHEN A.PERSISTENTANGER = 0 THEN 0
                                                WHEN A.PERSISTENTANGER IN (1, 2) THEN 1
                                                WHEN A.PERSISTENTANGER = 3 THEN 2
                                                ELSE 0
                                            END) + (CASE WHEN A.UNREALFEARS = 0 THEN 0 WHEN A.UNREALFEARS IN (1, 2) THEN 1 WHEN A.UNREALFEARS = 3 THEN 2 ELSE 0 END) + (CASE
                                                WHEN A.HEALTHCOMPLAINTS = 0 THEN 0
                                                WHEN A.HEALTHCOMPLAINTS IN (1, 2) THEN 1
                                                WHEN A.HEALTHCOMPLAINTS = 3 THEN 2
                                                ELSE 0
                                            END) + (CASE WHEN A.ANXIOUSCOMPLAINTS = 0 THEN 0 WHEN A.ANXIOUSCOMPLAINTS IN (1, 2) THEN 1 WHEN A.ANXIOUSCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE
                                                WHEN A.SADFACIAL = 0 THEN 0
                                                WHEN A.SADFACIAL IN (1, 2) THEN 1
                                                WHEN A.SADFACIAL = 3 THEN 2
                                                ELSE 0
                                            END) + (CASE WHEN A.CRYING = 0 THEN 0 WHEN A.CRYING IN (1, 2) THEN 1 WHEN A.CRYING = 3 THEN 2 ELSE 0 END)) > 5 THEN
                                          5
                                      WHEN ((CASE WHEN A.NEGATIVESTATEMENTS = 0 THEN 0 WHEN A.NEGATIVESTATEMENTS IN (1, 2) THEN 1 WHEN A.NEGATIVESTATEMENTS = 3 THEN 2 ELSE 0 END) + (CASE
                                                WHEN A.PERSISTENTANGER = 0 THEN 0
                                                WHEN A.PERSISTENTANGER IN (1, 2) THEN 1
                                                WHEN A.PERSISTENTANGER = 3 THEN 2
                                                ELSE 0
                                            END) + (CASE WHEN A.UNREALFEARS = 0 THEN 0 WHEN A.UNREALFEARS IN (1, 2) THEN 1 WHEN A.UNREALFEARS = 3 THEN 2 ELSE 0 END) + (CASE
                                                WHEN A.HEALTHCOMPLAINTS = 0 THEN 0
                                                WHEN A.HEALTHCOMPLAINTS IN (1, 2) THEN 1
                                                WHEN A.HEALTHCOMPLAINTS = 3 THEN 2
                                                ELSE 0
                                            END) + (CASE WHEN A.ANXIOUSCOMPLAINTS = 0 THEN 0 WHEN A.ANXIOUSCOMPLAINTS IN (1, 2) THEN 1 WHEN A.ANXIOUSCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE
                                                WHEN A.SADFACIAL = 0 THEN 0
                                                WHEN A.SADFACIAL IN (1, 2) THEN 1
                                                WHEN A.SADFACIAL = 3 THEN 2
                                                ELSE 0
                                            END) + (CASE WHEN A.CRYING = 0 THEN 0 WHEN A.CRYING IN (1, 2) THEN 1 WHEN A.CRYING = 3 THEN 2 ELSE 0 END)) BETWEEN 0
                                                                                                                                                           AND 5 THEN
                                          ((CASE WHEN A.NEGATIVESTATEMENTS = 0 THEN 0 WHEN A.NEGATIVESTATEMENTS IN (1, 2) THEN 1 WHEN A.NEGATIVESTATEMENTS = 3 THEN 2 ELSE 0 END) + (CASE
                                               WHEN A.PERSISTENTANGER = 0 THEN 0
                                               WHEN A.PERSISTENTANGER IN (1, 2) THEN 1
                                               WHEN A.PERSISTENTANGER = 3 THEN 2
                                               ELSE 0
                                           END) + (CASE WHEN A.UNREALFEARS = 0 THEN 0 WHEN A.UNREALFEARS IN (1, 2) THEN 1 WHEN A.UNREALFEARS = 3 THEN 2 ELSE 0 END) + (CASE
                                               WHEN A.HEALTHCOMPLAINTS = 0 THEN 0
                                               WHEN A.HEALTHCOMPLAINTS IN (1, 2) THEN 1
                                               WHEN A.HEALTHCOMPLAINTS = 3 THEN 2
                                               ELSE 0
                                           END) + (CASE WHEN A.ANXIOUSCOMPLAINTS = 0 THEN 0 WHEN A.ANXIOUSCOMPLAINTS IN (1, 2) THEN 1 WHEN A.ANXIOUSCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE
                                               WHEN A.SADFACIAL = 0 THEN 0
                                               WHEN A.SADFACIAL IN (1, 2) THEN 1
                                               WHEN A.SADFACIAL = 3 THEN 2
                                               ELSE 0
                                           END) + (CASE WHEN A.CRYING = 0 THEN 0 WHEN A.CRYING IN (1, 2) THEN 1 WHEN A.CRYING = 3 THEN 2 ELSE 0 END))
                                      ELSE
                                          NULL
                                  END)
                             WHEN (NVL2(A.NEGATIVESTATEMENTS, 0, 1) + NVL2(A.PERSISTENTANGER, 0, 1) + NVL2(A.UNREALFEARS, 0, 1) + NVL2(A.HEALTHCOMPLAINTS, 0, 1) + NVL2(A.ANXIOUSCOMPLAINTS, 0, 1) +
                                  NVL2(
                                  A.SADFACIAL,
                                  0,
                                  1) + NVL2(A.CRYING, 0, 1)) >= 3 AND (NVL(A.MOODINTEREST, 8) <> 8 OR NVL(A.MOODANXIOUS, 8) <> 8 OR NVL(A.MOODSAD, 8) <> 8) THEN
                                 (CASE
                                      WHEN ((CASE WHEN A.MOODINTEREST = 0 THEN 0 WHEN A.MOODINTEREST IN (1, 2) THEN 1 WHEN A.MOODINTEREST = 3 THEN 2 WHEN A.MOODINTEREST = 8 THEN 0 ELSE 0 END) + (
                                            CASE
                                                WHEN A.MOODANXIOUS = 0 THEN 0
                                                WHEN A.MOODANXIOUS IN (1, 2) THEN 1
                                                WHEN A.MOODANXIOUS = 3 THEN 2
                                                WHEN A.MOODANXIOUS = 8 THEN 0
                                                ELSE 0
                                            END) + (CASE WHEN A.MOODSAD = 0 THEN 0 WHEN A.MOODSAD IN (1, 2) THEN 1 WHEN A.MOODSAD = 3 THEN 2 WHEN A.MOODSAD = 8 THEN 0 ELSE 0 END)) > 3 THEN
                                          3
                                      ELSE
                                          ((CASE WHEN A.MOODINTEREST = 0 THEN 0 WHEN A.MOODINTEREST IN (1, 2) THEN 1 WHEN A.MOODINTEREST = 3 THEN 2 WHEN A.MOODINTEREST = 8 THEN 0 ELSE 0 END) + (CASE
                                               WHEN A.MOODANXIOUS = 0 THEN 0
                                               WHEN A.MOODANXIOUS IN (1, 2) THEN 1
                                               WHEN A.MOODANXIOUS = 3 THEN 2
                                               WHEN A.MOODANXIOUS = 8 THEN 0
                                               ELSE 0
                                           END) + (CASE WHEN A.MOODSAD = 0 THEN 0 WHEN A.MOODSAD IN (1, 2) THEN 1 WHEN A.MOODSAD = 3 THEN 2 WHEN A.MOODSAD = 8 THEN 0 ELSE 0 END))
                                  END)
                             WHEN (NVL2(A.NEGATIVESTATEMENTS, 0, 1) + NVL2(A.PERSISTENTANGER, 0, 1) + NVL2(A.UNREALFEARS, 0, 1) + NVL2(A.HEALTHCOMPLAINTS, 0, 1) + NVL2(A.ANXIOUSCOMPLAINTS, 0, 1) +
                                  NVL2(
                                  A.SADFACIAL,
                                  0,
                                  1) + NVL2(A.CRYING, 0, 1)) < 3 AND (NVL(A.MOODINTEREST, 8) <> 8 OR NVL(A.MOODANXIOUS, 8) <> 8 OR NVL(A.MOODSAD, 8) <> 8) THEN
                                 GREATEST( (CASE WHEN ((CASE WHEN A.NEGATIVESTATEMENTS = 0 THEN 0 WHEN A.NEGATIVESTATEMENTS IN (1, 2) THEN 1 WHEN A.NEGATIVESTATEMENTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.PERSISTENTANGER = 0 THEN 0 WHEN A.PERSISTENTANGER IN (1, 2) THEN 1 WHEN A.PERSISTENTANGER = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.UNREALFEARS = 0 THEN 0 WHEN A.UNREALFEARS IN (1, 2) THEN 1 WHEN A.UNREALFEARS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.HEALTHCOMPLAINTS = 0 THEN 0 WHEN A.HEALTHCOMPLAINTS IN (1, 2) THEN 1 WHEN A.HEALTHCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.ANXIOUSCOMPLAINTS = 0 THEN 0 WHEN A.ANXIOUSCOMPLAINTS IN (1, 2) THEN 1 WHEN A.ANXIOUSCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.SADFACIAL = 0 THEN 0 WHEN A.SADFACIAL IN (1, 2) THEN 1 WHEN A.SADFACIAL = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.CRYING = 0 THEN 0 WHEN A.CRYING IN (1, 2) THEN 1 WHEN A.CRYING = 3 THEN 2 ELSE 0 END)) > 5 THEN 5 WHEN ((CASE WHEN A.NEGATIVESTATEMENTS = 0 THEN 0 WHEN A.NEGATIVESTATEMENTS IN (1, 2) THEN 1 WHEN A.NEGATIVESTATEMENTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.PERSISTENTANGER = 0 THEN 0 WHEN A.PERSISTENTANGER IN (1, 2) THEN 1 WHEN A.PERSISTENTANGER = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.UNREALFEARS = 0 THEN 0 WHEN A.UNREALFEARS IN (1, 2) THEN 1 WHEN A.UNREALFEARS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.HEALTHCOMPLAINTS = 0 THEN 0 WHEN A.HEALTHCOMPLAINTS IN (1, 2) THEN 1 WHEN A.HEALTHCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.ANXIOUSCOMPLAINTS = 0 THEN 0 WHEN A.ANXIOUSCOMPLAINTS IN (1, 2) THEN 1 WHEN A.ANXIOUSCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.SADFACIAL = 0 THEN 0 WHEN A.SADFACIAL IN (1, 2) THEN 1 WHEN A.SADFACIAL = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.CRYING = 0 THEN 0 WHEN A.CRYING IN (1, 2) THEN 1 WHEN A.CRYING = 3 THEN 2 ELSE 0 END)) BETWEEN 0 AND 5 THEN ((CASE WHEN A.NEGATIVESTATEMENTS = 0 THEN 0 WHEN A.NEGATIVESTATEMENTS IN (1, 2) THEN 1 WHEN A.NEGATIVESTATEMENTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.PERSISTENTANGER = 0 THEN 0 WHEN A.PERSISTENTANGER IN (1, 2) THEN 1 WHEN A.PERSISTENTANGER = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.UNREALFEARS = 0 THEN 0 WHEN A.UNREALFEARS IN (1, 2) THEN 1 WHEN A.UNREALFEARS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.HEALTHCOMPLAINTS = 0 THEN 0 WHEN A.HEALTHCOMPLAINTS IN (1, 2) THEN 1 WHEN A.HEALTHCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.ANXIOUSCOMPLAINTS = 0 THEN 0 WHEN A.ANXIOUSCOMPLAINTS IN (1, 2) THEN 1 WHEN A.ANXIOUSCOMPLAINTS = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.SADFACIAL = 0 THEN 0 WHEN A.SADFACIAL IN (1, 2) THEN 1 WHEN A.SADFACIAL = 3 THEN 2 ELSE 0 END) + (CASE WHEN A.CRYING = 0 THEN 0 WHEN A.CRYING IN (1, 2) THEN 1 WHEN A.CRYING = 3 THEN 2 ELSE 0 END)) ELSE NULL END), (CASE WHEN ((CASE WHEN A.MOODINTEREST = 0 THEN 0 WHEN A.MOODINTEREST IN (1, 2) THEN 1 WHEN A.MOODINTEREST = 3 THEN 2 WHEN A.MOODINTEREST = 8 THEN 0 ELSE 0 END) + (CASE WHEN A.MOODANXIOUS = 0 THEN 0 WHEN A.MOODANXIOUS IN (1, 2) THEN 1 WHEN A.MOODANXIOUS = 3 THEN 2 WHEN A.MOODANXIOUS = 8 THEN 0 ELSE 0 END) + (CASE WHEN A.MOODSAD = 0 THEN 0 WHEN A.MOODSAD IN (1, 2) THEN 1 WHEN A.MOODSAD = 3 THEN 2 WHEN A.MOODSAD = 8 THEN 0 ELSE 0 END)) > 3 THEN 3 ELSE ((CASE WHEN A.MOODINTEREST = 0 THEN 0 WHEN A.MOODINTEREST IN (1, 2) THEN 1 WHEN A.MOODINTEREST = 3 THEN 2 WHEN A.MOODINTEREST = 8 THEN 0 ELSE 0 END) + (CASE WHEN A.MOODANXIOUS = 0 THEN 0 WHEN A.MOODANXIOUS IN (1, 2) THEN 1 WHEN A.MOODANXIOUS = 3 THEN 2 WHEN A.MOODANXIOUS = 8 THEN 0 ELSE 0 END) + (CASE WHEN A.MOODSAD = 0 THEN 0 WHEN A.MOODSAD IN (1, 2) THEN 1 WHEN A.MOODSAD = 3 THEN 2 WHEN A.MOODSAD = 8 THEN 0 ELSE 0 END)) END))
                             ELSE
                                 NULL
                         END),
                        0) >= 4 THEN
                   1
               ELSE
                   0
           END
               AS MOOD_BAD
    FROM   DW_OWNER.UAS_COMMUNITYHEALTH A
           LEFT JOIN DW_OWNER.UAS_SCALE B ON (A.RECORD_ID = B.RECORD_ID AND B.NAME IN ('Age Scale'))
           LEFT JOIN DW_OWNER.UAS_SCALE B1 ON (A.RECORD_ID = B1.RECORD_ID AND B1.NAME IN ('ADL Hierarchy Scale'))
           LEFT JOIN DW_OWNER.UAS_SCALE B2 ON (A.RECORD_ID = B2.RECORD_ID AND B2.NAME IN ('Depression Rating Scale'))
           LEFT JOIN DW_OWNER.UAS_SCALE B3 ON (A.RECORD_ID = B3.RECORD_ID AND B3.NAME IN ('Pain Scale'))
           LEFT JOIN DW_OWNER.UAS_SCALE B4 ON (A.RECORD_ID = B4.RECORD_ID AND B4.NAME IN ('Cognitive Performance Scale 2'))
           LEFT JOIN DW_OWNER.UAS_CHASUPPLEMENT C ON (A.RECORD_ID = C.RECORD_ID)
           LEFT JOIN DW_OWNER.UAS_PAT_ASSESSMENTS D ON (A.RECORD_ID = D.RECORD_ID)
