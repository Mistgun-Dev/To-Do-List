import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

Item {

    property int itemHeight: 40 // Taille en hauteur d'une tache affichée

    Column {

        width: parent.width
        height: parent.height
        spacing: 10

        //-----------------------------------------------------------------------------------------------------
        // Section "Today"
        Item {
            width: parent.width
            height: headerToday.height + (listViewToday.visible ? listViewToday.height : 0)

            Column {
                width: parent.width
                height: parent.height

                Rectangle {
                    id: headerToday
                    width: parent.width
                    height: 30
                    color: "lightblue"

                    Text {
                        anchors.centerIn: parent
                        text: "Today"
                        font.pixelSize: 20
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listViewToday.visible = !listViewToday.visible
                        }
                    }
                }

                ListView {
                    id: listViewToday
                    width: parent.width
                    height: itemHeight * model.count
                    visible: true

                    model: ListModel {
                        id: tacheTodayModel
                        Component.onCompleted: {
                            for (var i = 0; i < gestionTaches.listeTaches.length; i++) {
                                var tache = gestionTaches.listeTaches[i];
                                append(tache);
                            }
                        }
                    }

                    delegate: Text {
                        text: model.titre
                        padding: 10
                    }
                }
            }
        }

        //-----------------------------------------------------------------------------------------------------
        // Section "This Week"
        Item {
            id: thisWeekSection
            width: parent.width
            height: headerThisWeek.height + (listViewThisWeek.visible ? listViewThisWeek.height : 0)

            Column {
                width: parent.width
                height: parent.height

                Rectangle {
                    id: headerThisWeek
                    width: parent.width
                    height: 40
                    color: "lightgreen"

                    Text {
                        anchors.centerIn: parent
                        text: "This Week"
                        font.pixelSize: 20
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listViewThisWeek.visible = !listViewThisWeek.visible
                        }
                    }
                }

                ListView {
                    id: listViewThisWeek
                    width: parent.width
                    height: itemHeight * model.count
                    visible: false
                    model: ListModel {
                        id: tacheThisWeekModel
                        Component.onCompleted: {
                            for (var i = 0; i < gestionTaches.listeTaches.length; i++) {
                                var tache = gestionTaches.listeTaches[i];
                                append(tache);
                            }
                        }
                    }
                    delegate: Text {
                        text: model.titre
                        padding: 10
                    }
                }
            }
        }

        //-----------------------------------------------------------------------------------------------------
        // Section "Later"
        Item {
            id: laterSection
            width: parent.width
            height: headerLater.height + (listViewLater.visible ? listViewLater.height : 0)

            Column {
                width: parent.width
                height: parent.height

                Rectangle {
                    id: headerLater
                    width: parent.width
                    height: 40
                    color: "lightcoral"

                    Text {
                        anchors.centerIn: parent
                        text: "Later"
                        font.pixelSize: 20
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listViewLater.visible = !listViewLater.visible
                        }
                    }
                }

                ListView {
                    id: listViewLater
                    width: parent.width
                    height: itemHeight * model.count
                    visible: false
                    model: ListModel {
                        id: tacheLaterModel
                        Component.onCompleted: {
                            for (var i = 0; i < gestionTaches.listeTaches.length; i++) {
                                var tache = gestionTaches.listeTaches[i];
                                append(tache);
                            }
                        }
                    }
                    delegate: Text {
                        text: model.titre
                        padding: 10
                    }
                }
            }
        }
    }

    //-----------------------------------------------------------------------------------------------------
    // Gestion des connexions pour actualiser la vue lorsqu'on ajoute, supprime, ou modifie une tache
    Connections {
        target: gestionTaches
        onTacheUpdate: {
            tacheTodayModel.clear();
            for (var i = 0; i < gestionTaches.listeTaches.length; i++) {
                var tache = gestionTaches.listeTaches[i];
                tacheTodayModel.append(tache);
            }
        }
    }
}

/*model: gestionTaches.listeTaches.filter(function(tache) {
    var now = new Date()
    var endOfWeek = new Date(now.getFullYear(), now.getMonth(), now.getDate() + (7 - now.getDay()))
    return tache.dateHeure.date() > Qt.formatDate(now, "yyyy-MM-dd") && tache.dateHeure.date() <= Qt.formatDate(endOfWeek, "yyyy-MM-dd")
})*/
