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
    code_produit                        STRING COMMENT 'Code produit/service Cabestan'
)
COMMENT "Regroupement Cabestan avec la dernière version de chaque période (type de regroupement - gamme - marché - segment - famille - produit)"
STORED AS PARQUET
LOCATION '${hdfs_path}'
;

ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (code_periode,code_type_rgpt,code_famille)
disable novalidate
;
