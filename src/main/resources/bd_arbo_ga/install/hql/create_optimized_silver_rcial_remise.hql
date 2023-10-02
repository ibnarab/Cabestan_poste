USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_remise                                      STRING          COMMENT 'Code remise'                                                                          ,
    remise                                           STRING          COMMENT 'Ex. Remise Postimpact Noël 2000'                                                      ,
    code_type_remise                                 STRING          COMMENT 'Code type remise '                                                                    ,
    type_remise                                      STRING          COMMENT ' '                                                                                    ,
    indic_particip_calcul_ca                         STRING          COMMENT 'Indicateur qui détermine si une remise participe au calcul du CA net ou non  '        ,
    date_arret_remise                                STRING          COMMENT ' '                                                                                    ,
    code_article_pilotage                            STRING          COMMENT 'Obligatoire pour une remise de type 2 '                                               ,
    article_pilotage                                 STRING          COMMENT 'Libellé associé au Code article de pilotage '                                         ,
    code_type_entite                                 STRING          COMMENT 'Indique à quel type d’entité Cabestan est rattaché une remise. '                      ,
    type_entite                                      STRING          COMMENT 'Libellé associé au Code type entité. '                                                ,
    code_entite_rattachement                         STRING          COMMENT 'Selon le type d entité '                                                              ,
    entite_rattachement                              STRING          COMMENT 'Libellé associé au Code entité rattachement.'
)
COMMENT "Dernière version des remises Cabestan"
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_remise, code_type_remise, code_entite_rattachement)
disable novalidate
;
