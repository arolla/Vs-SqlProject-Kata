# Database deployment

## Scenarios

2 possibilités : 

* Avec une base de données existante à versionner
* Sans base de données (from scratch)

## Prérequis

Avoir un SQL Server installé en local. Edition Developer fonctionne bien : https://www.microsoft.com/en-us/sql-server/sql-server-downloads

## Scenario

Projet legacy avec une base de données existante. On veut automatiser les déploiements SQL.

On a un site de eCommerce qui vend des ordinateurs. On veut ajouter un système de notation sur les produits.

## Déroulé de la formation

* Récupérer le répo existant.
* Se posiitonner sur le tag "0-init"? (name to be redefined).
* Raconter :
  * Il y a un ensemble de scripts SQL versionnés par des timestamp qui servent à déployer la base
  * On veut changer ça et avoir un vrai système moderne
* Lancer le script d'init pour avoir la base de données existante

Première étape : on extrait le schéma de la base de données sous un SQL Project.

* Lancer Visual studio, créer un projet
* Se connecter à la base existante, copier le schéma de la base (schema compare)

=> Tag: 1-extracted-as-is

Seconde étape : tuning des paramètres du projet ? Attention au loup, si on fait l'opération sur une base en local, ses paramètres ne seront pas les mêmes qu'une base de prod (onprem ou cloud).

Etape 3 : Créer un pipeline Azure DevOps pour déployer la base

Choses à montrer :

* Générer le script et le vérifier à l'oeil
* Vérifier l'impact sans exécuter la migration

Etape 4 : Paramétrage du pipeline

* Block on possible dataloss
* Drop objects not in source

Etape 5 : Extraire les valeurs référentielles

* Créer un script PostDeploy

Etape 6 : Ajouter des tables et déployer

Etape 7 : Renommer / supprimer des tables

## ToDo

* Créer la base existante et extraire les scripts
* Documenter la manip d'extraction.

### later

* Créer une infra de démo dans le cloud ?
* Rédiger un scénario de démo
* Ajouter bonnes pratiques
  * Pre post deploy rejouables
  * Config de base de données
  * Empêcher la suppression de données et comment gérer une suppression de table?
  * Compiler le projet pour vériifer les incohérences