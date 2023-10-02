USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=39)'                       ,
    discount_group_code                                          STRING COMMENT 'Code Groupe Remise'                                   ,
    discount_group_label                                         STRING COMMENT 'Libellé Groupe Remise'                                ,
    discount_group_start_date                                    STRING COMMENT 'Date de début Groupe Remise (Format: AAAA-MM-JJ)'     ,
    discount_group_end_date                                      STRING COMMENT 'Date de fin Groupe Remise (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (discount_group_code)
disable novalidate
;
