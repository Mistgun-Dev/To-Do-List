#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QVector>
#include "tache.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QVariant>
#include <QDebug>

/**
 * @class Database
 * @brief Classe représentant une base de données simple pour stocker et gérer des tâches.
 *
 * Cette classe encapsule une collection de tâches et fournit des méthodes pour ajouter,
 * supprimer, modifier et récupérer les tâches.
 */
class Database : public QObject
{
    Q_OBJECT

public:

    /**
     * @brief Accède à l'instance unique du singleton Database.
     * Cette méthode retourne une référence à l'unique instance de la classe Database.
     * Si l'instance n'existe pas encore, elle est créée.
     * @return Référence à l'instance unique de Database.
     */
    static Database& instance();

    /**
     * @brief Constructeur de copie supprimé.
     * Cette méthode supprime le constructeur de copie pour éviter
     * la duplication de l'instance unique du singleton Database.
     * @param other L'objet Database à copier.
     */
    Database(const Database&) = delete;

    /**
     * @brief Opérateur d'affectation supprimé.
     * Cette méthode supprime l'opérateur d'affectation pour éviter
     * d'affecter une nouvelle valeur à l'instance unique du singleton Database.
     * @param other L'objet Database à affecter.
     * @return Référence à l'instance actuelle de Database.
     */
    Database& operator=(const Database&) = delete;

    /**
     * @brief Initialise la connexion à la base de données SQLite et crée la table si elle n'existe pas
     * @return True si la tâche a été supprimée avec succès, False sinon.
     */
    Q_INVOKABLE bool createTable();

    /**
     * @brief Ajoute une tâche à la base de données.
     * @param tache Pointeur vers la tâche à ajouter.
     */
    Q_INVOKABLE void addTache(QSharedPointer<Tache> tache);

    /**
     * @brief Supprime une tâche de la base de données.
     * @param id Identifiant de la tâche à supprimer.
     * @return True si la tâche a été supprimée avec succès, False sinon.
     */
    Q_INVOKABLE bool removeTache(int id);

    /**
     * @brief Récupère une tâche par son identifiant.
     * @param id Identifiant de la tâche à récupérer.
     * @return Pointeur vers la tâche correspondante ou nullptr si elle n'existe pas.
     */
    QSharedPointer<Tache> getTache(int id);

    /**
     * @brief Récupère toutes les tâches de la base de données.
     * @return Vecteur contenant des pointeurs vers toutes les tâches.
     */
    QList<QSharedPointer<Tache>> getAllTaches();

    /**
     * @brief Met à jour une tâche existante dans la base de données.
     * @param tache Pointeur vers la tâche mise à jour.
     * @return True si la mise à jour a été effectuée avec succès, False sinon.
     */
    Q_INVOKABLE bool updateTache(Tache*  tache);

signals:
    /**
     * @brief Signal émis lorsqu'une modification des tâches se produit.
     * Ce signal peut être connecté à l'interface utilisateur pour garantir que celle-ci est mise à jour.
     */
    void tacheModelChanged();

private:

public:
    /**
     * @brief Constructeur de la classe Database.
     * Initialise de la base de données SQLite
     */
    explicit Database(QObject *parent = nullptr);

    /**
     * @brief Destructeur de la classe Database.
     * Libérer la mémoire des tâches er ferme la connexion à la base de données.
     */
    ~Database();

    /**
     * @brief Met à jour le modèle des tâches en chargeant les données depuis la base de données.
     * Libérer la mémoire des tâches er ferme la connexion à la base de données.
     */
    void updateModel();

    QSqlDatabase m_db;  // Connexion à la base de données SQLite
    QList<QSharedPointer<Tache>> m_taches;  // Vecteur contenant les tâches de la base de données.
};

#endif // DATABASE_H
