use tp_agence_voyages;

TRUNCATE TABLE notes;
SELECT * FROM consumes;
SELECT * FROM notes;

CALL add_note(1, 1, 1, 8);

CALL add_note(1, 3, 1, 8);


SELECT COUNT(*) as nombre
    FROM consumes WHERE client_id=1 AND service_code=3;
    
