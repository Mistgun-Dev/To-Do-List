import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Controls.Fusion
import QtQuick.Layouts 6.7
import "."
import "ListeTaches.js" as EditTaches

/**
 * @class Page
 * @brief Page principale pour créer ou modifier une tâche.
 * Cette page permet à l'utilisateur de créer une nouvelle tâche ou de modifier une tâche existante.
 * Elle offre également la possibilité de sélectionner une date et une heure pour la tâche.
 */
Page {
    id: page
    visible: true
    width: mainWindow.width
    height: mainWindow.height
    title: "New Task"

    /** type:bool Propriété pour déterminer s'il s'agit d'une modification de tâche ou bien création */
    property bool isEditMode: false

    /** type:bool Propriété pour déterminer si le mode est sombre */
    property bool isDarkMode: false

    /** type:color Propriété pour la couleur du header en mode clair */
   //property color headerColorLight: "#4CAF50"
    property color headerColorLight: mainWindow.parametrage

    /** type:color Propriété pour la couleur du label en mode clair */
    //property color textColorLight: "#4CAF50"
    property color  textColorLight: mainWindow.sousMenuColor
    //property color textColorLightReset: "black"


    /** type:color Propriété pour la couleur du bouton en mode clair */
    property color buttonColorLight: "#4CAF50"

    /** type:color Propriété pour la couleur du text en mode clair */
    property color inputFieldColorLight: "black"

    /** type:color Propriété pour la couleur du holder text en mode clair */
    property color inputFielHolderdColor: "gray"

    /** type:color Propriété pour la couleur du background en mode clair */
    //property color backgroundColorLight: "#F7F7F7"
    property color backgroundColorLight: mainWindow.theme


    /** type:color Propriété pour la couleur du header en mode sombre */
    property color headerColorDark: "#2E7D32"

    /** type:color Propriété pour la couleur du label en mode sombre */
    property color textColorDark: "#2E7D32"

    /** type:color Propriété pour la couleur du bouton en mode sombre */
    property color buttonColorDark: "#81C784"

    /** type:color Propriété pour la couleur du text en mode sombre */
    property color inputFieldColorDark: "#FFFFFF"

    /** type:color Propriété pour la couleur du background en mode sombre */
    property color backgroundColorDark: "#303030"


    /** type:color Propriété pour la liaison des couleurs du header en fonction du mode */
    property color headerColor: isDarkMode ? headerColorDark : headerColorLight

    /** type:color Propriété pour la liaison des couleurs du label en fonction du mode */
    property color textColor: isDarkMode ? textColorDark : textColorLight

    /** type:color Propriété pour la liaison des couleurs du bouton en fonction du mode */
    //property color buttonColor: isDarkMode ? buttonColorDark : buttonColorLight
    property color buttonColor: mainWindow.boutonp


    /** type:color Propriété pour la liaison des couleurs du text en fonction du mode */
    property color inputFieldColor: isDarkMode ? inputFieldColorDark : inputFieldColorLight

    /** type:color Propriété pour la liaison des couleurs du background en fonction du mode */
    property color backgroundColor: isDarkMode ? backgroundColorDark : backgroundColorLight


    /** type:int Propriété pour la taille de police */
    property int fontSize: mainWindow.sousMenufSize

    /** type:int Propriété pour la taille de police du text en header */
    property int fontSizeHeader: fontSize + 7

    /** type:int Propriété pour la taille de police du text du label */
    property int fontSizeLabel: fontSize

    /** type:int Propriété pour la taille de police du text à entrer */
    property int fontSizeInput: fontSize - 2


    /**
     * Fonction pour génerer un entier aléatoire pour l'affecter à l'id d'une tâche
     * @param type:int min la valeur de retour est supérieure ou égale à min
     * @param type:int max la valeur de retour est inférieure ou égale à max
     * @return type:int Un entier aléatoire dans l'intervale [min,max]
     */
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
                    closeTimer.start()
                    dynamicLoader.source = "MainPage.qml"
                    //stackView.pop()
                }

                /**
                 * @brief Timer pour fermer la page après une animation du bouton de retour.
                 */
                Timer {
                    id: closeTimer
                    interval: 200 // Le Timer s'exécutera après la durée de l'animation
                    repeat: false
                    onTriggered: {
                        dynamicLoader.source = "MainPage.qml"  // Ferme la fenêtre après le délai
                    }
                }

                /**
                 * @brief Animation pour agrandir et rétrécir le bouton de retour.
                 */
                SequentialAnimation {
                    id: anim
                    // Expand the button
                    PropertyAnimation {
                        target: redRect
                        property: "scale"
                        to: 1.3
                        duration: 100
                        easing.type: Easing.InOutQuad
                    }

                    // Shrink back to normal
                    PropertyAnimation {
                        target: redRect
                        property: "scale"
                        to: 1.0
                        duration: 100
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
                font.bold: true
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
            text:  page.isEditMode ? tache.titre : qsTr("")
            placeholderTextColor : inputFielHolderdColor
            color : inputFieldColor
            font.pixelSize: fontSizeInput
            background: Rectangle {
                //color: backgroundColor
                color:"white"
                border.color: "lightgray"
                radius: 5
            }
            onEditingFinished: tache.titre= textfieldtitre.text
        }

        Label {
            text: "Due date"
            //color: textColor
            color:"white"
            font.pixelSize: fontSizeLabel
        }

        RowLayout {

            TextField {
                id: textfieldate
                Layout.fillWidth: true
                implicitHeight: page.height* 0.08
                placeholderText: "dd/MM/yyyy"
                placeholderTextColor : inputFielHolderdColor
                color : inputFieldColor
                font.pixelSize: fontSizeInput
                text: page.isEditMode ? EditTaches.getDateParse(tache.dateHeure) : "dd/MM/yyyy"
                background: Rectangle {
                    //color: backgroundColor
                    color: "white"
                    border.color: "lightgray"
                    radius: 5
                }
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
                text: page.isEditMode ? EditTaches.getHeureParse(tache.dateHeure) : "hh:mm AP"
                color : inputFieldColor
                placeholderTextColor : inputFieldColor
                font.pixelSize: fontSizeInput
                background:
                    Rectangle
                    {
                        //color: backgroundColor
                        color: "white"
                        border.color: "lightgray"
                        radius: 5
                    }
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
                palette.buttonText: "white"
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
            text:  page.isEditMode ? tache.note : qsTr("")
            color : inputFieldColor
            font.pixelSize: fontSizeInput
            Layout.fillWidth: true
            Layout.fillHeight: true
            implicitHeight: page.height* 0.2
            background: Rectangle {
                //color: backgroundColor
                color:"white"
                border.color: "lightgray"
                radius: 5
            }

            onEditingFinished :{
                tache.note= note.text
            }
        }

        // Bouton "Add task" ou "Update task" selon le mode de l'édit
        Button {
            text: page.isEditMode ? qsTr("Update task") : qsTr("Add task")
            palette.buttonText: "white"
            font.bold: true
            font.pixelSize: fontSizeInput
            background: Rectangle {
                color: buttonColor
                radius: 20
            }
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            onClicked: {

                if(isEditMode){
                    tache.titre = textfieldtitre.text
                    tache.dateHeure = textfieldate.text + " " + textfieltime.text
                    tache.note = note.text

                    //gestionTaches.modifierTache(tache.id, tache)
                    //dbManager.updateTache(gestionTaches.getTache(tache.id))
                    dbManager.updateTache(tache)
                }
                else
                {
                    tache.id = page.generateRandomInt(1, 100);
                    tache.dateHeure = textfieldate.text +" "+ textfieltime.text
                    tache.priority = 1
                    tache.note= note.text

                    gestionTaches.ajouterTache(tache.id, tache.titre, tache.note, tache.dateHeure, tache.priority)
                    dbManager.addTache(gestionTaches.getTache(tache.id))
                }

                dynamicLoader.source = "MainPage.qml";
            }
        }
    }

    background: Rectangle {
        //color: "white"
        color: backgroundColor
    }

    //Dialog pour sélectionner la date
    DateSelector {
        id: dateSelectorDialog
    }

    //Dialog pour sélectionner l'heure
    TimeSelector {
        id: timeSelectorDialog
    }
}
