USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                   STRING COMMENT 'Code type enregistrement (=54)'                     ,
    taxe_rule_code                                                STRING COMMENT 'Code RG Fiscale'                                    ,
    taxe_rule_label                                               STRING COMMENT 'Libellé RG Fiscale'                                 ,
    taxe_rule_start_date                                          STRING COMMENT 'Date de début RG Fiscale (Format: AAAA-MM-JJ)'      ,
    taxe_rule_end_date                                            STRING COMMENT 'Date de fin RG Fiscale (Format: AAAA-MM-JJ)'        ,
    date_import                                                   STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (taxe_rule_code)
disable novalidate
;
