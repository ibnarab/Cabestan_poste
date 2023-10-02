USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=10) '               ,
    vat_code                                                     STRING COMMENT 'Code TVA'                                      ,
    vat_label                                                    STRING COMMENT 'Libellé du code TVA'                           ,
    accounting_post_code                                         STRING COMMENT 'Code imputation comptable'                     ,
    distance_sell_accounting_code                                STRING COMMENT 'Code imputation comptable vente à distance'    ,
    vat_start_date                                               STRING COMMENT 'Date de début code TVA (Format: JJ/MM/AAAA)'   ,
    vat_end_date                                                 STRING COMMENT 'Date de fin code TVA (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
