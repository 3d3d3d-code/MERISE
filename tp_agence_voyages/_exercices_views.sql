use tp_agence_voyages;


-- Créer les vues répondant aux demandes suivantes :


-- 1) Afficher les informations de toutes les villes (informations du pays incluses)


CREATE VIEW CITIES_SEE(citiy_code,city_name) AS SELECT *FROM CITIES INNER JOIN COUNTRIES



-- NDROP VIEW IF EXISTS info_countries;
  -- Create view info_countries as 

-- 2) Afficher les noms, prénoms, email de tous les clients qui ont réservé au moins 1 voyage. 
--    On a besoin de connaitre le titre du voyage ainsi que le pays de destination



-- 3) Créer la vue permettant d'afficher :
--     Toutes les informations d'un client (sauf son mot de passe)
--     Le  nom de son commercial associé
--     Le nombre de voyages qu'il a commandé ET payé
--     La destination de son dernier voyage (ville + pays)

