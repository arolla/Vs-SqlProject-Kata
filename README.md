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

- Créer un projet de base de données
- Lancer une comparaison de shémas avec la BDD existante
!()[./Screenshots/launch_schemas_compare.png]
!()[./Screenshots/select_database_for_comparison.png]
!()[./Screenshots/select_project_for_comparison.png]
!()[./Screenshots/source_and_destination_for_schemas_comparison.png]
- Mettre à jour le projet de base de données
- Lancer une comparaison de données:
!()[./Screenshots/launch_data_comparison.png]
  - Repérer les tables référentiel.
  - Créer des scripts d'insertion de données de référentiel
- Ajouter un script de post deployment
  - Ajouter les scripts de données de référentiel
- Publier le projet sur une nouvelle BDD.
- comparer la base originale et la nouvelle base.
