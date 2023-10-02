-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_categorie}
SELECT

    CASE WHEN TRIM(record_type)         = '' THEN NULL ELSE TRIM(record_type)                                                                                                           END AS record_type         ,
    CASE WHEN TRIM(category_code)       = '' THEN NULL ELSE TRIM(category_code)                                                                                                         END AS category_code       ,
    CASE WHEN TRIM(category_label)      = '' THEN NULL ELSE TRIM(category_label)                                                                                                        END AS category_label      ,
    CASE WHEN TRIM(category_start_date) = '' THEN NULL ELSE CONCAT(substr(category_start_date, 7, 4), '-', substr(category_start_date, 4, 2), '-', substr(category_start_date, 1, 2))   END AS category_start_date ,
    CASE WHEN TRIM(category_end_date)   = '' THEN NULL ELSE CONCAT(substr(category_end_date,   7, 4), '-', substr(category_end_date,   4, 2), '-', substr(category_end_date,   1, 2))   END AS category_end_date   ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_09}
;
