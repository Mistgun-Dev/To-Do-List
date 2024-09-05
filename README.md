<<<<<<< HEAD
# To-Do List Application

## Introduction
Cette application est une application de bureau multiplateforme développée en utilisant Qt et QML. Elle est conçue pour aider les utilisateurs à gérer leurs tâches quotidiennes de manière simple, intuitive et efficace.

## Fonctionnalités Principales

Gestion des Tâches
- **Organisation par catégories** :
  - "Aujourd'hui"
  - "Cette semaine"
  - "Plus tard"
- **Ajout de tâches** : L'utilisateur peut ajouter une tâche dans l'une de ces trois catégories en fonction de la date choisie.
- **Restrictions** : Il n'est pas possible d'ajouter des tâches pour des dates passées.

### Vue des Paramètres
- **Changer le thème** : Basculer entre le mode clair et le mode sombre.
- **Changer la taille de la police** : Ajuster la taille du texte dans l'application.
- **Retirer les tâches complétées** : Supprimer toutes les tâches marquées comme complétées. (Implémentation à vnenir)
- **Limiter le nombre de tâches** : Définir un nombre maximum de tâches par catégorie.
  
### Ajout et Gestion des Tâches
- **Bandeau d'ajout rapide** : Un bandeau permet d'ajouter une nouvelle tâche pour le jour même en spécifiant seulement un nom.
- **Bouton d'ajout de tâche** : Présent sur l'interface principale pour permettre la création de nouvelles tâches.
- **Marquage des tâches** : Chaque tâche comporte une checkbox pour la marquer comme complétée, avec un changement visuel lorsqu'elle est cochée.
- **Édition des tâches** : Cliquer sur une tâche existante permet de l'éditer.
- **Suppression des tâches** : Châque tâche comporte un icone de suppression pour supprimer la tâche

### Détails de l'Ajout de Tâche
- **Nom de la tâche** : Ajouter un nom à la tâche.
- **Sélection de la date** : Utiliser un composant dédié pour choisir la date.
- **Sélection de l'heure** : Utiliser un composant dédié pour choisir l'heure.
- **Ajout de précisions** : Ajouter des détails dans un champ de texte multi-ligne, avec un bouton "finished editing" pour terminer l'édition.

## Installation
=======
# Gestion des Tâches - Application QML

## Description

Cette application permet de créer, modifier et gérer des tâches avec des fonctionnalités telles que la sélection de la date et de l'heure, l'ajout de notes, et le mode sombre/clair. Elle utilise Qt Quick pour l'interface utilisateur et intègre des animations et des transitions.

## Fonctionnalités

- **Ajout et modification de tâches** : Créez ou modifiez des tâches en remplissant un formulaire avec un titre, une date, une heure, et des notes.
- **Sélection de la date et de l'heure** : Utilisez des dialogues personnalisés pour sélectionner la date et l'heure de chaque tâche.
- **Modes sombre et clair** : Changez entre un thème sombre et clair pour une expérience utilisateur personnalisée.
- **Animations** : Animation lors de l'appui sur le bouton de retour pour une meilleure expérience utilisateur.
- **Documentation Doxygen** : Les commentaires dans le code sont formatés pour générer automatiquement une documentation avec Doxygen.

## Structure du Projet

- `main.qml` : Point d'entrée de l'application.
- `NewTask.qml` : Page principale pour la création et la modification de tâches.
- `DateSelector.qml` : Dialog pour sélectionner une date.
- `TimeSelector.qml` : Dialog pour sélectionner une heure.
- `ListeTaches.js` : Script JavaScript pour la gestion des tâches, incluant des fonctions pour l'obtention d'indices pour l'heure, les minutes, et le format AM/PM.
- `dbManager` : Interface pour l'intégration avec une base de données pour la sauvegarde et la gestion des tâches.

## Installation depuis Github

1. Clonez le dépôt.
2. Ouvrez le projet avec Qt Creator.
3. Compilez et exécutez le projet.

## Installation avec l'installateur fourni

1. Téléchargez l'installateur.
2. Préparez un dossier où l'application va être installer.
3. Ouvrez l'installateur.
4. Cette fenêtre va être afficher, cliquez sur le bouton **Suivant**.
![image](https://github.com/user-attachments/assets/e12351bb-da18-46bd-a17a-be1b8d957249)  
5. Changez le chemin vers le dossier d'installation créé à l'étape **2** et puis cliquez sur le bouton **Suivant**.
![image](https://github.com/user-attachments/assets/c0d5bb74-882f-4b3d-969b-cb0a930f7770)
6. Cliquez sur le CheckBox **The root component** et puis sur le bouton **Suivant**.
![image](https://github.com/user-attachments/assets/3333d074-9bb6-4b20-8578-0e16625a71c5)
7. Cliquez sur le bouton **Suivant**.
![image](https://github.com/user-attachments/assets/622f07ca-9950-4941-ad01-a2d04f4d59ce)
8. Maintenent l'application est prête à installer, cliquez donc sur le bouton **Installer**.
![image](https://github.com/user-attachments/assets/35e708d4-1f60-4bc7-9ba6-fb2151dc6972)
9. Appuyer sur le bouton **Terminer**.
![image](https://github.com/user-attachments/assets/c2ecbf45-c5bc-4ef2-b7f1-9525ba88d30d)
10. Allez au dossier d'installation et ouvrez le .exe trouver.

## Utilisation 

1. **Ajouter une tâche** : Cliquez sur le bouton `Add Task` sur la page principale. Remplissez le formulaire et cliquez sur `Ajouter`.
2. **Modifier une tâche** : Cliquez sur une tâche existante sur l'icône `Stylo` dans la liste pour l'ouvrir en mode édition. Apportez vos modifications et cliquez sur `Update Task`.
3. **Sélectionner la date et l'heure** : Utilisez les boutons de calendrier et d'horloge pour sélectionner la date et l'heure respectivement.
4. **Basculer entre les modes clair et sombre** : Utilisez l'option dans les paramètres pour changer le mode d'affichage.

## Code Doxygen

Le projet est commenté pour une génération facile de documentation avec Doxygen. Pour générer la documentation :

1. Installez [Doxygen](https://www.doxygen.nl/).
2. Exécutez `doxygen` dans le répertoire racine du projet pour générer la documentation.

## Contribution

Les contributions sont les bienvenues. Pour contribuer :

1. Forkez le projet.
2. Créez une branche pour votre fonctionnalité (`git checkout -b feature/NewFeature`).
3. Commitez vos changements (`git commit -m 'Add some NewFeature'`).
4. Poussez sur la branche (`git push origin feature/NewFeature`).
5. Ouvrez une Pull Request.
>>>>>>> develop
