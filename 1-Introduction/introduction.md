# Introduction à SQL

## 1. Introduction à SQL
SQL (Structured Query Language) est un langage standard utilisé pour interagir avec les bases de données relationnelles. Il permet de :

- Créer et gérer des bases de données et des tables.
- Insérer, modifier, supprimer, et lire des données.
- Effectuer des opérations avancées comme des jointures, des agrégations, etc.
- SGBD populaires : MySQL, PostgreSQL, Oracle, SQL Server, SQLite.

## 2. Les Bases de Données Relationnelles

- **Base de données** : Un ensemble de tables organisées.
- **Table** : Structure contenant des lignes (enregistrements) et des colonnes (champs).
- **Clé primaire (Primary Key)** : Identifiant unique pour chaque ligne d’une table.
- **Clé étrangère (Foreign Key)** : Lien entre deux tables.

## 3. Types de données courants

| Type       | Description                      |
|------------|----------------------------------|
| INT        | Nombres entiers                  |
| FLOAT      | Nombres à virgule flottante      |
| VARCHAR(n) | Texte (longueur max n)           |
| TEXT       | Texte long                       |
| DATE       | Dates (YYYY-MM-DD)               |
| BOOLEAN    | Valeur booléenne (TRUE / FALSE) |

## 4. Commandes SQL de Base

### 4.1. Manipulation de la base de données
```sql
CREATE DATABASE NomBase;   -- Crée une nouvelle base
USE NomBase;               -- Sélectionne une base de données
DROP DATABASE NomBase;     -- Supprime une base de données
```

### 4.2. Création de tables
```sql
CREATE TABLE NomTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    date_naissance DATE
);
```

### 4.3. Insertion de données
```sql
INSERT INTO NomTable (nom, date_naissance)
VALUES ('zoro', '2005-05-15');
```

### 4.4. Lecture de données
```sql
SELECT * FROM NomTable;                     -- Toutes les colonnes
SELECT nom, date_naissance FROM NomTable;   -- Colonnes spécifiques
```

### 4.5. Mise à jour de données
```sql
UPDATE NomTable
SET nom = 'zoro'
WHERE id = 1;
```

### 4.6. Suppression de données
```sql
DELETE FROM NomTable WHERE id = 1;
```

## 5. Clauses et Opérations

### 5.1. Filtres avec WHERE
```sql
SELECT * FROM NomTable WHERE nom = 'zoro';
```

### 5.2. Opérateurs

| Opérateur | Description             |
|------------|-------------------------|
| =          | Égal                  |
| > / <      | Plus grand / Plus petit |
| LIKE       | Recherche avec motif (%)|
| BETWEEN    | Entre deux valeurs      |
| IN         | Valeurs spécifiques     |

**Exemple** :
```sql
SELECT * FROM NomTable WHERE date_naissance BETWEEN '1990-01-01' AND '2000-12-31';
```

### 5.3. Classement et Limitation
```sql
SELECT * FROM NomTable ORDER BY date_naissance DESC;  -- Tri descendant
SELECT * FROM NomTable LIMIT 5;                       -- Limite à 5 lignes
```

## 6. Jointures

Les jointures relient plusieurs tables.

### 6.1. Jointure interne (INNER JOIN)
```sql
SELECT t1.nom, t2.date_emprunt
FROM Table1 t1
JOIN Table2 t2 ON t1.id = t2.id_table1;
```

### 6.2. Jointure externe (LEFT JOIN, RIGHT JOIN)
```sql
SELECT t1.nom, t2.date_emprunt
FROM Table1 t1
LEFT JOIN Table2 t2 ON t1.id = t2.id_table1;
```

## 7. Fonctions d’Agrégation

| Fonction  | Description         |
|-----------|---------------------|
| COUNT()   | Compte les lignes   |
| SUM()     | Somme des valeurs   |
| AVG()     | Moyenne             |
| MAX()     | Valeur maximale     |
| MIN()     | Valeur minimale     |

**Exemple** :
```sql
SELECT categorie, COUNT(*) AS nombre
FROM Livres
GROUP BY categorie;
```

## 8. Transactions

Les transactions assurent la cohérence des données.

```sql
START TRANSACTION;
UPDATE Comptes SET solde = solde - 100 WHERE id = 1;
UPDATE Comptes SET solde = solde + 100 WHERE id = 2;
COMMIT;    -- Confirme les modifications
ROLLBACK;  -- Annule les modifications
```

## 9. Sécurité et Index

### 9.1. Indexation
Améliore la performance des requêtes.
```sql
CREATE INDEX idx_nom ON NomTable(nom);
```

### 9.2. Droits d’accès
```sql
GRANT SELECT, INSERT ON NomBase.* TO 'utilisateur'@'localhost' IDENTIFIED BY 'motdepasse';
```

