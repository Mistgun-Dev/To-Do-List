import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "FiltrerTaches.js" as Filtre
import "ListeTaches.js" as Tache
import "."

Item {
    width: parent.width
    height: parent.height

    /*
    Component.onCompleted{
        var listeTachesGlobale = gestionTaches.listeTaches
    }
    */

    //Column{

        PageHome
        {
            anchors.fill: parent
        }

        Column {
            width: parent.width
            height: parent.height
            x:5
            y: 45
            spacing: 15

            // Bouton Ajouter Tache
            Rectangle{
                id: buttonAddTask
                width: parent.width - buttonAddTask.anchors.margins
                height: 30
                radius: 10
                anchors.margins: 15
                //anchors.bottom: parent.bottom
                color: "green";
                border.color: "lightgray"
                border.width: 2
                Text{
                    text: "Add new task"
                    color:"white"
                    font.bold: true
                    font.pixelSize: 15
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        page.isEditMode = false;
                        dynamicLoader.source = "NewTask.qml";
                    }
                }
            }

            //Espacement
            Item{
                height: 20
            }

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
                            var listeTachesToday = Filtre.getFilteredTodayTasks(Tache.getListeTaches());
                            //var listeTachesToday = Tache.getListeTaches();
                            console.log(" NN = ", listeTachesToday.length)
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

                        var listeTachesThisWeek = Filtre.getFilteredThisWeekTasks(Tache.getListeTaches());
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
                        var listeTachesLater = Filtre.getFilteredLaterTasks(Tache.getListeTaches());
                        for (var i = 0; i < listeTachesLater.length; i++) {
                            append(listeTachesLater[i]);
                        }
                    }
                }
            }
        }
    //}
}
