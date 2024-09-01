#include "GestionTaches.h"

GestionTaches::GestionTaches()
{
    ajouterTache(0, "Tache 1", "note 1", QDateTime::currentDateTime(), Priority::HIGH);
    ajouterTache(1, "Tache 2", "note 2", QDateTime::currentDateTime(), Priority::LOW);
    ajouterTache(2, "Tache 3", "note 3", QDateTime::currentDateTime(), Priority::HIGH);
    ajouterTache(3, "Tache 4", "note 4", QDateTime::currentDateTime(), Priority::MEDIUM);

}

GestionTaches::~GestionTaches()
{

}

void GestionTaches::ajouterTache(Tache &tache)
{

}

void GestionTaches::ajouterTache(int id, const QString &titre, const QString &note, const QDateTime &dateHeure, Priority priority)
{
    Tache* newTache = new Tache(id, titre, note, dateHeure, priority);
    listeTaches.append(newTache);

    emit tacheAjoutee();
}



void GestionTaches::ajouterTacheRapide(const QString &titre)
{

}

void GestionTaches::supprimerTache(int id)
{

}

void GestionTaches::modifierTache(int id, const Tache &nouvelleTache)
{

}

Tache GestionTaches::getTache(int id) const
{

}

QList<Tache*> GestionTaches::getListeTaches() const
{

}
