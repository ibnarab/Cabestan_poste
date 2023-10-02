-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_crit_article}
SELECT

    CASE WHEN TRIM(code_type_enregist)  = '' THEN NULL ELSE TRIM(code_type_enregist) END AS code_type_enregist  ,
    CASE WHEN TRIM(code_article)        = '' THEN NULL ELSE TRIM(code_article)       END AS code_article        ,
    CASE WHEN TRIM(code_val_crit)       = '' THEN NULL ELSE TRIM(code_val_crit)      END AS code_val_crit       ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_20}
;
