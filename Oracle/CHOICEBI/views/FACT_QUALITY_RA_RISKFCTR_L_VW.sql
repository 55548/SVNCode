DROP VIEW FACT_QUALITY_RA_RISKFCTR_L_VW;

CREATE OR REPLACE VIEW FACT_QUALITY_RA_RISKFCTR_L_VW
(
    RECORD_ID,
    RISK_FACTOR,
    RISK_FACTOR_VAL
) AS
    WITH datasource AS (SELECT * FROM FACT_QUALITY_RA_RISKFCTR_VW)
    SELECT record_id, LOWER(risk_fac) AS RISK_FACTOR, factor_val
    FROM   datasource UNPIVOT (factor_val
                      FOR risk_fac
                      IN  (intercept,
                          age_lte54,
                          age_55_64,
                          age_65_74,
                          age_75_84,
                          age_85,
                          age_missing,
                          badldecline,
                          badlh2,
                          badlh3,
                          badlh4,
                          bbathing,
                          bchf,
                          bconditions,
                          bdecsn,
                          bdeprate,
                          bdiabetes,
                          bdyspnea,
                          bendstage,
                          bfalls,
                          bloco,
                          blocomot,
                          boutside,
                          bpain,
                          bsadness,
                          bstroke,
                          bunstand,
                          bunsteadygait,
                          bwalkass,
                          cogntv_2,
                          copd_2,
                          cvd_2,
                          dizzy_2,
                          gender_2,
                          lifestyle_alcohol_cd,
                          med_manag_2,
                          musculoskeletal_hip_cd,
                          musculoskeletal_othr_fract_cd,
                          nfloc_bad,
                          other_cancer_cd,
                          pain_daily_2,
                          pain_intensity_bad,
                          pialzoth,
                          poorhealth_2,
                          psychiatric_anxiety_cd,
                          psychiatric_bipolar_cd,
                          psychiatric_schizophrenia_cd,
                          sad_2,
                          short_of_breath_bad,
                          urinary_cont_bad,
                          adl_bad,
                          balz,
                          behav_disrpt_2,
                          bothdem,
                          bshortterm,
                          cognition_bad,
                          locomotion_bad,
                          managing_meds_bad,
                          mood_bad))