USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=53)'                            ,
    loc_zone_code                                                STRING COMMENT 'Code Zone Implantation'                                    ,
    loc_zone_label                                               STRING COMMENT 'Libellé Zone Implantation'                                 ,
    loc_zone_start_date                                          STRING COMMENT 'Date de début Zone Implantation (Format: AAAA-MM-JJ)'      ,
    loc_zone_end_date                                            STRING COMMENT 'Date de fin Zone Implantation  (Format: AAAA-MM-JJ)'       ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (loc_zone_code)
disable novalidate
;
