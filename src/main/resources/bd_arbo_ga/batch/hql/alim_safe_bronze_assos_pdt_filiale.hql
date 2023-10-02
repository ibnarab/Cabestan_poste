-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_assos_pdt_filiale}
SELECT

    CASE WHEN TRIM(code_type_enregist)     = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                          END AS code_type_enregist   ,
    CASE WHEN TRIM(code_pdt_filiale)       = '' THEN NULL ELSE TRIM(code_pdt_filiale)                                                                                            END AS code_pdt_filiale     ,
    CASE WHEN TRIM(code_type_filiale)      = '' THEN NULL ELSE TRIM(code_type_filiale)                                                                                           END AS code_type_filiale    ,
    CASE WHEN TRIM(code_ss_pdt)            = '' THEN NULL ELSE TRIM(code_ss_pdt)                                                                                                 END AS code_ss_pdt          ,
    CASE WHEN TRIM(date_deb_rat)           = '' THEN NULL ELSE CONCAT(substr(date_deb_rat,    7, 4), '-', substr(date_deb_rat,   4, 2), '-', substr(date_deb_rat,   1, 2))       END AS date_deb_rat         ,
    CASE WHEN TRIM(date_arret_rat)         = '' THEN NULL ELSE CONCAT(substr(date_arret_rat,  7, 4), '-', substr(date_arret_rat, 4, 2), '-', substr(date_arret_rat, 1, 2))       END AS date_arret_rat       ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_23}
;
