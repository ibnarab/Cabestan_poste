-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ver_service_ss_pdt}
SELECT

    CASE WHEN TRIM(code_type_enregist)  = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                END AS code_type_enregist   ,
    CASE WHEN TRIM(code_ss_pdt)         = '' THEN NULL ELSE TRIM(code_ss_pdt)                                                                                       END AS code_ss_pdt          ,
    CASE WHEN TRIM(code_ss_pdt_service) = '' THEN NULL ELSE TRIM(code_ss_pdt_service)                                                                               END AS code_ss_pdt_service  ,
    CASE WHEN TRIM(date_deb_ver)        = '' THEN NULL ELSE CONCAT(substr(date_deb_ver, 7, 4), '-', substr(date_deb_ver, 4, 2), '-', substr(date_deb_ver, 1, 2))    END AS date_deb_ver         ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_33}
;
