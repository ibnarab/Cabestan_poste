USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enreg                                              STRING COMMENT 'Code type enregistrement'       ,
    code_crit                                                    STRING COMMENT 'Code critère'                   ,
    num_ordre_affich                                             STRING COMMENT 'Numéro ordre d affichage'       ,
    libelle_crit                                                 STRING COMMENT 'Libellé critère'                ,
    libelle_unite_crit                                           STRING COMMENT 'Libellé unité critère'          ,
    libelle_trigramme_crit                                       STRING COMMENT 'Libellé trigramme critère'      ,
    nombre_decimale_crit                                         STRING COMMENT 'Nombre de décimal critère'      ,
    code_type_crit                                               STRING COMMENT 'Code type critère'              ,
    code_nat_crit                                                STRING COMMENT 'Code nature critère'            ,
    date_import                                                  STRING COMMENT 'Date de l import'

)

STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_crit)
disable novalidate
;
