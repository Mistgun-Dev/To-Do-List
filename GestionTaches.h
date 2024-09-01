#ifndef GESTIONTACHES_H
#define GESTIONTACHES_H

#include "tache.h"

/**
 * @class GestionTaches
 * @brief Classe permettant de gérer une liste de tache.
 *
 * Cette classe implémente des méthodes pour créer, modifier, supprimer et récupérer des tâches.
 * Elle comporte un conteneur de liste de tâches gérant l'intégralité des tâches du programme.
 */
class GestionTaches : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<Tache> listeTaches READ getListeTaches NOTIFY tacheAjoutee)

public:

    /**
     * @brief Constructeur par défaut de la classe GestionTaches.
     */
    GestionTaches();

    /**
     * @brief Destructeur de la classe GestionTaches.
     */
    ~GestionTaches();

    /**
     * @brief Ajoute une tâche déjà créée à la liste des tâches.
     * @param tache Référence à une tâche déja créée, à ajouter à la liste.
     */
    void ajouterTache(Tache& tache);

    /**
     * @brief Crée et ajoute une tâche à la liste avec les attributs spécifiés.
     * @param id Identifiant unique de la tâche.
     * @param titre Titre de la tâche.
     * @param note Note associée à la tâche.
     * @param dateHeure Date et heure de la tâche.
     * @param priority Priorité de la tâche.
     */
    void ajouterTache(int id, const QString& titre, const QString& note, const QDateTime& dateHeure, Priority priority);

    /**
     * @brief Crée et ajoute une tâche à la date actuelle en ne renseignant que le titre, depuis l'écran principal.
     * @param titre Titre de la tâche.
     */
    void ajouterTacheRapide(const QString& titre);

    /**
     * @brief Supprime une tâche de la liste en fonction de son identifiant.
     * @param id Identifiant unique de la tâche à supprimer.
     */
    void supprimerTache(int id);

    /**
     * @brief Modifie une tâche existante avec une nouvelle tâche.
     * @param id Identifiant unique de la tâche à modifier.
     * @param nouvelleTache Référence à la nouvelle tâche qui remplacera l'ancienne.
     */
    void modifierTache(int id, const Tache& nouvelleTache);

    /**
     * @brief Récupère une tâche à partir de son identifiant.
     * @param id Identifiant unique de la tâche à récupérer.
     * @return Tache Tache correspondant à l'identifiant renseigné.
     */
    Tache getTache(int id) const;

    /**
     * @brief Récupère la liste complète des tâches.
     * @return QList Liste contenant toutes les tâches.
     */
    QList<Tache> getListeTaches() const;

signals:

    /**
     * @brief Signal émis lorsqu'une nouvelle tâche est ajoutée.
     */
    void tacheAjoutee();

    /**
     * @brief Signal émis lorsqu'une tâche est modifiée.
     */
    void tacheModifiee();

    /**
     * @brief Signal émis lorsqu'une tâche est supprimée.
     */
    void tacheSuprimee();

private:

    QList<Tache> listeTaches; /**< Liste des tâches. */
};

#endif // GESTIONTACHES_H
