-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_type_tarif}
SELECT

    CASE WHEN TRIM(code_type_enreg)    = '' THEN NULL ELSE TRIM(code_type_enreg)    END AS code_type_enreg   ,
    CASE WHEN TRIM(code_type_tarif)    = '' THEN NULL ELSE TRIM(code_type_tarif)    END AS code_type_tarif   ,
    CASE WHEN TRIM(libelle_type_tarif) = '' THEN NULL ELSE TRIM(libelle_type_tarif) END AS libelle_type_tarif,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_06}
;
