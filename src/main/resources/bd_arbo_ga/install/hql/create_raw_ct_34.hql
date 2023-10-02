USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                  ,
    code_ss_pdt                                              STRING COMMENT 'Code Sous-Produit'                         ,
    libelle_carac_ss_pdt                                     STRING COMMENT 'Libellé caractéristiques Sous-Produit '    ,
    code_pdt_service                                         STRING COMMENT 'Code Produit/service '                     ,
    date_deb_ver                                             STRING COMMENT 'Date début version Sous-Produit  '         ,
    date_fin_tarif_ss_pdt                                    STRING COMMENT 'Date fin tarification Sous-Produit  '      ,
    date_arret_ss_pdt                                        STRING COMMENT 'Date arrêt Sous-Produit  '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
