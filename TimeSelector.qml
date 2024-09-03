import QtQuick 6.7
import QtQuick.Controls 6.7
//import QtQuick.Controls.Basic
//import QtQuick.Controls.Imagine
//import QtQuick.Controls.Universal
import QtQuick.Layouts 6.7
import "."

// Time selector
Dialog {
    modal: true
    anchors.centerIn:  parent
    standardButtons: Dialog.Ok | Dialog.Cancel
    onAccepted: {
        console.log("Popup Confirmée");
    }
    onRejected: {
        console.log("Popup Annulée");
    }

    contentItem: Rectangle {
        id: rect
        color: "transparent"
        border.color: "transparent"
           anchors.centerIn: parent

        /** type:int Propriété pour contenir l'heure en entier */
        property int selectedHour: 12

        /** type:int Propriété pour contenir les minutes en entier */
        property int selectedMinute: 30

        /** type:int Propriété pour contenir l'es minutes'heure en string */
        property string selectedHourAsString: "01"

        /** type:int Propriété pour contenir les minutes en string */
        property string selectedMinuteAsString: "01"

        /**
         * Fonction pour convertir le text du model de Tumbler des heures en valeur de "01" à "12"
         * @param type:int count le model de Tumbler des heures
         * @param type:int modelData la valeur afficher sur le Tumbler des heures en entier
         * @return type:string la valeur afficher sur le Tumbler des heures en string
         */
        function formatText(count, modelData) {
            var data = count === 12 ? modelData + 1 : modelData;
            return data.toString().length < 2 ? "0" + data : data;
        }

        /**
         * Fonction pour convertir un nombre entier en string
         * @param type:int number le nombre à convertir
         * @return type:string la valeur de conversion en string
         */
        function numberToString(number) {
            return number.toString().length < 2 ? "0" + number : number;
        }

        FontMetrics {
            id: fontMetrics
        }

        Component {
            id: delegateComponent

            Label {
                text: rect.formatText(Tumbler.tumbler.count, modelData)
                opacity: 0.85 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: fontMetrics.font.pixelSize * 1.25
            }
        }
            Row {
                id: row

                Tumbler {
                    id: hoursTumbler
                    model: 12
                    delegate: delegateComponent
                    onCurrentItemChanged: {
                        rect.selectedHour = currentIndex+1
                        rect.selectedHourAsString = rect.numberToString(rect.selectedHour)
                        console.log(rect.selectedHour)
                        textfieltime.text = page.isEditMode ? qsTr("") : rect.selectedHourAsString + ":" + rect.selectedMinuteAsString + " " + amPmTumbler.currentItem.text}
                }

                Tumbler {
                    id: minutesTumbler
                    model: 60
                    delegate: delegateComponent
                    background: Item {
                        Rectangle{
                            border.color: "#000000"

                        }
                    }
                    onCurrentItemChanged: {
                        rect.selectedMinute = minutesTumbler.currentItem.text
                        rect.selectedMinuteAsString = rect.numberToString(rect.selectedMinute)
                        console.log(rect.selectedMinute)
                        textfieltime.text = page.isEditMode ? qsTr("") : rect.selectedHourAsString + ":" + rect.selectedMinuteAsString + " " + amPmTumbler.currentItem.text
                    }
                }

                Tumbler {
                    id: amPmTumbler
                    model: ["AM", "PM"]
                    delegate: delegateComponent
                    onCurrentItemChanged: {
                        console.log(amPmTumbler.currentItem.text)
                      textfieltime.text = page.isEditMode ? qsTr("") : rect.selectedHourAsString + ":" + rect.selectedMinuteAsString + " " + amPmTumbler.currentItem.text
                    }
                }
            }
    }
}
