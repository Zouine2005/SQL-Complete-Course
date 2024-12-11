# LDD (Langage de Définition des Données)

## Introduction
Le LDD (ou **DDL**, *Data Definition Language* en anglais) est utilisé pour définir ou modifier la structure des objets d'une base de données, tels que les tables, les colonnes ou les relations.

## Commandes principales du LDD

### CREATE : Créer une nouvelle table ou base de données
Cette commande permet de créer une nouvelle table, base de données ou tout autre objet.

**Syntaxe** :
```sql
CREATE TABLE NomTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    age INT
);
```

### ALTER : Modifier la structure d'une table existante
Cette commande est utilisée pour modifier une table, comme ajouter ou supprimer des colonnes, ou changer le type de données.

**Syntaxes** :
- Ajouter une colonne :
  ```sql
  ALTER TABLE NomTable ADD email VARCHAR(255);
  ```
- Supprimer une colonne :
  ```sql
  ALTER TABLE NomTable DROP COLUMN age;
  ```

### DROP : Supprimer un objet
Cette commande supprime définitivement une table, une base de données ou un autre objet.

**Syntaxes** :
- Supprimer une table :
  ```sql
  DROP TABLE NomTable;
  ```
- Supprimer une base de données :
  ```sql
  DROP DATABASE NomBase;
  ```

### TRUNCATE : Vider une table
Cette commande supprime toutes les données d'une table tout en conservant sa structure.

**Syntaxe** :
```sql
TRUNCATE TABLE NomTable;
```

## Exemple pratique

### Créer une table pour gérer les produits
```sql
CREATE TABLE Produits (
    id_produit INT AUTO_INCREMENT PRIMARY KEY,
    nom_produit VARCHAR(100),
    prix FLOAT
);
```

### Ajouter une nouvelle colonne à cette table
```sql
ALTER TABLE Produits ADD quantite_stock INT;
```

### Supprimer définitivement la table
```sql
DROP TABLE Produits;
```

