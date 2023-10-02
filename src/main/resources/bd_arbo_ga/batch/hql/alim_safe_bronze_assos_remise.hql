-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_assos_remise}
SELECT

    CASE WHEN TRIM(code_type_enregist)    = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                      END AS code_type_enregist  ,
    CASE WHEN TRIM(code_remise)           = '' THEN NULL ELSE TRIM(code_remise)                                                                                             END AS code_remise         ,
    CASE WHEN TRIM(date_deb_ver)          = '' THEN NULL ELSE CONCAT(substr(date_deb_ver, 7, 4), '-', substr(date_deb_ver, 4, 2), '-', substr(date_deb_ver, 1, 2))          END AS date_deb_ver        ,
    CASE WHEN TRIM(code_type_entite)      = '' THEN NULL ELSE TRIM(code_type_entite)                                                                                        END AS code_type_entite    ,
    CASE WHEN TRIM(code_entite)           = '' THEN NULL ELSE TRIM(code_entite)                                                                                             END AS code_entite         ,
    CASE WHEN TRIM(code_art)              = '' THEN NULL ELSE TRIM(code_art)                                                                                                END AS code_art            ,
    CASE WHEN TRIM(date_deb_rat)          = '' THEN NULL ELSE CONCAT(substr(date_deb_rat, 7, 4), '-', substr(date_deb_rat, 4, 2), '-', substr(date_deb_rat, 1, 2))          END AS date_deb_rat        ,
    CASE WHEN TRIM(date_fin_rat)          = '' THEN NULL ELSE CONCAT(substr(date_fin_rat, 7, 4), '-', substr(date_fin_rat, 4, 2), '-', substr(date_fin_rat, 1, 2))          END AS date_fin_rat        ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_24}
;
