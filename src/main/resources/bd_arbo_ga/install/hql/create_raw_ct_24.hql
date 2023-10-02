USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_remise                                              STRING COMMENT 'Code remise'                                  ,
    date_deb_ver                                             STRING COMMENT 'Date début version remise '                   ,
    code_type_entite                                         STRING COMMENT 'Code type entité'                             ,
    code_entite                                              STRING COMMENT 'Code entité'                                  ,
    code_art                                                 STRING COMMENT 'Code article  '                               ,
    date_deb_rat                                             STRING COMMENT 'Date début rattachement remise '              ,
    date_fin_rat                                             STRING COMMENT 'Date fin rattachement remise '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
