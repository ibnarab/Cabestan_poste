-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_art_offre_presse}
SELECT

    CASE WHEN TRIM(code_type_enregist)                      = '' THEN NULL ELSE TRIM(code_type_enregist)                    END AS code_type_enregist                       ,
    CASE WHEN TRIM(code_art_new_offre_presse)               = '' THEN NULL ELSE TRIM(code_art_new_offre_presse)             END AS code_art_new_offre_presse                ,
    CASE WHEN TRIM(code_art_old_offre_presse)               = '' THEN NULL ELSE TRIM(code_art_old_offre_presse)             END AS code_art_old_offre_presse                ,
    CASE WHEN TRIM(bool_quotidien_faible_ressources_pub)    = '' THEN NULL ELSE TRIM(bool_quotidien_faible_ressources_pub)  END AS bool_quotidien_faible_ressources_pub     ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_43}
;
