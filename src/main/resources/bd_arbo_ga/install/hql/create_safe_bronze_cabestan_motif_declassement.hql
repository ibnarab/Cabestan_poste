USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=40)'                            ,
    down_reason_code                                             STRING COMMENT 'Code Motif Déclassement'                                   ,
    down_reason_label                                            STRING COMMENT 'Libellé Motif Déclassement'                                ,
    down_reason_start_date                                       STRING COMMENT 'Date de début Motif Déclassement (Format: AAAA-MM-JJ)'     ,
    down_reason_end_date                                         STRING COMMENT 'Date de fin Motif Déclassement (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (down_reason_code)
disable novalidate
;
