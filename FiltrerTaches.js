// ------- TODAY ---------------------------------------------------
function getFilteredTodayTasks(listeTaches)
{
    var filteredTasks = [];

    for (var i = 0; i < listeTaches.length; i++) {
        var task = listeTaches[i];
        task.dateHeure = task.dateHeure.split(' ')[0];

        var today = getDateFormatted();
        var ret = (task.dateHeure === today);

        if (ret) {
            filteredTasks.push(task);
        }
    }
    return filteredTasks;
}

// ------- THIS WEEK ---------------------------------------------------

function getFilteredThisWeekTasks(listeTaches)
{
    var filteredTasks = [];
    var today = new Date();

    // Trouver le premier jour de la semaine (lundi)
    var startOfWeek = new Date(today);
    startOfWeek.setDate(today.getDate() - today.getDay() + 1);

    // Trouver le dernier jour de la semaine (dimanche)
    var endOfWeek = new Date(startOfWeek);
    endOfWeek.setDate(startOfWeek.getDate() + 6);

    for (var i = 0; i < listeTaches.length; i++) {
        var task = listeTaches[i];
        var taskDate = parseDate(task.dateHeure);

        if (taskDate >= startOfWeek && taskDate <= endOfWeek && taskDate !== today) {
            filteredTasks.push(task);
        }
    }

    return filteredTasks;
}


// ------- LATER ---------------------------------------------------

function getFilteredLaterTasks(listeTaches)
{
    var filteredTasks = [];
    var today = new Date();

    // Trouver le premier jour de la semaine (lundi)
    var startOfWeek = new Date(today);
    startOfWeek.setDate(today.getDate() - today.getDay() + 1);

    // Trouver le dernier jour de la semaine (dimanche)
    var endOfWeek = new Date(startOfWeek);
    endOfWeek.setDate(startOfWeek.getDate() + 6);

    for (var i = 0; i < listeTaches.length; i++) {
        var task = listeTaches[i];
        var taskDate = parseDate(task.dateHeure);

        // Vérifier si la date de la tâche est après la fin de la semaine en cours
        if (taskDate > endOfWeek) {
            filteredTasks.push(task);
        }
    }

    return filteredTasks;
}


//---- FONCTION UTILS -----------------------------------------------

function getDateFormatted()
{
    var today = new Date();

    // Récupérer le jour, le mois et l'année
    var day = String(today.getDate()).padStart(2, '0');
    var month = String(today.getMonth() + 1).padStart(2, '0'); // Les mois commencent à 0 en JavaScript, donc on ajoute 1
    var year = today.getFullYear();

    // Formater la date en "jj/mm/aaaa"
    var formattedDate = day + '/' + month + '/' + year;

    return formattedDate;
}

// Fonction pour convertir le format "jj/mm/aaaa hh:ss AM/PM" en objet Date
function parseDate(dateString) {
    var [datePart, timePart] = dateString.split(' ');
    var [day, month, year] = datePart.split('/').map(Number);
    var [hours, minutes] = timePart.split(':').map(Number);
    var amPm = timePart.slice(-2);

    if (amPm === 'PM' && hours < 12) hours += 12;
    if (amPm === 'AM' && hours === 12) hours = 0;

    return new Date(year, month - 1, day, hours, minutes);
}
