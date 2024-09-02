import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Controls.Fusion
import QtQuick.Layouts 6.7
import "."

Page {
    id: page
    visible: true
    width: mainWindow.width
    height: mainWindow.height
    title: "New Task"

    // Propriété pour déterminer le mode
    property bool isDarkMode: false

    // Propriétés pour le mode clair
    property color headerColorLight: "#4CAF50"
    property color textColorLight: "#4CAF50"
    property color buttonColorLight: "#4CAF50"
    property color inputFieldColorLight: "gray"
    property color backgroundColorLight: "#F7F7F7"

    // Propriétés pour le mode sombre
    property color headerColorDark: "#2E7D32"
    property color textColorDark: "#2E7D32"
    property color buttonColorDark: "#81C784"
    property color inputFieldColorDark: "#FFFFFF"
    property color backgroundColorDark: "#303030"

    // Liaison des couleurs en fonction du mode
    property color headerColor: isDarkMode ? headerColorDark : headerColorLight
    property color textColor: isDarkMode ? textColorDark : textColorLight
    property color buttonColor: isDarkMode ? buttonColorDark : buttonColorLight
    property color inputFieldColor: isDarkMode ? inputFieldColorDark : inputFieldColorLight
    property color backgroundColor: isDarkMode ? backgroundColorDark : backgroundColorLight

    // Propriétés pour la taille de police
    property int fontSize: 20

    // Choix de la taille de police selon les besoins
    property int fontSizeHeader: fontSize
    property int fontSizeLabel: fontSize - 2
    property int fontSizeInput: fontSize - 4

    property bool isEditMode: false

    //fonction pour génerer un int aléatoire pour l'affecter à l'id d'une tâche
    function generateRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    header: ToolBar {
        id: toolbar
        width: page.width
        background: Rectangle {
            color: headerColor
            //width: page.width
        }

        RowLayout {
            width: parent.width

            Button {
                icon.source: "images/logout"
                Layout.alignment: Qt.AlignLeft
                icon.width: 30  // Ajustez la taille de l'icône
                icon.height: 30
                background: Rectangle { color: "transparent"}
                id: redRect
                onPressed: {
                    anim.start()
                    stackView.pop()
                }
                SequentialAnimation {
                    id: anim
                    // Expand the button
                    PropertyAnimation {
                        target: redRect
                        property: "scale"
                        to: 1.3
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }

                    // Shrink back to normal
                    PropertyAnimation {
                        target: redRect
                        property: "scale"
                        to: 1.0
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: page.isEditMode ? qsTr("Edit task") : qsTr("New task")
                color: "white"
                font.pixelSize: fontSizeHeader
                Layout.alignment: Qt.AlignCenter
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        Label {
            text: "Title"
            color: textColor
             font.pixelSize: fontSizeLabel
        }

        TextField {
            id: textfieldtitre
            Layout.fillWidth: true
            implicitHeight: page.height* 0.08 /*40*/
            placeholderText: "Task name"
            text:  page.isEditMode ? qsTr("l'ancien titre") : qsTr("")
            placeholderTextColor : inputFieldColor
            color : inputFieldColor
            font.pixelSize: fontSizeInput
            background: Rectangle {
                color: backgroundColor
                border.color: "lightgray"
                radius: 5
            }
            onEditingFinished: tache.titre= textfieldtitre.text
        }

        Label {
            text: "Due date"
            color: textColor
            font.pixelSize: fontSizeLabel
        }

        RowLayout {

            TextField {
                id: textfieldate
                Layout.fillWidth: true
                implicitHeight: page.height* 0.08
                placeholderText: "dd/MM/yyyy"
                color : inputFieldColor
                placeholderTextColor : inputFieldColor
                font.pixelSize: fontSizeInput
                background: Rectangle {
                    color: backgroundColor
                    border.color: "lightgray"
                    radius: 5
                }
                onEditingFinished: tache.titre= textfieldate.text
            }

            Button {
                icon.source: "images/Calendar_Icon"
                icon.width: 27  // Ajustez la taille de l'icône
                icon.height: 27
                background: Rectangle {
                    color: isDarkMode ?"#E8F5E9":"#F7F7F7"
                    border.color: "lightgreen"
                    radius: 10
                }
                padding: 4
                onClicked: dateSelectorDialog.open()
            }
        }

        Label {
            text: "Due time"
            color: textColor
            font.pixelSize: fontSizeLabel
        }

        RowLayout {

            TextField {
                id: textfieltime
                Layout.fillWidth: true
                implicitHeight: page.height* 0.08
                placeholderText: "hh:mm AP"
                color : inputFieldColor
                placeholderTextColor : inputFieldColor
                font.pixelSize: fontSizeInput
                background: Rectangle {
                    color: backgroundColor
                    border.color: "lightgray"
                    radius: 5
                }
                onEditingFinished: tache.titre= textfieltime.text
            }

            Button {
                icon.source: "images/Clock_Icon"
                icon.width: 27  // Ajustez la taille de l'icône
                icon.height: 27
                background: Rectangle {
                    color: isDarkMode ?"#E8F5E9":"#F7F7F7"
                    border.color: "lightgreen"
                    radius: 10
                }
                padding: 4  // Ajoutez du padding pour un meilleur affichage
                onClicked: timeSelectorDialog.open()
                }
        }

        RowLayout {
            id: noteRow
            Layout.fillWidth: true
            spacing: 10

        Label {
            text: "Notes"
            color: textColor
            font.pixelSize: fontSizeLabel
        }
        // Bouton "Finished Editing"
        Button {
                text: qsTr("Finished Editing")
                font.pixelSize: fontSizeInput
                background: Rectangle {
                    color: buttonColor
                    radius: 10
                }
                Layout.alignment: Qt.AlignRight
                onClicked: {
                    note.focus = false
                    textfieldtitre.forceActiveFocus()
                }
            }
        }

        TextArea {
            id: note
            text:  page.isEditMode ? qsTr("la note ancienne") : qsTr("")
            color : inputFieldColor
            font.pixelSize: fontSizeInput
            Layout.fillWidth: true
            Layout.fillHeight: true
            implicitHeight: page.height* 0.2
            background: Rectangle {
                color: backgroundColor
                border.color: "lightgray"
                radius: 5
            }

            onEditingFinished : {
                tache.note= note.text
            }
        }

        Button {
            text: page.isEditMode ? qsTr("Update task") : qsTr("Add task")
            font.pixelSize: fontSizeInput
            background: Rectangle {
                color: buttonColor
                radius: 20
            }
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            onClicked: {
                console.log("Task added")
                tache.id = page.generateRandomInt(1, 100);
                //console.log("Task added")
                tache.dateHeure = textfieldate.text +" "+ textfieltime.text
                tache.priority = 1
                gestionTaches.ajouterTache(tache.id, tache.titre, tache.note, tache.dateHeure, tache.priority)
                stackView.pop()
            }
        }
    }

    background: Rectangle {
        //color: "white"
        color: backgroundColor
    }

    // Ajouter un bouton pour basculer entre le mode clair et le mode sombre
        Button {
            text: isDarkMode ? "Mode clair" : "Mode sombre"
            background: Rectangle {
                color: buttonColor
                radius: 10
            }
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 20
            onClicked: {
                isDarkMode = !isDarkMode
            }
        }

    DateSelector {
        id: dateSelectorDialog
    }

    TimeSelector {
        id: timeSelectorDialog
    }
}
