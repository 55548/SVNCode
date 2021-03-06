DROP MATERIALIZED VIEW MV_GC_HHA_AUTH_LINES_BY_DAY;
CREATE MATERIALIZED VIEW MV_GC_HHA_AUTH_LINES_BY_DAY
BUILD IMMEDIATE
REFRESH FORCE
START WITH TO_DATE('26-Sep-2018','dd-mon-yyyy')
NEXT TRUNC(SYSDATE) + 1    
WITH PRIMARY KEY
AS 
WITH A AS
         (SELECT /*+ driving_site(a) */
                M.MEMBER_ID,
                 A.UNIQUE_ID AS SUBSCRIBER_ID,
                 A.AUTH_ID,
                 A.ALTERNATE_SERVICE_ID,
                 A.DECISION_ID,
                 A.PHYSICIAN_ID,
                 B.PHYSICIAN_CODE,
                 SUBSTR( B.PHYSICIAN_CODE, 1, 9) AS PROV_ID,
                 A.PROVIDER_NAME,
                 A.AUTH_TYPE_NAME,
                 A.AUTH_STATUS,
                 A.DECISION_STATUS_DESC,
                 A.AUTH_CREATED_ON,
                 A.AUTH_UPDATED_ON,
                 A.AUTH_CREATED_BY_NAME,
                 A.UNIT_TYPE,
                 A.AUTH_CODE_REF_NAME,
                 A.AUTH_CODE_REF_ID,
                 A.SERVICE_DECISION_MODIFIER,
                 A.AUTH_CODE_REF_ID || A.SERVICE_DECISION_MODIFIER AS CPT_CODE,
                 TRUNC(A.SERVICE_FROM_DATE) AS SERVICE_FROM_DATE,
                 TRUNC(A.SERVICE_TO_DATE) AS SERVICE_TO_DATE,
                 TRUNC(A.SERVICE_TO_DATE) - TRUNC(A.SERVICE_FROM_DATE) + 1 AS DAYS_OF_SERVICE,
                 A.CURRENT_REQUESTED,
                 A.HOURS_X_DAYS,
                 ROUND( CASE WHEN (TRUNC(A.SERVICE_TO_DATE) - TRUNC(A.SERVICE_FROM_DATE) + 1) = 0 THEN NULL WHEN C.UB_IND = 1 THEN C.UNIT_HR * (A.CURRENT_REQUESTED * 7) / (TRUNC(A.SERVICE_TO_DATE) - TRUNC(A.SERVICE_FROM_DATE) + 1) END, 4)
                     AS HOURS_PER_WEEK_UBC --Calculated from Universal Billing Criteria (UBC) Only
                                          ,
                 ROUND( CASE WHEN (TRUNC(A.SERVICE_TO_DATE) - TRUNC(A.SERVICE_FROM_DATE) + 1) = 0 THEN NULL ELSE C.UNIT_HR * (A.CURRENT_REQUESTED * 7) / (TRUNC(A.SERVICE_TO_DATE) - TRUNC(A.SERVICE_FROM_DATE) + 1) END, 4)
                     AS HOURS_PER_WEEK_CODES --Calculated from Service Codes - UBC and Non-UBC
                                            ,
                 ROUND( NVL(A.HOURS_X_DAYS, CASE WHEN (TRUNC(A.SERVICE_TO_DATE) - TRUNC(A.SERVICE_FROM_DATE) + 1) = 0 THEN NULL ELSE C.UNIT_HR * (A.CURRENT_REQUESTED * 7) / (TRUNC(A.SERVICE_TO_DATE) - TRUNC(A.SERVICE_FROM_DATE) + 1) END), 4)
                     AS HOURS_PER_WEEK_COMBO --Calculated from Hours_X_Days and Service Codes
                                            ,
                 C.UB_IND,
                 CASE WHEN A.SERVICE_TO_DATE <= '31mar2018' THEN 'NA' WHEN C.UB_IND = 1 THEN 'MET' ELSE 'ERROR' END AS UB_RULE,
                 C.UNIT_HR,
                 C.SERVICE_GROUP_ID,
                 C.SERVICE_GROUP_DESC
          FROM   CHOICEBI.V_AUTH_DATA@NEXUS2 A
                 LEFT JOIN CMGC.PHYSICIAN_DEMOGRAPHY@NEXUS2 B ON (A.PHYSICIAN_ID = B.PHYSICIAN_ID)
                 LEFT JOIN DIM_CPT_CODES C ON (C.SYSTEM = 'PCS' AND A.AUTH_CODE_REF_ID || A.SERVICE_DECISION_MODIFIER = C.PROC_CD_FULL)
                 LEFT JOIN (SELECT SBSB_ID, MEMBER_ID, ROW_NUMBER() OVER (PARTITION BY SBSB_ID ORDER BY DL_UPD_TS DESC) AS SEQ FROM CHOICE.DIM_MEMBER_DETAIL@DLAKE) M
                     ON (A.UNIQUE_ID = M.SBSB_ID AND M.SEQ = 1)
          WHERE  A.UNIQUE_ID LIKE 'V%' AND A.AUTH_CODE_TYPE_ID != 2 AND A.AUTH_STATUS_ID IN (2, 6, 1, 7) AND A.DECISION_STATUS = 3 AND A.AUTH_TYPE_ID IN (29, 47, 67, 74))
SELECT D.DAY_DATE,
       D.CHOICE_WEEK_ID,
       TO_CHAR( D.DAY_DATE, 'yyyymm') AS MONTH_ID,
       A.*
FROM   A A JOIN MSTRSTG.LU_DAY D ON (D.DAY_DATE BETWEEN A.SERVICE_FROM_DATE AND A.SERVICE_TO_DATE)
WHERE  D.DAY_DATE >= '01jan2015';

GRANT SELECT ON MV_GC_HHA_AUTH_LINES_BY_DAY TO LINKADM;

GRANT SELECT ON MV_GC_HHA_AUTH_LINES_BY_DAY TO RCPRD_RO;

GRANT SELECT ON MV_GC_HHA_AUTH_LINES_BY_DAY TO ROC_RO;

GRANT SELECT ON MV_GC_HHA_AUTH_LINES_BY_DAY TO SF_CHOICE;
