#include "GestionTaches.h"

GestionTaches::GestionTaches()
{
    //Valeurs de tests en dur
    ajouterTache(0, "Tache 1", "note 1", "03/09/2024 11:21 AM", Priority::HIGH);
    ajouterTache(1, "Tache 2", "note 2", "03/09/2024 11:21 AM", Priority::LOW);
    ajouterTache(2, "Tache 3", "note 3", "03/09/2024 11:21 AM", Priority::HIGH);
    ajouterTache(3, "Tache 4", "note 4", "05/09/2024 11:21 AM", Priority::MEDIUM);

    /*
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
    */
}

GestionTaches::~GestionTaches()
{

}

void GestionTaches::ajouterTache(QSharedPointer<Tache>& tache)
{
    listeTaches.append(tache);
    emit tacheUpdate();
}

void GestionTaches::ajouterTache(int id, const QString &titre, const QString &note, const /*QDateTime*/QString &dateHeure, Priority priority)
{
    QSharedPointer<Tache> newTache = QSharedPointer<Tache>::create(id, titre, note, dateHeure, priority);
    listeTaches.append(newTache);
    emit tacheUpdate();
/*
    QSharedPointer<Tache> nouvelleTache = QSharedPointer<Tache>::create(id, titre, note, dateHeure, priority);
    ajouterTache(nouvelleTache);
*/
}



void GestionTaches::ajouterTacheRapide(const QString &titre)
{

    QDateTime dateHeure = QDateTime::currentDateTime();
    QString formattedString = dateHeure.toString("yyyy-MM-dd HH:mm:ss");
    ajouterTache(-1, titre, "", formattedString, Priority::MEDIUM);
    emit tacheUpdate();
}

void GestionTaches::supprimerTache(int id)
{
    for (int i = 0; i < listeTaches.size(); ++i) {
        if (listeTaches[i]->getId() == id) {
            listeTaches.removeAt(i);
            emit tacheUpdate();
            return;
        }
    }
    emit tacheUpdate();
}

void GestionTaches::modifierTache(int id, const QSharedPointer<Tache>& nouvelleTache)
{
    for (int i = 0; i < listeTaches.size(); ++i) {
        if (listeTaches[i]->getId() == id) {
            listeTaches[i] = nouvelleTache;
            emit tacheUpdate();
            return;
        }
    }

    emit tacheUpdate();
}

QSharedPointer<Tache> GestionTaches::getTache(int id) const
{
    for (const auto& tache : listeTaches) {
        if (tache->getId() == id) {
            return tache;
        }
    }
    return QSharedPointer<Tache>(nullptr);
}

QList<QSharedPointer<Tache>> GestionTaches::getListeTaches() const
{
    return listeTaches;
}

QVariantList GestionTaches::getTachesAsVariantList() const
{
    QVariantList variantList;
    for (const auto& tache : listeTaches) {
        QVariantMap tacheMap;
        tacheMap["id"] = tache->getId();
        tacheMap["titre"] = tache->getTitre();
        tacheMap["note"] = tache->getNote();
        tacheMap["dateHeure"] = tache->getDateHeure();
        tacheMap["priority"] = static_cast<int>(tache->getPriority());
        tacheMap["isCompleted"] = tache->getCompleted();

        variantList.append(tacheMap);
    }

    qDebug() << "TAILLE = ", variantList.count();
    return variantList;
}
