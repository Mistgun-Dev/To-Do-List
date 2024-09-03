function getFilteredTodayTasks(listeTaches)
{
    var filteredTasks = [];

    for (var i = 0; i < listeTaches.length; i++) {
        var task = listeTaches[i];

        var today = new Date();
        var ret = (task.dateHeure === today.toDateString());

        if (ret) {
            filteredTasks.push(task);
        }
    }
    return filteredTasks;
}

//-------------------------------------------------------------------

function getFilteredThisWeekTasks(listeTaches)
{
    var filteredTasks = [];

    var now = new Date();

    // Trouver le premier jour de la semaine (lundi)
    var startOfWeek = new Date(now);
    startOfWeek.setDate(now.getDate() - now.getDay() + 1);

    // Trouver le dernier jour de la semaine (dimanche)
    var endOfWeek = new Date(startOfWeek);
    endOfWeek.setDate(startOfWeek.getDate() + 6);

    for (var i = 0; i < listeTaches.length; i++) {
        var task = listeTaches[i];

        // Créer un objet Date pour la date de la tâche
        var taskDate = new Date(task.dateHeure);

        // Vérifier si la date de la tâche est dans la semaine en cours
        if (taskDate >= startOfWeek && taskDate <= endOfWeek) {
            filteredTasks.push(task);
        }
    }

    return filteredTasks;
}

//-------------------------------------------------------------------

function getFilteredLaterTasks(listeTaches) {
    var filteredTasks = [];

    var now = new Date();

    // Trouver le premier jour de la semaine prochaine (lundi)
    var startOfNextWeek = new Date(now);
    startOfNextWeek.setDate(now.getDate() - now.getDay() + 8); // Passer au lundi de la semaine suivante

    // Parcourir la liste des tâches
    for (var i = 0; i < listeTaches.length; i++) {
        var task = listeTaches[i];

        // Créer un objet Date pour la date de la tâche
        var taskDate = new Date(task.dateHeure);

        // Vérifier si la date de la tâche est au-delà du début de la semaine prochaine
        if (taskDate >= startOfNextWeek) {
            filteredTasks.push(task);
        }
    }

    return filteredTasks;
}
