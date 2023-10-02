USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                              ,
    code_art_new_offre_presse                                STRING COMMENT 'Code article nouveau offre presse'                     ,
    code_art_old_offre_presse                                STRING COMMENT 'Code article ancien offre presse '                     ,
    bool_quotidien_faible_ressources_pub                     STRING COMMENT 'Booléen Quotidien à Faible Ressources Publicitaires'   ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (bool_quotidien_faible_ressources_pub)
disable novalidate
;
