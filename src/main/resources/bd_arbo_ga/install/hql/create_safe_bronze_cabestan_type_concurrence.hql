USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=15)'                          ,
    comp_type_code                                               STRING COMMENT 'Code Type Concurrence'                                   ,
    comp_type_label                                              STRING COMMENT 'Libellé Type Concurrence'                                ,
    comp_type_start_date                                         STRING COMMENT 'Date de début Type Concurrence (Format: AAAA-MM-JJ)'     ,
    comp_type_end_date                                           STRING COMMENT 'Date de fin Type Concurrence (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (comp_type_code)
disable novalidate
;
