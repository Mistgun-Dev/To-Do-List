#include "database.h"

// Méthode d'accès à l'instance unique
Database& Database::instance() {
    static Database instance;
    return instance;
}

Database::Database(QObject *parent)
    : QObject(parent) {
    // Initialisation de la base de données SQLite
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("taches.db");

    if (!m_db.open()) {
        qDebug() << "Erreur lors de l'ouverture de la base de données:" << m_db.lastError();
    } else {
        qDebug() << "Base de données ouverte avec succès.";
        updateModel();  // Initialiser le modèle lorsque la base de données est ouverte
    //     QSqlQuery query;
    //     // Création de la table si elle n'existe pas
    //     QString createTableQuery = "CREATE TABLE IF NOT EXISTS taches ("
    //                                "id INTEGER PRIMARY KEY, "
    //                                "titre TEXT, "
    //                                "note TEXT, "
    //                                "dateHeure TEXT, "
    //                                "isCompleted INTEGER, "
    //                                "priority INTEGER)";
    //     if (!query.exec(createTableQuery)) {
    //         qDebug() << "Erreur lors de la création de la table:" << query.lastError();
    //     }
    //     else {
    //         qDebug() << "Table 'taches' créée ou déjà existante.";
    //         // Charger toutes les tâches de la base de données dans le vecteur m_taches
    //         query.exec("SELECT * FROM taches");
    //         while (query.next()) {
    //             Tache* tache = new Tache(
    //                 query.value("id").toInt(),
    //                 query.value("titre").toString(),
    //                 query.value("note").toString(),
    //                 query.value("dateHeure").toString(),
    //                 static_cast<Priority>(query.value("priority").toInt())
    //                 );
    //             tache->setCompleted(query.value("isCompleted").toBool());
    //             m_taches.append(tache);
    //         }
    //     }
    }
}

Database::~Database() {
    //qDeleteAll(m_taches);
    m_taches.clear();
    m_db.close();
}

bool Database::createTable() {
        QSqlQuery query;
        if (!query.exec("CREATE TABLE IF NOT EXISTS taches ("
                        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                        "titre TEXT,"
                        "note TEXT,"
                        "dateHeure TEXT,"
                        "isCompleted INTEGER,"
                        "priority INTEGER)")) {
            qDebug() << "Erreur lors de la création de la table:" << query.lastError();
            return false;  // Ajoutez un retour en cas d'erreur
        } else {
            qDebug() << "Table 'taches' créée ou déjà existante.";
            return true;
        }
}

void Database::addTache(QSharedPointer<Tache> tache) {
    QSqlQuery query;
    query.prepare("INSERT INTO taches (titre, note, dateHeure, isCompleted, priority) "
                  "VALUES (:titre, :note, :dateHeure, :isCompleted, :priority)");
    query.bindValue(":titre", tache->getTitre());
    query.bindValue(":note", tache->getNote());
    query.bindValue(":dateHeure", tache->getDateHeure());
    query.bindValue(":isCompleted", tache->getCompleted());
    query.bindValue(":priority", static_cast<int>(tache->getPriority()));

    if (query.exec()) {
        tache->setId(query.lastInsertId().toInt());
        m_taches.append(tache);  // Ajouter la tâche au vecteur
        emit tacheModelChanged();  // Émet le signal après l'ajout
        qDebug() << "tache ajoutée à la liste des taches";
    } else {
        qDebug() << "Erreur lors de l'ajout de la tâche:" << query.lastError();
    }
}

bool Database::removeTache(int id) {
    QSqlQuery query;
    query.prepare("DELETE FROM taches WHERE id = :id");
    query.bindValue(":id", id);

    if (query.exec()) {
        for (int i = 0; i < m_taches.size(); ++i) {
            if (m_taches[i]->getId() == id) {
                //delete m_taches[i];
                m_taches.remove(i);  // Supprimer la tâche du vecteur
                emit tacheModelChanged();  // Émet le signal après la suppression
                qDebug() << "tache supprimée de la liste des taches";
                break;
            }
        }
        return true;
    } else {
        qDebug() << "Erreur lors de la suppression de la tâche:" << query.lastError();
        return false;
    }
}

QSharedPointer<Tache> Database::getTache(int id) {
    for (const auto& tache : m_taches) {
        if (tache->getId() == id) {
            return tache;
        }
    }
    return nullptr;
}

QList<QSharedPointer<Tache>> Database::getAllTaches() {
    updateModel();
    return m_taches;
}


bool Database::updateTache(Tache* tache) {

    QSqlQuery query;

    query.prepare("UPDATE taches SET titre = :titre, note = :note, dateHeure = :dateHeure, "
                  "isCompleted = :isCompleted, priority = :priority WHERE id = :id");
    query.bindValue(":titre", tache->getTitre());
    query.bindValue(":note", tache->getNote());
    query.bindValue(":dateHeure", tache->getDateHeure());
    query.bindValue(":isCompleted", tache->getCompleted());
    query.bindValue(":priority", static_cast<int>(tache->getPriority()));
    query.bindValue(":id", tache->getId());

    if (query.exec()) {
        return true;
    } else {
        qDebug() << "Erreur lors de la mise à jour de la tâche:" << query.lastError();
    }
}

/*
bool Database::updateTache(QSharedPointer<Tache> tache) {
        if (!tache) {
            qDebug() << "Invalid tache pointer";
            return false;
        }

        QSqlQuery query;
        if (!query.prepare("UPDATE taches SET titre = :titre, note = :note, dateHeure = :dateHeure, "
                           "isCompleted = :isCompleted, priority = :priority WHERE id = :id")) {
            qDebug() << "Query preparation failed:" << query.lastError();
            return false;
        }

        query.bindValue(":titre", tache->getTitre());
        query.bindValue(":note", tache->getNote());
        query.bindValue(":dateHeure", tache->getDateHeure());
        query.bindValue(":isCompleted", tache->getCompleted());
        query.bindValue(":priority", static_cast<int>(tache->getPriority()));
        query.bindValue(":id", tache->getId());

        if (!query.exec()) {
            qDebug() << "Erreur lors de la mise à jour de la tâche:" << query.lastError();
            return false;
        }

        for (int i = 0; i < m_taches.size(); ++i) {
            if (m_taches[i]->getId() == tache->getId()) {
                m_taches[i] = tache;
                emit tacheModelChanged();  // Émet le signal après la mise à jour
                qDebug() << "tache modifiée, id:" << tache->getId();
                return true;
            }
        }

        qDebug() << "Tache with id" << tache->getId() << "not found in m_taches.";

        return false;
}
*/

void Database::updateModel() {
    m_taches.clear();

    QSqlQuery query;
    // Charger toutes les tâches de la base de données dans le vecteur m_taches
    if (!query.exec("SELECT * FROM taches")) {
        qDebug() << "Erreur lors du chargement des tâches:" << query.lastError();
    }

    while (query.next()) {
        QSharedPointer<Tache> tache = QSharedPointer<Tache>::create(
            query.value("id").toInt(),
            query.value("titre").toString(),
            query.value("note").toString(),
            query.value("dateHeure").toString(),
            static_cast<Priority>(query.value("priority").toInt())
            );
        tache->setCompleted(query.value("isCompleted").toBool());
        m_taches.append(tache);
    }
    emit tacheModelChanged();  // Notifier QML que le modèle a changé
}

