-- 1. Calculer le salaire moyen des employés dans chaque département
-- Ajout de la colonne 'departement' dans la table Employes
ALTER TABLE Employes ADD departement VARCHAR(50);
UPDATE Employes 
SET departement = 'IT' WHERE id IN (2, 4);
UPDATE Employes 
SET departement = 'RH' WHERE id IN (1, 3, 5);

SELECT departement, AVG(age) AS age_moyen
FROM Employes
GROUP BY departement;

-- 2. Effectuer des transactions
START TRANSACTION;

-- Transférer un employé d’un projet à un autre
DELETE FROM Employes_Projets WHERE id_employe = 2;
INSERT INTO Employes_Projets (id_employe, id_projet) VALUES (2, 2);

-- Annuler en cas d’erreur
ROLLBACK;

-- Si tout va bien
COMMIT;
