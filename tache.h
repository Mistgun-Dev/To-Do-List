#ifndef TACHE_H
#define TACHE_H
#include <QtQml/qqml.h>
#include <QDateTime>
#include <QObject>


enum class Priority { HIGH, MEDIUM, LOW};

class Tache : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString titre READ getTitre WRITE setTitre NOTIFY titreChanged)
    Q_PROPERTY(QString note READ getNote WRITE setNote NOTIFY noteChanged)
    Q_PROPERTY(QDateTime dateHeure READ getDateHeure WRITE setDateHeure NOTIFY dateHeureChanged)
    Q_PROPERTY(bool isCompleted READ getCompleted WRITE setCompleted NOTIFY isCompletedChanged)
    Q_PROPERTY(Priority priority READ getPriority WRITE setPriority NOTIFY priorityChanged)

public:

    Tache();
    ~Tache();

    // Accesseurs pour le titre
    void setTitre(const QString& titre);
    QString getTitre();

    // Accesseurs pour les notes
    void setNote(const QString& note);
    QString getNote();

    // Accesseurs setters pour la date et l'heure
    void setDateHeure(const QDateTime& dateTime);
    void setDateHeureActuelle();

    // Accesseurs getters pour la date et l'heure
    QDateTime getDateHeure();
    QString getDateHeureAsString();
    QString getDateAsString();
    QString getHeureAsString();

    // Accesseurs pour le booleen d'accomplissement de la tâche
    void setCompleted(bool val);
    bool getCompleted();

    // Accesseurs pour la priorité de la tache
    void setPriority(Priority priority);
    Priority getPriority();

signals:
    void titreChanged();
    void noteChanged();
    void dateHeureChanged();
    void isCompletedChanged();
    void priorityChanged();

private:
    int id;
    QString m_titre;
    QString m_note;
    QDateTime m_dateHeure;
    bool m_isCompleted;
    Priority m_priority;
};

#endif // TACHE_H
