USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=11)'                                ,
    accounting_post_code                                         STRING COMMENT 'Code imputation comptable (Sur 8 caractères obligatoire)'      ,
    accounting_post_label                                        STRING COMMENT 'Libellé imputation comptable'                                  ,
    accounting_post_type_code                                    STRING COMMENT 'Code type imputation comptable'                                ,
    accounting_start_date                                        STRING COMMENT 'Date de début imputation comptable (Format: AAAA-MM-JJ)'       ,
    accounting_end_date                                          STRING COMMENT 'Date de fin imputation comptable   (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (accounting_post_code)
disable novalidate
;
