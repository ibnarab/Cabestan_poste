USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=49)'                        ,
    filter_type_code                                             STRING COMMENT 'Code type de filtre'                                   ,
    filter_val_code                                              STRING COMMENT 'Code valeur de filtre'                                 ,
    filter_val_label                                             STRING COMMENT 'Libellé valeur de filtre'                              ,
    filter_val_start_date                                        STRING COMMENT 'Date de début valeur de filtre (Format: AAAA-MM-JJ)'   ,
    filter_val_end_date                                          STRING COMMENT 'Date de fin valeur de filtre (Format: AAAA-MM-JJ)'     ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (filter_type_code,filter_val_code)
disable novalidate
;
