USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'             ,
    code_type_imputation                                         STRING COMMENT 'Code type imputation comptable'       ,
    libelle_type_imputation                                      STRING COMMENT 'Libellé type imputation comptable'    ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_type_imputation)
disable novalidate
;
