import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7


Item {

ColumnLayout{
width: parent.width

    RowLayout{
    width: parent.width
    spacing: 0

        Rectangle{
            Layout.fillWidth: true
            height: 80
            color: mainWindow.parametrage

            Text{
            text: "To Do List"
            font.pixelSize: 25
            font.weight: 650
            anchors.left: parent.left
            anchors.margins: 20
            anchors.verticalCenter: parent.verticalCenter
            }

        }





        Rectangle {
            id: muSettings


            height:80
            width: 80



            Image {

            anchors.verticalCenter: parent.verticalCenter
           //anchors.right: parent.right
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 20
            source: "images/setting.png"
            width: 35
            height: 35
            }

            color: mouse.hovered ?  mainWindow.boutonh : stylus.hovered ? "tomato" : mainWindow.boutonp

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
