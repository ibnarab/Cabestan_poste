-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_assos_dapo}
SELECT

    CASE WHEN TRIM(code_type_enregist)  = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                    END AS code_type_enregist  ,
    CASE WHEN TRIM(code_art)            = '' THEN NULL ELSE TRIM(code_art)                                                                                              END AS code_art            ,
    CASE WHEN TRIM(code_art_dapo)       = '' THEN NULL ELSE TRIM(code_art_dapo)                                                                                         END AS code_art_dapo       ,
    CAST(quantite AS INT)                                                                                                                                                   AS quantite            ,
    CASE WHEN TRIM(code_service_dapo)   = '' THEN NULL ELSE TRIM(code_service_dapo)                                                                                     END AS code_service_dapo   ,
    CASE WHEN TRIM(date_deb_rat)        = '' THEN NULL ELSE CONCAT(substr(date_deb_rat, 7, 4), '-', substr(date_deb_rat, 4, 2), '-', substr(date_deb_rat, 1, 2))        END AS date_deb_rat        ,
    CASE WHEN TRIM(date_fin_rat)        = '' THEN NULL ELSE CONCAT(substr(date_fin_rat, 7, 4), '-', substr(date_fin_rat, 4, 2), '-', substr(date_fin_rat, 1, 2))        END AS date_fin_rat        ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_44}
;
