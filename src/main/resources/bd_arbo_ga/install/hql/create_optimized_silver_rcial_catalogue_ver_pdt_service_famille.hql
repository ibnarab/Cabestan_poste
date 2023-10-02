USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_pdt_service                                         STRING COMMENT 'Code Produit/service'                         ,
    date_deb_ver                                             STRING COMMENT 'Date début version Produit/Service'           ,
    code_famille                                             STRING COMMENT 'Code Famille '                                ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_pdt_service,date_deb_ver,code_famille)
disable novalidate
;
