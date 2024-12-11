# Différence entre LMD et LDD

| **Aspect**              | **LMD (DML)**                         | **LDD (DDL)**                       |
|--------------------------|----------------------------------------|--------------------------------------|
| **But**                 | Manipuler les données existantes.      | Définir ou modifier la structure.    |
| **Commandes typiques**  | INSERT, SELECT, UPDATE, DELETE         | CREATE, ALTER, DROP, TRUNCATE        |
| **Impact**              | Agit sur les lignes de la table.       | Affecte la structure de la table.    |
| **Rollback**            | Peut être annulé (avec ROLLBACK).      | Ne peut pas toujours être annulé.    |

## Lien entre LMD et LDD

Le **LDD** est utilisé pour créer l'infrastructure de la base de données, comme les tables et les colonnes. Une fois cette structure en place, le **LMD** est utilisé pour manipuler les données à l'intérieur de cette infrastructure.

### Exemple pratique
1. **Définir une structure avec le LDD** :
    ```sql
    CREATE TABLE Utilisateurs (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nom VARCHAR(100),
        email VARCHAR(255)
    );
    ```

2. **Manipuler les données avec le LMD** :
    ```sql
    INSERT INTO Utilisateurs (nom, email) VALUES ('Alice', 'alice@example.com');
    SELECT * FROM Utilisateurs;
    ```

