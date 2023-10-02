USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                     ,
    code_val_crit                                            STRING COMMENT 'Code Valeur Critère'                          ,
    code_val_crit_diff                                       STRING COMMENT 'Code valeur critère liste de référence '      ,
    valeur_borne_min_crit                                    STRING COMMENT 'Valeur borne min critère '                    ,
    valeur_borne_max_crit                                    STRING COMMENT 'Valeur borne max critère '                    ,
    code_crit                                                STRING COMMENT 'Code critère  '                               ,
    date_deb_val                                             STRING COMMENT 'Date de début valeur critère  '


)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
