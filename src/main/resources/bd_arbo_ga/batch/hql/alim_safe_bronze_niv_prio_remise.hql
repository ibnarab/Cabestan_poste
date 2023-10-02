-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_niv_prio_remise}
SELECT

    CASE WHEN TRIM(record_type)                     = '' THEN NULL ELSE TRIM(record_type)                                                                                                                                               END AS record_type                      ,
    CASE WHEN TRIM(discount_prior_level_code)       = '' THEN NULL ELSE TRIM(discount_prior_level_code)                                                                                                                                 END AS discount_prior_level_code        ,
    CASE WHEN TRIM(discount_prior_level_label)      = '' THEN NULL ELSE TRIM(discount_prior_level_label)                                                                                                                                END AS discount_prior_level_label       ,
    CAST(discount_prior_level_number AS INT)                                                                                                                                                                                                AS discount_prior_level_number      ,
    CASE WHEN TRIM(discount_prior_level_start_date) = '' THEN NULL ELSE CONCAT(substr(discount_prior_level_start_date, 7, 4), '-', substr(discount_prior_level_start_date, 4, 2), '-', substr(discount_prior_level_start_date, 1, 2))   END AS discount_prior_level_start_date  ,
    CASE WHEN TRIM(discount_prior_level_end_date)   = '' THEN NULL ELSE CONCAT(substr(discount_prior_level_end_date,   7, 4), '-', substr( discount_prior_level_end_date,  4, 2), '-', substr(discount_prior_level_end_date,   1, 2))   END AS discount_prior_level_end_date    ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_13}
;
