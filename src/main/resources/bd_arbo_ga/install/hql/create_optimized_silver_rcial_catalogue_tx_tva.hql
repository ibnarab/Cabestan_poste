USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING         COMMENT 'Code type enregistrement (=14)'                    ,
    vat_rate                                                     DECIMAL(18, 5) COMMENT 'Taux TVA'                                          ,
    deposit_zone_code                                            STRING         COMMENT 'Code Zone Dépôt'                                   ,
    dest_zone_code                                               STRING         COMMENT 'Code Zone Destination'                             ,
    loc_zone_code                                                STRING         COMMENT 'Code Zone Implantation'                            ,
    vat_code                                                     STRING         COMMENT 'Code TVA'                                          ,
    marketing_type_code                                          STRING         COMMENT 'Code type marketing'                               ,
    tax_rule                                                     STRING         COMMENT 'Code RG Fiscale'                                   ,
    vat_rate_start_date                                          STRING         COMMENT 'Date de début Taux TVA (Format: AAAA-MM-JJ)'       ,
    vat_rate_end_date                                            STRING         COMMENT 'Date de fin Taux TVA (Format: AAAA-MM-JJ)'         ,
    date_import                                                  STRING         COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (deposit_zone_code,dest_zone_code,loc_zone_code,vat_code,marketing_type_code)
disable novalidate
;
