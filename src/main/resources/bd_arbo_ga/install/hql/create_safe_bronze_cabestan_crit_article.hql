USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'          ,
    code_article                                             STRING COMMENT 'Code article'                      ,
    code_val_crit                                            STRING COMMENT 'Code Valeur Critère'               ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_article,code_val_crit)
disable novalidate
;
