USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                   ,
    code_art                                                 STRING COMMENT 'Code article'                               ,
    code_art_dapo                                            STRING COMMENT 'Code article DAPO'                          ,
    quantite                                                 INT    COMMENT 'Quantité'                                   ,
    code_service_dapo                                        STRING COMMENT 'Code service DAPO'                          ,
    date_deb_rat                                             STRING COMMENT 'Date début de rattachement'                 ,
    date_fin_rat                                             STRING COMMENT 'Date fin de rattachement'                   ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_art,date_deb_rat)
disable novalidate
;
