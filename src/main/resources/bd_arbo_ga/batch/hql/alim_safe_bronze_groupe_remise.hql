-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_groupe_remise}
SELECT

    CASE WHEN TRIM(record_type)                 = '' THEN NULL ELSE TRIM(record_type)                                                                                                                           END AS record_type                  ,
    CASE WHEN TRIM(discount_group_code)         = '' THEN NULL ELSE TRIM(discount_group_code)                                                                                                                   END AS discount_group_code          ,
    CASE WHEN TRIM(discount_group_label)        = '' THEN NULL ELSE TRIM(discount_group_label)                                                                                                                  END AS discount_group_label         ,
    CASE WHEN TRIM(discount_group_start_date)   = '' THEN NULL ELSE CONCAT(substr(discount_group_start_date, 7, 4), '-', substr(discount_group_start_date, 4, 2), '-', substr(discount_group_start_date, 1, 2)) END AS discount_group_start_date    ,
    CASE WHEN TRIM(discount_group_end_date)     = '' THEN NULL ELSE CONCAT(substr(discount_group_end_date,   7, 4), '-', substr(discount_group_end_date,   4, 2), '-', substr(discount_group_end_date,   1, 2)) END AS discount_group_end_date      ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_39}
;
