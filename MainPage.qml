import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "FiltrerTaches.js" as Filtre
import "ListeTaches.js" as Tache
import "."

/**
 * @qmltype Item
 * @brief Interface principale pour l'affichage des tâches et des sections de tâches.
 */
Item {

    width: parent.width
    height: parent.height
    z: 1

    /**
     * @brief Propriétés de la page MainPageProperties
     */
    MainPageProperties{
        id: style
    }

    /**
     * @brief Composant toolbar
     */
    PageHome {
        anchors.fill: parent
        z: 1
    }

    /**
     * @brief Conteneur principal des sections et du formulaire d'ajout de tâche.
     */
    Column {
        id: column
        width: parent.width
        height: parent.height - buttonAddTask.height - y - 20
        x: 10
        y: 55
        spacing: 15


        Row{
            width: parent.width
            height: 16

        }


        /**
         * @brief Ligne contenant le champ de texte pour ajouter une tâche et le bouton "Ajouter".
         */
        Row {
            width: parent.width
            height: 30
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            spacing : 5

            /**
             * @brief Conteneur du champ de texte d'ajout de tâche.
             */
            Rectangle {
                id: container
                width: parent.width - buttonAddAutomaticTask.width - column.x - 20
                height: parent.height
                color: style.textFieldAddTaskBackgroundColor
                border.color: style.textFieldAddTaskBorderColor
                border.width: 1
                radius: 4

                Item {
                    anchors.fill: parent

                    /**
                     * @brief Champ de texte pour entrer une nouvelle tâche.
                     */
                    TextField {
                        id: newTaskAutomatic
                        anchors.fill: parent
                        placeholderText: ""
                        //font.pixelSize: fontSize - 3
                        font.pixelSize: style.fontSize - 3

                        //color: style.textFieldAddTaskTextColor
                        color: mainWindow.boutonp


                        selectionColor: "#008000"
                        background: Rectangle {
                            color: style.textFieldAddTaskBackgroundColor
                            //border.color: style.textFieldAddTaskBorderColor
                            border.color: mainWindow.boutonp
                        }
                        onTextChanged: {
                            placeholder.visible = newTaskAutomatic.text.length === 0
                        }
                    }

                    /**
                     * @brief PlaceHolder du texte de saisie
                     */
                    Text {
                        id: placeholder
                        text: "Entrez une nouvelle tâche"
                        //color: style.textFieldAddTaskPlaceHolderTextColorLight
                        color: mainWindow.boutonp
                        //font.pixelSize: fontSize - 3
                        font.pixelSize: style.fontSize - 3
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        visible: newTaskAutomatic.text.length === 0
                    }
                }
            }

            /**
             * @brief Bouton pour ajouter une tâche automatiquement à la liste.
             */
            Button {
                id: buttonAddAutomaticTask
                anchors.verticalCenter: parent.verticalCenter
                width: 150
                height: 30
                highlighted: true
                background: Rectangle {
                    //color: style.buttonAddTaskColor
                    color: mainWindow.boutonp

                    radius: 4
                }

                Text {
                    anchors.centerIn: parent
                    text: "Ajouter"
                    color: "white"
                    //font.pixelSize: fontSize - 3
                    font.pixelSize: style.fontSize - 3
                }

                onClicked: {
                    if (newTaskAutomatic.length === 0) {
                        ;
                    } else {
                        tache.id = Filtre.generateRandomInt(1, 100);
                        tache.titre = newTaskAutomatic.text;
                        tache.note = "note";
                        tache.dateHeure = tache.getDateHeureNow();
                        tache.priority = 1;

                        gestionTaches.ajouterTache(tache.id, tache.titre, tache.note, tache.dateHeure, tache.priority);
                        dbManager.addTache(gestionTaches.getTache(tache.id));
                        gestionTaches.listeTaches

                        sectionToday.newTaskAdded(tache);
                    }
                }
            }
        }

        /**
         * @brief Espacement entre le formulaire et les sections de tâches.
         */
        Item {
            height: 20
        }

        /**
         * @brief Section des tâches pour "Aujourd'hui".
         */
        TacheSection {
            id: sectionToday
            currentSection: "today"
            sectionTitre: "Today"
            color: style.backgroundColorTitle

            //bulleColor: style.bulleColorToday
            bulleColor: mainWindow.boutonp

            bulleBorderColor: style.bulleBorderColorToday
            //titleSectionColor: style.titleSectionColor
            titleSectionColor: mainWindow.sousMenuColor

            borderTacheColor: style.borderTacheColor
            backgroundTacheColor: style.backgroundTacheColor
            titleTacheColor: style.titleTacheColor
            noteColor: style.noteColor
            dateHeureColor: style.dateHeureColor
            checkBoxValidatedColor: style.bulleColorToday
            checkBoxValidatedBorderColor: style.checkBoxValidatedBorderColor
            fontSize: style.fontSize
            sectionVisible: true

            /**
             * @brief Modèle de données pour les tâches d'aujourd'hui.
             */
            tacheModel: ListModel {
                id: todayModel
                Component.onCompleted: {
                    var listeTachesToday = Filtre.getFilteredTodayTasks(Tache.getListeTaches());
                    for (var i = 0; i < listeTachesToday.length; i++) {
                        append(listeTachesToday[i]);
                    }
                }
            }
        }

        /**
         * @brief Section des tâches pour "Cette semaine".
         */
        TacheSection {
            currentSection: "thisWeek"
            sectionTitre: "This Week"
            color: style.backgroundColorTitle

            //bulleColor: style.bulleColorThisWeek
             bulleColor: mainWindow.boutonp

            bulleBorderColor: style.bulleBorderColorThisWeek
            //titleSectionColor: style.titleSectionColor
            titleSectionColor: mainWindow.sousMenuColor


            borderTacheColor: style.borderTacheColor
            backgroundTacheColor: style.backgroundTacheColor
            titleTacheColor: style.titleTacheColor
            noteColor: style.noteColor
            dateHeureColor: style.dateHeureColor
            checkBoxValidatedColor: style.bulleColorThisWeek
            checkBoxValidatedBorderColor: style.checkBoxValidatedBorderColor
            fontSize: style.fontSize
            sectionVisible: false

            /**
             * @brief Modèle de données pour les tâches de la semaine.
             */
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

        /**
         * @brief Section des tâches pour "Plus tard".
         */
        TacheSection {
            currentSection: "later"
            sectionTitre: "Later"
            color: style.backgroundColorTitle

            //bulleColor: style.bulleColorLater
            bulleColor: mainWindow.boutonp

            bulleBorderColor: style.bulleBorderColorLater

            //titleSectionColor: style.titleSectionColor
            titleSectionColor: mainWindow.sousMenuColor

            borderTacheColor: style.borderTacheColor
            backgroundTacheColor: style.backgroundTacheColor
            titleTacheColor: style.titleTacheColor
            noteColor: style.noteColor
            dateHeureColor: style.dateHeureColor
            checkBoxValidatedColor: style.bulleColorLater
            checkBoxValidatedBorderColor: style.checkBoxValidatedBorderColor
            fontSize: style.fontSize
            sectionVisible: false

            /**
             * @brief Modèle de données pour les tâches "Plus tard".
             */
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

    /**
     * @brief Bouton pour ouvrir la page de création de nouvelle tâche.
     */
    Rectangle {
        id: buttonAddTask
        //width: 50
        //height: 50

        width:120
        height:50
        radius:4

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        //color: "transparent"
        color: mainWindow.boutonp

        transform: Scale {
            id: buttonScale
            origin.x: buttonAddTask.width / 2
            origin.y: buttonAddTask.height / 2
            xScale: 1.0
            yScale: 1.0
        }

        //Image {
          //  width: parent.width
            //height: parent.height
            //source: isDarkMode ? "images/addButtonDark.svg" : "images/addButtonLight.svg"
            //fillMode: Image.PreserveAspectCrop
        //}


        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Ajouter"
            color: "white"
            font.pixelSize: style.fontSize - 3
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

        /**
         * @brief Animation pour agrandir/réduire le bouton lors du survol.
         */
        Behavior on scale {
            NumberAnimation {
                duration: 150
                easing.type: Easing.InOutQuad
            }
        }
    }
}
