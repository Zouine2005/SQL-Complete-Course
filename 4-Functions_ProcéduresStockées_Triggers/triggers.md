# Triggers en SQL

## Introduction
Les triggers (ou déclencheurs) sont des objets de base de données qui s'exécutent automatiquement en réponse à un événement spécifique (INSERT, UPDATE, DELETE) sur une table. Ils permettent de contrôler ou d'automatiser des actions en fonction des modifications de données.

## Syntaxe de création

```sql
CREATE TRIGGER NomTrigger
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON NomTable
FOR EACH ROW
BEGIN
    -- Corps du trigger
END;
```

### Exemple 1 : Création d'un log après insertion
Créons un trigger qui enregistre chaque nouvelle ligne ajoutée dans une table `Logs`.

#### Script :
```sql
CREATE TRIGGER LogInsertion
AFTER INSERT ON Utilisateurs
FOR EACH ROW
BEGIN
    INSERT INTO Logs (description, date_action)
    VALUES (CONCAT('Nouvel utilisateur : ', NEW.nom), NOW());
END;
```

### Explications :
- **AFTER INSERT** : Le trigger se déclenche après une insertion.
- **NEW.nom** : Permet d'accéder aux valeurs insérées.
- **Logs** : Table utilisée pour stocker l'historique des actions.

### Exemple 2 : Vérification avant mise à jour
Implémentons un trigger qui empêche de réduire un salaire en dessous d'un certain seuil lors d'une mise à jour.

#### Script :
```sql
CREATE TRIGGER VerifierSalaire
BEFORE UPDATE ON Employes
FOR EACH ROW
BEGIN
    IF NEW.salaire < 1500 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le salaire ne peut pas être inférieur à 1500';
    END IF;
END;
```

### Explications :
- **BEFORE UPDATE** : Le trigger se déclenche avant la modification.
- **NEW.salaire** : Représente la nouvelle valeur proposée.
- **SIGNAL** : Permet de lever une erreur si la condition est remplie.

## Types de triggers
1. **BEFORE triggers** : S'exécutent avant l'action (utile pour validation ou modification de données).
2. **AFTER triggers** : S'exécutent après l'action (utile pour journalisation ou actions dépendantes).

## Suppression d'un trigger
Pour supprimer un trigger, utilisez la commande suivante :
```sql
DROP TRIGGER IF EXISTS NomTrigger;
```

## Utilisations courantes
1. **Audit** : Suivi des modifications des données.
2. **Validation** : Vérification des règles métier avant des opérations.
3. **Synchronisation** : Mise à jour automatique des données liées.

### Exemple pratique : Synchronisation de stock
Créons un trigger qui met à jour automatiquement le stock d'un produit lors de la suppression d'une commande.

#### Script :
```sql
CREATE TRIGGER MettreAJourStock
AFTER DELETE ON Commandes
FOR EACH ROW
BEGIN
    UPDATE Produits
    SET stock = stock + OLD.quantite
    WHERE id_produit = OLD.id_produit;
END;
```

### Explications :
- **AFTER DELETE** : Déclenché après la suppression d'une commande.
- **OLD.quantite** : Accède à l'ancienne valeur avant la suppression.

## Bonnes pratiques
1. **Minimalisme** : Évitez d'avoir des triggers trop complexes pour conserver des performances optimales.
2. **Documentation** : Décrivez clairement la logique des triggers pour faciliter la maintenance.
3. **Tests approfondis** : Vérifiez les effets sur les performances et sur l'intégrité des données.

Les triggers sont un excellent outil pour automatiser des tâches répétitives ou garantir l'intégrité des données dans votre base. Cependant, leur utilisation doit être mesurée pour éviter des comportements imprévus ou des conflits avec d'autres processus.

