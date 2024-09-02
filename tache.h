#ifndef TACHE_H
#define TACHE_H
#include <QtQml/qqml.h>
#include <QDateTime>
#include <QObject>

/**
 * @enum Priority
 * @brief Définition des priorités pour les tâches.
 *
 * Les tâches peuvent avoir trois niveaux de priorité :
 * - HIGH : Priorité haute
 * - MEDIUM : Priorité moyenne
 * - LOW : Priorité basse
 */
enum class Priority { HIGH, MEDIUM, LOW };

/**
 * @class Tache
 * @brief Classe représentant une tâche avec un titre, une note, une date, un état d'accomplissement et une priorité.
 *
 * Cette classe encapsule les informations d'une tâche et fournit des méthodes pour accéder
 * et modifier ces informations.
 */
class Tache : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString titre READ getTitre WRITE setTitre NOTIFY titreChanged)
    Q_PROPERTY(QString note READ getNote WRITE setNote NOTIFY noteChanged)
    Q_PROPERTY(/*QDateTime*/QString dateHeure READ getDateHeure WRITE setDateHeure NOTIFY dateHeureChanged)
    Q_PROPERTY(bool isCompleted READ getCompleted WRITE setCompleted NOTIFY isCompletedChanged)
    Q_PROPERTY(Priority priority READ getPriority WRITE setPriority NOTIFY priorityChanged)

public:

    /**
     * @brief Constructeur par défaut de la classe Tache.
     * Initialise une tâche avec des valeurs par défaut.
     */
    Tache();

    /**
     * @brief Constructeur avec paramètres pour créer une tâche.
     *
     * @param id Identifiant unique de la tâche.
     * @param titre Titre de la tâche.
     * @param note Note associée à la tâche.
     * @param dateHeure Date et heure associées à la tâche.
     * @param priority Niveau de priorité de la tâche.
     */
    Tache(int id, const QString& titre, const QString& note, const /*QDateTime*/QString& dateHeure, Priority priority);

    /**
     * @brief Destructeur de la classe Tache.
     */
    ~Tache();

    /**
     * @brief Modifie l'identifiant de la tâche.
     * @param id Référence à l'identifiant de la tâche.
     */
    void setId(const int& id);

    /**
     * @brief Récupère l'identifiant de la tâche.
     * @return Identifiant unique de la tâche.
     */
    int getId();

    /**
     * @brief Modifie le titre de la tâche.
     * @param titre Référence au titre de la tâche.
     */
    void setTitre(const QString& titre);

    /**
     * @brief Récupère le titre de la tâche.
     * @return Titre de la tâche sous forme de QString.
     */
    QString getTitre();

    /**
     * @brief Modifie la note de la tâche.
     * @param note Référence à la note de la tâche.
     */
    void setNote(const QString& note);

    /**
     * @brief Récupère la note de la tâche.
     * @return Note associée à la tâche.
     */
    QString getNote();

    /**
     * @brief Modifie la date et l'heure de la tâche.
     * @param dateTime Référence à la nouvelle date et heure.
     */
    void setDateHeure(const /*QDateTime*/QString& dateTime);

    /**
     * @brief Modifie la date et l'heure de la tâche à l'heure actuelle.
     */
    void setDateHeureActuelle();

    /**
     * @brief Récupère la date et l'heure de la tâche.
     * @return Date et heure de la tâche sous forme de QDateTime.
     */
    /*QDateTime*/QString getDateHeure();

    /**
     * @brief Récupère la date et l'heure sous forme de chaine de caractère.
     * @return Date et heure sous forme de QString au format "dd/MM/yyyy HH:mm:ss".
     */
    QString getDateHeureAsString();

    /**
     * @brief Récupère la date sous forme de chaine de caractère.
     * @return Date sous forme de QString au format "dd/MM/yyyy".
     */
    QString getDateAsString();

    /**
     * @brief Récupère l'heure sous forme de chaine de caractère.
     * @return Heure sous forme de QString au format "HH:mm:ss".
     */
    QString getHeureAsString();

    /**
     * @brief Modifie l'état d'accomplissement de la tâche.
     * @param val Booléen indiquant si la tâche est accomplie.
     */
    void setCompleted(bool val);

    /**
     * @brief Récupère l'état d'accomplissement de la tâche.
     * @return Booléen indiquant si la tâche est accomplie.
     */
    bool getCompleted();

    /**
     * @brief Modifie la priorité de la tâche.
     * @param priority Nouvelle priorité de la tâche.
     */
    void setPriority(Priority priority);

    /**
     * @brief Récupère la priorité de la tâche.
     * @return Priorité de la tâche.
     */
    Priority getPriority();

signals:


    ///@brief Emission d'un signal lors du changement d'id
    void idChanged();
    ///@brief Emission d'un signal lors du changement de titre
    void titreChanged();
    ///@brief Emission d'un signal lors du changement de note
    void noteChanged();
    ///@brief Emission d'un signal lors du changement de date et heure
    void dateHeureChanged();
    ///@brief Emission d'un signal lors du changement du statut de validation
    void isCompletedChanged();
    ///@brief Emission d'un signal lors du changement de priorité
    void priorityChanged();

private:
    int m_id;               // Identifiant unique de la tâche.
    QString m_titre;        // Titre de la tâche.
    QString m_note;         // Note associée à la tâche.
    // QDateTime m_dateHeure;  // Date et heure de la tâche au format QDateTime.
    QString m_dateHeure;  // Date et heure de la tâche au format QString.
    bool m_isCompleted;     // Indique si la tâche est accomplie.
    Priority m_priority;    // Priorité de la tâche (élevée, moyenne ou basse).
};

#endif // TACHE_H
