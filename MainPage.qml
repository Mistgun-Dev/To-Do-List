import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Controls.Material
import QtQuick.Layouts 6.7
import "FiltrerTaches.js" as Filtre
import "ListeTaches.js" as Tache
import "."

Item {
    width: parent.width
    height: parent.height
    z: 1

        Image {
            source: "images/background.jpg"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
        }

        PageHome
        {
            anchors.fill: parent
            z:2
        }

        Column {
            id: column
            width: parent.width
            height: parent.height - buttonAddTask.height - y - 20
            x:5
            y: 50
            spacing: 15


            Row{
                width: parent.width
                height: 30
                anchors.leftMargin: 25
                anchors.rightMargin: 25
                spacing : 5

                TextField {
                    id: newTaskAutomatic
                    width: parent.width - buttonAddAutomaticTask.width - 20
                    height : parent.height
                    placeholderText: "Entrez une nouvelle tâche"
                    font.pixelSize: 15
                }

                Button {
                    id: buttonAddAutomaticTask
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Ajouter")
                    width: 150
                    height: 40
                    highlighted: true
                    Material.background: Material.Green
                    onClicked: {
                        if(newTaskAutomatic.length === 0)
                        {
                            //
                        }
                        else{
                            tache.id = 123;
                            tache.titre = newTaskAutomatic.text;
                            tache.note = "";
                            tache.dateHeure = tache.getDateHeureNow();
                            console.log("TACHE = ", tache.dateHeure);
                            tache.priority = 1;

                            gestionTaches.ajouterTache(tache.id, tache.titre, tache.note, tache.dateHeure, tache.priority);
                            //Tache.addTaskInListe(tache);

                            // Notify each TacheSection about the new task
                            sectionToday.newTaskAdded(tache);
                        }
                    }
                }
            }

            //Espacement
            Item{
                height: 20
            }

            // Section "Today"
            TacheSection {
                id: sectionToday
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
        // Bouton Ajouter Tache
        Rectangle{
            id: buttonAddTask
            anchors.horizontalCenter: parent.horizontalCenter
            width: 60
            height: 60
            //radius: 0
            anchors.margins: 25
            anchors.bottom: parent.bottom
            color: "transparent";
            z: 2
            //border.color: "lightgray"
            //border.width: 2

            Image {
                source: "images/addbutton.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    dynamicLoader.source = "NewTask.qml";
                    if (dynamicLoader.item)
                        dynamicLoader.item.isEditMode = false;

                    dynamicLoader.item.forceActiveFocus();
                    dynamicLoader.item.width = dynamicLoader.item.width;
                }
            }
        }
}
