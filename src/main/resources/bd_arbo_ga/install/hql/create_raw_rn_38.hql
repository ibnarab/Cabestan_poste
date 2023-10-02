USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'                   ,
    code_valeur_crit                                             STRING COMMENT 'Code valeur critère liste de référence'     ,
    code_crit                                                    STRING COMMENT 'Code critère'                               ,
    libelle_crit_reference                                       STRING COMMENT 'Libellé critère liste de référence'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
