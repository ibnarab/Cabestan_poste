-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO ${database_safe}.${table_safe_val_crit}
SELECT

    CASE WHEN TRIM(code_type_enregist)    = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                              END AS code_type_enregist    ,
    CASE WHEN TRIM(code_val_crit)         = '' THEN NULL ELSE TRIM(code_val_crit)                                                                                   END AS code_val_crit         ,
    CASE WHEN TRIM(code_val_crit_diff)    = '' THEN NULL ELSE TRIM(code_val_crit_diff)                                                                              END AS code_val_crit_diff    ,
    CAST (valeur_borne_min_crit AS DECIMAL(18, 5))                                                                                                                      AS valeur_borne_min_crit ,
    CAST (valeur_borne_max_crit AS DECIMAL(18, 5))                                                                                                                      AS valeur_borne_max_crit ,
    CASE WHEN TRIM(code_crit)             = '' THEN NULL ELSE TRIM(code_crit)                                                                                       END AS code_crit             ,
    CASE WHEN TRIM(date_deb_val)          = '' THEN NULL ELSE CONCAT(substr(date_deb_val, 7, 4), '-', substr(date_deb_val, 4, 2), '-', substr(date_deb_val, 1, 2))  END AS date_deb_val          ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_26}
;
