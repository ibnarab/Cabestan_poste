USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'               ,
    code_msg                                                 STRING COMMENT 'Code message'                           ,
    txt_msg                                                  STRING COMMENT 'Texte du message'                       ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit '                     ,
    date_deb_msg                                             STRING COMMENT 'Date début message '                    ,
    date_arret_msg                                           STRING COMMENT 'Date arrêt message '                    ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_msg)
disable novalidate
;
