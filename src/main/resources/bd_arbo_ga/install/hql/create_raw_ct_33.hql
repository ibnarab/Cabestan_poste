USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit'                            ,
    code_ss_pdt_service                                      STRING COMMENT 'Code Sous-Produit Service '                   ,
    date_deb_ver                                             STRING COMMENT 'Date début version Sous-Produit Service '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
