-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_type_imput_comptable}
SELECT

    CASE WHEN TRIM(code_type_enreg)         = '' THEN NULL ELSE TRIM(code_type_enreg)         END AS code_type_enreg         ,
    CASE WHEN TRIM(code_type_imputation)    = '' THEN NULL ELSE TRIM(code_type_imputation)    END AS code_type_imputation    ,
    CASE WHEN TRIM(libelle_type_imputation) = '' THEN NULL ELSE TRIM(libelle_type_imputation) END AS libelle_type_imputation ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_08}
;
