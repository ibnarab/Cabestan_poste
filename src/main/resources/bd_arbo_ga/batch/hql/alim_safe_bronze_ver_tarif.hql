-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ver_tarif}
SELECT
    CASE WHEN TRIM(code_type_enregist)  = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                END AS code_type_enregist   ,
    CASE WHEN TRIM(code_article)        = '' THEN NULL ELSE TRIM(code_article)                                                                                      END AS code_article         ,
    CASE WHEN TRIM(date_deb_ver)        = '' THEN NULL ELSE CONCAT(substr(date_deb_ver, 7, 4), '-', substr(date_deb_ver, 4, 2), '-', substr(date_deb_ver, 1, 2))    END AS date_deb_ver         ,
    CASE WHEN TRIM(code_zone_depot)     = '' THEN NULL ELSE TRIM(code_zone_depot)                                                                                   END AS code_zone_depot      ,
    CASE WHEN TRIM(code_type_tarif)     = '' THEN NULL ELSE TRIM(code_type_tarif)                                                                                   END AS code_type_tarif      ,
    CASE WHEN TRIM(txt_formule)         = '' THEN NULL ELSE TRIM(txt_formule)                                                                                       END AS txt_formule          ,
    CAST(nbre_decimale_formule AS INT)                                                                                                                                  AS nbre_decimale_formule,
    CAST(mt_pu_fixe AS DECIMAL(18, 5))                                                                                                                                  AS mt_pu_fixe           ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_37}
;
