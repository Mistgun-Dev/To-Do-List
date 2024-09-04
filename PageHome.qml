import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7


Item {
    width: parent.width

    ColumnLayout{
    width: parent.width

        RowLayout{
        width: parent.width
        spacing: 0

            Rectangle{
                width: parent.width
                height: 40
                color: mainWindow.parametrage

                Text{
                text: "To Do List"
                font.pixelSize: mainWindow.parametragefSize
                font.weight: 650
                anchors.left: parent.left
                anchors.margins: 20
                anchors.verticalCenter: parent.verticalCenter
                }

            }

            Rectangle {
                id: muSettings
                height:30
                width: 30
                anchors.right: parent.right
                anchors.rightMargin: 25
                color: "transparent"

                Image {
                    anchors.fill: parent
                    source: "images/settings.png"
                    fillMode: Image.PreserveAspectFit
                }

                //color: mouse.hovered ?  mainWindow.boutonh : stylus.hovered ? "tomato" : mainWindow.boutonp

                HoverHandler {
                    id: stylus
                    acceptedDevices: PointerDevice.Stylus
                    cursorShape: Qt.CrossCursor
                }

                HoverHandler {
                    id: mouse
                    acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                    cursorShape: Qt.PointingHandCursor

                }

                TapHandler {
                    onSingleTapped: stackView.push(Qt.resolvedUrl("PageSettings.qml"))
                }
            }
        }
    }
}
