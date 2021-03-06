DROP TABLE DIM_MA_PREMRISK_ICD_TO_HCC CASCADE CONSTRAINTS;


CREATE TABLE DIM_MA_PREMRISK_ICD_TO_HCC
(
  ICD_CODE        VARCHAR2(8 CHAR),
  DESCRIPTION     VARCHAR2(225 CHAR),
  ESRD_V21        NUMBER,
  AGEDIS_V22      NUMBER,
  AGEDIS_V23      NUMBER,
  AGEDIS_V24      NUMBER,
  RXHCC_V05       NUMBER,
  ESRD_V21_IND    NUMBER,
  AGEDIS_V22_IND  NUMBER,
  AGEDIS_V23_IND  NUMBER,
  AGEDIS_V24_IND  NUMBER,
  RXHCC_V05_IND   NUMBER
);


GRANT SELECT ON DIM_MA_PREMRISK_ICD_TO_HCC TO MSTRSTG;

GRANT SELECT ON DIM_MA_PREMRISK_ICD_TO_HCC TO ROC_RO;

GRANT SELECT ON DIM_MA_PREMRISK_ICD_TO_HCC TO ROC_RO2;

GRANT SELECT ON DIM_MA_PREMRISK_ICD_TO_HCC TO LINKADM;

GRANT SELECT ON DIM_MA_PREMRISK_ICD_TO_HCC TO LINKADM2;