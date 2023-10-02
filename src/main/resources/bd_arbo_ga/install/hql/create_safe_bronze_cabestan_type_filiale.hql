USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=16)'                      ,
    subsidary_type_code                                          STRING COMMENT 'Code Type Filiale'                                   ,
    subsidary_type_label                                         STRING COMMENT 'Libellé Type Filiale'                                ,
    subsidary_type_start_date                                    STRING COMMENT 'Date de début Type Filiale (Format: AAAA-MM-JJ)'     ,
    subsidary_type_end_date                                      STRING COMMENT 'Date de fin Type Filiale (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (subsidary_type_code)
disable novalidate
;
