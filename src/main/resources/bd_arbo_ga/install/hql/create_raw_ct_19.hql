USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                                              ,
    code_article                                             STRING COMMENT 'Code article'                                                          ,
    libelle_ss_pdt_val_crit_art                              STRING COMMENT 'Libellé caractéristiques sous-produit + valeurs critères article'      ,
    indicateur_art                                           STRING COMMENT 'Indicateur article livrable '                                          ,
    date_debut_article                                       STRING COMMENT 'Date début article '                                                   ,
    date_fin_tarif                                           STRING COMMENT 'Date fin tarification article '                                        ,
    date_arret_article                                       STRING COMMENT 'Date arrêt article '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
