USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                              ,
    code_art_new_offre_presse                                STRING COMMENT 'Code article nouveau offre presse'                     ,
    code_art_old_offre_presse                                STRING COMMENT 'Code article ancien offre presse '                     ,
    bool_quotidien_faible_ressources_pub                     STRING COMMENT 'Booléen Quotidien à Faible Ressources Publicitaires'

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
