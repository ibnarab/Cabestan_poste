USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'          ,
    code_type_entite                                             STRING COMMENT 'Code type entité'                  ,
    libelle_type_entite                                          STRING COMMENT 'Libellé type entité'               ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_type_entite)
disable novalidate
;
