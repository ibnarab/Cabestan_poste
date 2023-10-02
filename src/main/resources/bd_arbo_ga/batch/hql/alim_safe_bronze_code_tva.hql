-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_code_tva}
SELECT

    CASE WHEN TRIM(record_type)                   = '' THEN NULL ELSE TRIM(record_type)                                                                                             END AS record_type                         ,
    CASE WHEN TRIM(vat_code)                      = '' THEN NULL ELSE TRIM(vat_code)                                                                                                END AS vat_code                            ,
    CASE WHEN TRIM(vat_label)                     = '' THEN NULL ELSE TRIM(vat_label)                                                                                               END AS vat_label                           ,
    CASE WHEN TRIM(accounting_post_code)          = '' THEN NULL ELSE TRIM(accounting_post_code)                                                                                    END AS accounting_post_code                ,
    CASE WHEN TRIM(distance_sell_accounting_code) = '' THEN NULL ELSE TRIM(distance_sell_accounting_code)                                                                           END AS distance_sell_accounting_code       ,
    CASE WHEN TRIM(vat_start_date)                = '' THEN NULL ELSE CONCAT(substr(vat_start_date, 7, 4), '-', substr(vat_start_date, 4, 2), '-', substr(vat_start_date, 1, 2))    END AS vat_start_date                      ,
    CASE WHEN TRIM(vat_end_date)                  = '' THEN NULL ELSE CONCAT(substr(vat_end_date,   7, 4), '-', substr(vat_end_date,   4, 2), '-', substr(vat_end_date,   1, 2))    END AS vat_end_date                        ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_10}
;
