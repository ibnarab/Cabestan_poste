USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'          ,
    code_type_remise                                             STRING COMMENT 'Code type remise'                  ,
    code_unite_remise                                            STRING COMMENT 'Code unité remise'                 ,
    libelle_type_remise                                          STRING COMMENT 'Libellé unité remise'              ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_type_remise,code_unite_remise)
disable novalidate
;
