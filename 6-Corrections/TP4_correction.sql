-- 1. Créer une procédure stockée AjouterEmploye
DELIMITER //
CREATE PROCEDURE AjouterEmploye(IN nom VARCHAR(100), IN age INT, IN poste VARCHAR(50))
BEGIN
    INSERT INTO Employes (nom, age, poste) VALUES (nom, age, poste);
END //
DELIMITER ;

-- Appeler la procédure
CALL AjouterEmploye('Sophie Martin', 28, 'Designer');

-- 2. Créer une fonction CalculerPrime
DELIMITER //
CREATE FUNCTION CalculerPrime(salaire FLOAT) RETURNS FLOAT
BEGIN
    RETURN salaire * 0.10;
END //
DELIMITER ;

-- Utiliser la fonction
SELECT nom, CalculerPrime(3000) AS prime FROM Employes;
