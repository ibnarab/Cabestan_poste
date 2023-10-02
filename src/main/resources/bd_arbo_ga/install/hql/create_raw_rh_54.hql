USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                   STRING COMMENT 'Code type enregistrement (=54)'                     ,
    taxe_rule_code                                                STRING COMMENT 'Code RG Fiscale'                                    ,
    taxe_rule_label                                               STRING COMMENT 'Libellé RG Fiscale'                                 ,
    taxe_rule_start_date                                          STRING COMMENT 'Date de début RG Fiscale (Format: JJ/MM/AAAA)'      ,
    taxe_rule_end_date                                            STRING COMMENT 'Date de fin RG Fiscale (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
