# Procédures Stockées en SQL

## Introduction
Une procédure stockée est un ensemble de commandes SQL précompilées, stockées et exécutées directement sur le serveur de la base de données. Elles permettent de réaliser des opérations complexes de manière efficace et réutilisable.

## Avantages des procédures stockées
- **Performance** : Réduction des allers-retours entre l’application et la base de données.
- **Réutilisabilité** : Une procédure peut être appelée plusieurs fois dans différents contextes.
- **Sécurité** : Les utilisateurs peuvent exécuter une procédure sans accès direct aux tables sous-jacentes.
- **Maintenance** : Simplifie la gestion des opérations complexes.

## Création d’une procédure stockée

### Syntaxe générale
```sql
DELIMITER $$
CREATE PROCEDURE NomProcedure (
    IN param1 Type,
    OUT param2 Type
)
BEGIN
    -- Bloc de commandes SQL
END$$
DELIMITER ;
```

### Exemple
Créons une procédure pour ajouter un utilisateur dans une table `Utilisateurs` :

```sql
DELIMITER $$
CREATE PROCEDURE AjouterUtilisateur (
    IN nom VARCHAR(100),
    IN email VARCHAR(255)
)
BEGIN
    INSERT INTO Utilisateurs (nom, email, date_inscription)
    VALUES (nom, email, CURDATE());
END$$
DELIMITER ;
```

## Exécution d’une procédure

### Syntaxe
```sql
CALL NomProcedure(param1, param2, ...);
```

### Exemple
Appelons la procédure `AjouterUtilisateur` :
```sql
CALL AjouterUtilisateur('Alice', 'alice@example.com');
```

## Utilisation des paramètres IN, OUT et INOUT
- **IN** : Paramètre d’entrée (valeur passée à la procédure).
- **OUT** : Paramètre de sortie (valeur retournée par la procédure).
- **INOUT** : Paramètre d’entrée et de sortie.

### Exemple avec OUT
Procédure pour compter les utilisateurs :
```sql
DELIMITER $$
CREATE PROCEDURE CompterUtilisateurs (
    OUT total INT
)
BEGIN
    SELECT COUNT(*) INTO total FROM Utilisateurs;
END$$
DELIMITER ;
```

Appel de la procédure :
```sql
CALL CompterUtilisateurs(@total);
SELECT @total;
```

## Modification d’une procédure
Pour modifier une procédure existante, il faut la supprimer puis la recréer.

### Suppression d'une procédure
```sql
DROP PROCEDURE IF EXISTS NomProcedure;
```

## Bonnes pratiques
1. Utiliser des noms descriptifs pour les procédures et les paramètres.
2. Ajouter des commentaires pour expliquer les opérations complexes.
3. Tester les procédures avec différents cas avant de les déployer.
4. Protéger les procédures sensibles avec des droits d’accès appropriés.

Avec les procédures stockées, vous pouvez centraliser la logique des opérations complexes directement au niveau de la base de données pour une gestion optimisée.

