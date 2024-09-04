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
    property alias titleSectionColor: headerText.color
    property alias bulleColor: nbTacheBulle.color
    property bool sectionVisible: listView.visible

    property color titleTacheColor: "black"
    property color dateHeureColor: "green"
    property color noteColor: "black"
    property color borderTacheColor: "lightgray"
    property color backgroundTacheColor: "white"
    property color checkBoxValidatedBorderColor: "lightgray"
    property color checkBoxValidatedColor: "#008000"
    property color bulleBorderColor: "transparent"


    property int collapsedHeight: 30
    property int expandedHeight: 75

    property string currentSection: ""

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
                        source: isDarkMode ? "images/arrowDownDark.svg" : "images/arrowDownLight.svg";
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
                radius: 10
                anchors.verticalCenter: parent.verticalCenter
                border.color: bulleBorderColor

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
            width: parent.width- 10
            height: 0
            spacing: 10
            anchors.margins: 20
            visible: false // Initialement non visible

            delegate: Rectangle {
                id: itemRect
                color: backgroundTacheColor
                border.color: borderTacheColor
                border.width: 1
                height: isExpanded ? expandedHeight : collapsedHeight
                width: parent.width - listView.spacing
                radius: 5

                property bool isExpanded: false

                Row {
                    id: rowInRect
                    anchors.fill: parent
                    spacing: 10
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15

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
                            color: titleTacheColor
                            text: model.titre
                            font.pixelSize: 14
                            wrapMode: Text.WordWrap
                            elide: Text.ElideRight
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Note
                        Text {
                            id: noteText
                            text: model.note
                            color: noteColor
                            visible: isExpanded
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                            elide: Text.ElideRight
                            anchors.centerIn: parent
                        }

                        // Date
                        Text {
                            id: dateHeureText
                            text: currentSection === "today" ? EditTaches.getHeureParse(model.dateHeure) : model.dateHeure
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                            color: isDarkMode ? "white" : bulleColor
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
                    x: rowListElements.x + rowListElements.anchors.leftMargin - rowInRect.spacing - 15
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
                        iconArrow.source = isDarkMode ? "images/arrowDownDark.svg" : "images/arrowDownLight.svg";
                    } else {
                        iconArrow.source = isDarkMode ? "images/arrowUpDark.svg" : "images/arrowUpLight.svg";
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
