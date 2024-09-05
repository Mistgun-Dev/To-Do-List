# Documentation Client

## 1. Introduction

Ce document présente une analyse comparative entre les fonctionnalités attendues par le client et celles qui ont été effectivement implémentées. Il détaille également les raisons des éventuelles fonctionnalités manquantes et propose un plan pour leur implémentation future.

---

## 2. Fonctionnalités Attendues vs Implémentées

| **ID de Fonctionnalité** | **Description de la Fonctionnalité** | **Statut** | **Commentaire** |
|--------------------------|--------------------------------------|------------|-----------------|
| `F01`                    | L'application doit ouvrir une seule fenêtre  | Implémentée | |
| `F02`                    | L'application doit avoir une taille de fenêtre minimum prédéfinie  | Implémentée  |  |
| `F03`                    | L'application doit avoir un mode plein écran | Implémentée  |             |
| `F04`                    | L'utilisateur doit pouvoir voyager de la fenêtre des tâches à la fenêtre des paramètres sans encombre  | Implémentée |  |
| `F05`                    | Les tâches doivent être organisées en trois catégories  | Implémentée |  |
| `F06`                    | L'interface doit bloquer ou désactiver l'ajout de tâches avec une date passée  | Implémentée | Cette restriction est valable que si l'utilisateur sélectionne la date à l'aide du composant spécialisé  |
| `F07`                    | L'application doit inclure une vue "Settings"  | Implémentée |  |
| `F08`                    | La vue "Settings" permettre à changer le mode clair ou le mode sombre | Implémentée |  |
| `F09`                    | La vue "Settings" permettre à changer la taille de police  | Implémentée |  |
| `F10`                    | La vue "Settings" permettre à retirer les tâches complétées  | Implémentée |  |
| `F11`                    | La vue "Settings" permettre à limiter le nombre maximum de tâches  | Implémentée |  |
| `F12`                    | Un bandeau permettant d'ajouter une nouvelle tâche au jour même | Implémentée |  |
| `F13`                    | Un bouton d'ajout de tâche doit être présent sur l'interface principale  | Implémentée |  |
| `F14`                    | Chaque tâche doit comporter une checkbox pour marquer la tâche comme complétée  | Implémentée |  |
| `F15`                    | Cliquer sur une tâche existante doit amener l'utilisateur sur l'interface d'édition des tâches  | Implémentée |  |
| `F16`                    | Lors de l'ajout d'une tâche, l'utilisateur doit pouvoir ajouter un nom  | Implémentée |  |
| `F17`                    | Lors de l'ajout d'une tâche, l'utilisateur doit pouvoir sélectionner une date à l'aide d'un composant spécialisé  | Implémentée | Une interdiction de saisie manuelle peut être ajoutée |
| `F18`                    | Lors de l'ajout d'une tâche, l'utilisateur doit pouvoir sélectionner une heure à l'aide d'un composant spécialisé  | Implémentée | Un validateur de format n'est pas encore implémenté on cas de saisie manuelle  |
| `F19`                    | Lors de l'ajout d'une tâche, l'utilisateur doit pouvoir ajouter des précisions sur la tâche dans un champ de texte multi-ligne  | Implémentée |  |
| `F20`                    | Le champ de texte pour les précisions doit comporter un bouton "finished editing" qui, lorsqu'il est cliqué, enlève le focus du champ de texte  | Implémentée | Le focus est transféré au chams de saisie de titre |

---

