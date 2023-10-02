USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'      ,
    code_art                                                 STRING COMMENT 'Code article'                  ,
    code_type_filtre                                         STRING COMMENT 'Code type de filtre'           ,
    code_valeur_filtre                                       STRING COMMENT 'Code valeur de filtre'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
