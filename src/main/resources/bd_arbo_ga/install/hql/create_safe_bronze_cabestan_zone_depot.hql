USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=18)'                    ,
    deposit_zone_code                                            STRING COMMENT 'Code Zone Dépôt'                                   ,
    deposit_zone_label                                           STRING COMMENT 'Libellé Zone Dépôt'                                ,
    deposit_zone_start_date                                      STRING COMMENT 'Date de début Zone Dépôt (Format: AAAA-MM-JJ)'     ,
    deposit_zone_end_date                                        STRING COMMENT 'Date de fin Zone Dépôt (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (deposit_zone_code)
disable novalidate
;
