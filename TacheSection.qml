import QtQuick 6.7
import QtQuick.Controls 6.7


Item {
    id: tacheSection
    property alias sectionTitre: headerText.text
    property alias tacheModel: listView.model
    property alias headerHeight: header.height
    property alias color: header.color

    property int itemHeight: 30
    property int itemContainerHeight: itemHeight + listView.bottomMargin + listView.spacing

    width: parent.width
    height: header.height + listView.height

    Column
    {
        width: parent.width
        height: parent.height

        Row{
            spacing: 5

            Rectangle {
                    id: header
                    width: headerText.implicitWidth + 20
                    height: 30
                    color: "lightblue"
                    border.color: "gray"
                    radius: 5

                    Text {
                        id: headerText
                        font.pixelSize: 15
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (animationDefilement.running)
                                animationDefilement.stop();

                            if (listView.height === 0) {
                                listView.visible = true;
                                animationDefilement.to = itemContainerHeight * tacheModel.count;
                            } else {
                                animationDefilement.to = 0;
                            }

                            animationDefilement.running = true;
                        }
                    }
                }

            Rectangle{
                width: 20
                height: 20
                color: "orange"
                radius: 50
                anchors.verticalCenter: parent.verticalCenter

                Text{
                    id: todayTacheCount
                    anchors.centerIn: parent
                    font.pixelSize: 10
                    font.bold: true
                    color : "white"
                    text: tacheModel.count
                }
            }
        }

        ListView {
            id: listView
            width: parent.width
            height: 0
            visible: false
            spacing: 10
            anchors.margins: 20

            delegate:
                Rectangle{
                    radius:10
                    color: "lightGray"
                    border.color: "gray"
                    height: itemHeight
                    width: parent.width

                    Text {
                        text: model.titre
                        anchors.verticalCenter: parent.verticalCenter
                        padding: 10
                    }
            }

            NumberAnimation on height {
                id: animationDefilement
                duration: 300
                easing.type: Easing.Bezier
                onStopped: {
                    if (listView.height === 0) {
                        listView.visible = false;
                    }
                }
            }
        }
    }
}
