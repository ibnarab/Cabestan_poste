USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=14)'                    ,
    vat_rate                                                     STRING COMMENT 'Taux TVA'                                          ,
    deposit_zone_code                                            STRING COMMENT 'Code Zone Dépôt'                                   ,
    dest_zone_code                                               STRING COMMENT 'Code Zone Destination'                             ,
    loc_zone_code                                                STRING COMMENT 'Code Zone Implantation'                            ,
    vat_code                                                     STRING COMMENT 'Code TVA'                                          ,
    marketing_type_code                                          STRING COMMENT 'Code type marketing'                               ,
    tax_rule                                                     STRING COMMENT 'Code RG Fiscale'                                   ,
    vat_rate_start_date                                          STRING COMMENT 'Date de début Taux TVA (Format: JJ/MM/AAAA)'       ,
    vat_rate_end_date                                            STRING COMMENT 'Date de fin Taux TVA (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
