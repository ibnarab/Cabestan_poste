USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_art_contrat                                         STRING COMMENT 'Code article contrat'                         ,
    code_art_declas                                          STRING COMMENT 'Code article déclassement '                   ,
    date_deb_declas                                          STRING COMMENT 'Date début déclassement '                     ,
    date_fin_declas                                          STRING COMMENT 'Date fin déclassement'                        ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_art_contrat,code_art_declas,date_deb_declas)
disable novalidate
;
