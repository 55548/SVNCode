DROP TABLE TEMP_TPPEV;

CREATE --GLOBAL TEMPORARY 
TABLE TEMP_TPPEV
(
    MRN             NUMBER, 
    CASE_NUM        NUMBER,
    SERVICE_DATE    DATE,
    PAY_DATE        DATE,
    PAY_ID_NO       VARCHAR2 (5),
    PAY_TWICE_DAILY NUMBER ,
    PAY_SEQUENCE    NUMBER ,
    PAY_CYCLE_ID    VARCHAR2 (6),
    PAY_PROVIDER_ID VARCHAR2 (9),
    ADJUSTEDHOURS   NUMBER 
)
--ON COMMIT PRESERVE ROWS
RESULT_CACHE (MODE DEFAULT)
NOCACHE;



GRANT SELECT ON CHOICEBI.TEMP_TPPEV TO RIPUL_P;
GRANT SELECT ON CHOICEBI.TEMP_TPPEV TO MSTRSTG;
