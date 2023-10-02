USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=50)'                                       ,
    equinox_acc_code                                             STRING COMMENT 'Code imputation comptable EQUINOX'                                    ,
    equinox_acc_label                                            STRING COMMENT 'Libellé imputation comptable EQUINOX'                                 ,
    equinox_acc_type                                             STRING COMMENT 'Code type imputation. comptable EQUINOX'                              ,
    equinox_acc_start_date                                       STRING COMMENT 'Date de début imput. comptable EQUINOX (Format: JJ/MM/AAAA)'          ,
    equinox_acc_end_date                                         STRING COMMENT 'Date de fin imput. comptable EQUINOX (Format: JJ/MM/AAAA)'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
