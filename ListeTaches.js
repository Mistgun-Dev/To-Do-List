
var listeTachesGlobale =  gestionTaches.listeTaches;

function initListeTaches()
{
    listeTachesGlobale =  gestionTaches.listeTaches;
}

// Fonction pourrecupérer la liste de taches
function getListeTaches()
{
    return listeTachesGlobale;
}


// Fonction pour supprimer une tache de la liste affichée
function updateTask(id) {
    for (var i = 0; i < listeTachesGlobale.length; i++) {
        if (listeTachesGlobale[i].id === id)
        {
            listeTachesGlobale[i].splice(i,1);
            return true;
        }
    }
    return false;
}

function extractHour(dateHeure) {
    const heure = getHeureParse(dateHeure); // "hh:mm AM"
    let hour = parseInt(heure.split(':')[0]); // Extract "hh" and convert to integer

    const period = heure.split(' ')[1]; // Extract "AM" or "PM"
    if (period === 'PM' && hour !== 12) {
        hour += 12; // Convert PM hours to 24-hour format (except 12 PM)
    } else if (period === 'AM' && hour === 12) {
        hour = 0; // Convert 12 AM to 0 hours (midnight)
    }

    return hour;
}

function extractMinute(dateHeure) {
    const heure = getHeureParse(dateHeure); // "hh:mm AM"
    const minute = parseInt(heure.split(':')[1]); // Extract "mm" and convert to integer
    return minute;
}

function isAm(dateHeure) {
    const heure = getHeureParse(dateHeure); // "hh:mm AM"
    const period = heure.split(' ')[1]; // Extract "AM" or "PM"
    return period === 'AM';
}

function getHourIndex(dateHeure) {
    const hour = extractHour(dateHeure);
    return (hour === 0) ? 11 : (hour > 12 ? hour - 12 : hour) - 1; // Convert to 0-based index
}

function getMinuteIndex(dateHeure) {
    return extractMinute(dateHeure); // The minute can be used directly as the index
}

function getAmPmIndex(dateHeure) {
    return isAm(dateHeure) ? 0 : 1;
}

function getHeureParse(dateHeure)
{
    var heure = dateHeure.split(' ')[1] + ' ' + dateHeure.split(' ')[2];
    return heure;
}

function getDateParse(dateHeure)
{
    var date = dateHeure.split(' ')[0]
    return date;
}

function addTaskInListe(tache)
{
    listeTachesGlobale.push(tache);
}
