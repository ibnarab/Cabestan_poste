USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'           ,
    code_pdt_filiale                                         STRING COMMENT 'Code Produit Filiale'               ,
    code_type_filiale                                        STRING COMMENT 'Code type filiale'                  ,
    date_deb_pdt                                             STRING COMMENT 'Date début Produit Filiale'         ,
    date_arret_pdt                                           STRING COMMENT 'Date début article '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
