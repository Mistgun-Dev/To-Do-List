#include "GestionTaches.h"

GestionTaches::GestionTaches()
{
     QString format = "dd/MM/yyyy hh:mm AP";

    //Valeurs de tests en dur
    //Section today
    ajouterTache(0, "Tache 1", "note 1", QDateTime::currentDateTime().toString(format), Priority::HIGH);
    ajouterTache(1, "Tache 2", "note 2", QDateTime::currentDateTime().toString(format), Priority::LOW);
    ajouterTache(2, "Tache 3", "note 3", QDateTime::currentDateTime().toString(format), Priority::HIGH);
    ajouterTache(3, "Tache 4", "note 4", QDateTime::currentDateTime().toString(format), Priority::MEDIUM);

    //Section this week
    ajouterTache(4, "Tache 5", "note 5", "06/09/2024 11:21 AM", Priority::MEDIUM);
    ajouterTache(5, "Tache 6", "note 6", "07/09/2024 11:21 AM", Priority::MEDIUM);
    ajouterTache(6, "Tache 7", "note 7", "06/09/2024 03:30 AM", Priority::MEDIUM);

    //Section Later
    ajouterTache(7, "Tache 8", "note 8", "05/11/2025 11:21 AM", Priority::MEDIUM);
    ajouterTache(8, "Tache 9", "note 9", "05/01/2027 11:21 AM", Priority::MEDIUM);
    ajouterTache(10, "Tache 11", "note 11", "25/12/2024 11:21 AM", Priority::MEDIUM);
    ajouterTache(11, "Tache 12", "note 12", "25/11/2026 11:21 AM", Priority::MEDIUM);

    //Non valide (antérieure)
    ajouterTache(9, "Tache 10", "note 10", "05/01/2024 11:21 AM", Priority::MEDIUM);
}

GestionTaches::~GestionTaches()
{

}

void GestionTaches::ajouterTache(QSharedPointer<Tache>& tache)
{
    listeTaches.append(tache);
    emit tacheUpdate();
}

void GestionTaches::ajouterTache(int id, const QString &titre, const QString &note, const QString &dateHeure, Priority priority)
{
    QSharedPointer<Tache> newTache = QSharedPointer<Tache>::create(id, titre, note, dateHeure, priority);
    listeTaches.append(newTache);
    emit tacheUpdate();
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

void GestionTaches::modifierTache(int id, Tache *nouvelleTache)
{
    QSharedPointer<Tache> newTache = QSharedPointer<Tache>::create();
    newTache->setId(nouvelleTache->getId());
    newTache->setTitre(nouvelleTache->getTitre());
    newTache->setDateHeure(nouvelleTache->getDateHeure());
    newTache->setNote(nouvelleTache->getNote());
    newTache->setPriority(nouvelleTache->getPriority());

    qDebug() << "FONCTION DE MODIFICATIONNNN";
    for (int i = 0; i < listeTaches.size(); ++i) {
        if (listeTaches[i]->getId() == id) {
            listeTaches[i] = newTache;
            qDebug() << "TACHE MODIFIEEEEEEEE";
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
    return variantList;
}
