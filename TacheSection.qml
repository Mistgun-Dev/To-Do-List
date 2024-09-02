import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "UpdateView.js" as Update

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
    property int expandedHeight: 70

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
                            // Affichez la section et animez la hauteur
                            listView.visible = true;
                            animationDefilementListview.to = collapsedHeight * tacheModel.count;
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

            delegate: Rectangle
            {
                id: itemRect
                color: "transparent"
                border.color: "lightgray"
                //border.width : 2
                height: isExpanded ? expandedHeight : collapsedHeight
                width: parent.width - listView.spacing
                radius: 10

                property bool isExpanded: false

                Row {
                    id: rowInRect
                    anchors.fill: parent
                    spacing: 10
                    anchors.leftMargin: 15

                    Image {
                        id: iconValidate
                        source: model.isCompleted ? "images/task_checked" : "images/task_unchecked"
                        anchors.verticalCenter: parent.verticalCenter
                        width: 17
                        height: 17
                        fillMode: Image.PreserveAspectFit

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                model.isCompleted = !model.isCompleted;
                                line.visible = !line.visible
                            }
                        }
                    }

                    Column {
                        id: columnInRect
                        anchors.fill: parent
                        anchors.leftMargin: 25

                        Text {
                            text: model.titre
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 12
                        }

                        Text {
                            text: model.note
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            visible: isExpanded
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {

                                // Si on clique sur une tache et qu'aucune autre est ouvert
                                if (tacheOuverte !== null && tacheOuverte !== itemRect) {
                                    tacheOuverte.isExpanded = false
                                    tacheOuverte.height = collapsedHeight
                                    listView.height -= (expandedHeight - collapsedHeight)
                                    tacheOuverte.border.color = "lightgray"
                                }

                                // Ouvrir le nouvel élément
                                isExpanded = !isExpanded
                                itemRect.height = isExpanded ? expandedHeight : collapsedHeight
                                itemRect.border.color = isExpanded ? "lightgreen" : "lightgray"
                                if(isExpanded)
                                    listView.height += (expandedHeight - collapsedHeight)
                                else
                                    listView.height -= (expandedHeight - collapsedHeight)
                                // Mettre à jour l'élément actuellement étendu
                                tacheOuverte = isExpanded ? itemRect : null
                            }
                        }
                    }
                }

                Behavior on height {
                    NumberAnimation {
                        id: animationDefilementTache
                        duration: 300
                        easing.type: Easing.InOutBack
                        onStopped: {

                        }
                    }
                }

                // Ligne horizontale au milieu du rectangle lorsqu
                Rectangle {
                    id: line
                    visible: false;
                    width: columnInRect.width - columnInRect.x
                    height: 1
                    x:  columnInRect.x + columnInRect.anchors.leftMargin - rowInRect.spacing
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            NumberAnimation on height {
                id: animationDefilementListview
                duration: 300
                easing.type: Easing.Bezier
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
}
