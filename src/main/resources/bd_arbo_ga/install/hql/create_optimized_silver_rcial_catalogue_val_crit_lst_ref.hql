USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'                   ,
    code_valeur_crit                                             STRING COMMENT 'Code valeur critère liste de référence'     ,
    code_crit                                                    STRING COMMENT 'Code critère'                               ,
    libelle_crit_reference                                       STRING COMMENT 'Libellé critère liste de référence'         ,
    date_import                                                  STRING COMMENT 'Date de l import'

)

STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_valeur_crit)
disable novalidate
;
