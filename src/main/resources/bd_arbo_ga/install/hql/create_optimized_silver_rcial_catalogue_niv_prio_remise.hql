USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=13)'                                ,
    discount_prior_level_code                                    STRING COMMENT 'Code niveau priorité remise'                                   ,
    discount_prior_level_label                                   STRING COMMENT 'Libellé niveau priorité remise'                                ,
    discount_prior_level_number                                  INT    COMMENT 'Numéro niveau priorité remise'                                 ,
    discount_prior_level_start_date                              STRING COMMENT 'Date de début niveau priorité remise (Format: AAAA-MM-JJ)'     ,
    discount_prior_level_end_date                                STRING COMMENT 'Date de fin niveau priorité remise (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (discount_prior_level_code)
disable novalidate
;
