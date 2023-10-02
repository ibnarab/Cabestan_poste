-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_pdt_filiale}
SELECT

    CASE WHEN TRIM(code_type_enregist)   = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                            END AS code_type_enregist  ,
    CASE WHEN TRIM(code_pdt_filiale)     = '' THEN NULL ELSE TRIM(code_pdt_filiale)                                                                                              END AS code_pdt_filiale    ,
    CASE WHEN TRIM(code_type_filiale)    = '' THEN NULL ELSE TRIM(code_type_filiale)                                                                                             END AS code_type_filiale   ,
    CASE WHEN TRIM(date_deb_pdt)         = '' THEN NULL ELSE CONCAT(substr(date_deb_pdt,   7, 4), '-', substr(date_deb_pdt,   4, 2), '-', substr(date_deb_pdt,   1, 2))          END AS date_deb_pdt        ,
    CASE WHEN TRIM(date_arret_pdt)       = '' THEN NULL ELSE CONCAT(substr(date_arret_pdt, 7, 4), '-', substr(date_arret_pdt, 4, 2), '-', substr(date_arret_pdt, 1, 2))          END AS date_arret_pdt      ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_22}
;
