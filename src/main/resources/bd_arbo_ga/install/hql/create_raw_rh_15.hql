USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=15)'                          ,
    comp_type_code                                               STRING COMMENT 'Code Type Concurrence'                                   ,
    comp_type_label                                              STRING COMMENT 'Libellé Type Concurrence'                                ,
    comp_type_start_date                                         STRING COMMENT 'Date de début Type Concurrence (Format: JJ/MM/AAAA)'     ,
    comp_type_end_date                                           STRING COMMENT 'Date de fin Type Concurrence (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
