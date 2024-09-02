import QtQuick 6.7
import QtQuick.Controls 6.7
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

    property int itemHeight: 30
    property int itemContainerHeight: itemHeight + listView.bottomMargin + listView.spacing

    width: parent.width
    height: header.height + listView.height

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
                        if (animationDefilement.running)
                            animationDefilement.stop();

                        // Si la section est visible, cachez-la et animez la hauteur à 0
                        if (listView.visible) {
                            animationDefilement.to = 0;
                        } else {
                            // Affichez la section et animez la hauteur
                            listView.visible = true;
                            animationDefilement.to = itemContainerHeight * tacheModel.count;
                        }

                        animationDefilement.running = true;
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
                color: "transparent"
                border.color: "lightgray"
                height: itemHeight
                width: parent.width
                radius: 10

                Row {
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    Image {
                        id: iconValidate
                        source: model.isCompleted ? "images/task_checked" : "images/task_unchecked"
                        width: 20
                        height: 20
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                model.isCompleted = !model.isCompleted;
                            }
                        }
                    }

                    Text {
                        text: model.titre
                        anchors.verticalCenter: parent.verticalCenter
                        padding: 10
                        font.pixelSize: 12
                    }
                }
            }

            NumberAnimation on height {
                id: animationDefilement
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

    Component.onCompleted: {
        if (sectionVisible) {
            listView.height = itemContainerHeight * tacheModel.count;
            listView.visible = true;
        }
    }
}
