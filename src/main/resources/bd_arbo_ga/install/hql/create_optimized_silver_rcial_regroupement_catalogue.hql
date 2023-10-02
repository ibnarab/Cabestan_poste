USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_periode                        STRING COMMENT 'Code période Cabestan',
    libelle_periode                     STRING COMMENT 'Libellé Période Cabestan',
    code_type_rgpt                      STRING COMMENT 'Code Type regroupement Cabestan',
    libelle_type_rgpt                   STRING COMMENT 'Libellé Type regroupement Cabestan',
    code_gamme                          STRING COMMENT 'Code gamme Cabestan',
    libelle_gamme                       STRING COMMENT 'Libellé Gamme Cabestan',
    code_marche                         STRING COMMENT 'Code Marché',
    libelle_marche                      STRING COMMENT 'Libellé Marché',
    code_segment                        STRING COMMENT 'Code Segment',
    libelle_segment                     STRING COMMENT 'Libellé Segment',
    code_famille                        STRING COMMENT 'Code famille Cabestan',
    libelle_famille                     STRING COMMENT 'Libellé Famille Cabestan',
    code_produit                        STRING COMMENT 'Code produit/service Cabestan',
    libelle_produit                     STRING COMMENT 'Libellé Produit/service Cabestan',
    indic_service                       STRING COMMENT 'Indicateur service associé',
    indic_pac                           STRING COMMENT 'Indicateur CAP',
    date_pdt_deb_ver                    STRING COMMENT 'Date de création produit/service',
    date_pdt_arret                      STRING COMMENT 'Date arrêt produit/service',
    date_pdt_fin_pilot                  STRING COMMENT 'Date de fin de pilotage',
    code_ss_pdt                         STRING COMMENT 'Code sous-produit Cabestan',
    libelle_ss_pdt                      STRING COMMENT 'Libellé Sous-produit Cabestan',
    code_article                        STRING COMMENT 'Code article Cabestan',
    libelle_article                     STRING COMMENT 'Libellé Article Cabestan',
    code_pdt_filiale                    STRING COMMENT 'Code produit système opérant',
    code_type_filiale                   STRING COMMENT 'Code type système opérant',
    libelle_type_filiale                STRING COMMENT 'Libellé type système opérant'
)
COMMENT "Association de 2 hiérarchies : la dernière version de Regroupement (type de regroupement - gamme - marché - segment - famille) par période Cabestan avec la dernière version du Catalogue ([produit - sous-produit - article] et [produit - sous-produit - produit + type filiale])"
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_periode,code_type_rgpt,code_type_filiale,code_pdt_filiale,code_article,code_produit,code_famille)
disable novalidate
;
