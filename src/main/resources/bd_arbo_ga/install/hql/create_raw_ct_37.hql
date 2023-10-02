USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                   ,
    code_article                                             STRING COMMENT 'Code article'                               ,
    date_deb_ver                                             STRING COMMENT 'Date début version Tarif'                   ,
    code_zone_depot                                          STRING COMMENT 'Code zone de dépôt '                        ,
    code_type_tarif                                          STRING COMMENT 'Code type tarif'                            ,
    txt_formule                                              STRING COMMENT 'Texte de la formule'                        ,
    nbre_decimale_formule                                    STRING COMMENT 'Nombre de décimale de la formule  '         ,
    mt_pu_fixe                                               STRING COMMENT 'Montant de prix unitaire fixe  '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
