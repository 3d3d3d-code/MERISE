use tp_agence_voyages;


-- Créer les vues répondant aux demandes suivantes :
-- SELECT*FROM CITIES INNER JOIN COUNTRIES ;
-- 1) Afficher les informations de toutes les villes (informations du pays incluses)
DROP VIEW IF EXISTS view_cities ;

CREATE VIEW view_cities
AS
SELECT cities.*,countries.country_name
from countries
JOIN cities ON cities.country_code = countries.country_code ;






-- NDROP VIEW IF EXISTS info_countries;
  -- Create view info_countries as 

-- 2) Afficher les noms, prénoms, email de tous les clients qui ont réservé au moins 1 voyage. 
--    On a besoin de connaitre le titre du voyage ainsi que le pays de destination

  CREATE VIEW order_info
  AS SELECT client_lastname,client_firstname, client_email,trip_title,country_name
  FROM clients  JOIN orders  ON clients.client_id=orders.client_id  ;

    





 
 
 
 
 
 



-- 3) Créer la vue permettant d'afficher :
--     Toutes les informations d'un client (sauf son mot de passe)
--     Le  nom de son commercial associé
--     Le nombre de voyages qu'il a commandé ET payé
--     La destination de son dernier voyage (ville + pays)

