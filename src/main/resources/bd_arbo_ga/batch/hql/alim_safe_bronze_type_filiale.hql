-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_type_filiale}
SELECT

    CASE WHEN TRIM(record_type)               = '' THEN NULL ELSE TRIM(record_type)                                                                                                                             END AS record_type                 ,
    CASE WHEN TRIM(subsidary_type_code)       = '' THEN NULL ELSE TRIM(subsidary_type_code)                                                                                                                     END AS subsidary_type_code         ,
    CASE WHEN TRIM(subsidary_type_label)      = '' THEN NULL ELSE TRIM(subsidary_type_label)                                                                                                                    END AS subsidary_type_label        ,
    CASE WHEN TRIM(subsidary_type_start_date) = '' THEN NULL ELSE CONCAT(substr(subsidary_type_start_date, 7, 4), '-', substr(subsidary_type_start_date, 4, 2), '-', substr(subsidary_type_start_date, 1, 2))   END AS subsidary_type_start_date   ,
    CASE WHEN TRIM(subsidary_type_end_date)   = '' THEN NULL ELSE CONCAT(substr(subsidary_type_end_date,   7, 4), '-', substr(subsidary_type_end_date,   4, 2), '-', substr(subsidary_type_end_date,   1, 2))   END AS subsidary_type_end_date     ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_16}
;
