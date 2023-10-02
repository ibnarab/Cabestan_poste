USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=53)'                            ,
    loc_zone_code                                                STRING COMMENT 'Code Zone Implantation'                                    ,
    loc_zone_label                                               STRING COMMENT 'Libellé Zone Implantation'                                 ,
    loc_zone_start_date                                          STRING COMMENT 'Date de début Zone Implantation (Format: JJ/MM/AAAA)'      ,
    loc_zone_end_date                                            STRING COMMENT 'Date de fin Zone Implantation  (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
