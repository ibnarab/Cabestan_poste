USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_pdt_filiale                                         STRING COMMENT 'Code Produit Filiale'                         ,
    code_type_filiale                                        STRING COMMENT 'Code type filiale'                            ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit'                            ,
    date_deb_rat                                             STRING COMMENT 'Date début rattachement Produit Filiale '     ,
    date_arret_rat                                           STRING COMMENT 'Date arrêt rattachement Produit Filiale  '    ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_pdt_filiale,code_type_filiale,date_deb_rat)
disable novalidate
;
