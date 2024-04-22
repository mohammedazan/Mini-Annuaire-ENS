## Mini Annuaire de l'ENS - Application Web Java EE

Ce projet consiste à développer une application Web en Java EE qui simule l'accès à un annuaire de l'ENS (École Normale Supérieure). L'application utilise la technologie JSP (JavaServer Pages) pour créer une architecture 3-tiers (MVC) et se connecte à une base de données MySQL via JDBC (Java Database Connectivity).

## Objectifs

- Développer une application Web Java (3-tier) en utilisant la technologie JSP.
- Assurer la connexion à une base de données Oracle par l'intermédiaire d'un driver JDBC.

## Description de l'application

L'application offre les fonctionnalités suivantes :

- Consultation de l'annuaire de l'ENS via une interface Web.
- Stockage des données dans une base de données MySQL.
- Gestion des étudiants, des départements et des filières.
- Menu Utilisation : permet d'afficher la liste des étudiants, des départements et des filières, ainsi que de rechercher un étudiant, un département ou une filière.
- Menu Administration : permet d'insérer un nouvel étudiant, un nouveau département ou une nouvelle filière.

## Travail à réaliser

Le travail à réaliser comprend deux étapes :

1. Création de la base de données.
2. Test de la connexion avec la base de données.

Pour la création de la base de données, veuillez vous connecter à votre compte MySQL et exécuter les commandes suivantes :

- Création de la table "étudiant".
- Création de la table "département".
- Création de la table "filière".
- Insertion de quelques données pour remplir la base.

Les fonctionnalités à développer sont présentes dans la page d'accueil de l'application et comprennent la recherche d'un étudiant dans l'annuaire, l'affichage des départements et des filières, ainsi que l'insertion de nouveaux étudiants, départements et filières.

## Instructions pour l'exécution

Pour exécuter l'application, suivez les étapes suivantes :

1. Déployez le fichier WAR généré dans un conteneur de servlets tel que Apache Tomcat.
2. Accédez à l'application via l'URL appropriée dans votre navigateur Web.
3. Vous pouvez maintenant utiliser les fonctionnalités de l'application comme décrit dans la page d'accueil.

## Structure du Projet

- **/src/main/java**: Contient les fichiers Java de l'application.
- **/webapp**: Contient les fichiers JSP et HTML de l'application.
- **annuaire_ens**: Fichier Deployment Descriptor de l'application.

Pour plus d'informations sur les fonctionnalités spécifiques de l'application et les étapes de développement, veuillez consulter le fichier de spécifications du projet.
