USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=09)'                    ,
    category_code                                                STRING COMMENT 'Code catégorie'                                    ,
    category_label                                               STRING COMMENT 'Libellé catégorie'                                 ,
    category_start_date                                          STRING COMMENT 'Date de début catégorie (Format: AAAA-MM-JJ)'      ,
    category_end_date                                            STRING COMMENT 'Date de fin catégorie  (Format:AAAA-MM-JJ)'        ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (category_code)
disable novalidate
;
