#ifndef GESTIONTACHES_H
#define GESTIONTACHES_H

#include "tache.h"

class GestionTaches : public QObject
{
    Q_OBJECT

public:

    GestionTaches();
    ~GestionTaches();

    void creerTache(const QString& titre, const QString& note, const QDateTime& dateHeure, Priority priority);
    void ajouterTache(Tache& tache);
    void supprimerTache(int id);
    void modifierTache(int id, const Tache& nouvelleTache);
    Tache getTache(int id) const;
    QList<Tache> getListeTaches() const;

signals:
    void tacheAjoutee();
    void tacheModifiee();
    void tacheSUprimee();

private:

    QList<Tache> listeTaches;
};

#endif // GESTIONTACHES_H
