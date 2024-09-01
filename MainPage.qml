import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

Item {
    anchors.fill: parent

    Column {
        spacing: 10

        // Section "Today"
        Item {
            id: todaySection
            width: parent.width
            height: headerToday.height + (listViewToday.visible ? listViewToday.height : 0)

            Column {
                Rectangle {
                    id: headerToday
                    width: parent.width
                    height: 40
                    color: "lightblue"

                    Text {
                        anchors.centerIn: parent
                        text: "Today"
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
                    visible: false
                    model: gestionTaches.listeTaches.filter(function(tache) {
                        return tache.dateHeure.date() === Qt.formatDate(new Date(), "yyyy-MM-dd")
                    })
                    delegate: Text {
                        text: modelData.titre
                        padding: 10
                    }
                }
            }
        }

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
    }
}
