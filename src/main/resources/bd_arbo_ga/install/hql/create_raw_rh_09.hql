USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=09)'                    ,
    category_code                                                STRING COMMENT 'Code catégorie'                                    ,
    category_label                                               STRING COMMENT 'Libellé catégorie'                                 ,
    category_start_date                                          STRING COMMENT 'Date de début catégorie (Format: JJ/MM/AAAA)'      ,
    category_end_date                                            STRING COMMENT 'Date de fin catégorie  (Format:JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
