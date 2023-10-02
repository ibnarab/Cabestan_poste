-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_regle_fiscale}
SELECT

    CASE WHEN TRIM(record_type)          = '' THEN NULL ELSE TRIM(record_type)                                                                                                              END AS record_type          ,
    CASE WHEN TRIM(taxe_rule_code)       = '' THEN NULL ELSE TRIM(taxe_rule_code)                                                                                                           END AS taxe_rule_code       ,
    CASE WHEN TRIM(taxe_rule_label)      = '' THEN NULL ELSE TRIM(taxe_rule_label)                                                                                                          END AS taxe_rule_label      ,
    CASE WHEN TRIM(taxe_rule_start_date) = '' THEN NULL ELSE CONCAT(substr(taxe_rule_start_date, 7, 4), '-', substr(taxe_rule_start_date, 4, 2), '-', substr(taxe_rule_start_date, 1, 2))   END AS taxe_rule_start_date ,
    CASE WHEN TRIM(taxe_rule_end_date)   = '' THEN NULL ELSE CONCAT(substr(taxe_rule_end_date,   7, 4), '-', substr(taxe_rule_end_date,   4, 2), '-', substr(taxe_rule_end_date,   1, 2))   END AS taxe_rule_end_date   ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_54}
;
