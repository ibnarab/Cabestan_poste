-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ver_element_gestion}
SELECT

    CASE WHEN TRIM(code_type_enregist)              = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                               END AS code_type_enregist           ,
    CASE WHEN TRIM(code_art)                        = '' THEN NULL ELSE TRIM(code_art)                                                                                         END AS code_art                     ,
    CASE WHEN TRIM(date_deb_ver)                    = '' THEN NULL ELSE CONCAT(substr(date_deb_ver, 7, 4), '-', substr(date_deb_ver, 4, 2), '-', substr(date_deb_ver, 1, 2))   END AS date_deb_ver                 ,
    CASE WHEN TRIM(indic_date_tarif_nego)           = '' THEN NULL ELSE TRIM(indic_date_tarif_nego)                                                                            END AS indic_date_tarif_nego        ,
    CASE WHEN TRIM(code_imput_comptable)            = '' THEN NULL ELSE TRIM(code_imput_comptable)                                                                             END AS code_imput_comptable         ,
    CASE WHEN TRIM(code_imput_comptable_vad)        = '' THEN NULL ELSE TRIM(code_imput_comptable_vad)                                                                         END AS code_imput_comptable_vad     ,
    CASE WHEN TRIM(code_imput_comptable_equinox)    = '' THEN NULL ELSE TRIM(code_imput_comptable_equinox)                                                                     END AS code_imput_comptable_equinox ,
    CASE WHEN TRIM(code_tva)                        = '' THEN NULL ELSE TRIM(code_tva)                                                                                         END AS code_tva                     ,
    CASE WHEN TRIM(code_type_concurrence)           = '' THEN NULL ELSE TRIM(code_type_concurrence)                                                                            END AS code_type_concurrence        ,
    CASE WHEN TRIM(code_categorie)                  = '' THEN NULL ELSE TRIM(code_categorie)                                                                                   END AS code_categorie               ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_27}
;
