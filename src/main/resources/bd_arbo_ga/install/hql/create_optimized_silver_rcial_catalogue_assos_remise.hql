USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_remise                                              STRING COMMENT 'Code remise'                                  ,
    date_deb_ver                                             STRING COMMENT 'Date début version remise '                   ,
    code_type_entite                                         STRING COMMENT 'Code type entité'                             ,
    code_entite                                              STRING COMMENT 'Code entité'                                  ,
    code_art                                                 STRING COMMENT 'Code article  '                               ,
    date_deb_rat                                             STRING COMMENT 'Date début rattachement remise '              ,
    date_fin_rat                                             STRING COMMENT 'Date fin rattachement remise '                ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_remise,date_deb_ver,code_type_entite,code_entite,code_art)
disable novalidate
;
