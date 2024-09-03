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
       // color: mainWindow.boutonp

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
                onSingleTapped: stackView.pop()
            }




    }

        Rectangle{
            Layout.fillWidth: true
            height: 80
            id:thms
            color: mainWindow.parametrage

            Text{
            text: "Paramètres"
            font.pixelSize: mainWindow.parametragefSize
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
    //color: mainWindow.sousMenu
    //color: mainWindow.sousMenu

     Text{
     text: "Thèmes"
     color:mainWindow.sousMenuColor
     font.pixelSize: mainWindow.sousMenufSize
     anchors.verticalCenter: parent.verticalCenter

     }

    color: mouseSousM.hovered ?  mainWindow.boutonh : stylusSousM.hovered ? mainWindow.boutonh : "transparent"

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
  //  color:mainWindow.sousMenu

    Text{
     text: "Taille des caractères"
     color:mainWindow.sousMenuColor
     font.pixelSize: mainWindow.sousMenufSize
     anchors.verticalCenter: parent.verticalCenter
    }

    color: mouseSousMclr.hovered ?  mainWindow.boutonh : stylusSousMclr.hovered ? mainWindow.boutonh : "transparent"

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
