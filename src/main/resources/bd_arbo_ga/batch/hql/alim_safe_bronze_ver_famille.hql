-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ver_famille}
SELECT

    CASE WHEN TRIM(code_type_enregist)   = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                                 END AS code_type_enregist   ,
    CASE WHEN TRIM(code_famille)         = '' THEN NULL ELSE TRIM(code_famille)                                                                                                       END AS code_famille         ,
    CASE WHEN TRIM(libelle_ver_famille)  = '' THEN NULL ELSE TRIM(libelle_ver_famille)                                                                                                END AS libelle_ver_famille  ,
    CASE WHEN TRIM(code_gamme)           = '' THEN NULL ELSE TRIM(code_gamme)                                                                                                         END AS code_gamme           ,
    CASE WHEN TRIM(date_deb_ver)         = '' THEN NULL ELSE CONCAT(substr(date_deb_ver,       7, 4), '-', substr(date_deb_ver,       4, 2), '-', substr(date_deb_ver,       1, 2))   END AS date_deb_ver         ,
    CASE WHEN TRIM(date_arret_famille)   = '' THEN NULL ELSE CONCAT(substr(date_arret_famille, 7, 4), '-', substr(date_arret_famille, 4, 2), '-', substr(date_arret_famille, 1, 2))   END AS date_arret_famille   ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_28}
;
