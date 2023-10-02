-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_mode_aff}
SELECT

    CASE WHEN TRIM(record_type)         = '' THEN NULL ELSE TRIM(record_type)                                                                                                           END AS record_type           ,
    CASE WHEN TRIM(franking_mode_code)  = '' THEN NULL ELSE TRIM(franking_mode_code)                                                                                                    END AS franking_mode_code    ,
    CASE WHEN TRIM(franking_mode_label) = '' THEN NULL ELSE TRIM(franking_mode_label)                                                                                                   END AS franking_mode_label   ,
    CASE WHEN TRIM(franking_mode_abbr)  = '' THEN NULL ELSE TRIM(franking_mode_abbr)                                                                                                    END AS franking_mode_abbr    ,
    CASE WHEN TRIM(franking_start_date) = '' THEN NULL ELSE CONCAT(substr(franking_start_date, 7, 4), '-', substr(franking_start_date, 4, 2), '-', substr(franking_start_date, 1, 2))   END AS franking_start_date   ,
    CASE WHEN TRIM(franking_end_date)   = '' THEN NULL ELSE CONCAT(substr(franking_end_date,   7, 4), '-', substr(franking_end_date,   4, 2), '-', substr(franking_end_date,   1, 2))   END AS franking_end_date     ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_12}
;
