import QtQuick 6.7
import QtQuick.Controls 6.7
//import QtQuick.Controls.Material
import QtQuick.Layouts 6.7
import "FiltrerTaches.js" as Filtre
import "ListeTaches.js" as Tache
import "."

Item {

    id: mainPage

    /** type:bool Propriété pour déterminer si le mode est sombre */
    property bool isDarkMode: mainWindow.isDarkMode

    /** type:int Propriété pour la taille de police */
    property int fontSize: mainWindow.sousMenufSize

    /** type:bool Couleur de la bulle en  */
    property color bulleColorTodayLight: "#008000"
    property color bulleColorTodayDark: "transparent"
    property color bulleColorToday: isDarkMode ? bulleColorTodayDark : bulleColorTodayLight

    property color bulleColorThisWeekLight: "orange"
    property color bulleColorThisWeekDark: "transparent"
    property color bulleColorThisWeek: isDarkMode ? bulleColorThisWeekDark : bulleColorThisWeekLight

    property color bulleColorLaterLight: "purple"
    property color bulleColorLaterDark: "transparent"
    property color bulleColorLater: isDarkMode ? bulleColorLaterDark : bulleColorLaterLight

    property color bulleBorderColorTodayLight: "transparent"
    property color bulleBorderColorTodayDark: "white"
    property color bulleBorderColorToday: isDarkMode ? bulleBorderColorTodayDark : bulleBorderColorTodayLight

    property color bulleBorderColorThisWeekLight: "transparent"
    property color bulleBorderColorThisWeekDark: "white"
    property color bulleBorderColorThisWeek: isDarkMode ? bulleBorderColorThisWeekDark : bulleBorderColorThisWeekLight

    property color bulleBorderColorLaterLight: "transparent"
    property color bulleBorderColorLaterDark: "white"
    property color bulleBorderColorLater: isDarkMode ? bulleBorderColorLaterDark : bulleBorderColorLaterLight

    property color backgroundColorTitleLight: "transparent"
    property color backgroundColorTitleDark: "transparent"
    property color backgroundColorTitle: isDarkMode ? backgroundColorTitleDark : backgroundColorTitleLight

    property color titleSectionColorLight: "black"
    property color titleSectionColorDark: "white"
    property color titleSectionColor: isDarkMode ? titleSectionColorDark : titleSectionColorLight

    property color borderTacheColorLight: "lightgray"
    property color borderTacheColorDark: "white"
    property color borderTacheColor: isDarkMode ? borderTacheColorDark : borderTacheColorLight

    property color backgroundTacheColorLight: "white"
    property color backgroundTacheColorDark: "transparent"
    property color backgroundTacheColor: isDarkMode ? backgroundTacheColorDark : backgroundTacheColorLight

    property color titleTacheColorLight: "black"
    property color titleTacheColorDark: "white"
    property color titleTacheColor: isDarkMode ? titleTacheColorDark : titleTacheColorLight

    property color dateHeureColorLight: "green"
    property color dateHeureColorDark: "white"
    property color dateHeureColor: isDarkMode ? dateHeureColorDark : dateHeureColorLight

    property color noteColorLight: "black"
    property color noteColorDark: "white"
    property color noteColor: isDarkMode ? noteColorDark : noteColorLight

    property color tacheValidatedColorLight: "green"
    property color tacheValidatedColorDark: "green"
    property color tacheValidatedColor: isDarkMode ? tacheValidatedColorDark : tacheValidatedColorLight

    property color buttonAddTaskColorLight: "#008000"
    property color buttonAddTaskColorDark: "darkgray"
    property color buttonAddTaskColor: isDarkMode ? buttonAddTaskColorDark : buttonAddTaskColorLight

    property color checkBoxValidatedColorLight: "#008000"
    property color checkBoxValidatedColorDark: "#008000"
    property color checkBoxValidatedColor: isDarkMode ? checkBoxValidatedColorDark : checkBoxValidatedColorLight

    property color checkBoxValidatedBorderColorLight: "black"
    property color checkBoxValidatedBorderColorDark: "white"
    property color checkBoxValidatedBorderColor: isDarkMode ? checkBoxValidatedBorderColorDark : checkBoxValidatedBorderColorLight

    property color textFieldAddTaskBackgroundColorLight: "white"
    property color textFieldAddTaskBackgroundColorDark: "transparent"
    property color textFieldAddTaskBackgroundColor: isDarkMode ? textFieldAddTaskBackgroundColorDark : textFieldAddTaskBackgroundColorLight

    property color textFieldAddTaskBorderColorLight: "#008000"
    property color textFieldAddTaskBorderColorDark: "white"
    property color textFieldAddTaskBorderColor: isDarkMode ? textFieldAddTaskBorderColorDark : textFieldAddTaskBorderColorLight

    property color textFieldAddTaskTextColorLight: "#008000"
    property color textFieldAddTaskTextColorDark: "white"
    property color textFieldAddTaskTextColor: isDarkMode ? textFieldAddTaskTextColorDark : textFieldAddTaskTextColorLight

    property color textFieldAddTaskPlaceHolderTextColorLight: "darkgray"
    property color textFieldAddTaskPlaceHolderTextColorDark: "lightgray"
    property color textFieldAddTaskPlaceHolderTextColor: isDarkMode ? textFieldAddTaskPlaceHolderTextColorDark : textFieldAddTaskPlaceHolderTextColorLight

    width: parent.width
    height: parent.height
    z: 1


        PageHome
        {
            anchors.fill: parent
            z:2
        }

        Column {
            id: column
            width: parent.width
            height: parent.height - buttonAddTask.height - y - 20
            x:10
            y: 55
            spacing: 15


            Row{
                width: parent.width
                height: 30
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                spacing : 5

                Rectangle {
                    id: container
                    width: parent.width - buttonAddAutomaticTask.width - column.x - 20
                    height: parent.height
                    color: textFieldAddTaskBackgroundColor
                    border.color: textFieldAddTaskBorderColor
                    border.width: 1
                    radius: 4

                    // Conteneur pour le TextField et le placeholder
                    Item {
                        anchors.fill: parent

                        TextField {
                            id: newTaskAutomatic
                            anchors.fill: parent
                            placeholderText: "" // Ne pas utiliser placeholderText directement
                            font.pixelSize: 15
                            color: textFieldAddTaskTextColor
                            selectionColor: "#008000" // Couleur de la sélection du texte
                            background: Rectangle {
                                color: textFieldAddTaskBackgroundColor // Fond transparent pour montrer le fond du conteneur
                                border.color: textFieldAddTaskBorderColor
                            }
                            onTextChanged: {
                                placeholder.visible = newTaskAutomatic.text.length === 0
                            }
                        }

                        Text {
                            id: placeholder
                            text: "Entrez une nouvelle tâche"
                            color: textFieldAddTaskPlaceHolderTextColorLight
                            font.pixelSize: 15
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            visible: newTaskAutomatic.text.length === 0
                        }
                    }
                }


                Button {
                    id: buttonAddAutomaticTask
                    anchors.verticalCenter: parent.verticalCenter
                    width: 150
                    height: 30
                    highlighted: true
                    background: Rectangle {
                        color: buttonAddTaskColor
                        radius: 4
                    }

                    Text{
                        anchors.centerIn: parent
                        text: "Ajouter"
                        color: "white"
                        font.pixelSize: 15
                    }

                    onClicked: {
                        if(newTaskAutomatic.length === 0)
                        {
                            //
                        }
                        else{
                            tache.id = Filtre.generateRandomInt(1, 100);
                            tache.titre = newTaskAutomatic.text;
                            tache.note = "";
                            tache.dateHeure = tache.getDateHeureNow();
                            tache.priority = 1;

                            console.log("AJOUT D4UNE TACHE RAPIDE : ", tache.id);
                            gestionTaches.ajouterTache(tache.id, tache.titre, tache.note, tache.dateHeure, tache.priority);

                            dbManager.addTache(gestionTaches.getTache(tache.id))
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
                currentSection: "today"
                sectionTitre: "Today"
                color: mainPage.backgroundColorTitle
                bulleColor: mainPage.bulleColorToday
                bulleBorderColor: bulleBorderColorToday
                titleSectionColor: mainPage.titleSectionColor
                borderTacheColor : mainPage.borderTacheColor
                backgroundTacheColor: mainPage.backgroundTacheColor
                titleTacheColor: mainPage.titleTacheColor
                noteColor: mainPage.noteColor
                dateHeureColor: mainPage.dateHeureColor
                checkBoxValidatedColor: bulleColor
                checkBoxValidatedBorderColor: mainPage.checkBoxValidatedBorderColor
                sectionVisible: true

                tacheModel:
                    ListModel {
                        id: todayModel
                        Component.onCompleted: {
                            //var liste = gestionTache.listeTaches;
                            var listeTachesToday = Filtre.getFilteredTodayTasks(Tache.getListeTaches());
                            for (var i = 0; i < listeTachesToday.length; i++) {
                                append(listeTachesToday[i]);
                            }
                        }
                    }
            }

            // Section "This Week"
            TacheSection {
                currentSection: "thisWeek"
                sectionTitre: "This Week"
                color: mainPage.backgroundColorTitle
                bulleColor: mainPage.bulleColorThisWeek
                bulleBorderColor: bulleBorderColorThisWeek
                titleSectionColor: mainPage.titleSectionColor
                borderTacheColor : mainPage.borderTacheColor
                backgroundTacheColor: mainPage.backgroundTacheColor
                titleTacheColor: mainPage.titleTacheColor
                noteColor: mainPage.noteColor
                dateHeureColor: mainPage.dateHeureColor
                checkBoxValidatedColor: bulleColor
                checkBoxValidatedBorderColor: mainPage.checkBoxValidatedBorderColor
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
                currentSection: "later"
                sectionTitre: "Later"
                color: mainPage.backgroundColorTitle
                bulleColor: mainPage.bulleColorLater
                bulleBorderColor: bulleBorderColorLater
                titleSectionColor: mainPage.titleSectionColor
                borderTacheColor : mainPage.borderTacheColor
                backgroundTacheColor: mainPage.backgroundTacheColor
                titleTacheColor: mainPage.titleTacheColor
                noteColor: mainPage.noteColor
                dateHeureColor: mainPage.dateHeureColor
                checkBoxValidatedColor: bulleColor
                checkBoxValidatedBorderColor: mainPage.checkBoxValidatedBorderColor
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


        Rectangle {
            id: buttonAddTask
            width: 50
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            color: "transparent"

            // Transformation pour l'agrandissement
            transform: Scale {
                id: buttonScale
                origin.x: buttonAddTask.width / 2
                origin.y: buttonAddTask.height / 2
                xScale: 1.0
                yScale: 1.0
            }

            Image {
                width: parent.width
                height: parent.height
                source: isDarkMode ? "images/addButtonDark.svg" : "images/addButtonLight.svg"
                fillMode: Image.PreserveAspectCrop
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dynamicLoader.source = "NewTask.qml";
                    if (dynamicLoader.item) {
                        dynamicLoader.item.isEditMode = false;
                        dynamicLoader.item.isDarkMode = isDarkMode;
                    }

                    dynamicLoader.item.forceActiveFocus();
                    dynamicLoader.item.width = dynamicLoader.item.width;
                }

                onEntered: {
                    buttonScale.xScale = 1.5;
                    buttonScale.yScale = 1.5;
                }

                onExited: {
                    buttonScale.xScale = 1.0;
                    buttonScale.yScale = 1.0;
                }
            }

            Behavior on scale {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }
        }
}
