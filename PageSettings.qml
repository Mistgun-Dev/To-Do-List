import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7


Item {

ColumnLayout{
width: parent.width

    RowLayout{
    width: parent.width
    spacing: 0




    Rectangle {
        id: menuSettings
       // color: apw.boutonp

        height:80
        width: 80



        Image {
        anchors.verticalCenter: parent.verticalCenter
       //anchors.right: parent.right
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        source: "images/arrowLeft.png"
        width: 35
        height: 35
        }



        color: mouse.hovered ?  apw.boutonh : stylus.hovered ? apw.boutonh : apw.boutonp

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
                onSingleTapped: stackView.pop()
            }




    }














        Rectangle{
            Layout.fillWidth: true
            height: 80
            id:thms
            color: apw.parametrage

            Text{
            text: "Paramètres"
            font.pixelSize: apw.parametragefSize
            font.weight: 650
            anchors.horizontalCenter: parent.horizontalCenter
           // anchors.left: parent.left
            anchors.margins: 20
            anchors.verticalCenter: parent.verticalCenter
            }

        }







}


Rectangle {
    id: dark
    Layout.fillWidth: true
    height:50
    //color: apw.sousMenu




     Text{
     text: "Thèmes"
     color:apw.sousMenuColor
     font.pixelSize: apw.sousMenufSize
     anchors.verticalCenter: parent.verticalCenter

     }






    color: mouseSousM.hovered ?  apw.boutonh : stylusSousM.hovered ? apw.boutonh : "transparent"

    HoverHandler {
        id: stylusSousM
        acceptedDevices: PointerDevice.Stylus
        cursorShape: Qt.CrossCursor
    }

    HoverHandler {
        id: mouseSousM
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }


    TapHandler {
            onSingleTapped: {

                stackView.push(Qt.resolvedUrl("PageThemes.qml"))
            }

        }






}






Rectangle {
    id: clr
    Layout.fillWidth: true
    height:50





    Text{
     text: "Taille des caractères"
     color:apw.sousMenuColor
     font.pixelSize: apw.sousMenufSize
     anchors.verticalCenter: parent.verticalCenter
    }





    color: mouseSousMclr.hovered ?  apw.boutonh : stylusSousMclr.hovered ? apw.boutonh : "transparent"

    HoverHandler {
        id: stylusSousMclr
        acceptedDevices: PointerDevice.Stylus
        cursorShape: Qt.CrossCursor
    }

    HoverHandler {
        id: mouseSousMclr
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }


    TapHandler {
            onSingleTapped: {
                stackView.push(Qt.resolvedUrl("PageSize.qml"))
            }

        }



}




}
}
