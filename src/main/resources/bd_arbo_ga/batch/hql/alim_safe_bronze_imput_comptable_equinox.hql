-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_imput_comptable_equinox}
SELECT

    CASE WHEN TRIM(record_type)             = '' THEN NULL ELSE TRIM(record_type)                                                                                                                   END AS record_type              ,
    CASE WHEN TRIM(equinox_acc_code)        = '' THEN NULL ELSE TRIM(equinox_acc_code)                                                                                                              END AS equinox_acc_code         ,
    CASE WHEN TRIM(equinox_acc_label)       = '' THEN NULL ELSE TRIM(equinox_acc_label)                                                                                                             END AS equinox_acc_label        ,
    CASE WHEN TRIM(equinox_acc_type)        = '' THEN NULL ELSE TRIM(equinox_acc_type)                                                                                                              END AS equinox_acc_type         ,
    CASE WHEN TRIM(equinox_acc_start_date)  = '' THEN NULL ELSE CONCAT(substr(equinox_acc_start_date, 7, 4), '-', substr(equinox_acc_start_date, 4, 2), '-', substr(equinox_acc_start_date, 1, 2))  END AS equinox_acc_start_date   ,
    CASE WHEN TRIM(equinox_acc_end_date)    = '' THEN NULL ELSE CONCAT(substr(equinox_acc_end_date,   7, 4), '-', substr(equinox_acc_end_date,   4, 2), '-', substr(equinox_acc_end_date,   1, 2))  END AS equinox_acc_end_date     ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_50}
;
