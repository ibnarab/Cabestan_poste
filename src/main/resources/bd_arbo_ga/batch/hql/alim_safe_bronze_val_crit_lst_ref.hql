-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_val_crit_lst_ref}
SELECT

    CASE WHEN TRIM(code_type_enreg)         = '' THEN NULL ELSE TRIM(code_type_enreg)        END AS code_type_enreg        ,
    CASE WHEN TRIM(code_valeur_crit)        = '' THEN NULL ELSE TRIM(code_valeur_crit)       END AS code_valeur_crit       ,
    CASE WHEN TRIM(code_crit)               = '' THEN NULL ELSE TRIM(code_crit)              END AS code_crit              ,
    CASE WHEN TRIM(libelle_crit_reference)  = '' THEN NULL ELSE TRIM(libelle_crit_reference) END AS libelle_crit_reference ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_38}
;
