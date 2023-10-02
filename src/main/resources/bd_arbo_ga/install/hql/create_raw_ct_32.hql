USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                               STRING COMMENT 'Code type enregistrement'                               ,
    code_remise                                      STRING COMMENT 'Code remise'                                            ,
    libelle_ver_remise                               STRING COMMENT 'Libellé version remise'                                 ,
    date_deb_ver_remise                              STRING COMMENT 'Date début version remise '                             ,
    code_type_remise                                 STRING COMMENT 'Code type remise '                                      ,
    code_group_remise                                STRING COMMENT 'Code groupe remise  '                                   ,
    code_imput_comptable                             STRING COMMENT 'Code imputation comptable  '                            ,
    code_imput_comptable_vad                         STRING COMMENT 'Code imputation comptable vente à distance '            ,
    code_imput_comptable_equinox                     STRING COMMENT 'Code imputation comptable EQUINOX '                     ,
    code_assiete_remise                              STRING COMMENT 'Code assiette remise  '                                 ,
    code_unit_remise                                 STRING COMMENT 'Code unité remise  '                                    ,
    code_mod_aff                                     STRING COMMENT 'Code mode affranchissement  '                           ,
    code_tva                                         STRING COMMENT 'Code TVA '                                              ,
    code_niv_prio                                    STRING COMMENT 'Code Niveau priorité'                                   ,
    val_borne_min                                    STRING COMMENT 'Valeur borne minimum '                                  ,
    val_borne_max                                    STRING COMMENT 'Valeur borne maximum '                                  ,
    val_fixe                                         STRING COMMENT 'Valeur fixe  '                                          ,
    mt_seuil_min                                     STRING COMMENT 'Montant seuil minimum  '                                ,
    mt_seuil_max                                     STRING COMMENT 'Montant seuil maximum  '                                ,
    indic_particip_calcul_ca                         STRING COMMENT 'Indicateur de participation au calcul du CA net  '      ,
    date_arret_remise                                STRING COMMENT 'Date arrêt remise   '                                   ,
    code_art_pilotage                                STRING COMMENT 'Code article de pilotage '                              ,
    code_tag_remise                                  STRING COMMENT 'Code tag remise   '

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ('serialization.null.format'='')
;
