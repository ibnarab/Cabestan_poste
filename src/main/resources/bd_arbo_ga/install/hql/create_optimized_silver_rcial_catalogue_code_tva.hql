USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=10) '               ,
    vat_code                                                     STRING COMMENT 'Code TVA'                                      ,
    vat_label                                                    STRING COMMENT 'Libellé du code TVA'                           ,
    accounting_post_code                                         STRING COMMENT 'Code imputation comptable'                     ,
    distance_sell_accounting_code                                STRING COMMENT 'Code imputation comptable vente à distance'    ,
    vat_start_date                                               STRING COMMENT 'Date de début code TVA (Format: AAAA-MM-JJ)'   ,
    vat_end_date                                                 STRING COMMENT 'Date de fin code TVA (Format: AAAA-MM-JJ)'     ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (vat_code)
disable novalidate
;
