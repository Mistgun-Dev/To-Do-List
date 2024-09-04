
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
