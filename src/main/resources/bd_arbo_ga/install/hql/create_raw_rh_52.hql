USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=52)'                           ,
    destination_zone_code                                        STRING COMMENT 'Code Zone Destination'                                    ,
    destination_zone_label                                       STRING COMMENT 'Libellé Zone Destination'                                 ,
    destination_zone_start_date                                  STRING COMMENT 'Date de début Zone Destination (Format: JJ/MM/AAAA)'      ,
    destination_zone_end_date                                    STRING COMMENT 'Date de fin Zone Destination (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
