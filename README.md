# To-Do List Application

## Introduction
Cette application est une application de bureau multiplateforme développée en utilisant Qt et QML. Elle est conçue pour aider les utilisateurs à gérer leurs tâches quotidiennes de manière simple, intuitive et efficace.

## Fonctionnalités Principales

### Gestion des Tâches
- **Organisation par catégories** :
  - "Aujourd'hui"
  - "Cette semaine"
  - "Plus tard"
- **Ajout de tâches** : L'utilisateur peut ajouter une tâche dans l'une de ces trois catégories en fonction de la date choisie.
- **Restrictions** : Il n'est pas possible d'ajouter des tâches pour des dates passées.

### Vue des Paramètres
- **Changer le thème** : Basculer entre le mode clair et le mode sombre.
- **Changer la taille de la police** : Ajuster la taille du texte dans l'application.
- **Retirer les tâches complétées** : Supprimer toutes les tâches marquées comme complétées.
- **Limiter le nombre de tâches** : Définir un nombre maximum de tâches par catégorie.
- **Navigation** : Cliquer sur chaque paramètre amène l'utilisateur à une page dédiée pour modifier le paramètre.

### Ajout et Gestion des Tâches
- **Bandeau d'ajout rapide** : Un bandeau permet d'ajouter une nouvelle tâche pour le jour même en spécifiant seulement un nom.
- **Bouton d'ajout de tâche** : Présent sur l'interface principale pour permettre la création de nouvelles tâches.
- **Marquage des tâches** : Chaque tâche comporte une checkbox pour la marquer comme complétée, avec un changement visuel lorsqu'elle est cochée.
- **Édition des tâches** : Cliquer sur une tâche existante permet de l'éditer.

### Détails de l'Ajout de Tâche
- **Nom de la tâche** : Ajouter un nom à la tâche.
- **Sélection de la date** : Utiliser un composant dédié pour choisir la date.
- **Sélection de l'heure** : Utiliser un composant dédié pour choisir l'heure.
- **Ajout de précisions** : Ajouter des détails dans un champ de texte multi-ligne, avec un bouton "finished editing" pour terminer l'édition.

## Installation
