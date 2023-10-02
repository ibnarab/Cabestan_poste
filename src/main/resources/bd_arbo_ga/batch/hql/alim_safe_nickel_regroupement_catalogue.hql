-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_regroupement_catalogue}

SELECT
    REGROUPEMENT.code_periode       ,
    REGROUPEMENT.libelle_periode    ,
    REGROUPEMENT.code_type_rgpt     ,
    REGROUPEMENT.libelle_type_rgpt  ,
    REGROUPEMENT.code_gamme         ,
    REGROUPEMENT.libelle_gamme      ,
    REGROUPEMENT.code_marche        ,
    REGROUPEMENT.libelle_marche     ,
    REGROUPEMENT.code_segment       ,
    REGROUPEMENT.libelle_segment    ,
    REGROUPEMENT.code_famille       ,
    REGROUPEMENT.libelle_famille    ,
    CATALOGUE.code_produit          ,
    CATALOGUE.libelle_produit       ,
    CATALOGUE.indic_service         ,
    CATALOGUE.indic_pac             ,
    CATALOGUE.date_pdt_deb_ver      ,
    CATALOGUE.date_pdt_arret        ,
    CATALOGUE.date_pdt_fin_pilot    ,
    CATALOGUE.code_ss_pdt           ,
    CATALOGUE.libelle_ss_pdt        ,
    CATALOGUE.code_article          ,
    CATALOGUE.libelle_article       ,
    CATALOGUE.code_pdt_filiale      ,
    CATALOGUE.code_type_filiale     ,
    CATALOGUE.libelle_type_filiale

FROM
	${database_safe}.${table_safe_catalogue} CATALOGUE
INNER JOIN
	${database_safe}.${table_safe_regroupement} REGROUPEMENT ON REGROUPEMENT.code_produit = CATALOGUE.code_produit
;
