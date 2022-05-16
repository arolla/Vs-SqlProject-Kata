# Kata SQL Project

## Prérequis

Avoir un SQL Server installé en local. [Edition Developer](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).

## Scenario

Projet legacy avec une base de données existante. On veut automatiser les déploiements SQL.

On a un site de eCommerce qui vend des ordinateurs. On veut ajouter un systéme de notation sur les produits.

## Déroulé de la formation

### Etat initial

- Récupérer le répo existant.
- Se positionner sur le tag "00-db-init"
- Raconter :

  - Il y a un ensemble de scripts SQL versionnés par des timestamp qui servent à déployer la base
  - On veut changer ça et avoir un vrai système moderne
  - Exemple :
    - on fait l'init de base avec "0-init-db.sql"
    - on applique "20220516-AddOrderTotal.sql"

- Lancer les 2 scripts d'init pour avoir la base de données existante

On constate que le versioning git vaut é peu prés un versionning sur systéme de fichier.
La procédure de déploiement demande de se rappeler de ce qui a été déployé ou pas, et s'assurer que tout est fait dans le bon ordre.

### Nouvelle fonctionnalité: notation des produits

Un client doit pouvoir laisser une note et un commentaire sur un produit.

- Ajout de la table comments avec fk vers product et Customer (contrainte d'unicité du commentaire sur le produit ?)
- Mise à jour de la BDD.

bonnes pratiques à mettre en place:

- faire un point de sauvegarde de sa base locale
- toujours tester en local ( scripts dans ssms lors de l'écriture )
- tester plusieurs redéploiements
- tant que le déploiement ne fonctionne pas: recharger le point de sauvegarde et relancer
- vérifier que les scripts sont publiables plusieurs fois (ex: checker existance table avant DELETE)

### Refacto: modifier le référentiel de méthodes de paiement

- utiliser un couple clef/valeur
- passer par scripts pré / post deployment
- mettre à jour les tables et les valeurs

bonnes pratiques à mettre en place:

- Techniques pour ne pas se faire avoir par les suppressions de données qui empêchent le déploiement.
