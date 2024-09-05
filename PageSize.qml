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
*
**/

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
            text: "Taille des caractères"
            font.pixelSize: mainWindow.parametragefSize
            font.weight: 650
            anchors.horizontalCenter: parent.horizontalCenter
           // anchors.left: parent.left
            anchors.margins: 20
            anchors.verticalCenter: parent.verticalCenter
            }

        }







}







    RowLayout{
    height: 50
    width: parent.width


            Rectangle{
                height: parent.height
                width:7
                color: "transparent"

               Text{
                   text:"A"
                   color:mainWindow.sousMenuColor
                   font.pixelSize: 14
                   anchors.verticalCenter: parent.verticalCenter

               }

            }


            Rectangle{
                id:recslide
                height: parent.height
                Layout.fillWidth: true
                color: "transparent"





/**
*brief Slider: composant pour définir la tailles des caractères
*
*/


                Slider {
                    id: control
                    //value: 0.5
                   from: 0
                   value: mainWindow.rslide
                   to:100
                   stepSize: 1

                    anchors.verticalCenter: parent.verticalCenter
                    Layout.fillWidth: true

                    background: Rectangle {

                        x: control.leftPadding
                        y: control.topPadding + control.availableHeight / 2 - height / 2
                        implicitWidth: recslide.width
                        implicitHeight: 3
                        //width: control.availableWidth
                        height: implicitHeight
                        radius: 2
                        color: "#bdbebf"

                        Rectangle {
                            width: control.visualPosition * parent.width
                            height: parent.height
                            color: "grey"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                        y: control.topPadding + control.availableHeight / 2 - height / 2
                        implicitWidth: 18
                        implicitHeight: 18
                        radius: 13
                        color: control.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"
                    }



                    onValueChanged: {
                        //console.log(idcar.font.pixelSize)
                       // var pge = mainWindow.parametragefSizeReset*2


                        var a=mainWindow.parametragefSizeReset +(mainWindow.parametragefSizeReset*(control.value/100))
                        var c=mainWindow.sousMenufSizeReset +(mainWindow.sousMenufSizeReset*(control.value/100))
                        var d=mainWindow.tchfSizeReset +(mainWindow.tchfSizeReset*(control.value/100))
                        var e=mainWindow.tchfSizeDateReset +(mainWindow.tchfSizeDateReset*(control.value/100))
                        mainWindow.parametragefSize = Math.round(a)
                        mainWindow.sousMenufSize = Math.round(c)
                        mainWindow.tchfSize = Math.round(d)
                        mainWindow.tchfSizeDate = Math.round(e)
                       // console.log( Math.round(c))
                        mainWindow.rslide = control.value
                    }
                }












            }


            Rectangle{
                    width: 20
                    height: parent.height
                    color: "transparent"
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 20
                        text:"A"
                        color:mainWindow.sousMenuColor
                    }
                }

    }












}
}
