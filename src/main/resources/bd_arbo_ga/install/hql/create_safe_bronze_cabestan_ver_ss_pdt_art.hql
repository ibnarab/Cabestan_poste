USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit'                            ,
    date_deb_ver                                             STRING COMMENT 'Date début version Sous-Produit '             ,
    code_article                                             STRING COMMENT 'Code article '                                ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_ss_pdt,date_deb_ver,code_article)
disable novalidate
;
