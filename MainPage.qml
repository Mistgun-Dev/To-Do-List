import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "."

Item {
    width: parent.width
    height: parent.height
    x: 10
    y: 10

    Column {
        width: parent.width
        height: parent.height
        spacing: 10

        // Section "Today"
        TacheSection {
            sectionTitre: "Today"
            color: "lightblue"
            tacheModel: ListModel {
                id: tacheTodayModel
                Component.onCompleted: {
                    for (var i = 0; i < gestionTaches.listeTaches.length; i++) {
                        var tache = gestionTaches.listeTaches[i];
                        append(tache);
                    }
                }
            }
        }

        // Section "This Week"
        TacheSection {
            sectionTitre: "This Week"
            color: "lightgreen"
            tacheModel: ListModel {
                id: tacheThisWeekModel
                Component.onCompleted: {
                    for (var i = 0; i < gestionTaches.listeTaches.length; i++) {
                        var tache = gestionTaches.listeTaches[i];
                        append(tache);
                    }
                }
            }
        }

        // Section "Later"
        TacheSection {
            sectionTitre: "Later"
            color: "lightcoral"
            tacheModel: ListModel {
                id: tacheLaterModel
                Component.onCompleted: {
                    for (var i = 0; i < gestionTaches.listeTaches.length; i++) {
                        var tache = gestionTaches.listeTaches[i];
                        append(tache);
                    }
                }
            }
        }
    }
}
