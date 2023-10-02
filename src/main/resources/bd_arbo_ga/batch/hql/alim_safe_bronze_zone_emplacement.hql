-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_zone_emplacement}
SELECT

    CASE WHEN TRIM(record_type)           = '' THEN NULL ELSE TRIM(record_type)                                                                                                           END AS record_type          ,
    CASE WHEN TRIM(loc_zone_code)         = '' THEN NULL ELSE TRIM(loc_zone_code)                                                                                                         END AS loc_zone_code        ,
    CASE WHEN TRIM(loc_zone_label)        = '' THEN NULL ELSE TRIM(loc_zone_label)                                                                                                        END AS loc_zone_label       ,
    CASE WHEN TRIM(loc_zone_start_date)   = '' THEN NULL ELSE CONCAT(substr(loc_zone_start_date, 7, 4), '-', substr(loc_zone_start_date, 4, 2), '-', substr(loc_zone_start_date, 1, 2))   END AS loc_zone_start_date  ,
    CASE WHEN TRIM(loc_zone_end_date)     = '' THEN NULL ELSE CONCAT(substr(loc_zone_end_date,   7, 4), '-', substr(loc_zone_end_date,   4, 2), '-', substr(loc_zone_end_date,   1, 2))   END AS loc_zone_end_date    ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_53}
;
