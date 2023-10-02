-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_declassement}
SELECT

    CASE WHEN TRIM(code_type_enregist)  = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                        END AS code_type_enregist  ,
    CASE WHEN TRIM(code_art_contrat)    = '' THEN NULL ELSE TRIM(code_art_contrat)                                                                                          END AS code_art_contrat    ,
    CASE WHEN TRIM(code_art_declas)     = '' THEN NULL ELSE TRIM(code_art_declas)                                                                                           END AS code_art_declas     ,
    CASE WHEN TRIM(date_deb_declas)     = '' THEN NULL ELSE CONCAT(substr(date_deb_declas, 7, 4), '-', substr(date_deb_declas, 4, 2), '-', substr(date_deb_declas, 1, 2))   END AS date_deb_declas     ,
    CASE WHEN TRIM(date_fin_declas)     = '' THEN NULL ELSE CONCAT(substr(date_fin_declas, 7, 4), '-', substr(date_fin_declas, 4, 2), '-', substr(date_fin_declas, 1, 2))   END AS date_fin_declas     ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_41}
;
