-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_tx_tva}
SELECT

    CASE WHEN TRIM(record_type)         = '' THEN NULL ELSE TRIM(record_type)                                                                                                           END AS record_type          ,
    CAST(vat_rate AS DECIMAL(18, 5))                                                                                                                                                        AS vat_rate             ,
    CASE WHEN TRIM(deposit_zone_code)   = '' THEN NULL ELSE TRIM(deposit_zone_code)                                                                                                     END AS deposit_zone_code    ,
    CASE WHEN TRIM(dest_zone_code)      = '' THEN NULL ELSE TRIM(dest_zone_code)                                                                                                        END AS dest_zone_code       ,
    CASE WHEN TRIM(loc_zone_code)       = '' THEN NULL ELSE TRIM(loc_zone_code)                                                                                                         END AS loc_zone_code        ,
    CASE WHEN TRIM(vat_code)            = '' THEN NULL ELSE TRIM(vat_code)                                                                                                              END AS vat_code             ,
    CASE WHEN TRIM(marketing_type_code) = '' THEN NULL ELSE TRIM(marketing_type_code)                                                                                                   END AS marketing_type_code  ,
    CASE WHEN TRIM(tax_rule)            = '' THEN NULL ELSE TRIM(tax_rule)                                                                                                              END AS tax_rule             ,
    CASE WHEN TRIM(vat_rate_start_date) = '' THEN NULL ELSE CONCAT(substr(vat_rate_start_date, 7, 4), '-', substr(vat_rate_start_date, 4, 2), '-', substr(vat_rate_start_date, 1, 2))   END AS vat_rate_start_date  ,
    CASE WHEN TRIM(vat_rate_end_date)   = '' THEN NULL ELSE CONCAT(substr(vat_rate_end_date,   7, 4), '-', substr(vat_rate_end_date,   4, 2), '-', substr(vat_rate_end_date,   1, 2))   END AS vat_rate_end_date    ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_14}
;
