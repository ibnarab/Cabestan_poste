USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=40)'                            ,
    down_reason_code                                             STRING COMMENT 'Code Motif Déclassement'                                   ,
    down_reason_label                                            STRING COMMENT 'Libellé Motif Déclassement'                                ,
    down_reason_start_date                                       STRING COMMENT 'Date de début Motif Déclassement (Format: JJ/MM/AAAA)'     ,
    down_reason_end_date                                         STRING COMMENT 'Date de fin Motif Déclassement (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
