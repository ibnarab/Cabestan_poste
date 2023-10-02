USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    code_remise                         STRING          COMMENT 'Code remise',
    date_deb_ver_remise                 STRING          COMMENT 'Date début version remise',
    date_import                         STRING          COMMENT 'Date de l import',
    code_type_enregist                  STRING          COMMENT 'Code type enregistrement',
    libelle_ver_remise                  STRING          COMMENT 'Libellé version remise',
    code_type_remise                    STRING          COMMENT 'Code type remise',
    code_group_remise                   STRING          COMMENT 'Code groupe remise',
    code_imput_comptable                STRING          COMMENT 'Code imputation comptable',
    code_imput_comptable_vad            STRING          COMMENT 'Code imputation comptable vente à distance',
    code_imput_comptable_equinox        STRING          COMMENT 'Code imputation comptable EQUINOX',
    code_assiete_remise                 STRING          COMMENT 'Code assiette remise',
    code_unit_remise                    STRING          COMMENT 'Code unité remise',
    code_mod_aff                        STRING          COMMENT 'Code mode affranchissement',
    code_tva                            STRING          COMMENT 'Code TVA',
    code_niv_prio                       STRING          COMMENT 'Code Niveau priorité',
    val_borne_min                       DECIMAL(18, 5)  COMMENT 'Valeur borne minimum',
    val_borne_max                       DECIMAL(18, 5)  COMMENT 'Valeur borne maximum',
    val_fixe                            DECIMAL(18, 5)  COMMENT 'Valeur fixe',
    mt_seuil_min                        INT             COMMENT 'Montant seuil minimum',
    mt_seuil_max                        INT             COMMENT 'Montant seuil maximum',
    indic_particip_calcul_ca            STRING          COMMENT 'Indicateur de participation au calcul du CA net',
    date_arret_remise                   STRING          COMMENT 'Date arrêt remise',
    code_art_pilotage                   STRING          COMMENT 'Code article de pilotage',
    code_tag_remise                     STRING          COMMENT 'Code tag remise',
    article_pilotage                    STRING          COMMENT 'libellé article pilotage',
    code_type_entite                    STRING          COMMENT 'Code type entité',
    code_entite                         STRING          COMMENT 'Code entité',
    type_entite                         STRING          COMMENT 'Type entité',
    code_art                            STRING          COMMENT 'Code article',
    date_deb_rat                        STRING          COMMENT 'Date début rattachement remise',
    date_fin_rat                        STRING          COMMENT 'Date fin rattachement remise',
    libelle_article                     STRING          COMMENT 'Libellé article',
    libelle_sous_produit                STRING          COMMENT 'Libellé sous produit',
    libelle_produit                     STRING          COMMENT 'Libellé produit',
    libelle_famille                     STRING          COMMENT 'Libellé famille',
    libelle_gamme                       STRING          COMMENT 'Libellé gamme'

)
COMMENT "Dernière version des remises Cabestan"
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_remise,code_entite,code_art)
disable novalidate
;
