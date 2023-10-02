USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=49)'                        ,
    filter_type_code                                             STRING COMMENT 'Code type de filtre'                                   ,
    filter_val_code                                              STRING COMMENT 'Code valeur de filtre'                                 ,
    filter_val_label                                             STRING COMMENT 'Libellé valeur de filtre'                              ,
    filter_val_start_date                                        STRING COMMENT 'Date de début valeur de filtre (Format: JJ/MM/AAAA)'   ,
    filter_val_end_date                                          STRING COMMENT 'Date de fin valeur de filtre (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
