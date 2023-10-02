-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_catalogue}

SELECT
    Pdt.code_pdt_service                                        AS code_produit        ,
    Pdt.libelle_ver_pdt_service                                 AS libelle_produit     ,
    Pdt.indic_service                                           AS indic_service       ,
    Pdt.indic_pac                                               AS indic_pac           ,
    Pdt.date_deb_ver                                            AS date_pdt_deb_ver    ,
    Pdt.date_arret_pdt                                          AS date_pdt_arret      ,
    Pdt.date_fin_pilot                                          AS date_pdt_fin_pilot  ,
    SsPdt.code_ss_pdt                                           AS code_ss_pdt         ,
    SsPdt.libelle_carac_ss_pdt                                  AS libelle_ss_pdt      ,
    art.code_article                                            AS code_article        ,
    art.libelle_ss_pdt_val_crit_art                             AS libelle_article     ,
    'NA'                                                        AS code_pdt_filiale    ,
    'NA'                                                        AS code_type_filiale   ,
    'NON AFFECTE'                                               AS libelle_type_filiale

FROM
    (
    SELECT
        code_article                ,
        libelle_ss_pdt_val_crit_art ,
        rn
    FROM (
        SELECT
            code_article                ,
            libelle_ss_pdt_val_crit_art ,
            ROW_NUMBER() OVER (PARTITION BY code_article ORDER BY date_debut_article DESC) AS rn
        FROM ${database_safe}.${table_safe_article}
        ) art
    WHERE art.rn = 1
) art

LEFT JOIN
    (
    SELECT
        code_article,
        code_ss_pdt,
        ROW_NUMBER() OVER (PARTITION BY code_article ORDER BY date_deb_ver DESC) AS rn
    FROM
        ${database_safe}.${table_safe_ver_ss_pdt_art}
) lienArtSsPdt ON art.code_article = lienArtSsPdt.code_article AND lienArtSsPdt.rn = 1

LEFT JOIN
    (
    SELECT
        code_ss_pdt,
        code_pdt_service,
        libelle_carac_ss_pdt,
        ROW_NUMBER() OVER (PARTITION BY code_ss_pdt ORDER BY date_deb_ver DESC) AS rn
    FROM
        ${database_safe}.${table_safe_ver_ss_pdt}
) SsPdt ON lienArtSsPdt.code_ss_pdt = SsPdt.code_ss_pdt AND SsPdt.rn = 1

LEFT JOIN
    (
    SELECT
        code_pdt_service,
        libelle_ver_pdt_service,
        indic_service,
        indic_pac,
        date_deb_ver,
        date_arret_pdt,
        date_fin_pilot,
        ROW_NUMBER() OVER (PARTITION BY code_pdt_service ORDER BY date_deb_ver DESC) AS rn
    FROM
        ${database_safe}.${table_safe_ver_pdt_service}
) Pdt ON SsPdt.code_pdt_service = Pdt.code_pdt_service AND Pdt.rn = 1


UNION


SELECT
    Pdt.code_pdt_service										AS code_produit        ,
    Pdt.libelle_ver_pdt_service                                 AS libelle_produit     ,
    Pdt.indic_service                                           AS indic_service       ,
    Pdt.indic_pac                                               AS indic_pac           ,
    Pdt.date_deb_ver                                            AS date_pdt_deb_ver    ,
    Pdt.date_arret_pdt                                          AS date_pdt_arret      ,
    Pdt.date_fin_pilot                                          AS date_pdt_fin_pilot  ,
    SsPdt.code_ss_pdt                                           AS code_ss_pdt         ,
    SsPdt.libelle_carac_ss_pdt                                  AS libelle_ss_pdt      ,
    'NA'                                                        AS code_article        ,
    'NON AFFECTE'                                               AS libelle_article     ,
    pdt_filiale.code_pdt_filiale                                AS code_pdt_filiale    ,
    pdt_filiale.code_type_filiale                               AS code_type_filiale   ,
    type_filiale.subsidary_type_label                           AS libelle_type_filiale

FROM
    (
    SELECT
        code_pdt_filiale        ,
        code_type_filiale       ,
        rn
     FROM
        (
        SELECT
            code_pdt_filiale        ,
            code_type_filiale       ,
            ROW_NUMBER() OVER (PARTITION BY code_type_filiale, code_pdt_filiale ORDER BY date_deb_pdt DESC) AS rn
         FROM ${database_safe}.${table_safe_pdt_filiale}
         ) pdt_filiale
         WHERE pdt_filiale.rn = 1
) pdt_filiale

LEFT JOIN
    (
    SELECT
        code_ss_pdt              ,
        code_type_filiale        ,
        code_pdt_filiale         ,
        ROW_NUMBER() OVER (PARTITION BY code_type_filiale, code_pdt_filiale ORDER BY date_deb_rat DESC) AS rn
    FROM
        ${database_safe}.${table_safe_assos_pdt_filiale}
) lienFilialeSsPdt ON pdt_filiale.code_type_filiale = lienFilialeSsPdt.code_type_filiale AND pdt_filiale.code_pdt_filiale = lienFilialeSsPdt.code_pdt_filiale and lienFilialeSsPdt.rn=1

LEFT JOIN
    (
    SELECT
        code_ss_pdt               ,
        code_pdt_service          ,
        libelle_carac_ss_pdt      ,
        ROW_NUMBER() OVER (PARTITION BY code_ss_pdt ORDER BY date_deb_ver DESC) AS rn
    FROM
        ${database_safe}.${table_safe_ver_ss_pdt}
) SsPdt ON ssPdt.code_ss_pdt = lienFilialeSsPdt.code_ss_pdt AND SsPdt.rn = 1

LEFT JOIN
    (
    SELECT
        code_pdt_service          ,
        libelle_ver_pdt_service   ,
        indic_service             ,
        indic_pac                 ,
        date_deb_ver              ,
        date_arret_pdt            ,
        date_fin_pilot            ,
        ROW_NUMBER() OVER (PARTITION BY code_pdt_service ORDER BY date_deb_ver DESC) AS rn
    FROM
        ${database_safe}.${table_safe_ver_pdt_service}
) Pdt ON SsPdt.code_pdt_service = Pdt.code_pdt_service AND Pdt.rn = 1

LEFT JOIN
    (
    SELECT
        subsidary_type_code       ,
        subsidary_type_label      ,
        ROW_NUMBER() OVER (PARTITION BY subsidary_type_code ORDER BY subsidary_type_start_date DESC) AS rn
    FROM
        ${database_safe}.${table_safe_type_filiale}
) type_filiale ON pdt_filiale.code_type_filiale = type_filiale.subsidary_type_code AND type_filiale.rn = 1

;
