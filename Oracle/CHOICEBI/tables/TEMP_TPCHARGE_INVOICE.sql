DROP TABLE TEMP_TPCHARGE_INVOICE;

CREATE --GLOBAL TEMPORARY  
TABLE TEMP_TPCHARGE_INVOICE
(
SERVICE_DATE DATE,
PAY_DATE     DATE,
CHG_BORO     VARCHAR2 (1),
CASE_NUM     NUMBER (15),
MRN          NUMBER ,
SUM_HOURS    NUMBER 
)
--ON COMMIT PRESERVE ROWS
RESULT_CACHE (MODE DEFAULT)
NOCACHE;


GRANT SELECT ON CHOICEBI.TEMP_TPCHARGE_INVOICE TO MSTRSTG;
GRANT SELECT ON CHOICEBI.TEMP_TPCHARGE_INVOICE TO RIPUL_P;