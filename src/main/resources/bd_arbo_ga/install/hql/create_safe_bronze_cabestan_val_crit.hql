USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING         COMMENT 'Code type enregistrement'                     ,
    code_val_crit                                            STRING         COMMENT 'Code Valeur Critère'                          ,
    code_val_crit_diff                                       STRING         COMMENT 'Code valeur critère liste de référence '      ,
    valeur_borne_min_crit                                    DECIMAL(18, 5) COMMENT 'Valeur borne min critère '                    ,
    valeur_borne_max_crit                                    DECIMAL(18, 5) COMMENT 'Valeur borne max critère '                    ,
    code_crit                                                STRING         COMMENT 'Code critère  '                               ,
    date_deb_val                                             STRING         COMMENT 'Date de début valeur critère  '               ,
    date_import                                              STRING         COMMENT 'Date de l import'


)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_val_crit)
disable novalidate
;
