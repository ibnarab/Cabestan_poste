USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=17)'                    ,
    pool_type_code                                               STRING COMMENT 'Code Zone Dépôt'                                   ,
    pool_type_label                                              STRING COMMENT 'Libellé Zone Dépôt'                                ,
    pool_type_start_date                                         STRING COMMENT 'Date de début Zone Dépôt (Format: AAAA-MM-JJ)'     ,
    pool_type_end_date                                           STRING COMMENT 'Date de fin Zone Dépôt (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (pool_type_code)
disable novalidate
;
