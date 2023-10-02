-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ss_pdt_crit}
SELECT

    CASE WHEN TRIM(code_type_enregist)    = '' THEN NULL ELSE TRIM(code_type_enregist)  END AS code_type_enregist ,
    CASE WHEN TRIM(code_ss_pdt)           = '' THEN NULL ELSE TRIM(code_ss_pdt)         END AS code_ss_pdt        ,
    CASE WHEN TRIM(code_crit)             = '' THEN NULL ELSE TRIM(code_crit)           END AS code_crit          ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_25}
;
