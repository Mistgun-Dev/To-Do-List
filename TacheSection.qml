import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "UpdateView.js" as Update
import "ListeTaches.js" as EditTaches

/**
* @qmltype Item
* @brief Implémente une section de tâches avec une en-tête et une liste de tâches.

    Ce composant représente une section composé d'une liste de tâches, affichant chaque tâche avec les attributs qui la compose.
*/
Item {
    id: tacheSection

    /**
    * @property sectionTitre
    * @brief Alias pour le texte de l'en-tête de la section.
    * @type string
    */
    property alias sectionTitre: headerText.text

    /**
    * @property tacheModel
    * @brief Alias pour le modèle de données des tâches.
    * @type ListModel
    */
    property alias tacheModel: listView.model

    /**
    * @property headerHeight
    * @brief Alias pour la hauteur de l'en-tête.
    * @type int
    */
    property alias headerHeight: header.height

    /**
    * @property color
    * @brief Alias pour la couleur de l'en-tête.
    * @type color
    */
    property alias color: header.color

    /**
    * @property titleSectionColor
    * @brief Alias pour la couleur du texte de l'en-tête.
    * @type color
    */
    property alias titleSectionColor: headerText.color

    /**
    * @property bulleColor
    * @brief Alias pour la couleur de la bulle affichant le nombre de tâches restantes.
    * @type color
    */
    property alias bulleColor: nbTacheBulle.color

    /**
    * @property sectionVisible
    * @brief Indique si la section est visible.
    * @type bool
    */
    property bool sectionVisible: listView.visible

    /**
    * @property fontSize
    * @brief Taille de la police par défaut utilisée dans la section.
    * @type int
    * @default 18
    */
    property int fontSize: 18

    /**
    * @property titleTacheColor
    * @brief Couleur du texte du titre de la tâche.
    * @type color
    */
    property color titleTacheColor: "black"

    /**
    * @property dateHeureColor
    * @brief Couleur du texte de la date et heure.
    * @type color
    */
    property color dateHeureColor: "green"

    /**
    * @property noteColor
    * @brief Couleur du texte de la note.
    * @type color
    */
    property color noteColor: "black"

    /**
    * @property borderTacheColor
    * @brief Couleur de la bordure des tâches.
    * @type color
    */
    property color borderTacheColor: "lightgray"

    /**
    * @property backgroundTacheColor
    * @brief Couleur de fond des tâches.
    * @type color
    */
    property color backgroundTacheColor: "white"

    /**
    * @property checkBoxValidatedBorderColor
    * @brief Couleur de la bordure des cases à cocher.
    * @type color
    */
    property color checkBoxValidatedBorderColor: "lightgray"

    /**
    * @property checkBoxValidatedColor
    * @brief Couleur de fond des cases à cocher.
    * @type color
    */
    property color checkBoxValidatedColor: "#008000"

    /**
    * @property bulleBorderColor
    * @brief Couleur de la bordure de la bulle affichant le nombre de tâches restantes.
    * @type color
    */
    property color bulleBorderColor: "transparent"

    /**
    * @property collapsedHeight
    * @brief Hauteur de la section lorsqu'elle est réduite.
    * @type int
    */
    property int collapsedHeight: 30

    /**
    * @property expandedHeight
    * @brief Hauteur de la section lorsqu'elle est étendue.
    * @type int
    */
    property int expandedHeight: 75

    /**
    * @property currentSection
    * @brief Indique la section actuelle.
    * @type string
    */
    property string currentSection: ""

    /**
    * @property isNew
    * @brief Indique si la tache est nouvelle (pour lancer une animation d'insertion).
    * @type bool
    */
    property bool isNew: false

    /**
    * @property tacheOuverte
    * @brief Référence à la tâche actuellement ouverte.
    * @type Rectangle
    */
    property Rectangle tacheOuverte: null

    property bool hideTask: false

    width: parent.width
    height: header.height + listView.height


    Component.onCompleted: {
        if (sectionVisible) {
            listView.height = collapsedHeight * (tacheModel.count);
            listView.visible = true;
        }
    }

    /**
    * @brief Colonne contenant la liste des tâches.
    */
    Column {
        width: parent.width
        height: parent.height

        /**
        * @brief En-tête de la section.
        */
        Row {
            spacing: 0
            width: parent.width

            /**
            * @brief Rectangle représentant l'en-tête de la section.
            */
            Rectangle {
                id: header
                width: headerText.implicitWidth + iconArrow.width + 10
                height: 30
                color: "lightblue"
                radius: 5

                Row {
                    anchors.fill: parent

                    /**
                    * @brief Icône de flèche pour déplier/replier la section.
                    */
                    Image {
                        id: iconArrow
                        source: isDarkMode ? "images/arrowDownDark.svg" : "images/arrowDownLight.svg"
                        width: 22
                        height: 22
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    /**
                    * @brief Texte de l'en-tête de la section.
                    */
                    Text {
                        id: headerText
                        font.pixelSize: fontSize - 3
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                }

                /**
                * @brief Zone cliquable pour déplier/replier la section.
                */
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

            /**
            * @brief Bulle affichant le nombre de tâches restantes.
            */
            Rectangle {
                id: nbTacheBulle
                width: fontSize + 2
                height: fontSize + 2
                radius: 10
                anchors.verticalCenter: parent.verticalCenter
                border.color: bulleBorderColor

                /**
                * @brief Texte affichant le nombre de tâches restantes.
                */
                Text {
                    id: textTacheRestante
                    anchors.centerIn: parent
                    font.pixelSize: fontSize - 7
                    font.bold: true
                    color : "white"
                    text: Update.getNombreDeTachesIncomplete(tacheModel)
                }
            }
        }

        /**
        * @brief Liste des tâches.
        */
        ListView {
            id: listView
            width: parent.width - 10
            height: 0
            spacing: 10
            anchors.margins: 20
            visible: false

            /**
            * @brief Delegate pour chaque élément de la liste de tâches.
            */
            delegate: Rectangle {
                id: itemRect
                color: backgroundTacheColor
                border.color: borderTacheColor
                border.width: 1
                height: isExpanded ? expandedHeight : collapsedHeight
                width: parent.width - listView.spacing
                radius: 5
                Component.onCompleted: {
                    if(mainWindow.hideCompletedTasks)
                    {
                        if(model.isCompleted){
                            itemRect.visible = false
                            listView.height -= itemRect.height + listView.spacing;
                        }
                        else
                            itemRect.visible = true
                    }
                    else
                        itemRect.visible = true
                }


                property bool isExpanded: false

                /**
                * @brief Contenu de chaque élément de tâche.
                */
                Row {
                    id: rowInRect
                    anchors.fill: parent
                    spacing: 10
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15

                    /**
                    * @brief Case à cocher pour marquer une tâche comme complétée.
                    */
                    CheckBox {
                        id: iconValidate
                        checked: model.isCompleted ? true : false
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: 8

                        indicator: Rectangle {
                            width: 15
                            height: 15
                            radius: 2
                            border.color: checkBoxValidatedBorderColor
                            color: model.isCompleted ? checkBoxValidatedColor : "transparent"
                            anchors.verticalCenter: parent.verticalCenter

                            Text {
                                anchors.centerIn: parent
                                text: model.isCompleted ? "✓" : ""
                                color: "white"
                                font.bold : true
                            }
                        }

                        onCheckedChanged: {
                            model.isCompleted = !model.isCompleted;
                            line.visible = !line.visible;

                            if(mainWindow.hideCompletedTasks)
                            {
                                deleteAnimation.running = true;
                                hideTask = true;
                            }

                        }
                    }

                    /**
                    * @brief Élément contenant lee titre, la date, et la note de la tâche.
                    */
                    Item {
                        id: rowListElements
                        anchors.fill: parent
                        anchors.leftMargin: iconValidate.width + rowInRect.spacing
                        anchors.rightMargin: iconEdit.width + iconDelete.width + iconEdit.anchors.rightMargin + iconDelete.anchors.rightMargin + 20

                        /**
                        * @brief Titre de la tâche.
                        */
                        Text {
                            id: titleText
                            color: titleTacheColor
                            text: model.titre
                            font.pixelSize: fontSize - 4
                            wrapMode: Text.WordWrap
                            elide: Text.ElideRight
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        /**
                        * @brief Note de la tâche.
                        */
                        Text {
                            id: noteText
                            text: model.note
                            color: noteColor
                            visible: isExpanded
                            font.pixelSize: fontSize - 6
                            wrapMode: Text.WordWrap
                            elide: Text.ElideRight
                            anchors.centerIn: parent
                        }

                        /**
                        * @brief Date et heure de la tâche.
                        */
                        Text {
                            id: dateHeureText
                            text: currentSection === "today" ? EditTaches.getHeureParse(model.dateHeure) : model.dateHeure
                            font.pixelSize: fontSize - 6
                            font.bold: true
                            wrapMode: Text.WordWrap
                            color: isDarkMode ? "white" : bulleColor
                            elide: Text.ElideRight
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        /**
                        * @brief Zone cliquable pour étendre/replier une tâche.
                        */
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // Si on clique sur une tâche et qu'aucune autre est ouverte
                                if (tacheOuverte !== null && tacheOuverte !== itemRect) {
                                    tacheOuverte.isExpanded = false;
                                    tacheOuverte.height = collapsedHeight;
                                    listView.height -= (expandedHeight - collapsedHeight);
                                    tacheOuverte.border.color = (isDarkMode ? "white" : "lightgray");
                                }

                                // Ouvrir le nouvel élément
                                isExpanded = !isExpanded;
                                itemRect.height = isExpanded ? expandedHeight : collapsedHeight;
                                itemRect.border.color = isExpanded ? (isDarkMode ? "white" : bulleColor) : (isDarkMode ? "white" : "lightgray");
                                if (isExpanded)
                                    listView.height += (expandedHeight - collapsedHeight);
                                else
                                    listView.height -= (expandedHeight - collapsedHeight);

                                // Mettre à jour l'élément actuellement étendu
                                tacheOuverte = isExpanded ? itemRect : null;
                            }
                        }
                    }

                    /**
                    * @brief Animation pour la suppression d'une tâche.
                    */
                    NumberAnimation on x {
                        id: deleteAnimation
                        target: itemRect
                        running: false
                        property: "x"
                        to: -parent.width
                        duration: 500
                        easing.type: Easing.InOutQuad
                        onStopped: {
                            if(hideTask)
                            {
                                itemRect.visible = false
                                listView.height -= (itemRect.height + listView.spacing);
                                listView.model.remove(model.index);
                                hideTask = false
                            }
                            else{
                                listView.height -= (itemRect.height + listView.spacing);
                                gestionTaches.supprimerTache(model.id);
                                listView.model.remove(model.index);
                                EditTaches.updateTask(model.id);
                            }
                        }
                    }

                    /**
                    * @brief Bouton pour supprimer une tâche.
                    */
                    Image {
                        id: iconDelete
                        source: isDarkMode ? "images/deleteDark.svg" :"images/deleteLight.svg"
                        anchors.verticalCenter: parent.verticalCenter
                        width: 22
                        height: 22
                        fillMode: Image.PreserveAspectFit
                        anchors.rightMargin: 10
                        anchors.right: parent.right

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                    deleteAnimation.running = true;
                                    tache.id = model.id;
                                    dbManager.removeTache(tache.id)
                            }
                        }
                    }

                    /**
                    * @brief Bouton pour éditer une tâche.
                    */
                    Image {
                        id: iconEdit
                        source: isDarkMode ? "images/editDark.svg" :"images/editLight.svg"
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
                                dynamicLoader.item.isDarkMode = isDarkMode;
                            }
                        }
                    }
                }

                /**
                * @brief Animation pour le défilement des tâches.
                */
                Behavior on height {
                    NumberAnimation {
                        id: animationDefilementTache
                        duration: 300
                        easing.type: Easing.InOutBack
                    }
                }

                /**
                * @brief Ligne horizontale au milieu du rectangle lorsque la tâche est validée.
                */
                Rectangle {
                    id: line
                    visible: false;
                    width: rowListElements.width + rowListElements.anchors.rightMargin - 35
                    height: 1
                    x: rowListElements.x + rowListElements.anchors.leftMargin - rowInRect.spacing - 15
                    color: isDarkMode ? "white" : "gray"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            /**
            * @brief Animation pour le défilement de la liste des tâches.
            */
            NumberAnimation on height {
                id: animationDefilementListview
                duration: 300
                onStopped: {
                    if (listView.height === 0) {
                        listView.visible = false;
                        iconArrow.source = isDarkMode ? "images/arrowDownDark.svg" : "images/arrowDownLight.svg";
                    } else {
                        iconArrow.source = isDarkMode ? "images/arrowUpDark.svg" : "images/arrowUpLight.svg";
                    }
                }
            }
        }
    }

    /**
    * @brief Signal émis lorsqu'une nouvelle tâche est ajoutée.
    */
    signal newTaskAdded()

    /**
    * @brief Ajoute une nouvelle tâche à la liste (tacheMode) et anime le défilement.
    * @param tache La tâche à ajouter.
    */
    function addTask(tache) {
        isNew = true;
        tacheModel.insert(0, tache);
        listView.visible = true;
        animationDefilementListview.to = collapsedHeight * (tacheModel.count +1);
        animationDefilementListview.running = true;
    }

    /**
    * @brief Fonction appelée lorsque le signal newTaskAdded est émis.
    */
    onNewTaskAdded: {
        addTask(tache);
    }
}
