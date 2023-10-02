USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=39)'                       ,
    discount_group_code                                          STRING COMMENT 'Code Groupe Remise'                                   ,
    discount_group_label                                         STRING COMMENT 'Libellé Groupe Remise'                                ,
    discount_group_start_date                                    STRING COMMENT 'Date de début Groupe Remise (Format: JJ/MM/AAAA)'     ,
    discount_group_end_date                                      STRING COMMENT 'Date de fin Groupe Remise (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
