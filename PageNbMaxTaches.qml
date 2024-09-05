import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import QtQuick.Controls.Basic


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
            id:idcar
            text: "Nombre maximum de tâches"
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
                   text:"Nombre de tâches"
                   color:mainWindow.sousMenuColor
                   font.pixelSize: mainWindow.sousMenufSize
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.horizontalCenter: parent.horizontalCenter

               }







    }









            Rectangle{
                height: parent.height
                width:parent.width
                color: "transparent"






                SpinBox {
                    id: control
                    value: mainWindow.nbmaxtaches
                    editable: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: mainWindow.sousMenufSize

                    contentItem: TextInput {
                        z: 2
                        text: control.textFromValue(control.value, control.locale)

                        font: control.font
                        //color: "#21be2b"
                        color: mainWindow.boutonp
                        selectionColor: "#21be2b"
                        selectedTextColor: "#ffffff"
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignVCenter

                        readOnly: !control.editable
                        validator: control.validator
                        inputMethodHints: Qt.ImhFormattedNumbersOnly
                    }

                    up.indicator: Rectangle {
                        x: control.mirrored ? 0 : parent.width - width
                        height: 28
                        implicitWidth: 40
                        implicitHeight: 28
                        color: control.up.pressed ? "#e4e4e4" : "#f6f6f6"
                        border.color: enabled ? mainWindow.boutonp : "#bdbebf"

                        Text {
                            text: "+"
                            font.pixelSize: control.font.pixelSize * 2
                           // font.pixelSize: mainWindow.sousMenufSize
                            //color: "#21be2b"
                            color:mainWindow.boutonp
                            anchors.fill: parent
                            fontSizeMode: Text.Fit
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    down.indicator: Rectangle {
                        x: control.mirrored ? parent.width - width : 0
                        height: 28
                        implicitWidth: 40
                        implicitHeight: 28
                        color: control.down.pressed ? "#e4e4e4" : "#f6f6f6"
                        border.color: enabled ? mainWindow.boutonp : "#bdbebf"

                        Text {
                            text: "-"
                            font.pixelSize: control.font.pixelSize * 2
                            //font.pixelSize: 80*2
                            //color: "#21be2b"
                            color:mainWindow.boutonp
                            anchors.fill: parent
                            fontSizeMode: Text.Fit
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    background: Rectangle {
                        implicitWidth: 140
                        border.color: "#bdbebf"
                    }


                    onValueChanged: {
                       mainWindow.nbmaxtaches = control.value
                    }

                }









}










            }






}










