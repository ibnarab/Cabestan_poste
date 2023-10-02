USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'                     ,
    code_type_imputation_equinox                                 STRING COMMENT 'Code type imputation comptable EQUINOX'       ,
    libelle_type_imputation_equinox                              STRING COMMENT 'Libellé type imputation comptable EQUINOX'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
