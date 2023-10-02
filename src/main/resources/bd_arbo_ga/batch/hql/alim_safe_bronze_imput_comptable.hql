-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_imput_comptable}
SELECT

    CASE WHEN TRIM(record_type)                 = '' THEN NULL ELSE TRIM(record_type)                                                                                                                   END AS record_type               ,
    CASE WHEN TRIM(accounting_post_code)        = '' THEN NULL ELSE TRIM(accounting_post_code)                                                                                                          END AS accounting_post_code      ,
    CASE WHEN TRIM(accounting_post_label)       = '' THEN NULL ELSE TRIM(accounting_post_label)                                                                                                         END AS accounting_post_label     ,
    CASE WHEN TRIM(accounting_post_type_code)   = '' THEN NULL ELSE TRIM(accounting_post_type_code)                                                                                                     END AS accounting_post_type_code ,
    CASE WHEN TRIM(accounting_start_date)       = '' THEN NULL ELSE CONCAT(substr(accounting_start_date, 7, 4), '-', substr(accounting_start_date, 4, 2), '-', substr(accounting_start_date, 1, 2))     END AS accounting_start_date     ,
    CASE WHEN TRIM(accounting_end_date)         = '' THEN NULL ELSE CONCAT(substr(accounting_end_date,   7, 4), '-', substr(accounting_end_date,   4, 2), '-', substr(accounting_end_date,   1, 2))     END AS accounting_end_date       ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_11}
;
