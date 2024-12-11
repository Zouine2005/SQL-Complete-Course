# Fonctions en SQL

## Introduction
Les fonctions SQL sont des blocs de code prédéfinis ou définis par l'utilisateur qui prennent des paramètres en entrée, effectuent une opération et retournent une valeur unique. Contrairement aux procédures, une fonction doit obligatoirement retourner une valeur.

## Types de fonctions
1. **Fonctions prédéfinies** : Intégrées au système de gestion de base de données (par ex. COUNT, SUM, AVG).
2. **Fonctions définies par l'utilisateur (UDF)** : Créées pour des besoins spécifiques.

## Création d’une fonction définie par l’utilisateur

### Syntaxe
```sql
CREATE FUNCTION NomFonction (
    param1 Type,
    param2 Type
) RETURNS TypeRetour
BEGIN
    -- Corps de la fonction
    RETURN valeur;
END;
```

### Exemple
Créons une fonction pour calculer la TVA d'un prix :

```sql
CREATE FUNCTION CalculerTVA (
    prix FLOAT,
    taux FLOAT
) RETURNS FLOAT
BEGIN
    RETURN prix * (taux / 100);
END;
```

## Utilisation d'une fonction
Les fonctions peuvent être utilisées dans des requêtes SQL comme une expression.

### Exemple
Appelons la fonction `CalculerTVA` :
```sql
SELECT nom_produit, prix, CalculerTVA(prix, 20) AS tva
FROM Produits;
```

## Avantages des fonctions
- **Modularité** : Le code peut être réutilisé facilement.
- **Lisibilité** : Simplifie les requêtes complexes en les encapsulant dans une fonction.
- **Maintenance** : Le changement dans la logique de la fonction est automatiquement répercuté partout où elle est utilisée.

## Comparaison avec les procédures
| **Aspect**               | **Fonction**                              | **Procédure**                        |
|---------------------------|-------------------------------------------|---------------------------------------|
| **Retourne une valeur**  | Oui                                       | Non                                   |
| **Utilisation dans SELECT** | Oui                                       | Non                                   |
| **Paramètres**            | IN uniquement                             | IN, OUT, INOUT                       |
| **Complexité**            | Idéal pour des opérations simples         | Adapté pour des opérations complexes |

## Modification d’une fonction
Pour modifier une fonction, vous devez la supprimer puis la recréer.

### Suppression d’une fonction
```sql
DROP FUNCTION IF EXISTS NomFonction;
```

### Exemple pratique
Créons une fonction pour convertir une température de Celsius à Fahrenheit :

```sql
CREATE FUNCTION ConvertirCelsiusFahrenheit (
    celsius FLOAT
) RETURNS FLOAT
BEGIN
    RETURN (celsius * 9 / 5) + 32;
END;
```

Utilisation :
```sql
SELECT ConvertirCelsiusFahrenheit(25) AS fahrenheit;
```

## Bonnes pratiques
1. Utiliser des noms explicites pour décrire la fonction et ses paramètres.
2. Tester avec plusieurs jeux de données pour vérifier la robustesse de la fonction.
3. Documenter la logique de la fonction via des commentaires dans le code.

Les fonctions SQL sont des outils puissants pour rationaliser et centraliser les opérations dans une base de données tout en améliorant la lisibilité et la maintenance du code.

