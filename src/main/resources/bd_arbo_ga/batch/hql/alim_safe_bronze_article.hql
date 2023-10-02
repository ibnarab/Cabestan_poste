-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_article}
SELECT

    CASE WHEN TRIM(code_type_enregist)            = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                                               END AS code_type_enregist            ,
    CASE WHEN TRIM(code_article)                  = '' THEN NULL ELSE TRIM(code_article)                                                                                                                     END AS code_article                  ,
    CASE WHEN TRIM(libelle_ss_pdt_val_crit_art)   = '' THEN NULL ELSE TRIM(libelle_ss_pdt_val_crit_art)                                                                                                      END AS libelle_ss_pdt_val_crit_art   ,
    CASE WHEN TRIM(indicateur_art)                = '' THEN NULL ELSE TRIM(indicateur_art)                                                                                                                   END AS indicateur_art                ,
    CASE WHEN TRIM(date_debut_article)            = '' THEN NULL ELSE CONCAT(substr(date_debut_article, 7, 4), '-', substr(date_debut_article, 4, 2), '-', substr(date_debut_article, 1, 2))                 END AS date_debut_article            ,
    CASE WHEN TRIM(date_fin_tarif)                = '' THEN NULL ELSE CONCAT(substr(date_fin_tarif,     7, 4), '-', substr(date_fin_tarif,     4, 2), '-', substr(date_fin_tarif,     1, 2))                 END AS date_fin_tarif                ,
    CASE WHEN TRIM(date_arret_article)            = '' THEN NULL ELSE CONCAT(substr(date_arret_article, 7, 4), '-', substr(date_arret_article, 4, 2), '-', substr(date_arret_article, 1, 2))                 END AS date_arret_article            ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_19}
;
