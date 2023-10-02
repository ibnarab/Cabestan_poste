-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_msg}
SELECT

    CASE WHEN TRIM(code_type_enregist)  = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                           END AS code_type_enregist  ,
    CASE WHEN TRIM(code_msg)            = '' THEN NULL ELSE TRIM(code_msg)                                                                                                     END AS code_msg            ,
    CASE WHEN TRIM(txt_msg)             = '' THEN NULL ELSE TRIM(txt_msg)                                                                                                      END AS txt_msg             ,
    CASE WHEN TRIM(code_ss_pdt)         = '' THEN NULL ELSE TRIM(code_ss_pdt)                                                                                                  END AS code_ss_pdt         ,
    CASE WHEN TRIM(date_deb_msg)        = '' THEN NULL ELSE CONCAT(substr(date_deb_msg ,  7, 4), '-', substr(date_deb_msg,   4, 2), '-', substr(date_deb_msg,   1, 2))         END AS date_deb_msg        ,
    CASE WHEN TRIM(date_arret_msg)      = '' THEN NULL ELSE CONCAT(substr(date_arret_msg, 7, 4), '-', substr(date_arret_msg, 4, 2), '-', substr(date_arret_msg, 1, 2))         END AS date_arret_msg      ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_21}
;
