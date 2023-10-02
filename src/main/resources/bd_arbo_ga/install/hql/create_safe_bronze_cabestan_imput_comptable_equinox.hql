USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    record_type                                                  STRING COMMENT 'Code type enregistrement (=50)'                                       ,
    equinox_acc_code                                             STRING COMMENT 'Code imputation comptable EQUINOX'                                    ,
    equinox_acc_label                                            STRING COMMENT 'Libellé imputation comptable EQUINOX'                                 ,
    equinox_acc_type                                             STRING COMMENT 'Code type imputation. comptable EQUINOX'                              ,
    equinox_acc_start_date                                       STRING COMMENT 'Date de début imput. comptable EQUINOX (Format: AAAA-MM-JJ)'          ,
    equinox_acc_end_date                                         STRING COMMENT 'Date de fin imput. comptable EQUINOX (Format: AAAA-MM-JJ)'            ,
    date_import                                                  STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (equinox_acc_code,equinox_acc_type)
disable novalidate
;
