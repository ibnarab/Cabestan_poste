USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_famille                                             STRING COMMENT 'Code Famille'                                 ,
    libelle_ver_famille                                      STRING COMMENT 'Libellé version famille '                     ,
    code_gamme                                               STRING COMMENT 'Code gamme '                                  ,
    date_deb_ver                                             STRING COMMENT 'Date début version famille  '                 ,
    date_arret_famille                                       STRING COMMENT 'Date arrêt famille  '                         ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_famille,date_deb_ver)
disable novalidate
;
