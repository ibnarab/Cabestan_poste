USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'       ,
    code_crit                                                    STRING COMMENT 'Code critère'                   ,
    num_ordre_affich                                             STRING COMMENT 'Numéro ordre d affichage'       ,
    libelle_crit                                                 STRING COMMENT 'Libellé critère'                ,
    libelle_unite_crit                                           STRING COMMENT 'Libellé unité critère'          ,
    libelle_trigramme_crit                                       STRING COMMENT 'Libellé trigramme critère'      ,
    nombre_decimale_crit                                         STRING COMMENT 'Nombre de décimal critère'      ,
    code_type_crit                                               STRING COMMENT 'Code type critère'              ,
    code_nat_crit                                                STRING COMMENT 'Code nature critère'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
