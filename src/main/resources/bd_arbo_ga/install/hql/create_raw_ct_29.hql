USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_gamme                                               STRING COMMENT 'Code gamme'                                   ,
    libelle_ver_gamme                                        STRING COMMENT 'Libellé version gamme '                       ,
    code_type_groupe                                         STRING COMMENT 'Code Type Regroupement '                      ,
    date_deb_ver                                             STRING COMMENT 'Date début version gamme  '                   ,
    date_arret_gamme_1                                       STRING COMMENT 'Date arrêt gamme  '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
