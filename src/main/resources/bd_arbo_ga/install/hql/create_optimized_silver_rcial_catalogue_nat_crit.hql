USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'          ,
    code_nat_crit                                                STRING COMMENT 'Code nature critère'               ,
    libelle_nat_crit                                             STRING COMMENT 'Libellé nature critère'            ,
    date_import                                                  STRING COMMENT 'Date de l import'

)

STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_nat_crit)
disable novalidate
;
