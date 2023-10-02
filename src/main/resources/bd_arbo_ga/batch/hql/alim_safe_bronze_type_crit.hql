-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_type_crit}
SELECT

    CASE WHEN TRIM(code_type_enreg)     = '' THEN NULL ELSE TRIM(code_type_enreg)   END AS code_type_enreg   ,
    CASE WHEN TRIM(code_type_crit)      = '' THEN NULL ELSE TRIM(code_type_crit)    END AS code_type_crit    ,
    CASE WHEN TRIM(libelle_type_crit)   = '' THEN NULL ELSE TRIM(libelle_type_crit) END AS libelle_type_crit ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_04}
;
