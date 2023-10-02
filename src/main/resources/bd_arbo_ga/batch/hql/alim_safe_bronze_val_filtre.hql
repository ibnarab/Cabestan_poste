-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_val_filtre}
SELECT

    CASE WHEN TRIM(record_type)           = '' THEN NULL ELSE TRIM(record_type)                                                                                                               END AS record_type          ,
    CASE WHEN TRIM(filter_type_code)      = '' THEN NULL ELSE TRIM(filter_type_code)                                                                                                          END AS filter_type_code     ,
    CASE WHEN TRIM(filter_val_code)       = '' THEN NULL ELSE TRIM(filter_val_code)                                                                                                           END AS filter_val_code      ,
    CASE WHEN TRIM(filter_val_label)      = '' THEN NULL ELSE TRIM(filter_val_label)                                                                                                          END AS filter_val_label     ,
    CASE WHEN TRIM(filter_val_start_date) = '' THEN NULL ELSE CONCAT(substr(filter_val_start_date, 7, 4), '-', substr(filter_val_start_date, 4, 2), '-', substr(filter_val_start_date, 1, 2)) END AS filter_val_start_date,
    CASE WHEN TRIM(filter_val_end_date)   = '' THEN NULL ELSE CONCAT(substr(filter_val_end_date,   7, 4), '-', substr(filter_val_end_date,   4, 2), '-', substr(filter_val_end_date,   1, 2)) END AS filter_val_end_date  ,
   '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_49}
;
