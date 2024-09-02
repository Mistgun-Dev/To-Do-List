#include "GestionTaches.h"

GestionTaches::GestionTaches()
{
    //Valeurs de tests en dur
    ajouterTache(0, "Tache 1", "note 1", QDateTime::currentDateTime(), Priority::HIGH);
    ajouterTache(1, "Tache 2", "note 2", QDateTime::currentDateTime(), Priority::LOW);
    ajouterTache(2, "Tache 3", "note 3", QDateTime::currentDateTime(), Priority::HIGH);
    ajouterTache(3, "Tache 4", "note 4", QDateTime::currentDateTime(), Priority::MEDIUM);
    ajouterTache(4, "Tache 5", "note 5", QDateTime(QDate(2024, 9, 5), QTime(0, 0)), Priority::MEDIUM);
    ajouterTache(5, "Tache 6", "note 6", QDateTime(QDate(2024, 9, 3), QTime(0, 0)), Priority::MEDIUM);
    ajouterTache(6, "Tache 7", "note 7", QDateTime::currentDateTime(), Priority::MEDIUM);
    ajouterTache(7, "Tache 8", "note 8", QDateTime(QDate(2024, 9,18), QTime(0, 0)), Priority::MEDIUM);
    ajouterTache(8, "Tache 9", "note 9", QDateTime(QDate(2024, 9, 24), QTime(0, 0)), Priority::MEDIUM);
    ajouterTache(9, "Tache 10", "note 10", QDateTime(QDate(2024, 12, 25), QTime(0, 0)), Priority::MEDIUM);
    ajouterTache(10, "Tache 11", "note 11", QDateTime(QDate(2025, 9, 3), QTime(0, 0)), Priority::MEDIUM);
}

GestionTaches::~GestionTaches()
{

}

void GestionTaches::ajouterTache(QSharedPointer<Tache>& tache)
{

}

void GestionTaches::ajouterTache(int id, const QString &titre, const QString &note, const QDateTime &dateHeure, Priority priority)
{
    QSharedPointer<Tache> newTache = QSharedPointer<Tache>::create(id, titre, note, dateHeure, priority);
    listeTaches.append(newTache);

    emit tacheUpdate();
}



void GestionTaches::ajouterTacheRapide(const QString &titre)
{
    emit tacheUpdate();
}

void GestionTaches::supprimerTache(int id)
{
    emit tacheUpdate();
}

void GestionTaches::modifierTache(int id, const QSharedPointer<Tache>& nouvelleTache)
{
    emit tacheUpdate();
}

QSharedPointer<Tache> GestionTaches::getTache(int id) const
{

}

QList<QSharedPointer<Tache>> GestionTaches::getListeTaches() const
{
    return listeTaches;
}

QVariantList GestionTaches::getTachesAsVariantList() const {
    QVariantList variantList;
    for (const auto& tache : listeTaches) {
        QVariantMap tacheMap;
        tacheMap["id"] = tache->getId();
        tacheMap["titre"] = tache->getTitre();
        tacheMap["note"] = tache->getNote();
        tacheMap["dateHeure"] = tache->getDateHeure().toString();
        tacheMap["priority"] = static_cast<int>(tache->getPriority());
        tacheMap["isCompleted"] = tache->getCompleted();

        variantList.append(tacheMap);
    }
    return variantList;
}
