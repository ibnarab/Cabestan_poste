USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'               ,
    code_msg                                                 STRING COMMENT 'Code message'                           ,
    txt_msg                                                  STRING COMMENT 'Texte du message'                       ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit '                     ,
    date_deb_msg                                             STRING COMMENT 'Date début message '                    ,
    date_arret_msg                                           STRING COMMENT 'Date arrêt message '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
