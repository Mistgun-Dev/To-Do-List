import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "FiltrerTaches.js" as Filtre
import "."

Item {
    width: parent.width
    height: parent.height
    x: 5
    y: 10


    Column {
        width: parent.width
        height: parent.height
        spacing: 10

        // Section "Today"
        TacheSection {
            sectionTitre: "Today"
            color: "transparent"
            bulleColor: "green"
            textColor: "black"
            sectionVisible: true

            tacheModel:
                ListModel {
                    id: todayModel
                    Component.onCompleted: {
                        var listeTachesToday = Filtre.getFilteredTodayTasks(gestionTaches.listeTaches);
                        console.log("Today tasks count = ", listeTachesToday.length);
                        for (var i = 0; i < listeTachesToday.length; i++) {
                            append(listeTachesToday[i]);
                        }
                    }
                }
        }

        // Section "This Week"
        TacheSection {
            sectionTitre: "This Week"
            color: "transparent"
            bulleColor: "orange"
            textColor: "black"
            sectionVisible: false
            tacheModel: ListModel {
                id: thisWeekModel
                Component.onCompleted: {

                    var listeTachesThisWeek = Filtre.getFilteredThisWeekTasks(gestionTaches.listeTaches);
                    console.log("Week tasks count = ", listeTachesThisWeek.length);
                    for (var i = 0; i < listeTachesThisWeek.length; i++) {
                        append(listeTachesThisWeek[i]);
                    }
                }
            }
        }

        // Section "Later"
        TacheSection {
            sectionTitre: "Later"
            color: "transparent"
            bulleColor: "purple"
            textColor: "black"
            sectionVisible: false
            tacheModel: ListModel {
                id: tacheLaterModel
                Component.onCompleted: {
                    var listeTachesLater = Filtre.getFilteredLaterTasks(gestionTaches.listeTaches);
                    for (var i = 0; i < listeTachesLater.length; i++) {
                        append(listeTachesLater[i]);
                    }
                }
            }
        }
    }
}
