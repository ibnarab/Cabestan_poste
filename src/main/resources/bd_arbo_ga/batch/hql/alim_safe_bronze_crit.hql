-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_crit}
SELECT

    CASE WHEN TRIM(code_type_enreg)         = '' THEN NULL ELSE TRIM(code_type_enreg)           END AS code_type_enreg        ,
    CASE WHEN TRIM(code_crit)               = '' THEN NULL ELSE TRIM(code_crit)                 END AS code_crit              ,
    CASE WHEN TRIM(num_ordre_affich)        = '' THEN NULL ELSE TRIM(num_ordre_affich)          END AS num_ordre_affich       ,
    CASE WHEN TRIM(libelle_crit)            = '' THEN NULL ELSE TRIM(libelle_crit)              END AS libelle_crit           ,
    CASE WHEN TRIM(libelle_unite_crit)      = '' THEN NULL ELSE TRIM(libelle_unite_crit)        END AS libelle_unite_crit     ,
    CASE WHEN TRIM(libelle_trigramme_crit)  = '' THEN NULL ELSE TRIM(libelle_trigramme_crit)    END AS libelle_trigramme_crit ,
    CASE WHEN TRIM(nombre_decimale_crit)    = '' THEN NULL ELSE TRIM(nombre_decimale_crit)      END AS nombre_decimale_crit   ,
    CASE WHEN TRIM(code_type_crit)          = '' THEN NULL ELSE TRIM(code_type_crit)            END AS code_type_crit         ,
    CASE WHEN TRIM(code_nat_crit)           = '' THEN NULL ELSE TRIM(code_nat_crit)             END AS code_nat_crit          ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_02}
;
