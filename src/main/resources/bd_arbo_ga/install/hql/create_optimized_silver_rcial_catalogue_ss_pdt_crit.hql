USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit'                            ,
    code_crit                                                STRING COMMENT 'Code Critère '                                ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_ss_pdt,code_crit)
disable novalidate
;
