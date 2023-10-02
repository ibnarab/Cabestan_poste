USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING COMMENT 'Code type enregistrement'                                              ,
    code_article                                             STRING COMMENT 'Code article'                                                          ,
    libelle_ss_pdt_val_crit_art                              STRING COMMENT 'Libellé caractéristiques sous-produit + valeurs critères article'      ,
    indicateur_art                                           STRING COMMENT 'Indicateur article livrable '                                          ,
    date_debut_article                                       STRING COMMENT 'Date début article '                                                   ,
    date_fin_tarif                                           STRING COMMENT 'Date fin tarification article '                                        ,
    date_arret_article                                       STRING COMMENT 'Date arrêt article '                                                   ,
    date_import                                              STRING COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_article)
disable novalidate
;
