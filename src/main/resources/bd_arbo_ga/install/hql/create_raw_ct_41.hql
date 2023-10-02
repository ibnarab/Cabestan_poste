USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_art_contrat                                         STRING COMMENT 'Code article contrat'                         ,
    code_art_declas                                          STRING COMMENT 'Code article déclassement '                   ,
    date_deb_declas                                          STRING COMMENT 'Date début déclassement '                     ,
    date_fin_declas                                          STRING COMMENT 'Date fin déclassement'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
