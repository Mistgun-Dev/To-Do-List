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
            height: 55
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





/**
*@brief bouton permettant d'accéder aux paramétrages
*
*/


        Rectangle {
            id: muSettings


            height:55
            width: 80



            Image {

            anchors.verticalCenter: parent.verticalCenter
           //anchors.right: parent.right
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 20
            source: "images/setting.png"
            width: 28
            height: 28
            }

            color: mouse.hovered ?  mainWindow.boutonh : stylus.hovered ? mainWindow.boutonh : mainWindow.boutonp

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
