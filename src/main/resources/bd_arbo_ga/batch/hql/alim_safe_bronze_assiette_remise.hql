-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_assiette_remise}
SELECT

    CASE WHEN TRIM(code_type_enreg)         = '' THEN NULL ELSE TRIM(code_type_enreg)           END AS code_type_enreg          ,
    CASE WHEN TRIM(code_type_remise)        = '' THEN NULL ELSE TRIM(code_type_remise)          END AS code_type_remise         ,
    CASE WHEN TRIM(code_assiette_remise)    = '' THEN NULL ELSE TRIM(code_assiette_remise)      END AS code_assiette_remise     ,
    CASE WHEN TRIM(libelle_assiette_remise) = '' THEN NULL ELSE TRIM(libelle_assiette_remise)   END AS libelle_assiette_remise  ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_01}
;
