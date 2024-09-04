import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "UpdateView.js" as Update
import "ListeTaches.js" as EditTaches

Item {
    id: tacheSection
    property alias sectionTitre: headerText.text
    property alias tacheModel: listView.model
    property alias headerHeight: header.height
    property alias color: header.color
    property alias textColor: headerText.color
    property alias bulleColor: nbTacheBulle.color
    property bool sectionVisible: listView.visible

    property int collapsedHeight: 30
    property int expandedHeight: 75

    // Animation de hauteur pour l'insertion
    property bool isNew: false

    width: parent.width
    height: header.height + listView.height

    // Variable globale pour suivre l'élément actuellement étendu
    property Rectangle tacheOuverte: null

    Component.onCompleted: {
        if (sectionVisible) {
            listView.height = collapsedHeight * (tacheModel.count + 1);
            listView.visible = true;
        }
    }

    Column {
        width: parent.width
        height: parent.height

        // Header
        Row {
            spacing: 0
            width: parent.width

            Rectangle {
                id: header
                width: headerText.implicitWidth + iconArrow.width + 10
                height: 30
                color: "lightblue"
                radius: 5

                Row {
                    anchors.fill: parent

                    // Icone flèche
                    Image {
                        id: iconArrow
                        source: "images/arrow_down.png"
                        width: 22
                        height: 22
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    // Nom de la section
                    Text {
                        id: headerText
                        font.pixelSize: 15
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (animationDefilementListview.running)
                            animationDefilementListview.stop();

                        // Si la section est visible, cachez-la et animez la hauteur à 0
                        if (listView.visible) {
                            animationDefilementListview.to = 0;
                        } else {
                            listView.visible = true;
                            animationDefilementListview.to = collapsedHeight * (tacheModel.count + 1);
                        }

                        animationDefilementListview.running = true;
                    }
                }
            }

            // Bulle, nombre de tâches restante
            Rectangle {
                id: nbTacheBulle
                width: 20
                height: 20
                radius: 50
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    id: textTacheRestante
                    anchors.centerIn: parent
                    font.pixelSize: 11
                    font.bold: true
                    color : "white"
                    text: Update.getNombreDeTachesIncomplete(tacheModel)
                }
            }
        }

        ListView {
            id: listView
            width: parent.width
            height: 0
            spacing: 10
            anchors.margins: 20
            visible: false // Initialement non visible

            delegate: Rectangle {
                id: itemRect
                color: "white"
                border.color: "lightgray"
                border.width: 2
                height: isExpanded ? expandedHeight : collapsedHeight
                width: parent.width - listView.spacing
                radius: 5

                property bool isExpanded: false

                Row {
                    id: rowInRect
                    anchors.fill: parent
                    spacing: 10
                    anchors.leftMargin: 15

                    // Bouton de validation de la tâche
                    Image {
                        id: iconValidate
                        source: model.isCompleted ? "images/task_checked.png" : "images/task_unchecked.png"
                        anchors.verticalCenter: parent.verticalCenter
                        width: 17
                        height: 17
                        fillMode: Image.PreserveAspectFit

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                model.isCompleted = !model.isCompleted;
                                line.visible = !line.visible;
                            }
                        }
                    }

                    // Item pour les textes et les dates
                    Item {
                        id: rowListElements
                        anchors.fill: parent
                        anchors.leftMargin: iconValidate .width + rowInRect.spacing
                        anchors.rightMargin: iconEdit.width + iconDelete.width + iconEdit.anchors.rightMargin + iconDelete.anchors.rightMargin + 20

                        // Titre
                        Text {
                            id: titleText
                            text: model.titre
                            font.pixelSize: 14
                            wrapMode: Text.WordWrap
                            font.bold: true
                            elide: Text.ElideRight
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Note
                        Text {
                            text: model.note
                            visible: isExpanded
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                            elide: Text.ElideRight
                            anchors.centerIn: parent
                        }

                        // Date
                        Text {
                            id: dateText
                            text: model.dateHeure
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                            color: "green"
                            elide: Text.ElideRight
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // Si on clique sur une tâche et qu'aucune autre est ouverte
                                if (tacheOuverte !== null && tacheOuverte !== itemRect) {
                                    tacheOuverte.isExpanded = false;
                                    tacheOuverte.height = collapsedHeight;
                                    listView.height -= (expandedHeight - collapsedHeight);
                                    tacheOuverte.border.color = "lightgray";
                                }

                                // Ouvrir le nouvel élément
                                isExpanded = !isExpanded;
                                itemRect.height = isExpanded ? expandedHeight : collapsedHeight;
                                itemRect.border.color = isExpanded ? "lightgreen" : "lightgray";
                                if (isExpanded)
                                    listView.height += (expandedHeight - collapsedHeight);
                                else
                                    listView.height -= (expandedHeight - collapsedHeight);

                                // Mettre à jour l'élément actuellement étendu
                                tacheOuverte = isExpanded ? itemRect : null;
                            }
                        }
                    }

                    NumberAnimation on x {
                        id: deleteAnimation
                        target: itemRect
                        running: false
                        property: "x"
                        to: -parent.width
                        duration: 500
                        easing.type: Easing.InOutQuad
                        onStopped: {
                            listView.height -= itemRect.height + listView.spacing;
                            gestionTaches.supprimerTache(model.id);
                            listView.model.remove(model.index);
                            EditTaches.updateTask(model.id);
                        }
                    }

                    // Bouton supprimer
                    Image {
                        id: iconDelete
                        source: "images/delete.png"
                        anchors.verticalCenter: parent.verticalCenter
                        width: 22
                        height: 22
                        fillMode: Image.PreserveAspectFit
                        anchors.rightMargin: 10
                        anchors.right: parent.right

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(!model.isCompleted)
                                    deleteAnimation.running = true;
                                    tache.id = model.id;
                                    dbManager.removeTache(tache.id)
                            }
                        }
                    }

                    // Bouton éditer
                    Image {
                        id: iconEdit
                        source: "images/edit.png"
                        anchors.verticalCenter: parent.verticalCenter
                        width: 22
                        height: 22
                        fillMode: Image.PreserveAspectFit
                        anchors.rightMargin: 15
                        anchors.right: iconDelete.left

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                dynamicLoader.source = "NewTask.qml";
                                tache.titre = model.titre;
                                tache.note = model.note;
                                tache.dateHeure = model.dateHeure;
                                tache.id = model.id;
                                tache.priority = model.priority;
                                dynamicLoader.item.isEditMode = true;
                            }
                        }
                    }
                }

                Behavior on height {
                    NumberAnimation {
                        id: animationDefilementTache
                        duration: 300
                        easing.type: Easing.InOutBack
                    }
                }

                // Ligne horizontale au milieu du rectangle lorsque on valide la tâche
                Rectangle {
                    id: line
                    visible: false;
                    width: rowListElements.width + rowListElements.anchors.rightMargin - 20
                    height: 1
                    x: rowListElements.x + rowListElements.anchors.leftMargin - rowInRect.spacing
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }


            NumberAnimation on height {
                id: animationDefilementListview
                duration: 300
                //easing.type: Easing.InElastic
                onStopped: {
                    if (listView.height === 0) {
                        listView.visible = false;
                        iconArrow.source = "images/arrow_down.png";
                    } else {
                        iconArrow.source = "images/arrow_up.png";
                    }
                }
            }
        }
    }

    signal newTaskAdded()

    function addTask(tache) {
        isNew = true;
        tacheModel.insert(0, tache);
        listView.visible = true;
        animationDefilementListview.to = collapsedHeight * (tacheModel.count +1);
        animationDefilementListview.running = true;
    }

    onNewTaskAdded: {
        addTask(tache);
    }
}
