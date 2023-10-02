USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=12)'                                ,
    franking_mode_code                                           STRING COMMENT 'Code mode affranchissement'                                    ,
    franking_mode_label                                          STRING COMMENT 'Libellé mode affranchissement'                                 ,
    franking_mode_abbr                                           STRING COMMENT 'Libellé abrége mode affranchissement'                          ,
    franking_start_date                                          STRING COMMENT 'Date de début mode affranchissement (Format: JJ/MM/AAAA)'      ,
    franking_end_date                                            STRING COMMENT 'Date de fin mode affranchissement (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
