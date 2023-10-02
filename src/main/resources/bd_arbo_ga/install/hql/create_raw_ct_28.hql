USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_famille                                             STRING COMMENT 'Code Famille'                                 ,
    libelle_ver_famille                                      STRING COMMENT 'Libellé version famille '                     ,
    code_gamme                                               STRING COMMENT 'Code gamme '                                  ,
    date_deb_ver                                             STRING COMMENT 'Date début version famille  '                 ,
    date_arret_famille                                       STRING COMMENT 'Date arrêt famille  '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ( 'serialization.null.format'='')
;
