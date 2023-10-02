-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_nat_crit}
SELECT

    CASE WHEN TRIM(code_type_enreg)  = '' THEN NULL ELSE TRIM(code_type_enreg)  END AS code_type_enreg  ,
    CASE WHEN TRIM(code_nat_crit)    = '' THEN NULL ELSE TRIM(code_nat_crit)    END AS code_nat_crit    ,
    CASE WHEN TRIM(libelle_nat_crit) = '' THEN NULL ELSE TRIM(libelle_nat_crit) END AS libelle_nat_crit ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_03}
;
