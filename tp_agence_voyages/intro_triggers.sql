use tp_agence_voyages;

-- déclencheur automatique mise à jour d'un voyage
-- Si le prix a été modifié, vérifier qu'aucune commande n'existe pour ce voyage (le prix ne peut pas être modifié dans ce cas)

DROP TRIGGER IF EXISTS before_update_trip;

DELIMITER $$

CREATE TRIGGER before_update_trip BEFORE INSERT ON trips FOR EACH ROW
BEGIN
	
END$$

DELIMITER ;