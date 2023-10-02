USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'           ,
    code_pdt_filiale                                         STRING COMMENT 'Code Produit Filiale'               ,
    code_type_filiale                                        STRING COMMENT 'Code type filiale'                  ,
    date_deb_pdt                                             STRING COMMENT 'Date début Produit Filiale'         ,
    date_arret_pdt                                           STRING COMMENT 'Date début article '                ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_pdt_filiale,code_type_filiale)
disable novalidate
;
