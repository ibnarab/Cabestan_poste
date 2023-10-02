USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'      ,
    code_art                                                 STRING COMMENT 'Code article'                  ,
    code_type_filtre                                         STRING COMMENT 'Code type de filtre'           ,
    code_valeur_filtre                                       STRING COMMENT 'Code valeur de filtre'         ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_art,code_type_filtre,code_valeur_filtre)
disable novalidate
;
