
CREATE OR REPLACE VIEW FACT_MEMBER_DISENROLL_DETAIL as (
select
    DL_LOB_ID,
    TO_NUMBER(TO_CHAR(PRODUCT_END_DT, 'YYYYMM'))DISENROLLMENT_MONTH_ID, 
    TO_NUMBER(TO_CHAR(TRUNC(ADD_MONTHS (PRODUCT_END_DT,1),'MM'), 'YYYYMM')) EFFECT_DISENROLL_MONTH_ID,
    MEMBER_ID,
    SUBSCRIBER_ID,
    PRODUCT_ID,
    PRODUCT_END_DT DISENROLLMENT_DATE,
    TO_NUMBER(TO_CHAR(TRUNC(ADD_MONTHS (PRODUCT_END_DT,1),'MM'), 'YYYYMM')) EFFECT_DISENROLL_DATE,
    1 DISENROLLMENT_FLAG
from 
    CHOICEBI.FACT_MEMBER_ENROLL_DISENROLL 
group by
    DL_LOB_ID, 
    TO_NUMBER(TO_CHAR(PRODUCT_END_DT, 'YYYYMM')),
    TO_NUMBER(TO_CHAR(TRUNC(ADD_MONTHS (PRODUCT_END_DT,1),'MM'), 'YYYYMM')),
    MEMBER_ID,
    SUBSCRIBER_ID,
    PRODUCT_ID,
    PRODUCT_END_DT,
    TO_NUMBER(TO_CHAR(TRUNC(ADD_MONTHS (PRODUCT_END_DT,1),'MM'), 'YYYYMM'))
);


CREATE OR REPLACE VIEW FACT_MEMBER_DISENROLL_PROD_AGG as (
select 
a.DL_LOB_ID,
A.DISENROLLMENT_MONTH_ID,
A.EFFECT_DISENROLL_MONTH_ID,
A.MEMBER_ID,
A.SUBSCRIBER_ID,
B.PRODUCT_NAME,
A.DISENROLLMENT_DATE,
A.EFFECT_DISENROLL_DATE,
MIN (DISENROLLMENT_FLAG) DISENROLLMENT_FLAG
from 
    FACT_MEMBER_DISENROLL_DETAIL a,
    MSTRSTG.D_VNS_LOB_PRODUCT_MAPPING b
where
a.PRODUCT_ID = B.PRODUCT_ID
group by
a.DL_LOB_ID,
A.DISENROLLMENT_MONTH_ID,
A.EFFECT_DISENROLL_MONTH_ID,
A.MEMBER_ID,
A.SUBSCRIBER_ID,
B.PRODUCT_NAME,
A.DISENROLLMENT_DATE,
A.EFFECT_DISENROLL_DATE);



CREATE OR REPLACE VIEW FACT_MEMBER_DISENROLL_LOB_AGG as(
select
a.DL_LOB_ID,
TO_NUMBER(TO_CHAR(a.FIVE_LOB_END_DT, 'YYYYMM'))DISENROLLMENT_MONTH_ID, 
TO_NUMBER(TO_CHAR(TRUNC(ADD_MONTHS (a.FIVE_LOB_END_DT,1),'MM'), 'YYYYMM'))EFFECT_DISENROLL_MONTH_ID,
a.MEMBER_ID,
a.SUBSCRIBER_ID,
b.PRODUCT_NAME,
a.FIVE_LOB_END_DT DISENROLLMENT_DATE,
TRUNC(ADD_MONTHS (a.FIVE_LOB_END_DT,1),'MM') EFFECT_DISENROLL_DATE,
1 DISENROLLMENT_FLAG
from CHOICEBI.FACT_MEMBER_ENROLL_DISENROLL a, 
CHOICEBI.FACT_MEMBER_ENROLL_DISENROLL b
where
a.member_id = b.member_id
and a.FIVE_LOB_END_DT = b.ENROLLMENT_END_DT
and a.DL_LOB_ID = b.DL_LOB_ID
group by
a.DL_LOB_ID,
TO_NUMBER(TO_CHAR(a.FIVE_LOB_END_DT, 'YYYYMM')), 
TO_NUMBER(TO_CHAR(TRUNC(ADD_MONTHS (a.FIVE_LOB_END_DT,1),'MM'), 'YYYYMM')),
a.MEMBER_ID,
a.SUBSCRIBER_ID,
b.PRODUCT_NAME,
a.FIVE_LOB_END_DT,
TRUNC(ADD_MONTHS (a.FIVE_LOB_END_DT,1),'MM')
);

grant select on FACT_MEMBER_DISENROLL_DETAIL to mstrstg;
grant select on FACT_MEMBER_DISENROLL_PROD_AGG to mstrstg;

grant select on FACT_MEMBER_DISENROLL_LOB_AGG to mstrstg;

grant select on FACT_MEMBER_DISENRL_CHOICE_AGG to mstrstg;


CREATE OR REPLACE VIEW FACT_MEMBER_DISENRL_CHOICE_AGG as 
(
select
    MIN (DISENROLLMENT_MONTH_ID) DISENROLLMENT_MONTH_ID,
    MIN (EFFECT_DISENROLL_MONTH_ID) EFFECT_DISENROLL_MONTH_ID,
    MEMBER_ID,
    SUBSCRIBER_ID,
    PRODUCT_NAME,
    DISENROLLMENT_DATE,
    EFFECT_DISENROLL_DATE,
    DISENROLLMENT_FLAG
from 
    FACT_MEMBER_DISENROLL_PROD_AGG
group by
    MEMBER_ID,
    SUBSCRIBER_ID,
    PRODUCT_NAME,
    DISENROLLMENT_DATE,
    EFFECT_DISENROLL_DATE,
    DISENROLLMENT_FLAG
);