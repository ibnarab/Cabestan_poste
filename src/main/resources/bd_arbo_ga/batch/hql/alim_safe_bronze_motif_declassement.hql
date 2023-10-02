-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_motif_declassement}
SELECT

    CASE WHEN TRIM(record_type)             = '' THEN NULL ELSE TRIM(record_type)                                                                                                                   END AS record_type             ,
    CASE WHEN TRIM(down_reason_code)        = '' THEN NULL ELSE TRIM(down_reason_code)                                                                                                              END AS down_reason_code        ,
    CASE WHEN TRIM(down_reason_label)       = '' THEN NULL ELSE TRIM(down_reason_label)                                                                                                             END AS down_reason_label       ,
    CASE WHEN TRIM(down_reason_start_date)  = '' THEN NULL ELSE CONCAT(substr(down_reason_start_date, 7, 4), '-', substr(down_reason_start_date, 4, 2), '-', substr(down_reason_start_date, 1, 2))  END AS down_reason_start_date  ,
    CASE WHEN TRIM(down_reason_end_date)    = '' THEN NULL ELSE CONCAT(substr(down_reason_end_date,   7, 4), '-', substr(down_reason_end_date,   4, 2), '-', substr(down_reason_end_date,   1, 2))  END AS down_reason_end_date    ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_40}
;
