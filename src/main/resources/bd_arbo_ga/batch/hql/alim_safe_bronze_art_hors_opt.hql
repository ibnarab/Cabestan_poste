-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_art_hors_opt}
SELECT

    CASE WHEN TRIM(code_type_enregist)      = '' THEN NULL ELSE TRIM(code_type_enregist)   END AS code_type_enregist  ,
    CASE WHEN TRIM(code_art_opt)            = '' THEN NULL ELSE TRIM(code_art_opt)         END AS code_art_opt        ,
    CASE WHEN TRIM(code_art_hors_opt)       = '' THEN NULL ELSE TRIM(code_art_hors_opt)    END AS code_art_hors_opt   ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_42}
;
