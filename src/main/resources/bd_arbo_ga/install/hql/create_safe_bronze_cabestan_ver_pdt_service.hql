USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                                      ,
    code_pdt_service                                         STRING COMMENT 'Code Produit/service'                                          ,
    libelle_ver_pdt_service                                  STRING COMMENT 'Libellé version Produit/Service '                              ,
    indic_service                                            STRING COMMENT 'Indicateur de service '                                        ,
    indic_pac                                                STRING COMMENT 'Indicateur du CAP '                                            ,
    date_deb_ver                                             STRING COMMENT 'Date début version Produit/Service(Format: AAAA-MM-JJ)  '      ,
    date_arret_pdt                                           STRING COMMENT 'Date arrêt Produit/Service  '                                  ,
    date_fin_pilot                                           STRING COMMENT 'Date de fin de pilotage'                                       ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_pdt_service,date_deb_ver)
disable novalidate
;
