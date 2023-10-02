-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_art_val_filtre}
SELECT

    CASE WHEN TRIM(code_type_enregist)      = '' THEN NULL ELSE TRIM(code_type_enregist)  END AS code_type_enregist  ,
    CASE WHEN TRIM(code_art)                = '' THEN NULL ELSE TRIM(code_art)            END AS code_art            ,
    CASE WHEN TRIM(code_type_filtre)        = '' THEN NULL ELSE TRIM(code_type_filtre)    END AS code_type_filtre    ,
    CASE WHEN TRIM(code_valeur_filtre)      = '' THEN NULL ELSE TRIM(code_valeur_filtre)  END AS code_valeur_filtre  ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_51}
;
