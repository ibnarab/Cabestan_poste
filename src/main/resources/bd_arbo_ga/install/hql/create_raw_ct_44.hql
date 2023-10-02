USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                   ,
    code_art                                                 STRING COMMENT 'Code article'                               ,
    code_art_dapo                                            STRING COMMENT 'Code article DAPO'                          ,
    quantite                                                 STRING COMMENT 'Quantité'                                   ,
    code_service_dapo                                        STRING COMMENT 'Code service DAPO'                          ,
    date_deb_rat                                             STRING COMMENT 'Date début de rattachement'                 ,
    date_fin_rat                                             STRING COMMENT 'Date fin de rattachement'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
