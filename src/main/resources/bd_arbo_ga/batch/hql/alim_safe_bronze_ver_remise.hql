-- TRUNCATE TABLE fait dans le lanceur safe

INSERT INTO TABLE ${database_safe}.${table_safe_ver_remise}
SELECT

    CASE WHEN TRIM(code_type_enregist)           = '' THEN NULL ELSE TRIM(code_type_enregist)                                                                                                   END AS code_type_enregist           ,
    CASE WHEN TRIM(code_remise)                  = '' THEN NULL ELSE TRIM(code_remise)                                                                                                          END AS code_remise                  ,
    CASE WHEN TRIM(libelle_ver_remise)           = '' THEN NULL ELSE TRIM(libelle_ver_remise)                                                                                                   END AS libelle_ver_remise           ,
    CASE WHEN TRIM(date_deb_ver_remise)          = '' THEN NULL ELSE CONCAT(substr(date_deb_ver_remise, 7, 4), '-', substr(date_deb_ver_remise, 4, 2), '-', substr(date_deb_ver_remise, 1, 2))  END AS date_deb_ver_remise          ,
    CASE WHEN TRIM(code_type_remise)             = '' THEN NULL ELSE TRIM(code_type_remise)                                                                                                     END AS code_type_remise             ,
    CASE WHEN TRIM(code_group_remise)            = '' THEN NULL ELSE TRIM(code_group_remise)                                                                                                    END AS code_group_remise            ,
    CASE WHEN TRIM(code_imput_comptable)         = '' THEN NULL ELSE TRIM(code_imput_comptable)                                                                                                 END AS code_imput_comptable         ,
    CASE WHEN TRIM(code_imput_comptable_vad)     = '' THEN NULL ELSE TRIM(code_imput_comptable_vad)                                                                                             END AS code_imput_comptable_vad     ,
    CASE WHEN TRIM(code_imput_comptable_equinox) = '' THEN NULL ELSE TRIM(code_imput_comptable_equinox)                                                                                         END AS code_imput_comptable_equinox ,
    CASE WHEN TRIM(code_assiete_remise)          = '' THEN NULL ELSE TRIM(code_assiete_remise)                                                                                                  END AS code_assiete_remise          ,
    CASE WHEN TRIM(code_unit_remise)             = '' THEN NULL ELSE TRIM(code_unit_remise)                                                                                                     END AS code_unit_remise             ,
    CASE WHEN TRIM(code_mod_aff)                 = '' THEN NULL ELSE TRIM(code_mod_aff)                                                                                                         END AS code_mod_aff                 ,
    CASE WHEN TRIM(code_tva)                     = '' THEN NULL ELSE TRIM(code_tva)                                                                                                             END AS code_tva                     ,
    CASE WHEN TRIM(code_niv_prio)                = '' THEN NULL ELSE TRIM(code_niv_prio)                                                                                                        END AS code_niv_prio                ,
    CAST(val_borne_min AS DECIMAL(18, 5))                                                                                                                                                           AS val_borne_min                ,
    CAST(val_borne_max AS DECIMAL(18, 5))                                                                                                                                                           AS val_borne_max                ,
    CAST(val_fixe AS DECIMAL(18, 5))                                                                                                                                                                AS val_fixe                     ,
    CAST(mt_seuil_min AS INT)                                                                                                                                                                       AS mt_seuil_min                 ,
    CAST(mt_seuil_max AS INT)                                                                                                                                                                       AS mt_seuil_max                 ,
    CASE WHEN TRIM(indic_particip_calcul_ca)     = '' THEN NULL ELSE TRIM(indic_particip_calcul_ca)                                                                                             END AS indic_particip_calcul_ca     ,
    CASE WHEN TRIM(date_arret_remise)            = '' THEN NULL ELSE CONCAT(substr(date_arret_remise, 7, 4), '-', substr(date_arret_remise, 4, 2), '-', substr(date_arret_remise, 1, 2))        END AS date_arret_remise            ,
    CASE WHEN TRIM(code_art_pilotage)            = '' THEN NULL ELSE TRIM(code_art_pilotage)                                                                                                    END AS code_art_pilotage            ,
    CASE WHEN TRIM(code_tag_remise)              = '' THEN NULL ELSE TRIM(code_tag_remise)                                                                                                      END AS code_tag_remise              ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_32}
;
