import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import "."


Item {

ColumnLayout{
width: parent.width

    RowLayout{
    width: parent.width
    spacing: 0




    Rectangle {
        id: menuSettings
       // color: mainWindow.boutonp

        height:55
        width: 55

        Image {
        anchors.verticalCenter: parent.verticalCenter
        //anchors.right: parent.right
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        source: "images/arrowLeft.png"
        width: 25
        height: 25
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
            height: 55
            id:thms
            color: mainWindow.parametrage

            Text{
            text: "Thèmes"
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
    Text{
     text: "Sombre"
     color:mainWindow.sousMenuColor
     font.pixelSize: mainWindow.sousMenufSize
     anchors.verticalCenter: parent.verticalCenter
     anchors.margins: 20
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
                mainWindow.theme="black"
                mainWindow.sousMenuColor="white"
                mainWindow.parametrage= "#668CCD"
                mainWindow.boutonp= "#4B6292"
                mainWindow.boutonh="#2C477C"

                mainWindow.newTaskAutomatic= mainWindow.stxtField
                page.textColorLight = "red"

            }

        }






}






Rectangle {
    id: clr
    Layout.fillWidth: true
    height:50
  //  color:mainWindow.sousMenu
    Text{
     text: "Clair"
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
                mainWindow.theme="white"
                mainWindow.sousMenuColor="black"
                //mainWindow.parametrage= "#DDBB3C"
                //mainWindow.boutonp="#B89C36"
                //mainWindow.boutonh="#897015"
                mainWindow.parametrage= mainWindow.parametrageReset
                mainWindow.boutonp= mainWindow.boutonpReset
                mainWindow.boutonh= mainWindow.boutonhReset

               // mainWindow.boutonh= mainWindow.txtField

            }

        }



}




}
}
