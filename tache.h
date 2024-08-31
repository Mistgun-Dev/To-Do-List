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

    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString titre READ getTitre WRITE setTitre NOTIFY titreChanged)
    Q_PROPERTY(QString note READ getNote WRITE setNote NOTIFY noteChanged)
    Q_PROPERTY(QDateTime dateHeure READ getDateHeure WRITE setDateHeure NOTIFY dateHeureChanged)
    Q_PROPERTY(bool isCompleted READ getCompleted WRITE setCompleted NOTIFY isCompletedChanged)
    Q_PROPERTY(Priority priority READ getPriority WRITE setPriority NOTIFY priorityChanged)

public:

    //Constructeur par défaut, et constructeur avec paramètre pour créer une tache
    Tache();
    Tache(int id, const QString& titre, const QString& note, const QDateTime& dateHeure, Priority priority);
    ~Tache();

    // Accesseurs pour l'id
    void setId(const int& id);
    int getId();

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
    void idChanged();
    void titreChanged();
    void noteChanged();
    void dateHeureChanged();
    void isCompletedChanged();
    void priorityChanged();

private:
    int m_id;               // Id unique de la tache
    QString m_titre;        // Titre de la tache
    QString m_note;         // Note attrivuée à la tache
    QDateTime m_dateHeure;  // Date et heure de la tache au format QDatetime
    bool m_isCompleted;     // Tache validée ou non
    Priority m_priority;    // Degré d'importance de la tache
};

#endif // TACHE_H
