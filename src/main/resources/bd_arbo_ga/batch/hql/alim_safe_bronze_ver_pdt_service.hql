-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ver_pdt_service}
SELECT

    CASE WHEN TRIM(code_type_enregist)       = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                              END AS code_type_enregist       ,
    CASE WHEN TRIM(code_pdt_service)         = '' THEN NULL ELSE TRIM(code_pdt_service)                                                                                                END AS code_pdt_service         ,
    CASE WHEN TRIM(libelle_ver_pdt_service)  = '' THEN NULL ELSE TRIM(libelle_ver_pdt_service)                                                                                         END AS libelle_ver_pdt_service  ,
    CASE WHEN TRIM(indic_service)            = '' THEN NULL ELSE TRIM(indic_service)                                                                                                   END AS indic_service            ,
    CASE WHEN TRIM(indic_pac)                = '' THEN NULL ELSE TRIM(indic_pac)                                                                                                       END AS indic_pac                ,
    CASE WHEN TRIM(date_deb_ver)             = '' THEN NULL ELSE CONCAT(substr(date_deb_ver,   7, 4), '-', substr(date_deb_ver,   4, 2), '-', substr(date_deb_ver,   1, 2))            END AS date_deb_ver             ,
    CASE WHEN TRIM(date_arret_pdt)           = '' THEN NULL ELSE CONCAT(substr(date_arret_pdt, 7, 4), '-', substr(date_arret_pdt, 4, 2), '-', substr(date_arret_pdt, 1, 2))            END AS date_arret_pdt           ,
    CASE WHEN TRIM(date_fin_pilot)           = '' THEN NULL ELSE CONCAT(substr(date_fin_pilot, 7, 4), '-', substr(date_fin_pilot, 4, 2), '-', substr(date_fin_pilot, 1, 2))            END AS date_fin_pilot           ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_30}
;
