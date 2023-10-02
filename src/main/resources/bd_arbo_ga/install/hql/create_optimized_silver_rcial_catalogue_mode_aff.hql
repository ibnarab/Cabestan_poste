USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=12)'                                ,
    franking_mode_code                                           STRING COMMENT 'Code mode affranchissement'                                    ,
    franking_mode_label                                          STRING COMMENT 'Libellé mode affranchissement'                                 ,
    franking_mode_abbr                                           STRING COMMENT 'Libellé abrége mode affranchissement'                          ,
    franking_start_date                                          STRING COMMENT 'Date de début mode affranchissement (Format: AAAA-MM-JJ)'      ,
    franking_end_date                                            STRING COMMENT 'Date de fin mode affranchissement (Format: AAAA-MM-JJ)'        ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (franking_mode_code)
disable novalidate
;
