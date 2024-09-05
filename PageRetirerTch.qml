import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7


Item {

ColumnLayout{
width: parent.width

    RowLayout{
    width: parent.width
    spacing: 0


/**
*@brief bouton permettant le retour vers la page précédente
*/


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
            id:idcar
            text: "Tâches"
            font.pixelSize: mainWindow.parametragefSize
            font.weight: 650
            anchors.horizontalCenter: parent.horizontalCenter
           // anchors.left: parent.left
            anchors.margins: 20
            anchors.verticalCenter: parent.verticalCenter
            }

        }







}










            Rectangle{
                height: 80
                width:parent.width
                color: "transparent"

               Text{
                   text:"    Retirer tâches complétées"
                   color:mainWindow.sousMenuColor
                   font.pixelSize: mainWindow.sousMenufSize
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.horizontalCenter: parent.horizontalCenter


               }

            }


            Rectangle{
                id:recslide
                height: parent.height
                Layout.fillWidth: true
                color: "transparent"


/**
*brief switch: permet d'activer ou désactiver la suppression des tâches marquées comme complétées
*
*/
                Switch {
                    id: control
                    //text: qsTr("Retirer taches complétées")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    checked:mainWindow.rtch

                    indicator: Rectangle {
                        implicitWidth: 48
                        implicitHeight: 26
                        x: control.leftPadding
                        y: parent.height / 2 - height / 2
                        radius: 13
                        //color: control.checked ? "#17a81a" : "#ffffff"
                        color: control.checked ? mainWindow.boutonp : "#ffffff"
                        //border.color: control.checked ? "#17a81a" : "#cccccc"
                        border.color: control.checked ? mainWindow.boutonp : "#cccccc"

                        Rectangle {
                            x: control.checked ? parent.width - width : 0
                            width: 26
                            height: 26
                            radius: 13
                            color: control.down ? "#cccccc" : "#ffffff"
                            //border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
                            border.color: control.checked ? (control.down ? mainWindow.boutonp : mainWindow.boutonp) : "#cccccc"
                        }
                    }

                    contentItem: Text {
                        text: control.text
                        font: control.font
                        opacity: enabled ? 1.0 : 0.3
                        //color: control.down ? "#17a81a" : "#21be2b"
                        color: control.down ? mainWindow.boutonp : mainWindow.boutonp
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: control.indicator.width + control.spacing
                    }


                    onClicked: {
                        //console.log(control.checked)
                        mainWindow.rtch=control.checked
                    }

                }

            }
















}
}
