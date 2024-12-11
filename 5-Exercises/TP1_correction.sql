-- 1. Créer une base de données
CREATE DATABASE Entreprise;
USE Entreprise;

-- 2. Ajouter une table Employes
CREATE TABLE Employes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    age INT,
    poste VARCHAR(50)
);

-- 3. Insérer des données
INSERT INTO Employes (nom, age, poste) 
VALUES 
    ('Alice Dupont', 35, 'Manager'),
    ('Jean Martin', 29, 'Développeur'),
    ('Lucie Durand', 40, 'Directrice'),
    ('Paul Morel', 25, 'Analyste'),
    ('Emma Thomas', 32, 'Comptable');

-- 4. Rechercher les employés ayant un âge supérieur à 30 ans
SELECT * FROM Employes WHERE age > 30;

-- 5. Mettre à jour le poste d’un employé spécifique
UPDATE Employes SET poste = 'Senior Développeur' WHERE nom = 'Jean Martin';

-- 6. Supprimer un employé par son id
DELETE FROM Employes WHERE id = 4;
