-- 1. Créer un trigger pour enregistrer les modifications
CREATE TABLE HistoriqueEmployes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    operation VARCHAR(50),
    date_operation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_employe INT
);

DELIMITER //
CREATE TRIGGER LogModification
AFTER UPDATE ON Employes
FOR EACH ROW
BEGIN
    INSERT INTO HistoriqueEmployes (operation, id_employe) 
    VALUES ('UPDATE', OLD.id);
END //
DELIMITER ;

-- Modifier un employé pour tester
UPDATE Employes SET poste = 'Directeur IT' WHERE id = 1;

-- 2. Configurer des privilèges
GRANT SELECT, INSERT ON Entreprise.* TO 'user1'@'localhost' IDENTIFIED BY 'password';

-- 3. Créer un index
CREATE INDEX idx_nom ON Employes(nom);
