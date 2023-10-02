USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=52)'                           ,
    destination_zone_code                                        STRING COMMENT 'Code Zone Destination'                                    ,
    destination_zone_label                                       STRING COMMENT 'Libellé Zone Destination'                                 ,
    destination_zone_start_date                                  STRING COMMENT 'Date de début Zone Destination (Format: AAAA-MM-JJ)'      ,
    destination_zone_end_date                                    STRING COMMENT 'Date de fin Zone Destination (Format: AAAA-MM-JJ)'        ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (destination_zone_code)
disable novalidate
;
