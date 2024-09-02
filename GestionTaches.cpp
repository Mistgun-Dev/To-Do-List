#include "GestionTaches.h"

GestionTaches::GestionTaches()
{
    //Valeurs de tests en dur
    ajouterTache(0, "Tache 1", "note 1", QDateTime::currentDateTime(), Priority::HIGH);
    ajouterTache(1, "Tache 2", "note 2", QDateTime::currentDateTime(), Priority::LOW);
    ajouterTache(2, "Tache 3", "note 3", QDateTime::currentDateTime(), Priority::HIGH);
    ajouterTache(3, "Tache 4", "note 4", QDateTime::currentDateTime(), Priority::MEDIUM);

    qDebug() << "Nombre de taches : " << listeTaches.size();
}

GestionTaches::~GestionTaches()
{

}

void GestionTaches::ajouterTache(QSharedPointer<Tache>& tache)
{
    listeTaches.append(tache);
    emit tacheUpdate();
}

void GestionTaches::ajouterTache(int id, const QString &titre, const QString &note, const QDateTime &dateHeure, Priority priority)
{
    // QSharedPointer<Tache> newTache = QSharedPointer<Tache>::create(id, titre, note, dateHeure, priority);
    // listeTaches.append(newTache);

    // emit tacheUpdate();

    QSharedPointer<Tache> nouvelleTache = QSharedPointer<Tache>::create(id, titre, note, dateHeure, priority);
    ajouterTache(nouvelleTache);
}



void GestionTaches::ajouterTacheRapide(const QString &titre)
{
    QDateTime dateHeure = QDateTime::currentDateTime();
    ajouterTache(-1, titre, "", dateHeure, Priority::MEDIUM);
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

QVariantList GestionTaches::getTachesAsVariantList() const {
    QVariantList variantList;
    for (const auto& tache : listeTaches) {
        QVariantMap tacheMap;
        tacheMap["id"] = tache->getId();
        tacheMap["titre"] = tache->getTitre();
        tacheMap["note"] = tache->getNote();
        tacheMap["dateHeure"] = tache->getDateHeure().toString();
        tacheMap["priority"] = static_cast<int>(tache->getPriority());
        variantList.append(tacheMap);
    }
    return variantList;
}
