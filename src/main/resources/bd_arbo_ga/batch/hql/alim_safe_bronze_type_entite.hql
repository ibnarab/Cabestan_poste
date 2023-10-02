-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_type_entite}
SELECT

    CASE WHEN TRIM(code_type_enreg)        = '' THEN NULL ELSE TRIM(code_type_enreg)     END AS code_type_enreg      ,
    CASE WHEN TRIM(code_type_entite)       = '' THEN NULL ELSE TRIM(code_type_entite)    END AS code_type_entite    ,
    CASE WHEN TRIM(libelle_type_entite)    = '' THEN NULL ELSE TRIM(libelle_type_entite) END AS libelle_type_entite ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_05}
;
