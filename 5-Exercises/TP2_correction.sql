-- 1. Créer une table Projets
CREATE TABLE Projets (
    id_projet INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100),
    budget FLOAT
);

-- 2. Ajouter une table de liaison Employes_Projets
CREATE TABLE Employes_Projets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    id_projet INT,
    FOREIGN KEY (id_employe) REFERENCES Employes(id),
    FOREIGN KEY (id_projet) REFERENCES Projets(id_projet)
);

-- 3. Insérer des données dans les tables
INSERT INTO Projets (titre, budget) 
VALUES ('Projet Alpha', 50000), 
       ('Projet Beta', 75000);

INSERT INTO Employes_Projets (id_employe, id_projet) 
VALUES (1, 1), (2, 1), (3, 2);

-- 4. Récupérer les projets auxquels chaque employé participe
SELECT e.nom, p.titre 
FROM Employes e
JOIN Employes_Projets ep ON e.id = ep.id_employe
JOIN Projets p ON ep.id_projet = p.id_projet;
