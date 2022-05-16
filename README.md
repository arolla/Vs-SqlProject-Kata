# Database deployment

## Scenarios

2 possibilit�s : 

* Avec une base de donn�es existante � versionner
* Sans base de donn�es (from scratch)

## Pr�requis

Avoir un SQL Server install� en local. Edition Developer fonctionne bien : https://www.microsoft.com/en-us/sql-server/sql-server-downloads

## Scenario

Projet legacy avec une base de donn�es existante. On veut automatiser les d�ploiements SQL.

On a un site de eCommerce qui vend des ordinateurs. On veut ajouter un syst�me de notation sur les produits.

## D�roul� de la formation

* R�cup�rer le r�po existant.
* Se posiitonner sur le tag "0-init"? (name to be redefined).
* Raconter :
  * Il y a un ensemble de scripts SQL versionn�s par des timestamp qui servent � d�ployer la base
  * On veut changer �a et avoir un vrai syst�me moderne
* Lancer le script d'init pour avoir la base de donn�es existante

Premi�re �tape : on extrait le sch�ma de la base de donn�es sous un SQL Project.

* Lancer Visual studio, cr�er un projet
* Se connecter � la base existante, copier le sch�ma de la base (schema compare)

=> Tag: 1-extracted-as-is

Seconde �tape : tuning des param�tres du projet ? Attention au loup, si on fait l'op�ration sur une base en local, ses param�tres ne seront pas les m�mes qu'une base de prod (onprem ou cloud).

Etape 3 : Cr�er un pipeline Azure DevOps pour d�ployer la base

Choses � montrer :

* G�n�rer le script et le v�rifier � l'oeil
* V�rifier l'impact sans ex�cuter la migration

Etape 4 : Param�trage du pipeline

* Block on possible dataloss
* Drop objects not in source

Etape 5 : Extraire les valeurs r�f�rentielles

* Cr�er un script PostDeploy

Etape 6 : Ajouter des tables et d�ployer

Etape 7 : Renommer / supprimer des tables

## ToDo

* Cr�er la base existante et extraire les scripts
* Documenter la manip d'extraction.

### later

* Cr�er une infra de d�mo dans le cloud ?
* R�diger un sc�nario de d�mo
* Ajouter bonnes pratiques
  * Pre post deploy rejouables
  * Config de base de donn�es
  * Emp�cher la suppression de donn�es et comment g�rer une suppression de table?
  * Compiler le projet pour v�riifer les incoh�rences