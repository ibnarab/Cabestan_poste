USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_pdt_filiale                                         STRING COMMENT 'Code Produit Filiale'                         ,
    code_type_filiale                                        STRING COMMENT 'Code type filiale'                            ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit'                            ,
    date_deb_rat                                             STRING COMMENT 'Date début rattachement Produit Filiale '     ,
    date_arret_rat                                           STRING COMMENT 'Date arrêt rattachement Produit Filiale  '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
