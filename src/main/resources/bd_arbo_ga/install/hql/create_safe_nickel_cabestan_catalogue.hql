USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
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
COMMENT "Catalogue de la dernière version des produits Cabestan ([produit - sous-produit - article] et [produit - sous-produit - produit filiale + type filiale])"
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_type_filiale,code_pdt_filiale,code_article)
disable novalidate
;
