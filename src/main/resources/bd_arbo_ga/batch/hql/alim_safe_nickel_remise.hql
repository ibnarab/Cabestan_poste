WITH

-- b_cabestan_ver_remise recuperation des dates debut de version les plus recent
ver_remise AS (
    SELECT * FROM (
        SELECT *, ROW_NUMBER() OVER (PARTITION BY code_remise ORDER BY date_deb_ver_remise DESC) AS row_num
        FROM ${database_safe}.${table_safe_ver_remise}
    ) AS v_m
    WHERE v_m.row_num = 1
),

-- b_cabestan_assos_remise recuperation des dates debut version les plus recent
assos_remise AS (
    SELECT code_type_entite, code_art, date_deb_rat, date_fin_rat, code_remise, date_deb_ver, code_entite
    FROM ${database_safe}.${table_safe_assos_remise}
    WHERE date_fin_rat is NULL
),

-- b_cabestan_article recuperation des dates debut article les plus recent
article AS (
    SELECT code_article, libelle_ss_pdt_val_crit_art
    FROM ${database_safe}.${table_safe_article}
),

-- b_cabestan_ver_ss_pdt recuperation des dates debut version les plus recent
ver_ss_pdt AS (
    SELECT *
    FROM (
        SELECT code_ss_pdt, libelle_carac_ss_pdt, code_pdt_service, ROW_NUMBER() OVER (PARTITION BY code_ss_pdt ORDER BY date_deb_ver DESC) AS row_num
        FROM ${database_safe}.${table_safe_ver_ss_pdt}
    ) AS v_s_p
    WHERE v_s_p.row_num = 1
),

-- b_cabestan_ver_pdt_service recuperation des dates debut version les plus recent
ver_pdt_service AS (
    SELECT *
    FROM (
        SELECT code_pdt_service, libelle_ver_pdt_service, ROW_NUMBER() OVER (PARTITION BY code_pdt_service ORDER BY date_deb_ver DESC ) AS row_num
        FROM ${database_safe}.${table_safe_ver_pdt_service}
    ) AS v_p_s
    WHERE v_p_s.row_num = 1
),

-- b_cabestan_ver_famille recuperation des dates debut version les plus recent
ver_famille AS (
    SELECT *
    FROM (
        SELECT code_famille, libelle_ver_famille, ROW_NUMBER() OVER (PARTITION BY code_famille ORDER BY date_deb_ver DESC) AS row_num
        FROM ${database_safe}.${table_safe_ver_famille}
    ) AS v_f
    WHERE v_f.row_num = 1
),

-- b_cabestan_ver_gamme recuperation des dates debut version les plus recent
ver_gamme AS (
    SELECT *
    FROM (
        SELECT code_gamme, libelle_ver_gamme, ROW_NUMBER() OVER (PARTITION BY code_gamme ORDER BY date_deb_ver DESC) AS row_num
        FROM ${database_safe}.${table_safe_ver_gamme}
    ) AS v_g
    WHERE v_g.row_num = 1
),

-- b_cabestan_ver_ss_pdt_art recuperation des dates debut version les plus recent
ver_ss_pdt_art AS (
    SELECT *
    FROM (
        SELECT code_ss_pdt, code_article, ROW_NUMBER() OVER (PARTITION BY code_ss_pdt ORDER BY date_deb_ver DESC ) AS row_num
        FROM ${database_safe}.${table_safe_ver_ss_pdt_art}
    ) AS v_s_p_ar
    WHERE v_s_p_ar.row_num = 1
),

table_article_libelle AS (
    SELECT *
    FROM ver_ss_pdt
    LEFT JOIN ver_pdt_service ON ver_pdt_service.code_pdt_service = ver_ss_pdt.code_pdt_service
),

table_article_pilotage AS (
    SELECT
        ver_remise.code_remise,
        CASE
            WHEN ver_remise.code_art_pilotage IS NOT NULL
            THEN COALESCE(article.libelle_ss_pdt_val_crit_art, ver_ss_pdt.libelle_carac_ss_pdt, ver_pdt_service.libelle_ver_pdt_service)
            ELSE NULL
        END AS article_pilotage
    FROM ver_remise
    LEFT JOIN article         ON article.code_article             = ver_remise.code_art_pilotage
    LEFT JOIN ver_ss_pdt_art  ON ver_ss_pdt_art.code_article      = ver_remise.code_art_pilotage
    LEFT JOIN ver_ss_pdt      ON ver_ss_pdt.code_ss_pdt           = ver_ss_pdt_art.code_ss_pdt
    LEFT JOIN ver_pdt_service ON ver_pdt_service.code_pdt_service = ver_ss_pdt.code_pdt_service
),

table_sous_produit AS (
    SELECT
    ver_ss_pdt.code_ss_pdt,
    CASE
        WHEN ver_pdt_service.libelle_ver_pdt_service IS NOT NULL AND ver_ss_pdt.libelle_carac_ss_pdt IS NOT NULL THEN CONCAT(ver_pdt_service.libelle_ver_pdt_service, " ", ver_ss_pdt.libelle_carac_ss_pdt)
        WHEN ver_pdt_service.libelle_ver_pdt_service IS     NULL OR  ver_ss_pdt.libelle_carac_ss_pdt IS     NULL THEN COALESCE(ver_pdt_service.libelle_ver_pdt_service, ver_ss_pdt.libelle_carac_ss_pdt)
        ELSE NULL
    END AS libelle_sous_produit
    FROM ver_ss_pdt
    LEFT JOIN ver_pdt_service ON ver_pdt_service.code_pdt_service = ver_ss_pdt.code_pdt_service
)

-- TRUNCATE TABLE fait dans le lanceur

INSERT INTO TABLE ${database_safe}.${table_safe_remise}
SELECT
    ver_remise.code_remise                                                                 AS code_remise                  ,
    ver_remise.date_deb_ver_remise                                                         AS date_deb_ver_remise          ,
    ver_remise.date_import                                                                 AS date_import                  ,
    ver_remise.code_type_enregist                                                          AS code_type_enregist           ,
    ver_remise.libelle_ver_remise                                                          AS libelle_ver_remise           ,
    ver_remise.code_type_remise                                                            AS code_type_remise             ,
    ver_remise.code_group_remise                                                           AS code_group_remise            ,
    ver_remise.code_imput_comptable                                                        AS code_imput_comptable         ,
    ver_remise.code_imput_comptable_vad                                                    AS code_imput_comptable_vad     ,
    ver_remise.code_imput_comptable_equinox                                                AS code_imput_comptable_equinox ,
    ver_remise.code_assiete_remise                                                         AS code_assiete_remise          ,
    ver_remise.code_unit_remise                                                            AS code_unit_remise             ,
    ver_remise.code_mod_aff                                                                AS code_mod_aff                 ,
    ver_remise.code_tva                                                                    AS code_tva                     ,
    ver_remise.code_niv_prio                                                               AS code_niv_prio                ,
    ver_remise.val_borne_min                                                               AS val_borne_min                ,
    ver_remise.val_borne_max                                                               AS val_borne_max                ,
    ver_remise.val_fixe                                                                    AS val_fixe                     ,
    ver_remise.mt_seuil_min                                                                AS mt_seuil_min                 ,
    ver_remise.mt_seuil_max                                                                AS mt_seuil_max                 ,
    ver_remise.indic_particip_calcul_ca                                                    AS indic_particip_calcul_ca     ,
    ver_remise.date_arret_remise                                                           AS date_arret_remise            ,
    ver_remise.code_art_pilotage                                                           AS code_art_pilotage            ,
    ver_remise.code_tag_remise                                                             AS code_tag_remise              ,
    table_article_pilotage.article_pilotage                                                AS article_pilotage             ,
    assos_remise.code_type_entite                                                          AS code_type_entite             ,
    assos_remise.code_entite                                                               AS code_entite                  ,
    CASE
        WHEN assos_remise.code_type_entite = '01' THEN "GAMME"
        WHEN assos_remise.code_type_entite = '02' THEN "FAMILLE"
        WHEN assos_remise.code_type_entite = '03' THEN "PRODUIT"
        WHEN assos_remise.code_type_entite = '04' THEN "SOUS-PRODUIT"
        WHEN assos_remise.code_type_entite = '05' THEN "ARTICLE"
        ELSE NULL
    END                                                                                    AS type_entite                  ,
    assos_remise.code_art                                                                  AS code_art                     ,
    assos_remise.date_deb_rat                                                              AS date_deb_rat                 ,
    assos_remise.date_fin_rat                                                              AS date_fin_rat                 ,
    CASE
        WHEN assos_remise.code_type_entite = "05" THEN
            CASE
                WHEN table_article_libelle.libelle_ver_pdt_service IS NOT NULL AND article.libelle_ss_pdt_val_crit_art IS NOT NULL THEN CONCAT(table_article_libelle.libelle_ver_pdt_service, " ", article.libelle_ss_pdt_val_crit_art)
                WHEN table_article_libelle.libelle_ver_pdt_service IS     NULL OR  article.libelle_ss_pdt_val_crit_art IS     NULL THEN COALESCE(table_article_libelle.libelle_ver_pdt_service, article.libelle_ss_pdt_val_crit_art)
            END
        ELSE NULL
    END                                                                                    AS libelle_article              ,
    if(assos_remise.code_type_entite="04", table_sous_produit.libelle_sous_produit, NULL)  AS libelle_sous_produit         ,
    if(assos_remise.code_type_entite="03", ver_pdt_service.libelle_ver_pdt_service, NULL)  AS libelle_produit              ,
    if(assos_remise.code_type_entite="02", ver_famille.libelle_ver_famille,         NULL)  AS libelle_famille              ,
    if(assos_remise.code_type_entite="01", ver_gamme.libelle_ver_gamme,             NULL)  AS libelle_gamme

FROM ver_remise
LEFT JOIN assos_remise           ON ver_remise.code_remise             = assos_remise.code_remise AND ver_remise.date_deb_ver_remise = assos_remise.date_deb_ver
LEFT JOIN ver_pdt_service        ON ver_pdt_service.code_pdt_service   = assos_remise.code_entite
LEFT JOIN table_sous_produit     ON table_sous_produit.code_ss_pdt     = assos_remise.code_entite
LEFT JOIN ver_famille            ON ver_famille.code_famille           = assos_remise.code_entite
LEFT JOIN ver_gamme              ON ver_gamme.code_gamme               = assos_remise.code_entite
LEFT JOIN article                ON article.code_article               = assos_remise.code_art
LEFT JOIN ver_ss_pdt_art         ON ver_ss_pdt_art.code_article        = article.code_article
LEFT JOIN table_article_libelle  ON ver_ss_pdt_art.code_ss_pdt         = table_article_libelle.code_ss_pdt
LEFT JOIN table_article_pilotage ON table_article_pilotage.code_remise = ver_remise.code_remise
;
