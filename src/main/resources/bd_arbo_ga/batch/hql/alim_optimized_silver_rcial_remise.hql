-- TRUNCATE TABLE fait dans le lanceur

INSERT INTO TABLE ${database_optimized}.${table_optimized_remise}
SELECT
    code_remise                                                                     AS code_remise                ,
    libelle_ver_remise                                                              AS remise                     ,
    code_type_remise                                                                AS code_type_remise           ,
    CASE
        WHEN code_type_remise = '01' THEN 'Remise ponct. liée à une vente'
        WHEN code_type_remise = '02' THEN 'Rem. pct. non liée à une vente'
        WHEN code_type_remise = '03' THEN 'Remise contractuelle'
        WHEN code_type_remise = '04' THEN 'Remise contract. tous clients'
        ELSE NULL
    END                                                                             AS type_remise                ,
    indic_particip_calcul_ca                                                        AS indic_particip_calcul_ca   ,
    date_arret_remise                                                               AS date_arret_remise          ,
    code_art_pilotage                                                               AS code_article_pilotage      ,
    article_pilotage                                                                AS article_pilotage           ,
    code_type_entite                                                                AS code_type_entite           ,
    type_entite                                                                     AS type_entite                ,
    IF(code_type_entite = '05', code_art,code_entite)                               AS code_entite_rattachement   ,
    CASE
        WHEN code_type_entite = '01' THEN libelle_gamme
        WHEN code_type_entite = '02' THEN libelle_famille
        WHEN code_type_entite = '03' THEN libelle_produit
        WHEN code_type_entite = '04' THEN libelle_sous_produit
        WHEN code_type_entite = '05' THEN libelle_article
        ELSE NULL
    END                                                                             AS entite_rattachement

FROM ${database_safe}.${table_safe_nickel_remise}
;
