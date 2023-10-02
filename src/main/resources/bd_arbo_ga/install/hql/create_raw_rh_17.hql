USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=17)'                    ,
    pool_type_code                                               STRING COMMENT 'Code Zone Dépôt'                                   ,
    pool_type_label                                              STRING COMMENT 'Libellé Zone Dépôt'                                ,
    pool_type_start_date                                         STRING COMMENT 'Date de début Zone Dépôt (Format: JJ/MM/AAAA)'     ,
    pool_type_end_date                                           STRING COMMENT 'Date de fin Zone Dépôt (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
