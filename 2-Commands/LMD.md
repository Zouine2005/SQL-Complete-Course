# LMD (Langage de Manipulation des Données)

## Introduction
Le LMD (ou **DML**, *Data Manipulation Language* en anglais) est utilisé pour manipuler les données dans une base de données existante. Il permet :

- D’insérer des données.
- De mettre à jour des données.
- De supprimer des données.
- De lire des données.

## Commandes principales du LMD

### INSERT : Ajouter de nouvelles données
Cette commande permet d’ajouter de nouvelles lignes dans une table.

**Syntaxe** :
```sql
INSERT INTO NomTable (colonne1, colonne2) VALUES ('valeur1', 'valeur2');
```

### SELECT : Lire ou récupérer des données
Cette commande permet de lire ou d’extraire des données d’une table.

**Syntaxe** :
```sql
SELECT colonne1, colonne2
FROM NomTable
WHERE condition;
```

### UPDATE : Modifier des données existantes
Cette commande est utilisée pour mettre à jour des données dans une table.

**Syntaxe** :
```sql
UPDATE NomTable
SET colonne1 = 'nouvelle_valeur'
WHERE condition;
```

### DELETE : Supprimer des données
Cette commande permet de supprimer des lignes d’une table.

**Syntaxe** :
```sql
DELETE FROM NomTable
WHERE condition;
```

## Exemple pratique

### Ajouter un nouvel utilisateur
```sql
INSERT INTO Utilisateurs (nom, age)
VALUES ('zoro', 20);
```

### Récupérer tous les utilisateurs ayant plus de 25 ans
```sql
SELECT *
FROM Utilisateurs
WHERE age > 25;
```

