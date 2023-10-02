USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'       ,
    code_type_remise                                             STRING COMMENT 'Code type remise'               ,
    code_assiette_remise                                         STRING COMMENT 'Code assiette remise'           ,
    libelle_assiette_remise                                      STRING COMMENT 'Libellé assiette remise'        ,
    date_import                                                  STRING COMMENT 'Date de l import'

)

STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_type_enreg,code_type_remise)
disable novalidate
;
