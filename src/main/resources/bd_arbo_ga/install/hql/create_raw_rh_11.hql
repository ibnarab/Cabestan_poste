USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=11)'                                ,
    accounting_post_code                                         STRING COMMENT 'Code imputation comptable (Sur 8 caractères obligatoire)'      ,
    accounting_post_label                                        STRING COMMENT 'Libellé imputation comptable'                                  ,
    accounting_post_type_code                                    STRING COMMENT 'Code type imputation comptable'                                ,
    accounting_start_date                                        STRING COMMENT 'Date de début imputation comptable (Format: JJ/MM/AAAA)'       ,
    accounting_end_date                                          STRING COMMENT 'Date de fin imputation comptable   (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
