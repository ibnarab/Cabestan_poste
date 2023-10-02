USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=13)'                                ,
    discount_prior_level_code                                    STRING COMMENT 'Code niveau priorité remise'                                   ,
    discount_prior_level_label                                   STRING COMMENT 'Libellé niveau priorité remise'                                ,
    discount_prior_level_number                                  STRING COMMENT 'Numéro niveau priorité remise'                                 ,
    discount_prior_level_start_date                              STRING COMMENT 'Date de début niveau priorité remise (Format: JJ/MM/AAAA)'     ,
    discount_prior_level_end_date                                STRING COMMENT 'Date de fin niveau priorité remise (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
