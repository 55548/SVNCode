DROP TABLE TEMP_ORDERED;

CREATE --GLOBAL TEMPORARY 
TABLE TEMP_ORDERED
(
    MONTH_ID           NUMBER,
    MRN               NUMBER ,
    THE_DATE          DATE,
    ORDERHRS_LV_DAY   NUMBER ,
    AUTH_UNITS_DAY    NUMBER ,
    AUTH_UNITS_DAY_HE NUMBER ,
    CPT_T1019         NUMBER ,
    CPT_S5130         NUMBER ,
    ORDERED_DAY       NUMBER ,
    ORDERED_DAY_HE    NUMBER,
    SOURCE            VARCHAR2(20)         
)
--ON COMMIT PRESERVE ROWS
RESULT_CACHE (MODE DEFAULT)
NOCACHE;
GRANT SELECT ON CHOICEBI.TEMP_ORDERED TO RIPUL_P;
GRANT SELECT ON CHOICEBI.TEMP_ORDERED TO MSTRSTG;
