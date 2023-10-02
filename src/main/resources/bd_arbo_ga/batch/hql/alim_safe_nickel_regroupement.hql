-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_regroupement}

SELECT
    Produit.per_cab                                     AS code_periode      ,
    "Periode Cabestan "||Produit.per_cab                AS libelle_periode   ,
    NVL(Gamme.code_type_groupe,         '99')           AS code_type_rgpt    ,
    NVL(rgpt.pool_type_label,           'NON AFFECTE')  AS libelle_type_rgpt ,
    NVL(Gamme.code_gamme,               '9999')         AS code_gamme        ,
    NVL(Gamme.libelle_ver_gamme,        'NON AFFECTE') AS libelle_gamme     ,
    NVL(exo.market_code,                '99')           AS code_marche       ,
    NVL(exo.market_label,               'NON AFFECTE')  AS libelle_marche    ,
    NVL(exo.segment_code,               '999')          AS code_segment      ,
    NVL(exo.segment_label,              'NON AFFECTE')  AS libelle_segment   ,
    NVL(Famille.code_famille,           '99999')        AS code_famille      ,
    NVL(Famille.libelle_ver_famille,    'NON AFFECTE') AS libelle_famille   ,
    Produit.code_pdt_service                            AS code_produit

FROM

    -- Niveau Produit / Famille

    (
    SELECT
        per_cab,
        code_pdt_service,
        code_famille
    FROM
        (
        SELECT
            per_cab,
            code_pdt_service,
            code_famille,
            CASE WHEN lienPdtFam.annee_deb = date_cab.per_cab OR (lienPdtFam.annee_deb = lienPdtFam.annee_max AND date_cab.per_cab > lienPdtFam.annee_max) THEN 1 ELSE 0 END    AS a_conserver,
            SUM(CASE WHEN date_cab.per_cab = lienPdtFam.annee_deb THEN 1 ELSE 0 END) OVER(partition by date_cab.per_cab, lienPdtFam.code_pdt_service)                           AS cpt,
            MAX(annee_suiv) OVER(partition by code_pdt_service, annee_deb)                                                                                                      AS annee_suiv
        FROM
            (
            SELECT DISTINCT
                YEAR(date_deb_ver) per_cab
            FROM
                ${database_safe}.${table_safe_ver_pdt_service_famille}
            ) date_cab,
            (
            SELECT
                MAX(YEAR(date_deb_ver)) OVER (PARTITION BY code_pdt_service)                                                                                                    AS annee_max,
                YEAR(date_deb_ver)                                                                                                                                              AS annee_deb,
                code_pdt_service,
                code_famille,
                RANK() OVER (PARTITION BY YEAR(date_deb_ver), code_pdt_service, code_famille ORDER BY date_deb_ver DESC)                                                        AS rang,
                LAG(YEAR(date_deb_ver), 1) OVER (PARTITION BY code_pdt_service ORDER BY code_pdt_service, date_deb_ver DESC)                                                    AS annee_suiv,
                CASE WHEN LAG(YEAR(date_deb_ver), 1) OVER (PARTITION BY code_pdt_service, code_famille ORDER BY date_deb_ver DESC) <= YEAR(date_deb_ver)+1 then 0 ELSE 1    END AS max_par_groupe_annee,
                CASE WHEN MAX(date_deb_ver) OVER (PARTITION BY YEAR(date_deb_ver), code_pdt_service) = date_deb_ver then 1 ELSE 0                                           END AS est_date_max
            FROM ${database_safe}.${table_safe_ver_pdt_service_famille}
            ) lienPdtFam
        WHERE lienPdtFam.rang = 1 AND est_date_max = 1
        AND (
            -- récupération des valeurs pour les années des périodes cabestan déjà présentes en base
            lienPdtFam.annee_deb = date_cab.per_cab
            -- récupération des valeurs pour les années des périodes cabestan supérieures à la dernière date présente en base
            OR (lienPdtFam.annee_deb = lienPdtFam.annee_max AND date_cab.per_cab > lienPdtFam.annee_max)
            -- récupération des valeurs pour les années des périodes cabestan dont les dates ne sont pas présentes en base
            OR (lienPdtFam.annee_deb < lienPdtFam.annee_suiv AND date_cab.per_cab > lienPdtFam.annee_deb AND date_cab.per_cab < lienPdtFam.annee_suiv AND lienPdtFam.max_par_groupe_annee = 1)
            OR (lienPdtFam.annee_suiv = lienPdtFam.annee_deb AND date_cab.per_cab > lienPdtFam.annee_deb AND lienPdtFam.max_par_groupe_annee = 1)
            )
        ) Pdt
    -- On ne conserve que les périodes déjà définies en base et on duplique la dernière version rencontrée pour les périodes manquantes
    WHERE a_conserver = 1 OR (cpt = 0 AND annee_suiv >= per_cab)
    ) Produit

INNER JOIN

    -- Niveau Famille / Gamme ne prenant toutes les années à partir de la date de début de la famille

    (

    SELECT
        per_cab,
        code_famille,
        libelle_ver_famille,
        code_gamme
    FROM
        (
        SELECT DISTINCT
            YEAR(date_deb_ver) per_cab
		FROM
			${database_safe}.${table_safe_ver_pdt_service_famille}
		) date_cab,
     	(
		SELECT
			MAX(YEAR(date_deb_ver)) OVER (PARTITION BY code_famille)                                                                                                AS annee_max,
			YEAR(date_deb_ver)                                                                                                                                      AS annee_deb,
			YEAR(date_arret_famille)                                                                                                                                AS annee_fin,
			code_famille,
			libelle_ver_famille,
			code_gamme,
			RANK() OVER (PARTITION BY YEAR(date_deb_ver), code_famille, code_gamme ORDER BY date_deb_ver DESC)                                                      AS rang,
			LAG(YEAR(date_deb_ver), 1) OVER (PARTITION BY code_famille ORDER BY date_deb_ver DESC)                                                                  AS annee_suiv,
			CASE WHEN LAG(YEAR(date_deb_ver), 1) OVER (PARTITION BY code_famille, code_gamme ORDER BY date_deb_ver DESC) <= YEAR(date_deb_ver)+1 then 0 ELSE 1  END AS max_par_groupe_annee,
			CASE WHEN MAX(date_deb_ver) OVER (PARTITION BY YEAR(date_deb_ver), code_famille) = date_deb_ver then 1 ELSE 0                                       END AS est_date_max
		FROM
			${database_safe}.${table_safe_ver_famille}
		) Fam
    WHERE Fam.rang = 1 AND est_date_max = 1
    AND (Fam.annee_deb = date_cab.per_cab OR (Fam.annee_deb = Fam.annee_max AND date_cab.per_cab > Fam.annee_max) OR (Fam.annee_deb < Fam.annee_suiv AND date_cab.per_cab > Fam.annee_deb AND date_cab.per_cab < Fam.annee_suiv AND Fam.max_par_groupe_annee = 1))
    GROUP BY per_cab, code_famille, libelle_ver_famille, code_gamme
    ) Famille ON Produit.code_famille = Famille.code_famille AND Produit.per_cab = Famille.per_cab

INNER JOIN

	-- Niveau Gamme prenant toutes les années à partir de la date de début de la gamme

    (

    SELECT
		per_cab,
		code_gamme,
		libelle_ver_gamme,
		code_type_groupe
	FROM
		(
		SELECT DISTINCT
			YEAR(date_deb_ver) per_cab
		FROM
			${database_safe}.${table_safe_ver_pdt_service_famille}
		) date_cab,
     	(SELECT
			MAX(YEAR(date_deb_ver)) OVER (PARTITION BY code_gamme)                                                                                      AS annee_max,
            YEAR(date_deb_ver)                                                                                                                          AS annee_deb,
            YEAR(date_arret_gamme_1)                                                                                                                    AS annee_fin,
            code_gamme,
            libelle_ver_gamme,
            code_type_groupe,
            RANK() OVER (PARTITION BY YEAR(date_deb_ver), code_gamme ORDER BY date_deb_ver DESC)                                                        AS rang,
            LAG(YEAR(date_deb_ver), 1) OVER (PARTITION BY code_gamme ORDER BY date_deb_ver DESC)                                                        AS annee_suiv,
            CASE WHEN LAG(YEAR(date_deb_ver), 1) OVER (PARTITION BY code_gamme ORDER BY date_deb_ver DESC) <= YEAR(date_deb_ver)+1 then 0 ELSE 1 END    AS max_par_groupe_annee
		FROM
			${database_safe}.${table_safe_ver_gamme}
		) Gam
    WHERE Gam.rang = 1
    AND (Gam.annee_deb = date_cab.per_cab OR (Gam.annee_deb = Gam.annee_max AND date_cab.per_cab > Gam.annee_max) OR (Gam.annee_deb < Gam.annee_suiv AND date_cab.per_cab > Gam.annee_deb AND date_cab.per_cab < Gam.annee_suiv AND Gam.max_par_groupe_annee = 1))
    GROUP BY per_cab, code_gamme, libelle_ver_gamme, code_type_groupe
    ) Gamme ON Famille.code_gamme = Gamme.code_gamme AND Famille.per_cab = Gamme.per_cab

INNER JOIN

	${database_safe}.${table_safe_type_regroupement} rgpt ON Gamme.code_type_groupe = rgpt.pool_type_code

LEFT JOIN

    ${database_safe}.${table_safe_exorcom} exo ON Gamme.per_cab = exo.cabestan_period_code AND Gamme.code_type_groupe = exo.cabestan_grouping_type AND Gamme.code_gamme = exo.cabestan_gamme_code
;



-- MVP 2 traitement complémentaire

INSERT INTO TABLE ${database_safe}.${table_safe_regroupement}

SELECT
    code_periode,
    libelle_periode,
    'CC',
    'CAP',
    code_gamme,
    libelle_gamme,
    code_marche,
    libelle_marche,
    code_segment,
    libelle_segment,
    code_famille,
    libelle_famille,
    code_produit

FROM ${database_safe}.${table_safe_regroupement} rgpt
LEFT JOIN
    (
    SELECT
        code_pdt_service,
        indic_pac,
        RANK() OVER (PARTITION BY code_pdt_service ORDER BY date_deb_ver DESC) AS rang
    FROM
        ${database_safe}.${table_safe_ver_pdt_service}
    ) Pdt
    ON rgpt.code_produit = Pdt.code_pdt_service AND Pdt.rang = 1

WHERE rgpt.code_type_rgpt = '02' AND (Pdt.indic_pac = "1" OR rgpt.code_gamme="1055")
;
