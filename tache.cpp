#include "Tache.h"


Tache::Tache(): m_id(0), m_titre(""), m_note(""), m_dateHeure(/*QDateTime::currentDateTime()*/""), m_isCompleted(false), m_priority(Priority::MEDIUM)
{}

Tache::Tache(int id, const QString &titre, const QString &note, const QString &dateHeure, Priority priority)
    : m_id(id), m_titre(titre), m_note(note), m_dateHeure(dateHeure), m_isCompleted(false), m_priority(priority)

{}


void Tache::setId(const int& id)
{
    if(m_id != id){
        m_id = id;
        emit idChanged();
    }
}

int Tache::getId()
{
    return m_id;
}

void Tache::setTitre(const QString& titre)
{
    if(m_titre != titre){
        m_titre = titre;
        emit titreChanged();
    }
}

QString Tache::getTitre()
{
    return m_titre;
}


void Tache::setNote(const QString& note)
{
    if(m_note != note){
        m_note = note;
        emit noteChanged();
    }
}

QString Tache::getNote()
{
    return m_note;
}


void Tache::setDateHeure(const QString& dateTime)
{
    if (m_dateHeure != dateTime) {
        m_dateHeure = dateTime;
        emit dateHeureChanged();
    }
}


QString Tache::getDateHeure()
{
    return m_dateHeure;
}


void Tache::setCompleted(bool val)
{
    if (m_isCompleted != val) {
        m_isCompleted = val;
        emit isCompletedChanged();
    }
}

bool Tache::getCompleted()
{
    return m_isCompleted;
}


void Tache::setPriority(Priority priority)
{
    if (m_priority != priority) {
        m_priority = priority;
        emit priorityChanged();
    }
}

Priority Tache::getPriority()
{
    return m_priority;
}


Tache::~Tache()
{

}
