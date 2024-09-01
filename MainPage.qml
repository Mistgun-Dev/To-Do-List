import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

Item {

    property int itemHeight: 40 // Taille en hauteur d'une tache affichée

    Column {

        width: parent.width
        height: parent.height
        spacing: 10

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
                               id: tachesModel
                               Component.onCompleted: {
                                   var taches = gestionTaches.getTachesAsVariantList();
                                   for (var i = 0; i < taches.length; i++) {
                                       tachesModel.append(taches[i]);
                                   }
                               }
                    }

                    /*model: gestionTaches.listeTaches.filter(function(tache) {
                        var now = new Date()
                        var endOfWeek = new Date(now.getFullYear(), now.getMonth(), now.getDate() + (7 - now.getDay()))
                        return tache.dateHeure.date() > Qt.formatDate(now, "yyyy-MM-dd") && tache.dateHeure.date() <= Qt.formatDate(endOfWeek, "yyyy-MM-dd")
                    })*/
                    delegate: Text {
                        text: model.titre
                        padding: 10
                    }
                }
            }
        }

        /*
        // Section "This Week"
        Item {
            id: thisWeekSection
            width: parent.width
            height: headerThisWeek.height + (listViewThisWeek.visible ? listViewThisWeek.height : 0)

            Column {
                Rectangle {
                    id: headerThisWeek
                    width: parent.width
                    height: 40
                    color: "lightgreen"

                    Text {
                        anchors.centerIn: parent
                        text: "This Week"
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
                    visible: false
                    model: gestionTaches.listeTaches.filter(function(tache) {
                        var now = new Date()
                        var endOfWeek = new Date(now.getFullYear(), now.getMonth(), now.getDate() + (7 - now.getDay()))
                        return tache.dateHeure.date() > Qt.formatDate(now, "yyyy-MM-dd") && tache.dateHeure.date() <= Qt.formatDate(endOfWeek, "yyyy-MM-dd")
                    })
                    delegate: Text {
                        text: modelData.titre
                        padding: 10
                    }
                }
            }
        }

        // Section "Later"
        Item {
            id: laterSection
            width: parent.width
            height: headerLater.height + (listViewLater.visible ? listViewLater.height : 0)

            Column {
                Rectangle {
                    id: headerLater
                    width: parent.width
                    height: 40
                    color: "lightcoral"

                    Text {
                        anchors.centerIn: parent
                        text: "Later"
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
                    visible: false
                    model: gestionTaches.listeTaches.filter(function(tache) {
                        var now = new Date()
                        var endOfWeek = new Date(now.getFullYear(), now.getMonth(), now.getDate() + (7 - now.getDay()))
                        return tache.dateHeure.date() > Qt.formatDate(endOfWeek, "yyyy-MM-dd")
                    })
                    delegate: Text {
                        text: modelData.titre
                        padding: 10
                    }
                }
            }
        }
    */
    }

}



/*
import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

Item {

    Column {
        width: parent.width
        height: parent.height
        spacing: 10
        Rectangle {
            id: headerToday
            width: parent.width
            height: 40
            color: "red"
            border.color: "black"

            Text {
                anchors.centerIn: parent
                text: "Today"
                color: "white"
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
            height: 100
            visible: false
            model: ListModel {
                ListElement { titre: "Task 1" }
                ListElement { titre: "Task 2" }
            }
            delegate: Text {
                text: model.titre
                padding: 10
            }
        }
    }
}
*/
