USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_type_enregist                                       STRING          COMMENT 'Code type enregistrement'                   ,
    code_article                                             STRING          COMMENT 'Code article'                               ,
    date_deb_ver                                             STRING          COMMENT 'Date début version Tarif'                   ,
    code_zone_depot                                          STRING          COMMENT 'Code zone de dépôt '                        ,
    code_type_tarif                                          STRING          COMMENT 'Code type tarif'                            ,
    txt_formule                                              STRING          COMMENT 'Texte de la formule'                        ,
    nbre_decimale_formule                                    INT             COMMENT 'Nombre de décimale de la formule  '         ,
    mt_pu_fixe                                               DECIMAL(18, 5)  COMMENT 'Montant de prix unitaire fixe  '            ,
    date_import                                              STRING          COMMENT 'Date de l import'

)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_article,date_deb_ver,code_zone_depot)
disable novalidate
;
