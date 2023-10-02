USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_gamme                                               STRING COMMENT 'Code gamme'                                   ,
    libelle_ver_gamme                                        STRING COMMENT 'Libellé version gamme '                       ,
    code_type_groupe                                         STRING COMMENT 'Code Type Regroupement '                      ,
    date_deb_ver                                             STRING COMMENT 'Date début version gamme  '                   ,
    date_arret_gamme_1                                       STRING COMMENT 'Date arrêt gamme  '                           ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_gamme,date_deb_ver)
disable novalidate
;
