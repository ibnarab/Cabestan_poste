-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ver_gamme}
SELECT

    CASE WHEN TRIM(code_type_enregist)   = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                                   END AS code_type_enregist   ,
    CASE WHEN TRIM(code_gamme)           = '' THEN NULL ELSE TRIM(code_gamme)                                                                                                           END AS code_gamme           ,
    CASE WHEN TRIM(libelle_ver_gamme)    = '' THEN NULL ELSE TRIM(libelle_ver_gamme)                                                                                                    END AS libelle_ver_gamme    ,
    CASE WHEN TRIM(code_type_groupe)     = '' THEN NULL ELSE TRIM(code_type_groupe)                                                                                                     END AS code_type_groupe     ,
    CASE WHEN TRIM(date_deb_ver)         = '' THEN NULL ELSE CONCAT(substr(date_deb_ver,       7, 4), '-', substr(date_deb_ver,       4, 2), '-', substr(date_deb_ver,       1, 2))     END AS date_deb_ver         ,
    CASE WHEN TRIM(date_arret_gamme_1)   = '' THEN NULL ELSE CONCAT(substr(date_arret_gamme_1, 7, 4), '-', substr(date_arret_gamme_1, 4, 2), '-', substr(date_arret_gamme_1, 1, 2))     END AS date_arret_gamme_1   ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_29}
;
