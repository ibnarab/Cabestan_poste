USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                       ,
    code_art                                                 STRING COMMENT 'Code article'                                   ,
    date_deb_ver                                             STRING COMMENT 'Date début version élément de gestion '         ,
    indic_date_tarif_nego                                    STRING COMMENT 'Indicateur de tarif négociable '                ,
    code_imput_comptable                                     STRING COMMENT 'Code imputation comptable '                     ,
    code_imput_comptable_vad                                 STRING COMMENT 'Code imputation comptable vente à distance  '   ,
    code_imput_comptable_equinox                             STRING COMMENT 'Date de début valeur critère  '                 ,
    code_tva                                                 STRING COMMENT 'Code TVA  '                                     ,
    code_type_concurrence                                    STRING COMMENT 'Code Type Concurrence  '                        ,
    code_categorie                                           STRING COMMENT 'Code catégorie  '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
